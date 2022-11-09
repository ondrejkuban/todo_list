import 'package:flutter/material.dart';
import 'package:todo_list/batch.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list/date_item.dart';

class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewTaskState();
  }
}

class NewTaskState extends State<NewTask> {
  bool _isEditing = false;
  late TextEditingController _editingController;
  String text = "";
  FocusNode _focusNode = FocusNode();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: text);
    _pageController = PageController(initialPage: 1, viewportFraction: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 2.h,
            left: 2.w,
            right: 2.w),
        child: Column(
          children: [
            Row(
              children: [
                Batch(),
                Batch(),
                Batch(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: TextField(
                controller: _editingController,
                focusNode: _focusNode,
                autofocus: false,
                cursorColor: Colors.grey[600],
                style: TextStyle(fontSize: 6.5.w),
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    hintText: "Your task",
                    border: InputBorder.none),
                onSubmitted: (newVal) {
                  setState(() {
                    text = newVal;
                  });
                },
              ),
            ),
            Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
            ],),
            SizedBox(
              width: 100.w,
              height: 15.w,
              child: PageView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: 20,
                  itemBuilder: (context, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateItem(week_index: i,index: 0,),
                        DateItem(week_index: i,index: 1,),
                        DateItem(week_index: i,index: 2,),
                        DateItem(week_index: i,index: 3,),
                        DateItem(week_index: i,index: 4,),
                        DateItem(week_index: i,index: 5,),
                        DateItem(week_index: i,index: 6,)
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
