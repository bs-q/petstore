import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              bool emailValid =
                  RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                      .hasMatch(value);
              if (!emailValid) {
                return 'Please enter valid email format';
              }
              return null;
            },
            decoration: const InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true),
          )),
          Flexible(
              child: TextFormField(
            obscureText: _showPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: _togglevisibility,
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                labelText: 'Password',
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true),
          )),
          Flexible(
              child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
            decoration: const InputDecoration(
                labelText: 'Full Name',
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true),
          )),
          Flexible(
              child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
            decoration: const InputDecoration(
                labelText: 'Phone',
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true),
          )),
          Flexible(
              child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
            decoration: const InputDecoration(
                labelText: 'Address',
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true),
          )),
        ],
      ),
    );
  }
}
