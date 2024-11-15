import 'package:agri_guru/layout/homeLayout/home_layout.dart';
import 'package:agri_guru/modules/login/login.dart';
import 'package:agri_guru/modules/onBoarding/onBoarding.dart';
import 'package:agri_guru/shared/network/local/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();
    bool? onBoarding = sharedPref.getData(key: "onBoarding");
  bool? token = sharedPref.getData(key: "token");
  Widget? widget;
  
  if (onBoarding != null) {
    if (token != null) {
      widget = HomeLayout();
    } else
      widget = Login();
  } else
    widget = OnBoarding();

  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatefulWidget {
  final Locale? locale;
    final Widget? startWidget;

  const MyApp({Key? key, this.locale, this.startWidget}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: widget.locale ?? Locale('en'),
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
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
      home:  widget.startWidget ?? Login(),
    );
  }
}
