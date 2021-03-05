class MessageOutgoing{
  MessageOutgoing();
  String _text;
  set text(String text){
    _text=text;
  }
  String get text => _text;
}

class MessageIncoming{
  String command1;
  String command2;
  String command3;
  String command4;
  String command5;
}
