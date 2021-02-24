import math
import environ
import psycopg2

env = environ.Env(
    DEBUG=(bool, False)
)
# reading .env file
environ.Env.read_env()

con = psycopg2.connect(database=env('database_name'), user=env('user_postgres'), password=env('pass_postgres'), host=env('host_postgres'), port=env('port_postgres'))
cur = con.cursor()

def square_root(x):
  y = math.sqrt(x)
  return y

# check if table exist else create
def tableCheck():
      cur.execute("select exists(select * from information_schema.tables where table_name=%s)", ('commands',))
      if not cur.fetchone()[0]:
            cur.execute('''CREATE TABLE commands
                        (id TEXT PRIMARY KEY     NOT NULL,
                        passcode TEXT NOT NULL,
                        one         TEXT   NOT NULL,
                        two         TEXT   NOT NULL,
                        three       TEXT   NOT NULL,
                        four        TEXT   NOT NULL,
                        five        TEXT   NOT NULL);''')
            con.commit()

# app creates a session id and user creates a passcode
def createSession(id,passcode):
      try:
        tableCheck()
        cur.execute(str("INSERT INTO commands (id,passcode,one,two,three,four,five) VALUES (\'"+str(id)+"\', \'"+str(passcode)+"\','','', '','', '')"));
        con.commit()
      except:
        print('user exist,overwriting')
        con.rollback()

# take 'command' and every ith command is pushed to i+1,and command is placed in i=0.Last command removed.
def setCommand(id,passcode,command):
      createSession(id,passcode)
      commandsGet=commandList(id,passcode)
      if command=='':
            return commandsGet[2:]
      count=0
      current=command
      final=[]
      for t in commandsGet:
            if count>=2:
                  final.append(current)
                  current=t
            count=count+1
      nos=['one','two','three','four','five']
      for t,r in zip(final,nos):
            cur.execute(str("UPDATE commands set "+r+" = \'"+t+"\' where id=\'"+id+"\'"))
            con.commit()
      return final

# get command list -> client calls function
def commandList(id,passcode):
      print(id)
      cur.execute(str("SELECT id,passcode,one,two,three,four,five from commands where id=\'"+id+"\'"))
      rows = cur.fetchall()
      commands=[]
      for r in rows:
            for t in r:
              commands.append(t)
      print(commands)
      con.commit()
      return commands
# to close cursor
def close():
      con.close()


# for testing
# commandList('1234','hero')
# setCommand('1234','hero','abc')
# setCommand('1234','hero','abc')
# setCommand('1234','hero','abcd')
# commandList('1234','hero')
