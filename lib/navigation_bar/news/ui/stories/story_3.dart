import 'package:flutter/material.dart';

class MyStory3 extends StatelessWidget {
  const MyStory3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white, // Цвет контейнера
          child: Center(
            child: Image.asset(
              'assets/bulbasaur.jpg', // Путь к вашему изображению
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
