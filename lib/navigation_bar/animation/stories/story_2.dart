import 'package:flutter/material.dart';

class MyStory2 extends StatelessWidget {
  const MyStory2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.purple, // Цвет контейнера
          child: Center(
            child: Image.asset(
              'assets/pawmi.png', // Путь к вашему изображению
              // width: 150.0,
              // height: 150.0,
              fit: BoxFit.cover, // Режим отображения изображения
            ),
          ),
        ),
      ),
    );
  }
}
