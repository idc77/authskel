import 'dart:developer';

import 'package:authskel/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            TextButton(style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),),
              onPressed: () {
              final authService = context.read<AuthService>();
              authService.signInWithAutoCodeExchange();
              if (authService.idToken != null) {
                log(authService.idToken!);
              }
              // context.read<AuthService>().signInWithAutoCodeExchange();

              /*
              _authService.signInWithAutoCodeExchange();
              if (_authService.idToken != null) {
                log(_authService.idToken!);
              }
               */
              },
              child: const Text('Login'),
            ),
            TextButton(
                onPressed: () {},
                child: const IDToken()
            ),
            TextButton(onPressed: () {}, child: const AccessToken())
          ],
        )
      ),
    );
  }

}

class IDToken extends StatelessWidget {
  const IDToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<AuthService>().idToken}',
    key: const Key('IDTokenState'),
    );
  }
}

class AccessToken extends StatelessWidget {
  const AccessToken({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<AuthService>().accessToken}',
      key: const Key('AccessTokenState'),
    );
  }

}