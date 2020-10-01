import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  var gameBoard;

  // Method for Checking Winner
  void isWinner() {
    if (gameBoard[0] != -1 &&
        gameBoard[0] == gameBoard[1] &&
        gameBoard[0] == gameBoard[2]) {
      if (gameBoard[0] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (gameBoard[3] != -1 &&
        gameBoard[3] == gameBoard[4] &&
        gameBoard[3] == gameBoard[5]) {
      if (gameBoard[3] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (gameBoard[6] != -1 &&
        gameBoard[6] == gameBoard[7] &&
        gameBoard[6] == gameBoard[8]) {
      if (gameBoard[6] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (gameBoard[0] != -1 &&
        gameBoard[0] == gameBoard[3] &&
        gameBoard[0] == gameBoard[6]) {
      if (gameBoard[0] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (gameBoard[1] != -1 &&
        gameBoard[1] == gameBoard[4] &&
        gameBoard[1] == gameBoard[7]) {
      if (gameBoard[1] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (gameBoard[2] != -1 &&
        gameBoard[2] == gameBoard[5] &&
        gameBoard[2] == gameBoard[8]) {
      if (gameBoard[2] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (gameBoard[0] != -1 &&
        gameBoard[0] == gameBoard[4] &&
        gameBoard[0] == gameBoard[8]) {
      if (gameBoard[0] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (gameBoard[2] != -1 &&
        gameBoard[2] == gameBoard[4] &&
        gameBoard[2] == gameBoard[6]) {
      if (gameBoard[2] == 0) {
        setState(() {
          this.message = "Circle Wins";
        });
      } else {
        setState(() {
          this.message = "Cross Wins";
        });
      }
    } else if (!this.gameBoard.contains(-1)) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  // Method for Reseting Game
  void resetGame() {
    setState(() {
      this.gameBoard = [-1, -1, -1, -1, -1, -1, -1, -1, -1];
      this.message = "";
    });
  }

  void playGame(int idx) {
    if (this.message != "") return;
    if (this.gameBoard[idx] == -1) {
      setState(() {
        if (this.isCross) {
          this.gameBoard[idx] = 1;
        } else {
          this.gameBoard[idx] = 0;
        }
        this.isCross = !this.isCross;
        this.isWinner();
      });
    }
  }

  AssetImage getImage(int value) {
    switch (value) {
      case 0:
        return circle;
      case 1:
        return cross;
      default:
        return edit;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameBoard = [-1, -1, -1, -1, -1, -1, -1, -1, -1];
      this.message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tic Tac Toe",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.help),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('How to Play?',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        content: Text(
                          '1. Take turns to draw symbols ❌⭕ \n\n'
                          '2. Click on boxes to edit ✏\n\n'
                          '3. First one with same symbols in a row wins 🎉\n\n'
                          "4. If no one gets a row it's a draw 🔄",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    });
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 9,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameBoard[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              this.resetGame();
            },
            color: Colors.purple,
            minWidth: 300.0,
            height: 50.0,
            child: Text(
              "Reset Game",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Developed By Divyanshu Rawat",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
