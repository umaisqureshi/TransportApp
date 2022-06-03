import 'package:flutter/material.dart';
import 'package:flutter_application_1/Contants/Constant.dart';
import 'package:flutter_application_1/Screens/MatchingRoutes.dart';
import 'package:google_fonts/google_fonts.dart';

var nameroute = "";

class searchingBox extends StatelessWidget {
  const searchingBox({
    Key? key,
    required this.size,
    required TextEditingController textcontroller,
  })  : _textcontroller = textcontroller,
        super(key: key);

  final Size size;
  final TextEditingController _textcontroller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.5,
        width: size.width * 0.9,
        decoration: const BoxDecoration(
          //border: Border.all(color: Colors.black38),
          color: Color.fromARGB(255, 34, 1, 91),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Where Would You Like To Go Today",
              style: GoogleFonts.abel(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5.0,
                child: Container(
                  width: size.width * 0.7,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20)),
                      color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: TextField(
                        controller: _textcontroller,
                        decoration: InputDecoration(
                            hintText: "Place", border: InputBorder.none),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MatchingRoutesScreen(
                            name: _textcontroller.text.isEmpty
                                ? "Please enter Location"
                                : _textcontroller.text,
                          )));
                  nameroute = _textcontroller.text;
                },
                child: Container(
                  height: 50,
                  width: size.width * 0.4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 97, 3, 3),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20), right: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      "Search",
                      style: GoogleFonts.abel(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceListWidget extends StatelessWidget {
  const PlaceListWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.6,
        child: ListView.builder(
            //  physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedRoutes.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 4.0,
                child: ListTile(
                  trailing: Text(
                    recommendedRoutes[index].price.toString() + "euro",
                    style: GoogleFonts.abel(
                        fontSize: 15,
                        color: Color.fromARGB(255, 97, 3, 3),
                        fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    recommendedRoutes[index].routeFollow,
                    style: GoogleFonts.abel(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 34, 1, 91),
                        fontWeight: FontWeight.normal),
                  ),
                  tileColor: Colors.white,
                  title: Text(
                    recommendedRoutes[index].placeName,
                    style: GoogleFonts.abel(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 34, 1, 91),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
