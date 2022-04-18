import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_dicoding/book_list.dart';

class PreviewPage extends StatelessWidget {
  final Books book;
  TextStyle desc = TextStyle(
      fontSize: 11,
      fontFamily: 'Poppins',
      color: HexColor('#190074').withOpacity(0.73),
      fontWeight: FontWeight.w800);
  PreviewPage({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#006AC2"),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 8),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                color: HexColor('#C6F8FF'),
                                onPressed: () => Navigator.pop(context),
                              )),
                          Image.asset("assets/images/PNG/book_logo.png"),
                          FavoriteIcon()
                        ],
                      ))),
            ),
            GradientText(book.title,
                style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'Martian',
                    fontWeight: FontWeight.bold),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [HexColor('#FDBA12'), HexColor('#F8CC5D')])),
            Flexible(
              flex: 6,
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [HexColor('#A7E0E8'), HexColor('#C6F8FF')])),
                ),
                Column(children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 30, right: 30),
                            child: FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Bahasa : ${book.lang}',
                                      style: desc,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Negara : ${book.region}",
                                      style: desc,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Penerbit: ${book.penerbit}',
                                      style: desc,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Penulis  : ${book.penulis}',
                                      style: desc,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Kategori: ${book.cat}',
                                      style: desc,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Rating',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                          color: HexColor('#190074')),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: book.rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 22,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: HexColor('#008AD9'),
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "(${book.rating})",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Image.network(book.imageUrls),
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  HexColor('#FFFFFF'),
                                  HexColor('#C6F8FF')
                                ]),
                          ),
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: Scrollbar(
                              thickness: 3,
                              isAlwaysShown: true,
                              interactive: true,
                              child: Container(
                                margin: EdgeInsets.only(right: 6),
                                child: ListView(children: [
                                  Text(
                                    "${book.sinopsis}",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 13.4, fontFamily: 'Poppins'),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
              ]),
            ),
          ],
        ));
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
      color: HexColor('#03f0fc'),
      iconSize: 35,
      onPressed: () => setState(() {
        isFav = !isFav;
      }),
    );
  }
}
