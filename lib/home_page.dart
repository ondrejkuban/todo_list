import 'package:flutter/material.dart';
import 'package:todo_list/new_task.dart';
import 'package:todo_list/todo_card.dart';
import 'package:sizer/sizer.dart';
import 'package:material_dialogs/material_dialogs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  static List k = [];
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    k = [TodoCard(topic: "MSD",task: "Ukol",refresh: refresh),TodoCard(topic: "KDS",task: "Ukol",refresh: refresh,),TodoCard(topic: "OPT",task: "Ukol",refresh: refresh,)];
    _pageController = PageController(initialPage: 1, viewportFraction: 0.4);

  }

  void refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (cont, orientation, deviceType) {
      return Scaffold(
          body: Stack(
            alignment: Alignment.bottomRight,
            children: [Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.black87, Colors.black54])),
              child: Column(
                children: [
                  Container(
                    height: 15.h,

                  ),
                  ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(5.w),topRight: Radius.circular(5.w)),child: Container(
                      width: 100.w,
                      height: 85.h,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: ListView.builder(

                          physics: const BouncingScrollPhysics(),
                          itemCount: k.length,
                          itemBuilder: (context, index) {

                            return k[index];

                          })),)
                ,
                ],
              ),
            ),
              Padding(
                padding:  EdgeInsets.all(3.w),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),boxShadow: const [  BoxShadow(
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                    blurRadius: 5,
                    color: Color(0x34161616))]),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(5.w),
                    child: Container(
                      width: 16.w,
                      height: 16.w,
                      color: Colors.lightBlue,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          highlightColor: Colors.blue[700],
                          splashColor: Colors.blue[700],
                          onTap: (){
                            Dialogs.bottomMaterialDialog(context: (context),customView: NewTask());
                          },
                          child: Icon(Icons.add,size: 12.w,color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]
          ));
    });
  }
}
