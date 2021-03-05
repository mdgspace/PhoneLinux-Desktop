import 'package:get_it/get_it.dart';
import 'package:mosyncapp/services/local_storage_service.dart';
import 'services/Message.dart';
GetIt locator = GetIt.instance;

Future<void> setupLocator() async{
  var localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorageService);
  locator.registerLazySingleton(() => MessageIncoming());
  locator.registerLazySingleton(() => MessageOutgoing());
}