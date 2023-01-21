import 'package:flutter/material.dart';
import 'package:training_app/modules/boarding_screen/boarding_screen.dart';
import 'package:training_app/modules/login_screen/login_screen.dart';
import 'package:training_app/shared/network/local/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();

  Widget widget;
  var onBoarding = CashHelper.getData(key: 'onBoarding');
  if (onBoarding != null) {
      widget = const LoginScreen();
  }
  else {
    widget = const BoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jameel',
      themeMode: ThemeMode.light,
      home: startWidget,
    );
  }
}
