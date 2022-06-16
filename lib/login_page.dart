import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_dicoding/auth_service.dart';
import 'package:project_dicoding/book_list.dart';
import 'package:project_dicoding/home_page.dart';
import 'package:project_dicoding/sign_up.dart';

import 'customshape.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController(text: "");
  TextEditingController pswrd = TextEditingController(text: "");

  void listener(TextEditingController variable) {
    variable.addListener(() {
      setState(() {});
    });
  }

  bool obscureStat = true;
  @override
  void initState() {
    obscureStat = true;
  }

  TextField txtField(
      {IconData? ikon,
      String? label,
      TextEditingController? data,
      bool pwd = false,
      bool visibility = false}) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.solid)),
          suffixIcon: (pwd)
              ? IconButton(
                  icon: Icon(
                    obscureStat ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () => setState(() {
                    obscureStat = !obscureStat;
                  }),
                )
              : null,
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 13.28,
              fontFamily: "Poppins",
              color: HexColor("#666666"))),
      controller: data,
      obscureText: (visibility) ? obscureStat : pwd,
    );
  }

  @override
  Widget build(BuildContext context) {
    listener(email);
    listener(pswrd);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: HexColor('#EFF3F8'),
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(padding: EdgeInsets.all(0), children: [
            Column(children: [
              Stack(children: [
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                      height: 401.31,
                      width: MediaQuery.of(context).size.width,
                      color: HexColor('#58A0FF'),
                      child: Padding(
                        padding: EdgeInsets.only(top: 90.3),
                        child: Text(
                          "Track Books You want to Read !",
                          style: TextStyle(
                              fontSize: 37.63,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 229.5, 0, 0),
                    width: 206.72,
                    height: 206.72,
                    child: Image(
                        image: AssetImage('assets/images/PNG/LogoLogin.png')),
                  ),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: TextButton(
                    onPressed: () async {
                      await AuthServices.SignInAnonymous();
                    },
                    child: Text(
                      'Login as Guest',
                      style: TextStyle(
                          fontSize: 17.63,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ]),
              Container(
                  height: 39.27,
                  width: 285.64,
                  margin: EdgeInsets.fromLTRB(73.1, 26.8, 73.1, 21.7),
                  child: txtField(data: email, label: "Email")),
              Container(
                  height: 39.27,
                  width: 285.64,
                  margin: EdgeInsets.fromLTRB(73.1, 0, 73.1, 21.4),
                  child: txtField(
                      label: "Password",
                      data: pswrd,
                      pwd: true,
                      visibility: true)),
              Container(
                width: 285.64,
                height: 43.12,
                margin: EdgeInsets.only(left: 73.1, right: 73.1, bottom: 10.5),
                child: ElevatedButton(
                  onPressed: (email.text.isNotEmpty && pswrd.text.isNotEmpty)
                      ? () async {
                          await AuthServices.SignInEmailPass(
                              email.text, pswrd.text, context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: HexColor('#1B1464'),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 17,
                        color: HexColor('#EFF3F8'),
                        fontFamily: "Poppins"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(
                "Don't have an account?",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: HexColor('#666666')),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text(
                  "Create an account",
                  style: TextStyle(
                      color: HexColor('#008AD9'),
                      fontFamily: 'Poppins',
                      fontSize: 19),
                ),
              )
            ]),
          ]),
        ));
  }
}
