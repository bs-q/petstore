import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.4,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: FractionallySizedBox(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFE4E3E3),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: FractionallySizedBox(
                              widthFactor: 0.7,
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Register',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: LoginForm(),
                            flex: 4,
                          ),
                          Flexible(
                              flex: 1,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.9);
                                        return MyColor.FONTCOLOR;
                                      },
                                    ),
                                  ),
                                  onPressed: () => {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
                flex: 4,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: FractionallySizedBox(),
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: Placeholder()),
        Flexible(child: Placeholder()),
        Flexible(child: Placeholder()),
        Flexible(child: Placeholder()),
        Flexible(child: Placeholder()),
        Flexible(child: Placeholder()),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
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
                decoration: const InputDecoration(
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
