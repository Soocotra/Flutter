import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_dicoding/auth_service.dart';

Widget SideBar(BuildContext context) {
  return Drawer(
    backgroundColor: HexColor("#006AC2"),
    width: MediaQuery.of(context).size.width / 2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () async {
            await AuthServices.SignOut();
          },
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: Color.fromARGB(255, 83, 18, 13),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "LOGOUT",
                    style: TextStyle(
                        color: Color.fromARGB(255, 83, 18, 13),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
