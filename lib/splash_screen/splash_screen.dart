import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 4),
      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black26,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
                builder: (context, child) {
                return Transform.rotate(angle: _controller.value * 2.0 * pi,child: child,);
                },
                child: Image.asset('assets/images/virus.png')),
            // SizedBox(
            //   height: height * .05,
            // ),
            Text('Covid_19\nTracker App',textAlign: TextAlign.center,style: TextStyle(
              fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}
