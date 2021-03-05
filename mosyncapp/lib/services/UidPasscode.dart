import 'package:mosyncapp/locator.dart';
import 'package:mosyncapp/services/local_storage_service.dart';
class UidPasscode{
  LocalStorageService _localStorageService = locator<LocalStorageService>();
  Future<bool> MakeUid() async{
      _localStorageService.pass="1234";
      _localStorageService.uid ="hero";
      return true;
  }
}