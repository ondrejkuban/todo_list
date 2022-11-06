import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/home_page.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({
    Key? key,
    this.topic = "",
    this.task = "",
    required this.refresh
  }) : super(key: key);
  final String topic;
  final String task;
  final Function refresh;

  //final DateTime deadline;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TodoCardState();
  }
}

class TodoCardState extends State<TodoCard> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool checked = false;
  double widthh = 85.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return UnconstrainedBox(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.h),
          child: AnimatedContainer(
            curve: Curves.bounceOut,
            clipBehavior: Clip.antiAlias,
            height: 10.h,
            width: widthh.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      color: Color(0x19161616))
                ],
                gradient:
                    const LinearGradient(colors: [Colors.white, Colors.white])),
            duration: Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                         // alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5.w),color: Colors.red[100]!),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:2.w,vertical: 1.w),
                            child: Text(
                        widget.topic,textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 2.h),
                      ),
                          )),
                      Text(widget.task,style: TextStyle(fontSize: 3.h),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();

                    if (!checked) {
                      checked = true;
                      //widthh = 0;

                      _controller.forward(from:0.3);

                      setState(() {

                      });
                    } else {
                      _controller.reverse(from: 0.6);
                      checked = false;
                    }
                  },
                  child: SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: Transform.scale(
                      child: Lottie.asset('assets/checkbox.json',

                          controller: _controller, onLoaded: (comp) {
                            _controller.duration =
                            const Duration(milliseconds: 800);
                      }, fit: BoxFit.fitHeight, width: 15.w, height: 15.w),
                      scale: 2.5,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
