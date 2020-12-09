import 'package:flutter/material.dart';
import 'package:knowledge_checker/globals.dart';
import 'package:knowledge_checker/screens/decoration_shapes.dart';
import 'package:knowledge_checker/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;
  SignIn({this.toogleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  height: 150,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: 1000,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Welcome!",
                          style: TextStyle(color: darkblue, fontSize: 40),
                        ),
                        SizedBox(
                          height: 28,
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
                                  height: 0,
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Material(
                                          shadowColor: Colors.black,
                                          elevation: 10.0,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 5.0),
                                              child: TextFormField(
                                                validator: (val) => val.isEmpty
                                                    ? 'Enter an email'
                                                    : null,
                                                autocorrect: false,
                                                enableSuggestions: false,
                                                onChanged: (val) {
                                                  setState(() {
                                                    email = val;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                                  hintText: 'Email',
                                                  suffixIcon: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .only(end: 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .mail_outline_rounded,
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
                                            left: 10.0, right: 10.0),
                                        child: Material(
                                          shadowColor: Colors.black,
                                          elevation: 10.0,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 5.0),
                                              child: TextFormField(
                                                validator: (val) => val.length <
                                                        5
                                                    ? 'Enter an username longer than 5 characters'
                                                    : null,
                                                autocorrect: false,
                                                enableSuggestions: false,
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
                                                            .only(end: 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .account_circle_outlined,
                                                      color: Colors.lightGreen,
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
                                            bottom: 0, left: 10.0, right: 10.0),
                                        child: Material(
                                          shadowColor: Colors.black,
                                          elevation: 10.0,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5.0),
                                            child: TextFormField(
                                              validator: (val) => val.length < 8
                                                  ? 'Enter a password longer than 8 characters'
                                                  : null,
                                              obscureText: true,
                                              autocorrect: false,
                                              onChanged: (val) {
                                                setState(() {
                                                  password = val;
                                                });
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                                hintText: 'Password',
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .only(end: 0.0),
                                                  child: Icon(
                                                    Icons.lock_outline_rounded,
                                                    color: Colors.teal,
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
                                  height: 60,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    // margin: EdgeInsets.only(right: 60.0),
                                    child: RaisedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          dynamic result = await _auth.register(
                                              email, password, username);
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
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                darkblue,
                                                Color(0xff4AC496)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 250.0, minHeight: 50.0),
                                          alignment: Alignment.center,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Sign up ",
                                                    style: TextStyle(
                                                        fontSize: 20)),
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
                                    Text("Already have an account ? "),
                                    FlatButton.icon(
                                        onPressed: () {
                                          widget.toogleView();
                                        },
                                        icon: Icon(Icons.person),
                                        label: Text('Log in'))
                                    //HrefText(text: "SIGN UP", widget: SignIn()),
                                  ],
                                ),
                              ],
                            )),
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
