import 'package:flutter/material.dart';


class Onboarding extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const Onboarding({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          )
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.8),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style:  const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style:  const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        )
      ],
    );
  }
}
