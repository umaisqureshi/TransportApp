import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widegts/ReuseableWidgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PathDetailsScreen extends StatefulWidget {
  late String pathvalue;
  PathDetailsScreen({Key? key, required this.pathvalue}) : super(key: key);

  @override
  State<PathDetailsScreen> createState() => _PathDetailsScreenState();
}

class _PathDetailsScreenState extends State<PathDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 97, 3, 3),
          elevation: 0,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 97, 3, 3),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              height: size.height * 0.4,
              width: size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      widget.pathvalue.toUpperCase(),
                      style: GoogleFonts.abel(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 200,
                      width: 200,
                      child: Icon(
                        Icons.train,
                        size: 170,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  DetailedCard(size: size),
                  DetailedCard(size: size),
                  DetailedCard(size: size),
                  DetailedCard(size: size),
                  DetailedCard(size: size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
