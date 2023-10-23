import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  SocialCard({super.key});

  List<String> assets = [
    "assets/icons/google.svg",
    "assets/icons/fb.svg",
    "assets/icons/twitter.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ...List.generate(
          assets.length,
          (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                assets[index],
                height: 50,
                width: 50,
              ),
            ),
          ),
        )
      ]),
    );
  }
}