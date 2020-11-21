import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(colors:[Colors.purple[100],Colors.pink],begin:Alignment.topLeft,end:Alignment.bottomRight
         )
      ),
      child: Center(
          child: SpinKitCubeGrid(
          color: Colors.black,
          size: 50.0,
          duration: Duration(seconds:1),

        ),
      ),
    );
  }
}
