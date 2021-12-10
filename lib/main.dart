import 'package:SnookerScoreBoardPro/game_opt.dart';
import 'package:SnookerScoreBoardPro/score_board.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snooker Scoreboard Pro',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Snooker Scoreboard Pro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Select Game Type:", style: TextStyle(fontSize: 24,),),

            SizedBox(height: 10),

            RaisedButton(
                padding: EdgeInsets.all(24),
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GameOptPage(gameType: 0,)),);},
                child: Text(gameTypes[0], style: TextStyle(fontSize: 24),),
            ),

            SizedBox(height: 10),

            RaisedButton(
              padding: EdgeInsets.all(24),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreBoardPage(
                    gameType: 1,
                    redBallCount: 6,
                    playerCount: 2,
                  )),
                );
              },
              child: Text(gameTypes[1], style: TextStyle(fontSize: 24),),
            ),

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
