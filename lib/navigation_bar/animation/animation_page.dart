import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'storypage.dart';
import 'util/story_circles.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _openStory() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoryPage(),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryCircle(
                    function: _openStory,
                  );
                },
              ),
            ),
            Text(
              "Hi! My name is Squirtle \n    Look at the stories",
              style: TextStyle(
                color: Colors.cyan,
                fontFamily: 'Inter',
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Lottie.asset('assets/squirtle.json'),
          ],
        ),
      ),
    );
  }
}
