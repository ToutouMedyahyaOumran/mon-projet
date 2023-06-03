import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage1 extends StatefulWidget {
  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  bool isSelected = false;
  String selectedLanguage = '';   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      // backgroundColor: Colors.blue,
      // elevation: 15,
      // centerTitle: true,
      // shape: const RoundedRectangleBorder(
      //     side: BorderSide(
      //       width: 3,
      //       color: Colors.white,
      //     ),
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(200),
      //         bottomRight: Radius.circular(200))),
      // bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(170),
      //     child: Column(
      //       children: [
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.all(8.0),
      //               child: Text(
      //                 "Mauri Urgance",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 30,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //             // CircleAvatar(

      //             //   radius: 25,
      //             //   backgroundColor: Colors.white,
      //             // )
      //           ],
      //         ),
      //         SizedBox(
      //           height: 100,
      //         )
      //       ],
      //
      //    )),
      //),

      body: Container(
        color: Colors.white,
        child: Column(
          // controller:_controller,

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/imgLan.jpeg'),
                ],
              ),
            ),

            // Text(
            //   "You have pushed the button this many times:".tr,
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            Container(
      child: Column(
        children: [
          buildLanguageButton('fr', 'Français'),
          SizedBox(height: 20),
          buildLanguageButton('en', 'Anglais'),
          SizedBox(height: 20),
          buildLanguageButton('ar', 'Arabe'),
        ],
      ),
    )
           
    ]
    )
    )
    );
  }
   Widget buildLanguageButton(String languageCode, String languageName) {
    return Center(
      child: Container(
        width: 300,
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedLanguage = languageCode;
            });
            Get.updateLocale(Locale(languageCode));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                languageName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              if (selectedLanguage == languageCode)
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.grey[100],
          ),
        ),
      ),
    );
  }
}



     
