from __future__ import print_function
import grpc

# import the generated classes
import comProto_pb2_grpc as comProto_pb2_grpc
import comProto_pb2 as comProto_pb2


def run():
    print("hell")
    with grpc.insecure_channel('localhost:50051') as channel:
        stub = comProto_pb2_grpc.commandServiceStub(channel)
        # example for command
        command = comProto_pb2.commandMessage(
            one='one1', two='two', three='three', four='four', five='five', id='1234', passcode='hero')
        response = stub.topCommand(command)
        print(response)
        # example for only response
        command = comProto_pb2.commandMessage(
            two='two', three='three', four='four', five='five', id='1234', passcode='hero')
        response = stub.topCommand(command)
        print(response)

if __name__ == '__main__':
    run()
