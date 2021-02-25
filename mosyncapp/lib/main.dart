import 'package:flutter/material.dart';
import 'package:mosyncapp/Screen/Screen.dart';
import 'package:mosyncapp/locator.dart';
import 'package:flutter/services.dart' as fs;
import 'package:mosyncapp/ui/router.dart';
import 'package:mosyncapp/ui/views/HomeScreen.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    fs.SystemChrome.setPreferredOrientations(
      [
        fs.DeviceOrientation.portraitUp,
        fs.DeviceOrientation.portraitDown,
      ],
    );
    fs.SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: MosyncRouter.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
    );
  }
}