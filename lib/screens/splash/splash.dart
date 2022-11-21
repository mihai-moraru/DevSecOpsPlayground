import 'package:flutter/material.dart';
import 'package:my_movie_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isButtonDisabled = false;
  @override
  void initState() {
    super.initState();
  }

  final _email = TextFormField(
    key: const Key('email_input'),
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    initialValue: 'notmyaddress@mail.com',
    decoration: InputDecoration(
      hintText: 'Email',
      contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
    ),
  );

  final _password = TextFormField(
    key: const Key('password_input'),
    autofocus: false,
    initialValue: 'password',
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Password',
      contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
    ),
  );

  Widget _loginBtn() {
    return ElevatedButton(
      key: const Key('login_btn'),
      onPressed: _isButtonDisabled
          ? null
          : () {
              setState(() {
                _isButtonDisabled = true;
              });
              navigateHome();
            },
      child: _isButtonDisabled
          ? const CircularProgressIndicator(
              key: Key('loading'),
              color: Colors.white,
            )
          : const Text("Login"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'The Movie App',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(height: 48.0),
          //email widget
          _email,
          const SizedBox(height: 8.0),
          //password widget
          _password,
          const SizedBox(height: 24.0),
          _loginBtn(),
        ],
      ),
    );
  }

  Future<void> navigateHome() async {
    await Future.delayed(const Duration(seconds: 1));
    final route = MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );

    Navigator.pushReplacement(context, route);
  }
}
