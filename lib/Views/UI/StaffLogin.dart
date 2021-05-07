import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Models/User.dart';
import 'package:provider/provider.dart';

import 'LoginForm.dart';

class StaffLogin extends StatefulWidget {
  @override
  _StaffLoginState createState() => _StaffLoginState();
}

class _StaffLoginState extends State<StaffLogin> {
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
                                    Text('Login',
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Form(key: _formKey, child: LoginForm()),
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Processing Data')));
                                      Provider.of<User>(context, listen: false)
                                          .updateName('ok');
                                    }
                                  },
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
                flex: 3,
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
