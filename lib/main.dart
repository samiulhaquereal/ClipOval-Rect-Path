import 'package:clip/clip_shadow_path.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ClipShadowPath(
              clipper: ClipPathCustomClip(),
              shadow: BoxShadow(
                color: Colors.black,
                offset: Offset(4,4),
                blurRadius: 4,
                spreadRadius: 8
              ),
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.brown,
              ),
            ),
          ),
          SizedBox(height: 20,)
          ,
          Center(
            child: ClipOval(
              clipper: ClipOvalCustomClip(),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.redAccent,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: ClipRect(
              clipper: ClipRectCustomClip(),
              child: Container(
                color: Colors.blueAccent,
                height: 300,
                width: 300,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ClipPathCustomClip extends CustomClipper<Path>{

  @override
  Path getClip(Size size){
    return Path()
     ..lineTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 5,
          size.height - 40,
          size.width / 2,
          size.height - 20
      )
    ..quadraticBezierTo(
        3 / 4 * size.width,
        size.height,
        size.width,
        size.height - 30
    )
    ..lineTo(size.width, 0);
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return false;
  }

}

class ClipOvalCustomClip extends CustomClipper<Rect>{

  @override
  Rect getClip(Size size){
    return Rect.fromLTWH(0, 0, size.width - 15, size.height);
  }
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper){
    return false;
  }

}

class ClipRectCustomClip extends CustomClipper<Rect>{

  @override
  Rect getClip(Size size){
    return Rect.fromLTWH(0, 0, 80, 80);
  }
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper){
    return false;
  }

}


