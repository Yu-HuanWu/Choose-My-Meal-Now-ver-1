
import 'package:flutter/material.dart';


class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Choose My Meal Now!'),
        backgroundColor: Colors.blueGrey[200],
      ),
      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Ready to find some good grubs?',
            style: TextStyle(fontSize: 40)),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                    (context) => SecondRoute()),
                  );
                },
                child: Text(
                  'Yes! I am hungry!',
                  style: TextStyle(fontSize: 20),
                )
            ),
            Image(image:
            AssetImage('images/mealimage.png'))
          ]
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text ("What do you feel like?"),
  backgroundColor: Colors.blueGrey[100],
),
      body:
        Column(

        )
    );
  }
}


void main() => runApp(
      MaterialApp(
        home: FirstRoute()
    ),
);

