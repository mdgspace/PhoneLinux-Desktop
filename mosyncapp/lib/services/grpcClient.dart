import 'package:grpc/grpc.dart';

import '../api/v1/comProto.pbgrpc.dart' as grpc;
import '../api/v1/comProto.pb.dart' as comProto;
import '../globals.dart';
import 'package:mosyncapp/services/Message.dart';
import 'local_storage_service.dart';
import 'package:mosyncapp/locator.dart';
/// CHANGE TO IP ADDRESS OF YOUR SERVER IF IT IS NECESSARY
const serverIP = globalServerIP;
const serverPort = globalServerPort;

class GrpcClient{
  bool _isShutdown = false;
  /// gRPC client channel to send messages to the server
  ClientChannel _clientSend;
  LocalStorageService _localStorageService=locator<LocalStorageService>();

  /// gRPC client channel to receive messages from the server
  ClientChannel _clientReceive;

  GrpcClient();
  MessageIncoming send(MessageOutgoing message){
    if (_clientSend == null) {
      // create new client
      _clientSend = ClientChannel(
        serverIP, // Your IP here or localhost
        port: serverPort,
        options: ChannelOptions(
          //TODO: Change to secure with server certificates
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(seconds: 10),
        ),
      );
    }
    comProto.commandMessage request = new comProto.commandMessage();
      request.one = message.text;
     request.id = _localStorageService.uid;
     request.passcode = _localStorageService.pass;
    print("Superior 1");
    grpc.commandServiceClient(_clientSend).topCommand(request).then((value) {
      print("Superior Superior");
      print(value.toString());
      // TODO call for success handler
    }).catchError((e) {
      print(e.toString());
    });
  }
}

