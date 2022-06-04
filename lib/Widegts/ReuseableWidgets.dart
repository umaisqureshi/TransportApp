import 'package:flutter/material.dart';
import 'package:flutter_application_1/Contants/Constant.dart';
import 'package:flutter_application_1/Screens/Details.dart';
import 'package:flutter_application_1/Screens/MatchingRoutes.dart';
import 'package:google_fonts/google_fonts.dart';

var nameroute = "";

class SearchingBox extends StatefulWidget {
  SearchingBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final TextEditingController _textcontroller = TextEditingController();

  @override
  State<SearchingBox> createState() => _SearchingBoxState();
}

class _SearchingBoxState extends State<SearchingBox> {
  @override
  void dispose() {
    widget._textcontroller.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.size.height * 0.5,
        width: widget.size.width * 0.9,
        decoration: const BoxDecoration(
          //border: Border.all(color: Colors.black38),
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Where Would You Like\n       To Go Today?",
              style: GoogleFonts.abel(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5.0,
                child: Container(
                  width: widget.size.width * 0.7,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20)),
                      color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: TextField(
                        controller: widget._textcontroller,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            hoverColor: Color.fromARGB(255, 97, 3, 3),
                            hintText: "Place",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 60,
            // ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MatchingRoutesScreen(
                            name: widget._textcontroller.text.isEmpty
                                ? "Please enter Location"
                                : widget._textcontroller.text,
                          )));
                  nameroute = widget._textcontroller.text;
                },
                child: Container(
                  height: 50,
                  width: widget.size.width * 0.4,
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
        height: size.height * 0.7,
        child: ListView.builder(
            //  physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedRoutes.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 4.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PathDetailsScreen(
                              pathvalue: recommendedRoutes[index].routeFollow,
                            )));
                  },
                  child: ListTile(
                    trailing: Text(
                      "Go",
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
                ),
              );
            })),
      ),
    );
  }
}

class DetailedCard extends StatelessWidget {
  const DetailedCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Card(
            elevation: 5,
            //  color: Color.fromARGB(255, 97, 3, 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: double.infinity,
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "CLI 456",
                      style: GoogleFonts.abel(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 97, 3, 3),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "11:00 pm",
                            style: GoogleFonts.abel(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 97, 3, 3),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "__TO__",
                            style: GoogleFonts.abel(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 97, 3, 3),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "12:00 pm",
                            style: GoogleFonts.abel(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 97, 3, 3),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3 June 2022",
                            style: GoogleFonts.abel(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 97, 3, 3),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 50,
                            width: size.width * 0.4,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 97, 3, 3),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: GoogleFonts.abel(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  "7 euro",
                  style: GoogleFonts.abel(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
