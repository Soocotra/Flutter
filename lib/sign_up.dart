import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:project_dicoding/auth_service.dart';
import 'package:project_dicoding/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    bool _isChecked = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#58A0FF"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.black,
                  iconSize: 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 40),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: "Poppins"),
                      children: [
                        TextSpan(
                            text: "\nCreate your new account",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 13))
                      ])),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70))),
                child: Container(
                  padding: EdgeInsets.only(top: 80),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      RegisterForm(controller: email, label: "Email"),
                      RegisterForm(
                          controller: password,
                          label: "Password",
                          obscure: true),
                      RegisterForm(
                          controller: confirmPassword,
                          label: "Re-enter Password",
                          obscure: true),
                      const SizedBox(
                        height: 20,
                      ),
                      StatefulBuilder(
                          builder: ((context, setState) => CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text(
                                "I agree that I have read and accepted the Terms of Use and Privacy Policy.",
                                style: TextStyle(
                                    fontSize: 12, fontFamily: "Poppins"),
                                textAlign: TextAlign.center,
                              ),
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() => _isChecked = value!);
                              }))),
                      InkWell(
                        onTap: () async {
                          if (!_isChecked) {
                            showDialog(
                                context: context,
                                builder: (_) => alertDialog(
                                    context: context,
                                    message: Text(
                                        "Please check the agreement box")));
                          } else if (password.text != confirmPassword.text) {
                            showDialog(
                                context: context,
                                builder: (_) => alertDialog(
                                    context: context,
                                    message: Text("Password doesn't match")));
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) => alertDialog(
                                    context: context,
                                    message: Text("Register Success")));
                            await AuthServices.SignUp(
                                    email.text, password.text, context)
                                .then((value) => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage())),
                                    });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.symmetric(
                              horizontal: 126, vertical: 10),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins"),
                          ),
                          decoration: BoxDecoration(
                              color: HexColor("#58A0FF"),
                              borderRadius: BorderRadius.circular(14)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container RegisterForm(
    {TextEditingController? controller, String? label, bool obscure = false}) {
  return Container(
    margin: EdgeInsets.only(top: 30),
    height: 50,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
          )),
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
          )),
      obscureText: obscure,
    ),
  );
}

CupertinoAlertDialog alertDialog(
    {required BuildContext context, required Widget message}) {
  return CupertinoAlertDialog(
    title: Text("Alert"),
    content: message,
    actions: [
      CupertinoDialogAction(
        child: Text("Ok"),
        onPressed: () => Navigator.pop(context),
      )
    ],
  );
}
