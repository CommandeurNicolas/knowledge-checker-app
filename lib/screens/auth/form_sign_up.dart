import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/services/auth.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:provider/provider.dart';
import 'package:knowledge_checker/shared/view_model/decoration_shapes.dart';
import 'package:knowledge_checker/shared/globals.dart';

class FormSignUp extends StatefulWidget {
  @override
  FormSignUpState createState() => FormSignUpState();
}

class FormSignUpState extends State<FormSignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = '';
  String classe = '';
  bool isTeacher = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<QuerySnapshot>(context);
    //print(classes.documents);
    List<String> listClass = [];
    for (var doc in classes.documents) {
      listClass.add(doc.data['title']);
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            DecorationShapes(),
            Positioned(
              top: 45,
              left: 15,
              child: IconButton(
                icon: new Icon(Icons.arrow_back_rounded),
                iconSize: 35,
                color: darkblue,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
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
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 30.0, right: 30.0),
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(left: 15.0),
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
                                                          .only(end: 12.0),
                                                  child: Icon(
                                                    Icons.mail_outline_rounded,
                                                    color: Colors.red,
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
                                          left: 30.0, right: 30.0),
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(left: 15.0),
                                            child: TextFormField(
                                              validator: (val) => val.length < 5
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
                                          left: 30.0,
                                          right: 30.0),
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15.0),
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
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 10.0,
                                          left: 30.0,
                                          right: 30.0),
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: DropdownButtonFormField(
                                            // TODO : update isTeacher
                                            validator: (val) =>
                                                val == null ? 'Empty' : null,
                                            onChanged: (val) {
                                              setState(() {
                                                isTeacher = val == "Teacher"
                                                    ? true
                                                    : false;
                                              });
                                            },
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Icon(Icons
                                                  .arrow_circle_down_rounded),
                                            ),
                                            iconEnabledColor: Colors.orange,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                            items: <String>[
                                              'Student',
                                              'Teacher'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 10.0,
                                          left: 30.0,
                                          right: 30.0),
                                      child: Material(
                                        shadowColor: Colors.black,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: DropdownButtonFormField(
                                            // TODO : update class
                                            validator: (val) =>
                                                val == null ? 'Empty' : null,
                                            onChanged: (val) {
                                              setState(() {
                                                classe = val;
                                              });
                                            },
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child:
                                                  Icon(Icons.class__outlined),
                                            ),
                                            iconEnabledColor: Colors.purple,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                            items: listClass.map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
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
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        dynamic result = await _auth.register(
                                            email,
                                            password,
                                            username,
                                            classe,
                                            isTeacher);
                                        if (result == null) {
                                          setState(() {
                                            error = 'Error';
                                            // TODO : #12 16:00
                                          });
                                        } else {
                                          Navigator.pop(context);
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
                                            colors: [darkblue, mygreen]),
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
