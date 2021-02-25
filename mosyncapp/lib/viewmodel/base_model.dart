import 'package:flutter/cupertino.dart';
import 'package:mosyncapp/enums/view_state.dart';

class BaseModel extends ChangeNotifier{
  ViewState _state = ViewState.Idle;
  // get method
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }
}