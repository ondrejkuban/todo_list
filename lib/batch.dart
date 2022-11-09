import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Batch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: Container(
        decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(200.w)),
          child: Padding(padding: EdgeInsets.all(2.w),
          child: Text("MSD",style: TextStyle(color: Colors.white),))
      ),
    );
  }

}