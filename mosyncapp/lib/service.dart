// import 'package:grpc/grpc.dart';
//
// import 'api/v1/comProto.pbgrpc.dart' as grpc;
// import 'api/v1/comProto.pb.dart' as comProto;
// import 'api/v1/google/protobuf/empty.pb.dart';
// import 'api/v1/google/protobuf/wrappers.pb.dart';
//
// /// CHANGE TO IP ADDRESS OF YOUR SERVER IF IT IS NECESSARY
// const serverIP = "127.0.0.1";
// const serverPort = 50051;
//
// class Service{
//   /// Flag is indicating that client is shutting down
//   bool _isShutdown = false;
//   /// gRPC client channel to send messages to the server
//   ClientChannel _clientSend;
//
//   /// gRPC client channel to receive messages from the server
//   ClientChannel _clientReceive;
//
//   /// Event is raised when message has been sent to the server successfully
//   void Function(MessageOutgoing message) onSentSuccess;
//
//   /// Event is raised when message sending is failed
//   void Function(MessageOutgoing message, String error) onSentError;
//
//   /// Event is raised when message has been received from the server
//   void Function(MessageIncoming message) onReceivedSuccess;
//
//   /// Event is raised when message receiving is failed
//   void Function(String error) onReceivedError;
//
//   /// Constructor
//   Service(
//       {this.onSentSuccess,
//         this.onSentError,
//         this.onReceivedSuccess,
//         this.onReceivedError});
//
//   // Shutdown client
//   Future<void> shutdown() async {
//     _isShutdown = true;
//     _shutdownSend();
//     _shutdownReceive();
//   }
//
//   // Shutdown client (send channel)
//   void _shutdownSend() {
//     if (_clientSend != null) {
//       _clientSend.shutdown();
//       _clientSend = null;
//     }
//   }
//
//   // Shutdown client (receive channel)
//   void _shutdownReceive() {
//     if (_clientReceive != null) {
//       _clientReceive.shutdown();
//       _clientReceive = null;
//     }
//   }
//
//   /// Send message to the server
//   void send(MessageOutgoing message) {
//     if (_clientSend == null) {
//       // create new client
//       _clientSend = ClientChannel(
//         serverIP, // Your IP here or localhost
//         port: serverPort,
//         options: ChannelOptions(
//           //TODO: Change to secure with server certificates
//           credentials: ChannelCredentials.insecure(),
//           idleTimeout: Duration(seconds: 10),
//         ),
//       );
//     }
//
//     comProto.commandMessage request = new comProto.commandMessage();
//     request.one = "message.text";
//     request.id = "hero";
//     request.passcode = "1234";
//     print("Superior 1");
//     grpc.commandServiceClient(_clientSend).topCommand(request).then((value) {
//       print("Superior Superior");
//       print(value.toString());
//       // call for success handler
//       if (onSentSuccess != null) {
//         var sentMessage = MessageOutgoing(
//             text: message.text,
//             );
//         onSentSuccess(sentMessage);
//       }
//     }).catchError((e) {
//         print(e.toString());
//     });
//     print("Superior 2");
//   }
//
//   /// Start listening messages from the server
//   void startListening() {
//     if (_clientReceive == null) {
//       // create new client
//       _clientReceive = ClientChannel(
//         serverIP, // Your IP here or localhost
//         port: serverPort,
//         options: ChannelOptions(
//           //TODO: Change to secure with server certificates
//           credentials: ChannelCredentials.insecure(),
//           idleTimeout: Duration(seconds: 10),
//         ),
//       );
//     }
//     comProto.commandMessage request = new comProto.commandMessage();
//     var stream =
//     grpc.commandServiceClient(_clientReceive).topCommand(request);
//     MessageIncoming msg = new MessageIncoming();
//     stream.then((onValue){
//       msg.command1 = onValue.one;
//       msg.command2 = onValue.two;
//       msg.command3 = onValue.three;
//       msg.command4 = onValue.four;
//       msg.command5 = onValue.five;
//     });
//   print(msg.command1);
//   }
// }
// class MessageOutgoing{
//   MessageOutgoing(
//       {this.text});
//   String text;
// }
// class MessageIncoming{
//
//   String command1;
//   String command2;
//   String command3;
//   String command4;
//   String command5;
// }
