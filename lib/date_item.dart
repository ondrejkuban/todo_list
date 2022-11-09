import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DateItem extends StatelessWidget {
  final int week_index;
  final int index;
  final List<String> days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];
  DateItem({super.key, required this.week_index,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13.w,
      height: 13.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w), color: Colors.grey),
      child: Center(
        child: Column(
          children: [
            //Text(days[index],style: TextStyle(color: Colors.white),),
            Text((week_index*7+index+1).toString(),style: TextStyle(fontSize:7.w,color: Colors.white),),
            Text(days[index],style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
