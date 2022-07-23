import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_cubit/cubit/scorebrd_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("teste!"),
      ),
      body: BlocBuilder<ScorebrdCubit,ScorebrdState>(
        builder: (context, state){
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          } else if(state is ErrorState) {
            return Center(child: Icon(Icons.close),);
          } else if(state is LoadedState) {
            final scores = state.scores;
            
            return ListView.builder(
                itemCount: scores.length,
                itemBuilder: (context,index) => cardGen(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, scores[index].date, scores[index].score1, scores[index].score2, scores[index].avatarImg1, scores[index].avatarImg2)
            );
          } else{
            return Container(color: Colors.purple,);
          }
        },
      ),
    );
  }


  Widget cardRow(var height, var width, int mtd, var date, int p1, int p2,
      int p3, int p4, int p5, int p6, var i1, var i2, var i3) {
    return Container(
      height: height * 0.5,
      width: width * 0.75,
      /*decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color(0xFF6630FF).withOpacity(0.03),blurRadius: 10,spreadRadius: 0.001,offset: Offset.fromDirection(1.55,40))
      ]),*/
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "MATCHDAY - NO. $mtd",
            style: TextStyle(
                color: Color(0xFF6630FF),
                fontWeight: FontWeight.w700,
                letterSpacing: 3),
          ),
          cardGen(height, width, '$date', p1, p2, i1, i2),
          cardGen(height, width, '$date', p3, p4, i3, i2),
          cardGen(height, width, '$date', p5, p6, i3, i1),
        ],
      ),
    );
  }

  Widget cardGen(
      var height, var width, var date, var px, var py, var i1, var i2) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
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
