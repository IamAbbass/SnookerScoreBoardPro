import 'package:SnookerScoreBoardPro/score_board.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class GameOptPage extends StatefulWidget {
  GameOptPage({Key key, this.gameType}) : super(key: key);
  final int gameType;

  @override
  _GameOptPageState createState() => _GameOptPageState();
}

class _GameOptPageState extends State<GameOptPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameTypes[widget.gameType]),
      ),
      body: Center(
        child: widget.gameType == 0 ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("How many red balls ?", style: TextStyle(fontSize: 24,),),
            SizedBox(height: 10),


            RaisedButton(
                padding: EdgeInsets.all(24),
                onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreBoardPage(
                    gameType: 0,
                    redBallCount: 3,
                    playerCount: 2,
                  )),
                );

              },
                child: Text("3 Balls", style: TextStyle(fontSize: 24),),
            ),
            SizedBox(height: 10),

            RaisedButton(
                padding: EdgeInsets.all(24),
                onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreBoardPage(
                    gameType: 0,
                    redBallCount: 6,
                    playerCount: 2,
                  )),
                );

              },
                child: Text("6 Balls", style: TextStyle(fontSize: 24),),
            ),
            SizedBox(height: 10),

            RaisedButton(
                padding: EdgeInsets.all(24),
                onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreBoardPage(
                    gameType: 0,
                    redBallCount: 10,
                    playerCount: 2,
                  )),
                );

              },
                child: Text("10 Balls", style: TextStyle(fontSize: 24),),
            ),
            SizedBox(height: 10),

            RaisedButton(
                padding: EdgeInsets.all(24),
                onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreBoardPage(
                    gameType: 0,
                    redBallCount: 15,
                    playerCount: 2,
                  )),
                );

              },
                child: Text("15 Balls", style: TextStyle(fontSize: 24),),
            ),


          ],
        ) : Container(),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
