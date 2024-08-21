import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  const SnackBarDemo({super.key});

  @override
  State<SnackBarDemo> createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade800.withOpacity(.80),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  snacMetho("msg");
                });
              },
              child: Text("data")),
        ),
      ),
    );
  }

  void snacMetho(String msg) {
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
}
