import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_game/playpage.dart';
import 'package:puzzle_game/secondpage.dart';
import 'package:puzzle_game/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: mainpage(),
  ));
}

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIndex();
  }

  void getIndex() async {
    setState(() {});
    pref = await SharedPreferences.getInstance();
    playIndex = pref!.getInt("currentndex") ?? 0;
    buttunIndex = pref!.getInt("playtndex") ?? 0;
    SIndexList = pref!.getStringList("StringIndex") ?? [];
    DoneList = pref!.getStringList("DoneList") ?? [];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black87.withOpacity(.80),
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Puzzle\nHUB",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    // color: Colors.white54,
                    color: Colors.white38,
                    shadows: [
                      Shadow(
                          color: Colors.black54,
                          offset: Offset(1, 1),
                          blurRadius: 8),
                      Shadow(
                          color: Colors.white54,
                          offset: Offset(-0.5, -.5),
                          blurRadius: 5),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      // shadowColor: MaterialStatePropertyAll(Colors.white12),
                      // elevation: MaterialStatePropertyAll(10),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide.none),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.grey.shade800.withOpacity(.78)),
                      overlayColor:
                          MaterialStatePropertyAll(Colors.grey.shade800),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return playpage(buttunIndex!);
                          },
                        ));
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.play_arrow_solid,
                              color: Colors.white38,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  offset: Offset(.6, .8),
                                  blurRadius: 5,
                                ),
                              ],
                              size: 17),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "play",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white38,
                              shadows: [
                                Shadow(
                                    color: Colors.black54,
                                    offset: Offset(.6, .8),
                                    blurRadius: 5)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                ElevatedButton(
                  style: ButtonStyle(
                    // shadowColor: MaterialStatePropertyAll(Colors.white12),
                    // elevation: MaterialStatePropertyAll(10),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide.none),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.grey.shade800.withOpacity(.78)),
                    overlayColor:
                        MaterialStatePropertyAll(Colors.grey.shade800),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return secondPage();
                        },
                      ));
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.circle_grid_hex_fill,
                          size: 19,
                          color: Colors.white38,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(.6, .8),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Levels",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white38,
                            shadows: [
                              Shadow(
                                  color: Colors.black54,
                                  offset: Offset(.6, .8),
                                  blurRadius: 5)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    // shadowColor: MaterialStatePropertyAll(Colors.white12),
                    // elevation: MaterialStatePropertyAll(10),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide.none),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.grey.shade800.withOpacity(.78)),
                    overlayColor:
                        MaterialStatePropertyAll(Colors.grey.shade800),
                  ),
                  onPressed: () {
                    setState(() {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.grey.shade50,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            elevation: 3,
                            shadowColor: Colors.black12,
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(05),
                              height: 110,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      // shadowColor: MaterialStatePropertyAll(Colors.white12),
                                      // elevation: MaterialStatePropertyAll(10),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: BorderSide.none),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.grey.shade800
                                              .withOpacity(.78)),
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.grey.shade800),
                                    ),
                                    onPressed: () async {
                                      setState(() {});
                                      await pref!.setInt("currentndex", 0);
                                      await pref!.setInt("playtndex", 0);
                                      await pref!.setStringList("DoneList", []);
                                      await pref!
                                          .setStringList("StringIndex", []);
                                      SIndexList = [];
                                      DoneList = [];
                                      buttunIndex = 0;
                                      playIndex = 0;
                                      doneIndex = 0;

                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.restart,
                                            size: 19,
                                            color: Colors.white38,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black54,
                                                offset: Offset(.6, .8),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "Reset",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white38,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black54,
                                                    offset: Offset(.6, .8),
                                                    blurRadius: 5)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      // shadowColor: MaterialStatePropertyAll(Colors.white12),
                                      // elevation: MaterialStatePropertyAll(10),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: BorderSide.none),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.grey.shade800
                                              .withOpacity(.78)),
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.grey.shade800),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.nosign,
                                            size: 19,
                                            color: Colors.white38,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black54,
                                                offset: Offset(.6, .8),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white38,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black54,
                                                    offset: Offset(.6, .8),
                                                    blurRadius: 5)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          // Icons.settings,
                          CupertinoIcons.settings_solid,
                          size: 19,
                          color: Colors.white38,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(.6, .8),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white38,
                            shadows: [
                              Shadow(
                                  color: Colors.black54,
                                  offset: Offset(.6, .8),
                                  blurRadius: 5)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------
//import 'dart:ffi';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:puzzle_game/playpage.dart';
// import 'package:puzzle_game/secondpage.dart';
// import 'package:puzzle_game/variables.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: mainpage(),
//   ));
// }
//
// class mainpage extends StatefulWidget {
//   const mainpage({super.key});
//
//   @override
//   State<mainpage> createState() => _mainpageState();
// }
//
// class _mainpageState extends State<mainpage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getIndex();
//   }
//
//   void getIndex() async {
//     pref = await SharedPreferences.getInstance();
//     playIndex = pref!.getInt("currentndex") ?? 0;
//     buttunIndex = pref!.getInt("playtndex") ?? 0;
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.black87.withOpacity(.80),
//             height: double.maxFinite,
//             width: double.maxFinite,
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Puzzle\nHUB",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 35,
//                     // color: Colors.white54,
//                     color: Colors.white38,
//                     shadows: [
//                       Shadow(
//                           color: Colors.black54,
//                           offset: Offset(1, 1),
//                           blurRadius: 8),
//                       Shadow(
//                           color: Colors.white54,
//                           offset: Offset(-0.5, -.5),
//                           blurRadius: 5),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 100,
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       // shadowColor: MaterialStatePropertyAll(Colors.white12),
//                       // elevation: MaterialStatePropertyAll(10),
//                       shape: MaterialStatePropertyAll(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             side: BorderSide.none),
//                       ),
//                       backgroundColor: MaterialStatePropertyAll(
//                           Colors.grey.shade800.withOpacity(.78)),
//                       overlayColor:
//                           MaterialStatePropertyAll(Colors.grey.shade800),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         Navigator.push(context, CupertinoPageRoute(
//                           builder: (context) {
//                             return playpage(buttunIndex!);
//                           },
//                         ));
//                       });
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 35,
//                       width: 90,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(CupertinoIcons.play_arrow_solid,
//                               color: Colors.white38,
//                               shadows: [
//                                 Shadow(
//                                   color: Colors.black54,
//                                   offset: Offset(.6, .8),
//                                   blurRadius: 5,
//                                 ),
//                               ],
//                               size: 17),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Text(
//                             "play",
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white38,
//                               shadows: [
//                                 Shadow(
//                                     color: Colors.black54,
//                                     offset: Offset(.6, .8),
//                                     blurRadius: 5)
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     // shadowColor: MaterialStatePropertyAll(Colors.white12),
//                     // elevation: MaterialStatePropertyAll(10),
//                     shape: MaterialStatePropertyAll(
//                       RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           side: BorderSide.none),
//                     ),
//                     backgroundColor: MaterialStatePropertyAll(
//                         Colors.grey.shade800.withOpacity(.78)),
//                     overlayColor:
//                         MaterialStatePropertyAll(Colors.grey.shade800),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       Navigator.push(context, CupertinoPageRoute(
//                         builder: (context) {
//                           return secondPage();
//                         },
//                       ));
//                     });
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 35,
//                     width: 90,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           CupertinoIcons.circle_grid_hex_fill,
//                           size: 19,
//                           color: Colors.white38,
//                           shadows: [
//                             Shadow(
//                               color: Colors.black54,
//                               offset: Offset(.6, .8),
//                               blurRadius: 5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Text(
//                           "Levels",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white38,
//                             shadows: [
//                               Shadow(
//                                   color: Colors.black54,
//                                   offset: Offset(.6, .8),
//                                   blurRadius: 5)
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     // shadowColor: MaterialStatePropertyAll(Colors.white12),
//                     // elevation: MaterialStatePropertyAll(10),
//                     shape: MaterialStatePropertyAll(
//                       RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           side: BorderSide.none),
//                     ),
//                     backgroundColor: MaterialStatePropertyAll(
//                         Colors.grey.shade800.withOpacity(.78)),
//                     overlayColor:
//                         MaterialStatePropertyAll(Colors.grey.shade800),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       showDialog(barrierDismissible: false,
//                         context: context,
//                         builder: (context) {
//                           return Dialog(
//                             backgroundColor: Colors.grey.shade50,
//                             shape: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide.none,
//                             ),
//                             elevation: 3,
//                             shadowColor: Colors.black12,
//                             alignment: Alignment.center,
//                             child: Container(
//                               padding: EdgeInsets.all(05),
//                               height: 110,
//                               alignment: Alignment.center,
//                               child: Column(
//                                 children: [
//                                   ElevatedButton(
//                                     style: ButtonStyle(
//                                       // shadowColor: MaterialStatePropertyAll(Colors.white12),
//                                       // elevation: MaterialStatePropertyAll(10),
//                                       shape: MaterialStatePropertyAll(
//                                         RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(20),
//                                             side: BorderSide.none),
//                                       ),
//                                       backgroundColor: MaterialStatePropertyAll(
//                                           Colors.grey.shade800.withOpacity(.78)),
//                                       overlayColor: MaterialStatePropertyAll(
//                                           Colors.grey.shade800),
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         pref!.setInt("currentndex", 0);
//                                         pref!.setInt("playtndex", 0);
//                                         buttunIndex = 0;
//                                         playIndex = 0;
//                                         doneIndex = 0;
//                                       });
//                                       Navigator.pop(context);
//                                     },
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       height: 35,
//                                       width: 90,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.restart,
//                                             size: 19,
//                                             color: Colors.white38,
//                                             shadows: [
//                                               Shadow(
//                                                 color: Colors.black54,
//                                                 offset: Offset(.6, .8),
//                                                 blurRadius: 5,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             width: 6,
//                                           ),
//                                           Text(
//                                             "Reset",
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                               color: Colors.white38,
//                                               shadows: [
//                                                 Shadow(
//                                                     color: Colors.black54,
//                                                     offset: Offset(.6, .8),
//                                                     blurRadius: 5)
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   ElevatedButton(
//                                     style: ButtonStyle(
//                                       // shadowColor: MaterialStatePropertyAll(Colors.white12),
//                                       // elevation: MaterialStatePropertyAll(10),
//                                       shape: MaterialStatePropertyAll(
//                                         RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(20),
//                                             side: BorderSide.none),
//                                       ),
//                                       backgroundColor: MaterialStatePropertyAll(
//                                           Colors.grey.shade800.withOpacity(.78)),
//                                       overlayColor: MaterialStatePropertyAll(
//                                           Colors.grey.shade800),
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                        Navigator.pop(context);
//                                       });
//                                     },
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       height: 35,
//                                       width: 90,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.nosign,
//                                             size: 19,
//                                             color: Colors.white38,
//                                             shadows: [
//                                               Shadow(
//                                                 color: Colors.black54,
//                                                 offset: Offset(.6, .8),
//                                                 blurRadius: 5,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             width: 6,
//                                           ),
//                                           Text(
//                                             "Cancel",
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                               color: Colors.white38,
//                                               shadows: [
//                                                 Shadow(
//                                                     color: Colors.black54,
//                                                     offset: Offset(.6, .8),
//                                                     blurRadius: 5)
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     });
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 35,
//                     width: 90,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           // Icons.settings,
//                           CupertinoIcons.settings_solid,
//                           size: 19,
//                           color: Colors.white38,
//                           shadows: [
//                             Shadow(
//                               color: Colors.black54,
//                               offset: Offset(.6, .8),
//                               blurRadius: 5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Text(
//                           "Settings",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white38,
//                             shadows: [
//                               Shadow(
//                                   color: Colors.black54,
//                                   offset: Offset(.6, .8),
//                                   blurRadius: 5)
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
