import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:puzzle_game/secondpage.dart';
import 'package:puzzle_game/variables.dart';

class playpage extends StatefulWidget {
  int ind;

  playpage(this.ind);

  @override
  State<playpage> createState() => _playpageState();
}

class _playpageState extends State<playpage> {
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey.shade800.withOpacity(.78),
        backgroundColor: Colors.black.withOpacity(.75),
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(context, CupertinoPageRoute(
                builder: (context) {
                  return secondPage();
                },
              ));
            });
          },
          icon: Icon(
            CupertinoIcons.back,
            size: 21,
            color: Colors.white38,
          ),
        ),
        title: Text(
          "Levels : ${widget.ind + 1}",
          style: TextStyle(
            fontSize: 23,
            // color: Colors.white54,
            color: Colors.white38,
            shadows: [
              Shadow(
                  color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () async {
                if(widget.ind <task.length-1)
                {
                  setState(() { });
                  SIndexList = pref!.getStringList("StringIndex") ?? [];
                    SIndexList.add((widget.ind).toString());
                    // print("object = ${finalIndexList}");
                    print("SIndex = $SIndexList");
                   await pref!.setStringList("StringIndex",SIndexList);
                  await pref!.setInt("playtndex", widget.ind+1);

                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(
                          builder: (context) {
                            return playpage(widget.ind + 1);
                          }));
                }

              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 20,
                  // color: Colors.white54,
                  color: Colors.white38,
                  shadows: [
                    Shadow(
                        color: Colors.black54,
                        offset: Offset(.6, .8),
                        blurRadius: 5)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black87.withOpacity(.80),
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 450,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(.65),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(.16),
                          offset: Offset(3, 2),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                  ),
                  child: Text(
                    "${task[widget.ind]}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white38,
                      shadows: [
                        Shadow(
                            color: Colors.black54,
                            offset: Offset(.6, .8),
                            blurRadius: 5)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900.withOpacity(.45),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(.16),
                            offset: Offset(3, 2),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  width: 10,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade800.withOpacity(.84),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(.6, .8),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Text(
                                                  (answer.isNotEmpty)
                                                      ? answer
                                                      : "Answer",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    // color: Colors.white54,
                                                    color: Colors.white38
                                                        .withOpacity(.40),
                                                    shadows: [
                                                      Shadow(
                                                          color: Colors.black54,
                                                          offset:
                                                              Offset(.6, .8),
                                                          blurRadius: 5)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        radius: 30,
                                        statesController:
                                            MaterialStatesController(),
                                        onLongPress: () {
                                          setState(() {
                                            if (answer.isNotEmpty) {
                                              answer = "";
                                            }
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            if (answer.isNotEmpty) {
                                              answer = answer.substring(
                                                  0, answer.length - 1);
                                            }
                                          });
                                        },
                                        child: Icon(
                                          CupertinoIcons.delete_left,
                                          size: 18,
                                          color: Colors.white38,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black54,
                                              offset: Offset(.6, .8),
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              SizedBox(
                                height: 50,
                                width: 70,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStatePropertyAll(10),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: BorderSide.none),
                                    ),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.grey.shade800.withOpacity(.78)),
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.grey.shade800),
                                  ),
                                  onPressed: () {},
                                  child: Icon(
                                    CupertinoIcons.lightbulb,
                                    size: 23,
                                    color: Colors.white38,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black54,
                                          offset: Offset(.6, .8),
                                          blurRadius: 5)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStatePropertyAll(10),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: BorderSide.none),
                                    ),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.grey.shade800.withOpacity(.78)),
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.grey.shade800),
                                  ),
                                  onPressed: () async {
                                    setState(() {});
                                    if(SIndexList.contains(widget.ind))
                                    {
                                      SIndexList.remove(widget.ind);
                                      await pref!.setStringList("StringIndex", SIndexList);
                                    }
                                    DoneList = pref!.getStringList("DoneList") ?? [];

                                      if (answer == "${answerList[widget.ind]}") {
                                        print("yes");
                                        DoneList.add((widget.ind ).toString());
                                        doneIndex = widget.ind;
                                        await pref!.setStringList("DoneList", DoneList);
                                        if (playIndex! <= doneIndex!) {
                                         await pref!.setInt("currentndex", (widget.ind + 1));
                                        }
                                        snacMethod("Correct Answer");
                                        if(widget.ind<task.length-1){
                                          Navigator.pushReplacement(context,
                                              CupertinoPageRoute(
                                                  builder: (context) {
                                                    return playpage(widget.ind + 1);
                                                  }));
                                        }else if(widget.ind ==task.length-1){
                                          Navigator.pop(context);
                                        }
                                      } else {
                                        print("no");
                                        snacMethod("Wrong Answer");
                                      }

                                      print("doneIndex == ${doneIndex}");
                                      print("playIndex == $playIndex");
                                    print("DoneList  == $DoneList");
                                    print("slist == $SIndexList");
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 70,
                                    child: Text(
                                      "Enter",
                                      style: TextStyle(
                                        fontSize: 17,
                                        // color: Colors.white54,
                                        color: Colors.white38,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black54,
                                              offset: Offset(.6, .8),
                                              blurRadius: 5)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child:
                                      Rowbutton("${numberlist[index]}", index),
                                );
                              },
                              itemCount: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void snacMethod(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white38,
          shadows: [
            Shadow(color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      duration: Duration(milliseconds: 700),
      padding: EdgeInsets.all(10),
      elevation: 5,
    ));
  }

  Widget Rowbutton(String text, int numTap) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(10),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), side: BorderSide.none),
        ),
        backgroundColor:
            MaterialStatePropertyAll(Colors.grey.shade800.withOpacity(.78)),
        overlayColor: MaterialStatePropertyAll(Colors.grey.shade800),
      ),
      onPressed: () {
        setState(() {
          answer = answer + "${numberlist[numTap]}";
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            // color: Colors.white54,
            color: Colors.white38,
            shadows: [
              Shadow(
                  color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
            ],
          ),
        ),
      ),
    );
  }
}

