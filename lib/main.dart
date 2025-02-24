import 'package:flutter/material.dart';
import 'package:mencoba_1/main_layout.dart';
import 'package:mencoba_1/screens/auth_page.dart';
import 'package:mencoba_1/screens/doctor_details.dart';
import 'package:mencoba_1/screens/home_page.dart';
import 'package:mencoba_1/screens/success_booked.dart';
import 'package:mencoba_1/utils/config.dart';
import 'package:mencoba_1/screens/booking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Doctor App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outLineBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outLineBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const AuthPage(),
        'home' : (context) => const HomePage(),
        'main' : (context) => const MainLayout(),
        'doc_details' : (context) => const DoctorDetails(),
        'booking_page' : (context) => const BookingPage(),
        'success_booked' : (context) => const AppointmentBooked(),
      },
    );
  }
}