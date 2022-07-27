import 'package:flutter/cupertino.dart';
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () =>
                        BlocProvider.of<ScorebrdCubit>(context).fetchScores(),
                    icon: Transform.rotate(
                        angle: 3.14 / -1,
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 23,
                        ))),
                Expanded(child: SizedBox()),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<ScorebrdCubit>(context).setErrorState(),
                              icon: Icon(
                                Icons.replay_sharp,
                                color: Colors.grey,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 80,
                            height: 3,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 30,
                                  color: Colors.purple,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 0,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: BlocBuilder<ScorebrdCubit, ScorebrdState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
                child: Stack(
                  children: [
                    Transform.rotate(
                      angle: -1.90,
                      child: Transform(
                          transform: Matrix4.diagonal3Values(100.0, 20.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6630FF),
                                    blurRadius: 0.01,
                                    spreadRadius: 0.001,
                                    offset: Offset.fromDirection(0.5, 0.2))
                              ],
                              color: Color(0xFF6630FF),
                            ),
                            width: 10,
                            height: MediaQuery.of(context).size.height * 0.025,
                          )),
                    ),
                    Center(child: CircularProgressIndicator(color: Color(0xFF6630FF),))
                  ],
            ));
          } else if (state is ErrorState) {
            return Stack(
              children: [
                Transform.rotate(
                  angle: -1.90,
                  child: Transform(
                      transform: Matrix4.diagonal3Values(100.0, 20.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6630FF),
                                blurRadius: 0.01,
                                spreadRadius: 0.001,
                                offset: Offset.fromDirection(0.5, 0.2))
                          ],
                          color: Color(0xFF6630FF),
                        ),
                        width: 10,
                        height: MediaQuery.of(context).size.height * 0.025,
                      )),
                ),
                Center(child: Icon(Icons.close))
              ],
            );
          } else if (state is LoadedState) {
            final scores = state.scores;
            var itemCount = 0;

            return Scaffold(
                body: Stack(
              children: [
                Transform.rotate(
                  angle: -1.90,
                  child: Transform(
                      transform: Matrix4.diagonal3Values(100.0, 20.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6630FF),
                                blurRadius: 0.01,
                                spreadRadius: 0.001,
                                offset: Offset.fromDirection(0.5, 0.2))
                          ],
                          color: Color(0xFF6630FF),
                        ),
                        width: 10,
                        height: MediaQuery.of(context).size.height * 0.025,
                      )),
                ),
                Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "History",
                      style: TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                        letterSpacing: 5.2,
                      ),
                    )),
                ListView.builder(
                  padding: EdgeInsets.only(top: 39),
                  itemCount: 2,
                  itemBuilder: (context, index) => Container(
                    height: height * 0.5,
                    width: width * 0.75,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "MATCHDAY - NO. ${10 - index}",
                          style: TextStyle(
                              color: Color(0xFF6630FF),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 3),
                        ),
                        ListView.builder(
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index2)=> scores[index2].cardGen(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, scores[index2+index*3].date, scores[index2+index*3].score1, scores[index2+index*3].score2, scores[index2+index*3].avatarImg1, scores[index2+index*3].avatarImg2),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ));
          } else {
            return Container(
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
