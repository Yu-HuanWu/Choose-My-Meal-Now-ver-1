
import 'dart:ui';

import 'package:flutter/material.dart';


class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Choose My Meal Now!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightGreen,
      ),
      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: <Widget>[
      Text('Ready to find some good grubs?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40,
              foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color= Colors.lightGreen,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic)),

                Text('Ready to find some good grubs?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
      ]

            )
            ,
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
                  style: TextStyle(fontSize: 30),
                )
            ),
             ]
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text ("Let's see what you are in the mood for..."),
          backgroundColor: Colors.lightGreen[400],
        ),
      body:
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
        Text("Select a protein:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        ]
    ),
        )
    ;
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) :
      super(key: key);

  @override
  _MyStatefulWidgetState createState() =>
      _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse:true);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-0.1,0.0),
      end: const Offset(0.1, 0.0),
    ).animate(
        CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Image(image:
        AssetImage('images/mealimage.png'),
        color: Color.fromRGBO(255, 255, 255, 0.5),
        colorBlendMode: BlendMode.modulate,
      height: double.maxFinite,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}

void main() => runApp(
      MaterialApp(
        home: Stack(
        children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent,

            /*image: new DecorationImage(image:
            new AssetImage('images/mealimage.png'),
            fit: BoxFit.cover),*/
          ),
        child: MyStatefulWidget(),
        //FirstRoute()
    ),
  Container(
    child: FirstRoute(),
      ),
],
),
      ),
);

