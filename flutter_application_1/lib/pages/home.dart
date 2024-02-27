import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      leading: createBackButton(),
      actions: [ createMenuButton() ],
    );
  }

  GestureDetector createMenuButton() {
    return GestureDetector(
      onTap: () { print("Tap Menu"); },
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 37,
        decoration: BoxDecoration(
          color: const Color(0xFFE2E3E3),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(
          'assets/icons/dots.svg',
          width: 5,
          height: 5
        ),
      )
    );
    
  }

  GestureDetector createBackButton() {
    return GestureDetector(
        onTap: () { print("Tap Back"); },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFFE2E3E3),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
              width: 26, height: 26),
        )
      );
  }
}