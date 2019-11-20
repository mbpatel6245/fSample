import 'dart:developer';

import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  AboutUsState createState() => AboutUsState();
}

class AboutUsState extends State<AboutUs> {
  /*String htmlData = "";

  Future<String> loadAsset() async {
    String data = await rootBundle.loadString('assets/aboutus.html');
    setState(() {
      htmlData = data;
    });
  }

  @override
  void initState() {
    loadAsset();
    super.initState();
  }
*/

  @override
  Widget build(BuildContext context) {
log("ABOUT US CALLED");
    return Container(
      child: Padding(
        padding: new EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Incepted in the year 2013, UGoldi has emerged as a big player in the market of iPhone covers and accesories. Started a shop Chowk area of Surat, we did spread our wings and are now based in a prime location at Ghoddod Road in Surat.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "\nUGoldi, brainchild of Aamir Chiniwala, has the record of selling most unique and most number of iPhone covers and accessories in Surat. In a year, we do sell more than 20,000 iPhone covers, and more than 2000 iPhone accessories. We are famous as Single Piece Cover store as you won't find another piece of the same cover design with us.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "\nWhen it comes to satisfy our customers, we do consider that our priority. Our easy exchange or return policy has provided us recurring customers.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ), SizedBox(
              height: 5.0,
            ),
            Text(
              "\nIn Surat, if it's iPhone, it's UGoldi that's pops up first.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ), SizedBox(
              height: 5.0,
            ),
            Text(
              "\nAddress : UGoldi, next to Citi bank, Ghoddod Road, Surat\n PH no: 8401984019",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
