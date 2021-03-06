import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Models/User.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';
import 'package:petstore/Views/Utils/TextLink.dart';
import 'package:provider/provider.dart';
import 'LoginForm.dart';
import 'RegisterForm.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final CustomHover login = CustomHover(underlineOnHover: true);
  final CustomHover register = CustomHover(underlineOnHover: true);
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();
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
                child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/')},
                  child: FractionallySizedBox(
                    child: Image.asset('assets/images/logo.png'),
                  ),
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
                                    TextLink(
                                        customHover: login,
                                        setState: setState,
                                        text: 'Login',
                                        fontSize: 28,
                                        fontWeight: FontWeight.w400,
                                        onClick: () {
                                          setState(() {
                                            isLogin = true;
                                          });
                                        }),
                                    TextLink(
                                        customHover: register,
                                        setState: setState,
                                        text: 'Register',
                                        fontSize: 28,
                                        fontWeight: FontWeight.w400,
                                        onClick: () {
                                          setState(() {
                                            isLogin = false;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Form(
                                key: _formKey,
                                child: isLogin ? LoginForm() : RegisterForm()),
                            flex: 7,
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
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Processing Data')));
                                      Provider.of<User>(context, listen: false)
                                          .updateName('ok');
                                      await Future.delayed(
                                          Duration(seconds: 2));
                                      Navigator.of(context).pushNamed('/');
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      isLogin ? 'Login' : 'Register',
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
