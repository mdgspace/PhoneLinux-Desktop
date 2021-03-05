import 'package:mosyncapp/services/Message.dart';
import 'package:mosyncapp/viewmodel/base_model.dart';
import 'package:mosyncapp/locator.dart';
import 'package:mosyncapp/services/grpcClient.dart';

class InputCommandViewModel extends BaseModel{
  GrpcClient _grpcClient = locator<GrpcClient>();
  MessageOutgoing _messageOutgoing= locator<MessageOutgoing>();

  Future getInput(String command) async{
    _messageOutgoing.text=command;
    _grpcClient.send(_messageOutgoing).then((value) {
      print(value.command1);
    });
  }
  void updateStream(){

  }
}