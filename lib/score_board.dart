import 'package:flutter/material.dart';

import 'constants.dart';
import 'models/score.dart';

class ScoreBoardPage extends StatefulWidget {
  ScoreBoardPage({Key key, this.gameType, this.redBallCount, this.playerCount}) : super(key: key);
  final int gameType;
  final int redBallCount;
  final int playerCount;
  @override
  _ScoreBoardPageState createState() => _ScoreBoardPageState();
}

class _ScoreBoardPageState extends State<ScoreBoardPage> {

  int selectedPlayer = 1;
  List<Score> score = List<Score>();

  int player_1_score = 0;
  int player_2_score = 0;

  String remaining_points = "-";

  @override
  void initState() {
    setState(() {
      remaining_points = ((widget.redBallCount*8)+7+6+5+4+3+2).toString();
    });
    super.initState();
  }

  void updateScore(int points){   

    score.add(
      Score(
        player: selectedPlayer,
        points: points,
      )
    );

    syncScore();
  }

  void syncScore(){
    int temp_player_1_score = 0;
    int temp_player_2_score = 0;

    int redBallLeft = widget.redBallCount;
    score.forEach((element) {
      print("Player ${element.player} scores ${element.points}");
      if(element.player == 1){
        temp_player_1_score += element.points;
      }else if(element.player == 2){
        temp_player_2_score += element.points;
      }

      if(element.points == 1){
        redBallLeft--;
      }
    });

    setState(() {
      player_1_score = temp_player_1_score;
      player_2_score = temp_player_2_score;   
      if(redBallLeft > 0){
        remaining_points = ((redBallLeft*8)+7+6+5+4+3+2).toString();
      }else{
        remaining_points = "< 27";
      }        
    });
  }

  clearScore(BuildContext context) { 
    showDialog(  
      context: context,  
      builder: (BuildContext context) {  
        return AlertDialog(  
          title: Text("Are you sure to want to clear the score ?"), 
          actions: [  
            FlatButton(  
              child: Text("No"),  
              onPressed: () {  
                Navigator.of(context).pop();  
              },  
            ),
            FlatButton(  
              child: Text("Yes"),  
              onPressed: () {  
                setState(() {
                  selectedPlayer = 1;
                  score = List<Score>();
                  player_1_score = 0;
                  player_2_score = 0;
                  remaining_points = ((widget.redBallCount*8)+7+6+5+4+3+2).toString();
                });
                Navigator.of(context).pop();  
              },  
            ),  
            
          ],  
        );  
      },  
    );  
  }  

  goBack(BuildContext context) { 
    showDialog(  
      context: context,  
      builder: (BuildContext context) {  
        return AlertDialog(  
          title: Text("Are you sure to want to clear the score ?"), 
          actions: [  
            FlatButton(  
              child: Text("No"),  
              onPressed: () {  
                Navigator.of(context).pop();  
              },  
            ),
            FlatButton(  
              child: Text("Yes"),  
              onPressed: () {  
                Navigator.of(context).pop();  
                Navigator.of(context).pop();  
              },  
            ),  
            
          ],  
        );  
      },  
    );  
  }  



  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
      
      onWillPop: () async { 
        goBack(context);        
      },
      child: new Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("${gameTypes[widget.gameType]}"),
          actions: [
            FlatButton(
              onPressed: (){
                clearScore(context);
              }, 
              child: Text("Clear", style: TextStyle(color: Colors.white))
            ),
          ],
        ),
        body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text("Player 1", style: TextStyle(fontWeight: selectedPlayer==1 ? FontWeight.bold : null, fontSize: 24),),
                  trailing: Text("${player_1_score}${selectedPlayer==1 ? '*' : ''}", style: TextStyle(fontWeight: selectedPlayer==1 ? FontWeight.bold : null, fontSize: 36),),
                  leading: selectedPlayer == 1 ? Icon(Icons.keyboard_arrow_right_outlined, size: 24) : Container(height:0, width: 0,),
                  subtitle: Text("Tap to select player"),
                  onTap: (){
                    setState(() {
                      selectedPlayer = 1;
                    });
                  },
                ),
                ListTile(
                  title: Text("Player 2", style: TextStyle(fontWeight: selectedPlayer==2 ? FontWeight.bold : null, fontSize: 24),),
                  trailing: Text("${player_2_score}${selectedPlayer==2 ? '*' : ''}", style: TextStyle(fontWeight: selectedPlayer==2 ? FontWeight.bold : null, fontSize: 36),),
                  leading: selectedPlayer == 2 ? Icon(Icons.keyboard_arrow_right_outlined, size: 24) : Container(height:0, width: 0,),
                  subtitle: Text("Tap to select player"),
                  onTap: (){
                    setState(() {
                      selectedPlayer = 2;
                    });
                  },
                ),
                widget.gameType == 0 ? Divider() : Container(),
                widget.gameType == 0 ? ListTile(
                  title: Text("Remaining Points On Table", style: TextStyle(fontSize: 24),),
                  trailing: Text(remaining_points, style: TextStyle(fontSize: 24),),
                ) : Container(),
              ],
            )
        ),//
        bottomNavigationBar: Container(
          height: 205,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10.0,
            children: [
              ElevatedButton(
                onPressed: () {updateScore(1);},
                child: Text('1', style: TextStyle(fontSize: 24),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              ),
              ElevatedButton(
                onPressed: () {updateScore(2);},
                child: Text('2', style: TextStyle(fontSize: 24),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              ),
              ElevatedButton(
                onPressed: () {updateScore(3);},
                child: Text('3', style: TextStyle(fontSize: 24),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              ),
              ElevatedButton(
                onPressed: () {updateScore(4);},
                child: Text('4', style: TextStyle(fontSize: 24),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              ),
              ElevatedButton(
                onPressed: () {updateScore(5);},
                child: Text('5', style: TextStyle(fontSize: 24),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              ),
              ElevatedButton(
                onPressed: () {updateScore(6);},
                child: Text('6', style: TextStyle(fontSize: 24),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              ),
              ElevatedButton(
                onPressed: () {updateScore(7);},
                child: Text('7', style: TextStyle(fontSize: 24),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    score.removeLast();
                  });
                  syncScore();
                },
                child: Icon(Icons.undo, size: 24,),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(36),
                ),
              )
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }
}
