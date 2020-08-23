import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Choose My Meal Now!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Stack(children: <Widget>[
          Text('Ready to find some good grub?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          Text('Ready to find some good grub?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
        ]),
        RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondRouteBackground()),
              );
            },
            child: Text(
              'Yes! I am hungry!',
              style: TextStyle(fontSize: 30),
            )),
        BottomCredit(),
      ]),
    );
  }
}

class BottomCredit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        child: const Text('About', style: TextStyle(fontSize: 20)),
        color: Colors.transparent,
        textColor: Colors.blueAccent,
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Credits(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('About this App'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                      'The following people helped made my first app possible:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(15.0),
                    children: <Widget>[
                      ListTile(
                        leading: Text('🏆Me🏆',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                        title: Text(
                            "In order for me to make this app, I must first exist. Ipso facto my existence made this app possible. Quod erat demonstrandum."),
                      ),
                      ListTile(
                        leading: Text('Aaron Hong',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                        title: Text(
                            'Took my undisciplined codes and made it look presentable, basically the Mr. Miyagi to my Daniel-san.🥢'),
                      ),
                      ListTile(
                        leading: Text('Eric Yen',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                        title: Text(
                            'Thanks for getting me started on coding. You gave me a lot of valuable insights and, of course, a life long friendship. I continue to miss you everyday.'),
                      ),
                      ListTile(
                        title: SizedBox(
                            height: 500.0,
                            width: 500.0,
                            child: Image.asset('images/friend.jpg')),
                      ),
                    ],
                  ),

                  //Text("- Me: in order for me to make this app, I must first exist. Ipso facto my existence made this app possible. Quod erat demonstrandum."),
                ])));
  }
}
//Old SecondRoute, must always evolve

//class SecondRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.transparent,
//      appBar: AppBar(
//        title: Text('What you are in the mood for?'),
//        backgroundColor: Colors.lightGreen[400],
//        centerTitle: true,
//      ),
//      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//        Text('Select a protein:🍗',
//            textAlign: TextAlign.center,
//            style: TextStyle(
//                fontSize: 40,
//                color: Colors.black,
//                fontWeight: FontWeight.bold)),
//        DropDown1Widget(),
//        Text('Do you like it hot? asdfghjk',
//            textAlign: TextAlign.center,
//            style: TextStyle(
//                fontSize: 40,
//                color: Colors.black,
//                fontWeight: FontWeight.bold)),
//        DropDown2Widget(),
//        RaisedButton(
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => ThirdRoute()),
//              );
//            },
//            child: Text(
//              'Yes! I am hungry!',
//              style: TextStyle(fontSize: 30),
//            )),
//      ]),
//    );
//  }
//}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('What you are in the mood for?'),
        backgroundColor: Colors.lightGreen[400],
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('Select a protein:🍗',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        Expanded(
          child: proteinlistview(),
        )
      ]),
    );
  }
}

//random route generator
class RouteGenerator {
  static List<String> myBeefPages = [
    'BigMacRoute',
    'HamburgerRoute',
    'DoublecheeseburgerRoute',
    'dqpcheeseRoute',
    'qpcheesebaconRoute'
  ];
  static List<String> myChickenPages = [
    'ButtermilkcrispychickenRoute',
    'McchickenRoute',
    'McnuggetsRoute'
  ];
  static List<String> myPorkPages = [
    'qpcheesebaconRoute',
    'McribRoute',
    'EggmcmuffinRoute'
  ];
  static List<String> mySeafoodPages = ['FiletofishRoute', 'EbifiletoRoute'];
  static List<String> myVegetarianPages = [
    'HotcakesRoute',
    'SidesaladRoute',
    'WorldfamousfriesRoute'
  ];

  static String getRandomBeefRoute() {
    return myBeefPages[Random().nextInt(myBeefPages.length)];
  }

  static String getRandomChickenRoute() {
    return myChickenPages[Random().nextInt(myChickenPages.length)];
  }

  static String getRandomPorkRoute() {
    return myPorkPages[Random().nextInt(myPorkPages.length)];
  }

  static String getRandomSeafoodRoute() {
    return mySeafoodPages[Random().nextInt(mySeafoodPages.length)];
  }

  static String getRandomVegetarianRoute() {
    return myVegetarianPages[Random().nextInt(myVegetarianPages.length)];
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'BigMacRoute':
        return MaterialPageRoute(builder: (_) => BigMacRoute());

      case 'HamburgerRoute':
        return MaterialPageRoute(builder: (_) => HamburgerRoute());

      case 'DoublecheeseburgerRoute':
        return MaterialPageRoute(builder: (_) => DoublecheeseburgerRoute());

      case 'dqpcheeseRoute':
        return MaterialPageRoute(builder: (_) => dqpcheeseRoute());

      case 'qpcheesebaconRoute':
        return MaterialPageRoute(builder: (_) => qpcheesebaconRoute());

      case 'ButtermilkcrispychickenRoute':
        return MaterialPageRoute(
            builder: (_) => ButtermilkcrispychickenRoute());

      case 'McchickenRoute':
        return MaterialPageRoute(builder: (_) => McchickenRoute());

      case 'McnuggetsRoute':
        return MaterialPageRoute(builder: (_) => McnuggetsRoute());

      case 'McribRoute':
        return MaterialPageRoute(builder: (_) => McribRoute());

      case 'EggmcmuffinRoute':
        return MaterialPageRoute(builder: (_) => EggmcmuffinRoute());

      case 'FiletofishRoute':
        return MaterialPageRoute(builder: (_) => FiletofishRoute());

      case 'EbifiletoRoute':
        return MaterialPageRoute(builder: (_) => EbifiletoRoute());

      case 'HotcakesRoute':
        return MaterialPageRoute(builder: (_) => HotcakesRoute());

      case 'SidesaladRoute':
        return MaterialPageRoute(builder: (_) => SidesaladRoute());

      case 'WorldfamousfriesRoute':
        return MaterialPageRoute(builder: (_) => WorldfamousfriesRoute());
    }
  }
}

