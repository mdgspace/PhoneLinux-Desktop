# to generate grpc files
# python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. comProto.proto
import grpc
from concurrent import futures
import time
# import the generated classes
import comProto_pb2_grpc as comProto_pb2_grpc
import comProto_pb2 as comProto_pb2
# import the original calculator.py
import remoteFunctions
import environ

env = environ.Env(
    DEBUG=(bool, False)
)
# reading .env file
environ.Env.read_env()
# topcommand service in proto file
class BidirectionalService(comProto_pb2_grpc.commandServiceServicer):

    def topCommand(self, request, context):
        response = comProto_pb2.commandMessage()
        print(str(response.id))
        comdict = remoteFunctions.setCommand(
            request.id, request.passcode, request.one)
        
        # last 5 commands stored in database
        response.one = comdict[0]
        response.two = comdict[1]
        response.three = comdict[2]
        response.four = comdict[3]
        response.five = comdict[4]
        
        return response

# server start
def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    comProto_pb2_grpc.add_commandServiceServicer_to_server(
        BidirectionalService(), server)
    print('Starting server. Listening on port ')
    print(str(env('port_grpc'))) 
    server.add_insecure_port('[::]:'+env('port_grpc'))
    server.start()
    server.wait_for_termination()

# Executed when invoked directly
if __name__ == '__main__':
    serve()
