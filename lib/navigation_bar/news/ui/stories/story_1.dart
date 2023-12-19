import 'package:flutter/material.dart';

class MyStory1 extends StatelessWidget {
  const MyStory1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.yellow, // Цвет контейнера
          child: Center(
            child: Image.asset(
              'assets/pikachu.jpg', // Путь к вашему изображению
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
