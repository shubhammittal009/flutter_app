import 'package:flutter/material.dart';
import 'theme/colors.dart';
import 'top_bar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRIS App',
      theme: appTheme,
      home: Scaffold(
        body: Container(
        // child: TopBar(),
        child: App(),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //
        // T 1  
        // 
        DragBox2(Offset(30.0, 10.0), 'R_ID 1', Colors.orange),
        DragBox2(Offset(30.0, 90.0), 'R_ID 2', Colors.lightGreen),
        DragBox2(Offset(30.0, 170.0), 'R_ID 3', Colors.orange),
        DragBox2(Offset(30.0, 250.0), 'R_ID 4', Colors.lightGreen),
        DragBox2(Offset(30.0, 330.0), 'R_ID 5', Colors.orange),
        DragBox2(Offset(30.0, 410.0), 'R_ID 6', Colors.lightGreen),
        DragBox2(Offset(30.0, 490.0), 'R_ID 7', Colors.orange),
        DragBox2(Offset(30.0, 570.0), 'R_ID 8', Colors.red),
        //
        // T 2  
        // 
        DragBox2(Offset(130.0, 10.0), 'W_ID 1', Colors.orange),
        DragBox2(Offset(130.0, 90.0), 'W_ID 2', Colors.lightGreen),
        DragBox2(Offset(130.0, 170.0), 'W_ID 3', Colors.orange),
        DragBox2(Offset(130.0, 250.0), 'W_ID 4', Colors.lightGreen),
        DragBox2(Offset(130.0, 330.0), 'W_ID 5', Colors.orange),
        DragBox2(Offset(130.0, 410.0), 'W_ID 6', Colors.lightGreen),
        DragBox2(Offset(130.0, 490.0), 'W_ID 7', Colors.orange),
        DragBox2(Offset(130.0, 570.0), 'W_ID 8', Colors.red),
        //
        // T 3  
        // 
        DragBox2(Offset(230.0, 10.0), 'W_ID 1', Colors.orange),
        DragBox2(Offset(230.0, 90.0), 'W_ID 2', Colors.lightGreen),
        DragBox2(Offset(230.0, 170.0), 'W_ID 3', Colors.orange),
        DragBox2(Offset(230.0, 250.0), 'W_ID 4', Colors.lightGreen),
        DragBox2(Offset(230.0, 330.0), 'W_ID 5', Colors.orange),
        DragBox2(Offset(230.0, 410.0), 'W_ID 6', Colors.lightGreen),
        DragBox2(Offset(230.0, 490.0), 'W_ID 7', Colors.orange),
        DragBox2(Offset(230.0, 570.0), 'W_ID 8', Colors.red),
        // 
        Positioned(
          left: 100.0,
          bottom: 0.0,
          child: DragTarget(
            onAccept: (Color color) {
              caughtColor = color;
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                ),
                child: Center(
                  child: Text("Buffer area"),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 120.0,
            height: 100.0,
            color: widget.itemColor,
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 70.0,
            height: 70.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}


// ----------------------------------------------------------------------------------------

class DragBox2 extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox2(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState2 createState() => DragBoxState2();
}

class DragBoxState2 extends State<DragBox2> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 60.0,
            height: 60.0,
            color: widget.itemColor,
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}

// -----------------------------------------------------------

class _HomePageState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TopBar(),
      ),
    );
  }
}