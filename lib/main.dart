import 'package:agri_guru/layout/homeLayout/home_layout.dart';
import 'package:agri_guru/modules/login/login.dart';
import 'package:agri_guru/modules/onBoarding/onBoarding.dart';
import 'package:agri_guru/shared/network/local/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 88, 211, 184),
        ),
        // primarySwatch:  Colors.amber,
        // scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[100],
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.grey[100],
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 88, 211, 184),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
            color: Colors.black,
          ),
        ),
        primaryColor: Color.fromARGB(255, 88, 211, 184),
        cardColor: Color.fromARGB(255, 88, 211, 184),
      ),
      home:sharedPref.getData(key: "onBoarding")==true? HomeLayout():OnBoarding(),
    );
  }
}
