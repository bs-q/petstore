import 'package:flutter/material.dart';

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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Register',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
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