// Widget Rowfun1(String text) {
//   return ElevatedButton(
//     style: ButtonStyle(
//       elevation: MaterialStatePropertyAll(10),
//       shape: MaterialStatePropertyAll(
//         RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5), side: BorderSide.none),
//       ),
//       backgroundColor:
//           MaterialStatePropertyAll(Colors.grey.shade800.withOpacity(.78)),
//       overlayColor: MaterialStatePropertyAll(Colors.grey.shade800),
//     ),
//     onPressed: () {
//       setState(() {});
//     },
//     child: Container(
//       alignment: Alignment.center,
//       height: 50,
//       width: 70,
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 17,
//           // color: Colors.white54,
//           color: Colors.white38,
//           shadows: [
//             Shadow(
//                 color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
//           ],
//         ),
//       ),
//     ),
//   );
// }




//--------------------------------------------------------------------------------------
//import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:puzzle_game/secondpage.dart';
// import 'package:puzzle_game/variables.dart';
//
// class playpage extends StatefulWidget {
//   int ind;
//
//   playpage(this.ind);
//
//   @override
//   State<playpage> createState() => _playpageState();
// }
//
// class _playpageState extends State<playpage> {
//   String answer = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: Colors.grey.shade800.withOpacity(.78),
//         backgroundColor: Colors.black.withOpacity(.75),
//         leading: IconButton(
//           splashRadius: 20,
//           onPressed: () {
//             setState(() {
//               Navigator.pushReplacement(context, CupertinoPageRoute(
//                 builder: (context) {
//                   return secondPage();
//                 },
//               ));
//             });
//           },
//           icon: Icon(
//             CupertinoIcons.back,
//             size: 21,
//             color: Colors.white38,
//           ),
//         ),
//         title: Text(
//           "Levels : ${widget.ind + 1}",
//           style: TextStyle(
//             fontSize: 23,
//             // color: Colors.white54,
//             color: Colors.white38,
//             shadows: [
//               Shadow(
//                   color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
//             ],
//           ),
//         ),
//         actions: [
//           Container(
//             padding: EdgeInsets.only(right: 10),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//             child: InkWell(
//               onTap: () {
//                 pref!.setInt("playtndex", widget.ind+1);
//                 Navigator.pushReplacement(context,
//                     CupertinoPageRoute(
//                         builder: (context) {
//                           return playpage(widget.ind + 1);
//                         }));
//               },
//               child: Text(
//                 "Skip",
//                 style: TextStyle(
//                   fontSize: 20,
//                   // color: Colors.white54,
//                   color: Colors.white38,
//                   shadows: [
//                     Shadow(
//                         color: Colors.black54,
//                         offset: Offset(.6, .8),
//                         blurRadius: 5)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.black87.withOpacity(.80),
//             height: double.maxFinite,
//             width: double.maxFinite,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 450,
//                   width: double.maxFinite,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade900.withOpacity(.65),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black87.withOpacity(.16),
//                           offset: Offset(3, 2),
//                           blurRadius: 5,
//                           spreadRadius: 2)
//                     ],
//                   ),
//                   child: Text(
//                     "${task[widget.ind]}",
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: Colors.white38,
//                       shadows: [
//                         Shadow(
//                             color: Colors.black54,
//                             offset: Offset(.6, .8),
//                             blurRadius: 5)
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade900.withOpacity(.45),
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black87.withOpacity(.16),
//                             offset: Offset(3, 2),
//                             blurRadius: 5,
//                             spreadRadius: 2)
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15, right: 15),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                   height: 50,
//                                   width: 10,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     color:
//                                         Colors.grey.shade800.withOpacity(.84),
//                                     borderRadius: BorderRadius.circular(5),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black54,
//                                         offset: Offset(.6, .8),
//                                         blurRadius: 5,
//                                       ),
//                                     ],
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Flexible(
//                                         child: Row(
//                                           children: [
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Flexible(
//                                               child: SingleChildScrollView(
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                                 child: Text(
//                                                   (answer.isNotEmpty)
//                                                       ? answer
//                                                       : "Answer",
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                     fontSize: 17,
//                                                     // color: Colors.white54,
//                                                     color: Colors.white38
//                                                         .withOpacity(.40),
//                                                     shadows: [
//                                                       Shadow(
//                                                           color: Colors.black54,
//                                                           offset:
//                                                               Offset(.6, .8),
//                                                           blurRadius: 5)
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       InkWell(
//                                         radius: 30,
//                                         statesController:
//                                             MaterialStatesController(),
//                                         onLongPress: () {
//                                           setState(() {
//                                             if (answer.isNotEmpty) {
//                                               answer = "";
//                                             }
//                                           });
//                                         },
//                                         onTap: () {
//                                           setState(() {
//                                             if (answer.isNotEmpty) {
//                                               answer = answer.substring(
//                                                   0, answer.length - 1);
//                                             }
//                                           });
//                                         },
//                                         child: Icon(
//                                           CupertinoIcons.delete_left,
//                                           size: 18,
//                                           color: Colors.white38,
//                                           shadows: [
//                                             Shadow(
//                                               color: Colors.black54,
//                                               offset: Offset(.6, .8),
//                                               blurRadius: 5,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 6,
//                               ),
//                               SizedBox(
//                                 height: 50,
//                                 width: 70,
//                                 child: ElevatedButton(
//                                   style: ButtonStyle(
//                                     elevation: MaterialStatePropertyAll(10),
//                                     shape: MaterialStatePropertyAll(
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           side: BorderSide.none),
//                                     ),
//                                     backgroundColor: MaterialStatePropertyAll(
//                                         Colors.grey.shade800.withOpacity(.78)),
//                                     overlayColor: MaterialStatePropertyAll(
//                                         Colors.grey.shade800),
//                                   ),
//                                   onPressed: () {},
//                                   child: Icon(
//                                     CupertinoIcons.lightbulb,
//                                     size: 23,
//                                     color: Colors.white38,
//                                     shadows: [
//                                       Shadow(
//                                           color: Colors.black54,
//                                           offset: Offset(.6, .8),
//                                           blurRadius: 5)
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 6,
//                               ),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   style: ButtonStyle(
//                                     elevation: MaterialStatePropertyAll(10),
//                                     shape: MaterialStatePropertyAll(
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           side: BorderSide.none),
//                                     ),
//                                     backgroundColor: MaterialStatePropertyAll(
//                                         Colors.grey.shade800.withOpacity(.78)),
//                                     overlayColor: MaterialStatePropertyAll(
//                                         Colors.grey.shade800),
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       if (answer ==
//                                           "${answerList[widget.ind]}") {
//                                         print("yes");
//                                         doneIndex = widget.ind;
//                                         if (playIndex! <= doneIndex!) {
//                                           pref!.setInt("currentndex", (widget.ind + 1));
//                                         }
//                                         print(
//                                             "Current index = ${widget.ind + 1}");
//                                         snacMethod("Correct Answer");
//                                         Navigator.pushReplacement(context,
//                                             CupertinoPageRoute(
//                                                 builder: (context) {
//                                           return playpage(widget.ind + 1);
//                                         }));
//                                       } else {
//                                         print("no");
//                                         snacMethod("Wrong Answer");
//                                       }
//                                     });
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     height: 50,
//                                     width: 70,
//                                     child: Text(
//                                       "Enter",
//                                       style: TextStyle(
//                                         fontSize: 17,
//                                         // color: Colors.white54,
//                                         color: Colors.white38,
//                                         shadows: [
//                                           Shadow(
//                                               color: Colors.black54,
//                                               offset: Offset(.6, .8),
//                                               blurRadius: 5)
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: GridView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 5),
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(6.0),
//                                   child:
//                                       Rowbutton("${numberlist[index]}", index),
//                                 );
//                               },
//                               itemCount: 10,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void snacMethod(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(
//         msg,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 25,
//           color: Colors.white38,
//           shadows: [
//             Shadow(color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
//           ],
//         ),
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//       duration: Duration(milliseconds: 700),
//       padding: EdgeInsets.all(10),
//       elevation: 5,
//     ));
//   }
//
//   Widget Rowbutton(String text, int numTap) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         elevation: MaterialStatePropertyAll(10),
//         shape: MaterialStatePropertyAll(
//           RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5), side: BorderSide.none),
//         ),
//         backgroundColor:
//             MaterialStatePropertyAll(Colors.grey.shade800.withOpacity(.78)),
//         overlayColor: MaterialStatePropertyAll(Colors.grey.shade800),
//       ),
//       onPressed: () {
//         setState(() {
//           answer = answer + "${numberlist[numTap]}";
//         });
//       },
//       child: Container(
//         alignment: Alignment.center,
//         height: 30,
//         width: 30,
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 17,
//             // color: Colors.white54,
//             color: Colors.white38,
//             shadows: [
//               Shadow(
//                   color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Widget Rowfun1(String text) {
// //   return ElevatedButton(
// //     style: ButtonStyle(
// //       elevation: MaterialStatePropertyAll(10),
// //       shape: MaterialStatePropertyAll(
// //         RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(5), side: BorderSide.none),
// //       ),
// //       backgroundColor:
// //           MaterialStatePropertyAll(Colors.grey.shade800.withOpacity(.78)),
// //       overlayColor: MaterialStatePropertyAll(Colors.grey.shade800),
// //     ),
// //     onPressed: () {
// //       setState(() {});
// //     },
// //     child: Container(
// //       alignment: Alignment.center,
// //       height: 50,
// //       width: 70,
// //       child: Text(
// //         text,
// //         style: TextStyle(
// //           fontSize: 17,
// //           // color: Colors.white54,
// //           color: Colors.white38,
// //           shadows: [
// //             Shadow(
// //                 color: Colors.black54, offset: Offset(.6, .8), blurRadius: 5)
// //           ],
// //         ),
// //       ),
// //     ),
// //   );
// // }