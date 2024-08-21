import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:puzzle_game/main.dart';
import 'package:puzzle_game/playpage.dart';
import 'package:puzzle_game/variables.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIndex();
  }

  void getIndex() async {
    setState(() {
      playIndex = pref!.getInt("currentndex") ?? 0;
      buttunIndex = pref!.getInt("playtndex") ?? 0;
      SIndexList = pref!.getStringList("StringIndex") ?? [];
      DoneList = pref!.getStringList("DoneList") ?? [];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey.shade800.withOpacity(.78),
        backgroundColor: Colors.black.withOpacity(.75),
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            size: 21,
            color: Colors.white38,
          ),
        ),
        title: Text(
          "Levels  ${playIndex}/${task.length}",
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
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);

              },
              icon: Icon(
                CupertinoIcons.home,
                size: 21,
                color: Colors.white38,
              ),
            ),
          ),
          SizedBox(
            width: 10,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: button(index),
                  );
                },
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 40,
                padding: EdgeInsets.only(left: 5, right: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button(int ind) {
    return Stack(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            // shadowColor: MaterialStatePropertyAll(Colors.white12),
            // elevation: MaterialStatePropertyAll(10),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide.none),
            ),
            //Colors.grey.shade800.withOpacity(.90)
            //Colors.grey.shade900.withOpacity(.70)
            //Colors.red.shade200.withOpacity(.08)

            // backgroundColor: MaterialStatePropertyAll(

            // backgroundColor: MaterialStatePropertyAll(
            //     ((SIndexList.contains((ind + 1).toString()))
            //         ? Color(0xff523030)
            //         : (playIndex! == ind)
            //             ? Colors.grey.shade800.withOpacity(.90)
            //             : ((playIndex! > ind)
            //                 ? Colors.grey.shade900.withOpacity(.70)
            //                 : Colors.red.shade200.withOpacity(.08)))),

            backgroundColor: MaterialStatePropertyAll((playIndex! == ind)
                ? Colors.grey.shade800.withOpacity(.90)
                : (DoneList.contains(ind.toString()))
                    ? Colors.grey.shade900.withOpacity(.70)
                    : ((SIndexList.contains(ind.toString())
                        ? Color(0xff523030)
                        : Colors.red.shade200.withOpacity(.08)))),

            overlayColor: MaterialStatePropertyAll(Colors.grey.shade800),
          ),
          onPressed: () {
            setState(() {
              if (playIndex! >= ind) {
                Navigator.pushReplacement(context, CupertinoPageRoute(
                  builder: (context) {
                    return playpage(ind);
                  },
                ));
              }
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 35,
            width: 35,
            child: Text(
              "${ind + 1}",
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
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 30,
            height: 30,
            child: (DoneList.contains(ind.toString()))
                ? Icon(
                    Icons.verified_rounded,
                    color: Color(0xff75BE7E).withOpacity(.4),
                    size: 13,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
// Widget ContainerMethod(int ind) {
//   return Container(
//     alignment: Alignment.center,
//     width: 30,
//     height: 30,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10), color: Colors.grey.shade700),
//     child: Text(
//       "${ind + 1}",
//       style: TextStyle(color: Colors.white, fontSize: 17),
//     ),
//   );
// }

//-----------------------------------------------------------------------
//import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:puzzle_game/main.dart';
// import 'package:puzzle_game/playpage.dart';
// import 'package:puzzle_game/variables.dart';
//
// class secondPage extends StatefulWidget {
//   const secondPage({super.key});
//
//   @override
//   State<secondPage> createState() => _secondPageState();
// }
//
// class _secondPageState extends State<secondPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getIndex();
//   }
//
//   void getIndex() async {
//     playIndex = pref!.getInt("currentndex") ?? 0;
//     buttunIndex = pref!.getInt("playtndex") ?? 0;
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: Colors.grey.shade800.withOpacity(.78),
//         backgroundColor: Colors.black.withOpacity(.75),
//         leading: IconButton(
//           splashRadius: 20,
//           onPressed: () {
//              Navigator.pop(context);
//               // Navigator.pushReplacement(context, CupertinoPageRoute(
//               //   builder: (context) {
//               //     return mainpage();
//               //   },
//               // ));
//           },
//           icon: Icon(
//             CupertinoIcons.back,
//             size: 21,
//             color: Colors.white38,
//           ),
//         ),
//         title: Text(
//           "Levels  ${playIndex}/${task.length}",
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
//           Center(
//             child: IconButton(
//               onPressed: () {
//                 Navigator.pushReplacement(context, CupertinoPageRoute(
//                   builder: (context) {
//                     return mainpage();
//                   },
//                 ));
//               },
//               icon: Icon(
//                 CupertinoIcons.home,
//                 size: 21,
//                 color: Colors.white38,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10,
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
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: button(index),
//                   );
//                 },
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 itemCount: 40,
//                 padding: EdgeInsets.only(left: 5, right: 5),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget button(int ind) {
//     return Stack(
//       children: [
//         ElevatedButton(
//           style: ButtonStyle(
//             // shadowColor: MaterialStatePropertyAll(Colors.white12),
//             // elevation: MaterialStatePropertyAll(10),
//             shape: MaterialStatePropertyAll(
//               RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   side: BorderSide.none),
//             ),
//             backgroundColor: MaterialStatePropertyAll((playIndex! == ind) ? Colors.grey.shade800.withOpacity(.90)
//                 : ((playIndex! > ind)
//                     ? Colors.grey.shade900.withOpacity(.70)
//                     : Colors.red.shade200.withOpacity(.08))),
//             overlayColor: MaterialStatePropertyAll(Colors.grey.shade800),
//           ),
//           onPressed: () {
//             setState(() {
//               if (playIndex! >= ind) {
//                 Navigator.push(context, CupertinoPageRoute(
//                   builder: (context) {
//                     return playpage(ind);
//                   },
//                 ));
//               }
//             });
//           },
//           child: Container(
//             alignment: Alignment.center,
//             height: 35,
//             width: 35,
//             child: Text(
//               "${ind + 1}",
//               style: TextStyle(
//                 fontSize: 17,
//                 // color: Colors.white54,
//                 color: Colors.white38,
//                 shadows: [
//                   Shadow(
//                       color: Colors.black54,
//                       offset: Offset(.6, .8),
//                       blurRadius: 5)
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 5,
//           right: 5,
//           child: Container(
//             width: 30,
//             height: 30,
//             child: (playIndex! > ind)
//                 ? Icon(
//                     Icons.verified_rounded,
//                     color: Color(0xff75BE7E).withOpacity(.4),
//                     size: 13,
//                   )
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
// }
// // Widget ContainerMethod(int ind) {
// //   return Container(
// //     alignment: Alignment.center,
// //     width: 30,
// //     height: 30,
// //     decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(10), color: Colors.grey.shade700),
// //     child: Text(
// //       "${ind + 1}",
// //       style: TextStyle(color: Colors.white, fontSize: 17),
// //     ),
// //   );
// // }
