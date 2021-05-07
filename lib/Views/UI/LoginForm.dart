import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: Align(
                alignment: Alignment.center,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                        .hasMatch(value);
                    if (!emailValid) {
                      return 'Please enter valid email format';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      filled: true),
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              alignment: Alignment.topCenter,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                obscureText: _isObscure,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    labelText: 'Password',
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    filled: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
