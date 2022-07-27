import 'package:flutter/material.dart';

class Score {
  String? avatarImg1;
  String? avatarImg2;
  String? date;
  int? score1;
  int? score2;

  Score({
    this.avatarImg1,
    this.avatarImg2,
    this.score1,
    this.score2,
    this.date
  });

  Widget cardGen(
      var height, var width, var date, var px, var py, var i1, var i2) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      shadowColor: Color(0xFF6630FF).withOpacity(0.12),
      elevation: 20,
      child: Container(
        height: height * 0.13,
        width: width,
        child: Stack(children: [
          Transform.rotate(
            angle: 3.14 / -2,
            child: Container(
              height: 63,
              width: 75,
              child: Text(
                '$date',
                style: TextStyle(fontSize: 11, color: Colors.grey[300]),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(i1),
                minRadius: 30,
              ),
              Text(
                "$px",
                style: TextStyle(fontSize: 32),
              ),
              Transform.rotate(
                angle: 3.14 / 7,
                child: Container(
                  width: 1,
                  height: 150,
                  color: Colors.grey[100],
                ),
              ),
              Text(
                "$py",
                style: TextStyle(fontSize: 32),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(i2),
                minRadius: 30,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
