import 'package:LinuxApp/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var authc = FirebaseAuth.instance;

  String users;
  String name;
  String password;
  var containskey;

  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      var user = await authc.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
      // if (!users.containsKey(data.name)) {
      //   return 'Username not exists';
      // }
      // if (users[data.name] != data.password) {
      //   return 'Password does not match';
      // }
      return null;
    });
  }

  Future<String> _loginUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      var user = await authc.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      // if (!users.containsKey(data.name)) {
      //   return 'Username not exists';
      // }
      // if (users[data.name] != data.password) {
      //   return 'Password does not match';
      // }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return FlutterLogin(
        title: 'Linux App',
        theme: LoginTheme(
          primaryColor: Color(0xFFFF9000),
        ),
        onSignup: _authUser,
        onLogin: _loginUser,
        onSubmitAnimationCompleted: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Options()),
          );
        },
        onRecoverPassword: null);
  }
}
