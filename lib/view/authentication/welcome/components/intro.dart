import 'package:flutter/material.dart';

class WelcomeIntro extends StatelessWidget {
  const WelcomeIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          FittedBox(
            child: Text(
              'Manage Your Tasks',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.displayMedium?.color,
                fontFamily: 'Metro',
                fontSize: 25,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Keep Track Of Your',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.color
                  ?.withOpacity(.7),
              fontFamily: 'Metro',
              fontSize: 16,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Tasks and Habits.',
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.color
                  ?.withOpacity(.7),
              fontFamily: 'Metro',
              fontSize: 16,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
