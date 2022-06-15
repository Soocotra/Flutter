import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_dicoding/drawer.dart';
import 'package:project_dicoding/preview_page.dart';
import 'book_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#006AC2"),
        elevation: 0,
      ),
      drawer: SideBar(context),
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [HexColor("#00C3FF"), HexColor("#006AC2")])),
          ),
          Center(
            child: Column(children: [
              Flexible(
                child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    width: 240,
                    child: Image.asset(
                        "assets/images/logo2/drawable-hdpi/Logo.png")),
              ),
              Flexible(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.fromLTRB(29.5, 0, 29.5, 0),
                    width: 427.74,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [HexColor('#C6F8FF'), HexColor('#FFFFFF')]),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: BookList(
                        key: key,
                      ),
                    )),
              )
            ]),
          )
        ]),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          final Books buku = bookList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PreviewPage(
                  book: buku,
                );
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: HexColor("#5885FF"),
              elevation: 20,
              borderOnForeground: true,
              margin: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.all(20),
                          width: 73.85,
                          height: 106,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(buku.imageUrls)))),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 35, 9, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            buku.title,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "by ${buku.penulis}",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
