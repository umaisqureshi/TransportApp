import 'package:flutter/material.dart';
import 'package:flutter_application_1/Contants/Constant.dart';
import 'package:flutter_application_1/Widegts/ReuseableWidgets.dart';

import 'package:google_fonts/google_fonts.dart';

class MatchingRoutesScreen extends StatefulWidget {
  final String name;
  const MatchingRoutesScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<MatchingRoutesScreen> createState() => _MatchingRoutesScreenState();
}

class _MatchingRoutesScreenState extends State<MatchingRoutesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 5,
          flexibleSpace: Container(
            width: size.width,
            color: Color.fromARGB(255, 97, 3, 3),
            child: Center(
              child: Text(
                widget.name.toUpperCase(),
                style: GoogleFonts.abel(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 97, 3, 3),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Routes",
                          style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      widget.name == "Please enter Location"
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              child: Center(
                                child: Text(
                                  "Nothing to Show",
                                  style: GoogleFonts.abel(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 97, 3, 3),
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            )
                          : PlaceListWidget(size: size),
                    ],
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
