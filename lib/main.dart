import 'package:authskel/screens/splash/splash_page.dart';
import 'package:authskel/services/auth/auth_service.dart';
import 'package:authskel/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthService())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: '/',
      routes: {'/': (_) => const SplashPage()},
    );
  }
}