//listview for proteins
class proteinlistview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Text('🐮'),
            title: Text('Beef'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(RouteGenerator.getRandomBeefRoute());
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: Text('🐔'),
            title: Text('Chicken'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(RouteGenerator.getRandomChickenRoute());
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: Text('🐷'),
            title: Text('Pork'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(RouteGenerator.getRandomPorkRoute());
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: Text('🐟'),
            title: Text('Seafood'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(RouteGenerator.getRandomSeafoodRoute());
            },
          ),
        ),
        Card(
          child: ListTile(
              leading: Text('🥬'),
              title: Text('Vegetarian'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RouteGenerator.getRandomVegetarianRoute());
              }),
        ),
      ],
    );
  }
}

class SecondRouteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Stack(
          children: [MyStatefulWidget(), SecondRoute()],
        ));
  }
}

//one of the optional route after SecondRoute, this one is for BigMac

class BigMacRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/BigMac.png'),
          ),
          Text('Big Mac!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class HamburgerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/hamburger.png'),
          ),
          Text('Hamburger!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class DoublecheeseburgerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/doublecheeseburger.png'),
          ),
          Text('Double Cheeseburger!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class ButtermilkcrispychickenRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/buttermilkcrispychicken.png'),
          ),
          Text('Buttermilk Crispy Chicken!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class McchickenRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/mcchicken.png'),
          ),
          Text('McChicken!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class McnuggetsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/mcnuggets.png'),
          ),
          Text('McNuggets!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class dqpcheeseRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/dqpcheese.png'),
          ),
          Text('Double Quarter Pounder with Cheese!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class qpcheesebaconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/qpcheesebacon.png'),
          ),
          Text('Quarter Pounder with Cheese Bacon!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class McribRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/mcrib.png'),
          ),
          Text('McRib!*',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Text('*may or may not be avaliable at current time'),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class EggmcmuffinRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/eggmcmuffin.png'),
          ),
          Text('Egg McMuffin!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class FiletofishRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/filetofish.png'),
          ),
          Text('Filet-O-Fish!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class EbifiletoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/ebifileto.png'),
          ),
          Text('EBI Filet-O!*',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Text('*Avaliable in Japan.'),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class HotcakesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/hotcakes.png'),
          ),
          Text('Hotcakes!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class SidesaladRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/sidesalad.png'),
          ),
          Text('Side Salad!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

class WorldfamousfriesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('You are in the mood for...'),
          backgroundColor: Colors.lightGreen[400],
          centerTitle: true,
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage('images/worldfamousfries.png'),
          ),
          Text('World Famous Fries!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Not even close? Let us try again!',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
        ]));
  }
}

////Drop Down menu for protein types
//class DropDown1Widget extends StatefulWidget {
//  DropDown1Widget({Key key}) : super(key: key);
//
//  @override
//  _DropDown1WidgetState createState() => _DropDown1WidgetState();
//}
//
//class _DropDown1WidgetState extends State<DropDown1Widget> {
//  String dropdownValue = 'Chicken';
//
//  @override
//  Widget build(BuildContext context) {
//    return DropdownButton<String>(
//      value: dropdownValue,
//      icon: Icon(Icons.arrow_drop_down),
//      iconSize: 24,
//      elevation: 16,
//      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
//      underline: Container(
//        height: 2,
//        color: Colors.deepPurpleAccent,
//      ),
//      onChanged: (String newValue) {
//        setState(() {
//          dropdownValue = newValue;
//        });
//      },
//      items: <String>[
//        'Chicken',
//        'Beef',
//        'Seafood',
//        'Pork',
//        'Vegetarian',
//        'Choose for me!'
//      ].map<DropdownMenuItem<String>>((String value) {
//        return DropdownMenuItem<String>(
//          value: value,
//          child: Text(value),
//        );
//      }).toList(),
//    );
//  }
//}
//
////Drop down menu 2 for spice level
//class DropDown2Widget extends StatefulWidget {
//  DropDown2Widget({Key key}) : super(key: key);
//
//  @override
//  _DropDown2WidgetState createState() => _DropDown2WidgetState();
//}
//
//class _DropDown2WidgetState extends State<DropDown2Widget> {
//  String dropdownValue = 'Hot';
//
//  @override
//  Widget build(BuildContext context) {
//    return DropdownButton<String>(
//      value: dropdownValue,
//      icon: Icon(Icons.arrow_drop_down),
//      iconSize: 24,
//      elevation: 16,
//      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),
//      underline: Container(
//        height: 2,
//        color: Colors.pinkAccent,
//      ),
//      onChanged: (String newValue) {
//        setState(() {
//          dropdownValue = newValue;
//        });
//      },
//      items: <String>['Hot', 'Mild', 'Not Spicy', 'Choose for me!']
//          .map<DropdownMenuItem<String>>((String value) {
//        return DropdownMenuItem<String>(
//          value: value,
//          child: Text(value),
//        );
//      }).toList(),
//    );
//  }
//}

//Freaking animated background for the home page
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
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
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-0.1, 0.0),
      end: const Offset(0.1, 0.0),
    ).animate(CurvedAnimation(
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
      child: Image(
        image: AssetImage('images/mealimage.png'),
        color: Color.fromRGBO(255, 255, 255, 0.5),
        colorBlendMode: BlendMode.modulate,
        height: double.maxFinite,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}

//idk i guess this is where the app actually run
void main() {
  //debugPaintSizeEnabled= true;
  runApp(
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
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
