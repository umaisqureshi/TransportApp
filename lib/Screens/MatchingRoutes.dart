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
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 34, 1, 91),
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
                      Container(
                        height: size.height * 0.2,
                        width: size.width,
                        color: const Color.fromARGB(255, 34, 1, 91),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Selected Location",
                                style: GoogleFonts.abel(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                widget.name.toUpperCase(),
                                style: GoogleFonts.abel(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Routes",
                          style: GoogleFonts.abel(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 34, 1, 91),
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
                                      color:
                                          const Color.fromARGB(255, 34, 1, 91),
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
