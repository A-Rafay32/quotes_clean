import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          // color: kCardColor,
          border: Border.all(
            width: 1,
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: Colors.transparent,
                offset: Offset(10, 10))
          ]),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w100,
            color: Color.fromARGB(255, 219, 214, 214),
            fontFamily: "Kanit"),
      )),
    );
  }
}
