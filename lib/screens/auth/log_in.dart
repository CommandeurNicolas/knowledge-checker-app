import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/screens/auth/sign_up.dart';
import 'package:knowledge_checker/services/auth.dart';
import 'package:knowledge_checker/shared/view_model/href_text.dart';
import 'package:knowledge_checker/shared/decoration_shapes.dart';
import 'package:knowledge_checker/shared/globals.dart';

class LogIn extends StatefulWidget {
  final Function toogleView;
  LogIn({this.toogleView});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            DecorationShapes(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 250,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: 1000,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Hello !",
                          style: TextStyle(color: darkblue, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(color: darkblue, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 50.0, right: 50.0),
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(left: 25.0),
                                            child: TextFormField(
                                              autocorrect: false,
                                              enableSuggestions: false,
                                              validator: (val) => val.length < 5
                                                  ? 'Enter an username longer than 5 characters'
                                                  : null,
                                              onChanged: (val) {
                                                setState(() {
                                                  username = val;
                                                });
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                                hintText: 'Username',
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .only(end: 12.0),
                                                  child: Icon(
                                                    Icons
                                                        .account_circle_outlined,
                                                    color: Colors.lightBlue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 10.0,
                                          left: 50.0,
                                          right: 50.0),
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: TextFormField(
                                            obscureText: true,
                                            autocorrect: false,
                                            validator: (val) => val.length < 8
                                                ? 'Enter a password longer than 8 characters'
                                                : null,
                                            onChanged: (val) {
                                              setState(() {
                                                password = val;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: 'Password',
                                              suffixIcon: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .only(end: 12.0),
                                                child: Icon(
                                                  Icons.lock_outline_rounded,
                                                  color: Colors.lightGreen,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 60.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: HrefText(text: "Forgot password ?"),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 60.0),
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        dynamic result = await _auth.login(
                                            username, password, username);
                                        if (result == null) {
                                          setState(() {
                                            error = 'Error';
                                            // TODO : #12 16:00
                                          });
                                        }
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
                                    padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [darkblue, mygreen],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 125.0, minHeight: 50.0),
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "Log in ",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.arrow_forward_rounded,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account ? "),
                                  // FlatButton.icon(
                                  //     onPressed: () {
                                  //       widget.toogleView();
                                  //     },
                                  //     icon: Icon(Icons.person),
                                  //     label: Text('Sign in'))
                                  HrefText(text: "SIGN UP", widget: SignUp()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
