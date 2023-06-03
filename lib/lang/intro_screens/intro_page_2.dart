import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logicLang.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});
 
  @override
  Widget build(BuildContext context) {
      //     builder: (context) =>
        GetMaterialApp(
    
      translations: Messages(), // your translations
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'UK'),
     
     
    );
    return Container(
     
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: Image.asset(
                'images/mauri.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            Text(
                "message"
                    .tr),
          ],
        ),
      ),
    );
  }
}
