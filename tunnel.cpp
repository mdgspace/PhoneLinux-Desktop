#include <iostream>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fstream>
#include <ctime>

using namespace std;

class TakeInput
{
private:
    char fileThis[21];
    int fd, fdCSV;
    fstream fout;
    char mainFolder[11] = "~/.mosync/";
    void writeInTempFile(char *buf, int size)
    {
        cout << fileThis;
        // writing to the file
        write(fd, buf, size);
        char delimit[2] = " ";
        // current date/time based on current system
        time_t now = time(0);
        // convert now to string form
        char *dt = ctime(&now);
        fout << (strtok(buf, delimit)) << "," << fileThis << "," << dt;
    }

public:
    TakeInput()
    {

        struct stat statbuf;
        int isDir = 0;

        if (stat(".mosync/", &statbuf) != -1)
        {
            if (S_ISDIR(statbuf.st_mode))
            {
                isDir = 1;
            }
        }
        if (!isDir)
        {
            // Creating a directory
            if (mkdir(".mosync/", 0777) == -1)
                cerr << "Error :  " << strerror(errno) << endl;
            else
                cout << "Directory created";
        }
        // works for unix, creates a temp file XXXXXX is replaced by number.
        strcpy(fileThis, ".mosync/mosync.XXXXXX");
        fd = mkstemp(fileThis);
        // CSV
        fout.open(".mosync/logs.csv", ios::out | ios::app);
        // format of input->First word of content, temp file name,time of entry
    }
    void ReadInput()
    {
        string str;
        cin >> str;
        char temp[str.length()];
        strcpy(temp, str.c_str());
        writeInTempFile(temp, str.length());
    }
    void CloseReader()
    {
        close(fd);
    }
    void DeleteTempFile()
    {
        remove(fileThis); // Delete the temporary file.
    }
};
int main(int argc, char *argv[])
{
    TakeInput td;
    td.ReadInput();
    td.CloseReader();
    //td.DeleteTempFile();   //to delete file
    return 0;
}