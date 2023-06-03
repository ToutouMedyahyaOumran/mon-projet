import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
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
                'images/pompier.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
             Text(
                "message1".tr),
          ],
        ),
      ),
    );
  }
}
