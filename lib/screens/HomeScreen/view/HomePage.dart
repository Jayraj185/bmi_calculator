
import 'dart:async';

import 'package:bmi_calculator/screens/HomeScreen/provider/HomeProvider.dart';
import 'package:bmi_calculator/utils/bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;
  Animation? animation;
  Animation? animation2;
  AnimationController? animationController;
  AnimationController? animationController2;
  AnimationController? animationController3;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2),vsync: this)..forward();
    animationController2 = AnimationController(duration: Duration(seconds: 1),vsync: this);
    animationController3 = AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation = Tween<double>(begin: -1.0,end: 0.0).animate(animationController!);
    animation2 = Tween<double>(begin: 1.0,end: 0.0).animate(animationController!);
  }
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
        child: AnimatedBuilder(
          animation: animationController!,
          builder: (context, child) {
            return Scaffold(
              backgroundColor: Colors.black, 
              appBar: AppBar(
                title: Text(
                  "BMI CALCULATOR",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: IconButton(
                      icon: Icon(Icons.refresh,color: Colors.white,),
                      onPressed: (){
                          if(ProviderTrue!.weight != 0 || ProviderTrue!.age != 0 || (ProviderTrue!.vis || ProviderTrue!.vis2))
                            {
                            ProviderFalse!.Refresh();
                            }
                          else
                            {
                            animationController2!.forward();
                              Timer(Duration(seconds: 1), () {
                                if(animationController2!.isAnimating)
                                  {
                                    animationController2!.reset();
                                  }
                                });
                            }
                      },
                    ),
                  )
                ],
                backgroundColor: Colors.white10,
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(animation!.value * MediaQuery.of(context).size.width, 0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30,top: 20),
                              child: GestureDetector(
                                onTap: (){
                                  ProviderTrue!.ChangeBoolValue();
                                },
                                child: Container(
                                  height: 180,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 12),
                                        child: Icon(Icons.male,color: (ProviderTrue!.vis)?Colors.pink:Colors.white,size: 90,),
                                      ),
                                      SizedBox(height: 12,),
                                      Text(
                                        "MALE",
                                        style: TextStyle(
                                            fontSize: 21,
                                            color: Colors.white70
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(animation2!.value * MediaQuery.of(context).size.width, 0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35,top: 20),
                              child: GestureDetector(
                                onTap: (){
                                  ProviderTrue!.ChangeBoolValue2();
                                },
                                child: Container(
                                  height: 180,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.female,color: (ProviderTrue!.vis2)?Colors.pink:Colors.white,size: 90,),
                                      SizedBox(height: 12,),
                                      Text(
                                        "FEMALE",
                                        style: TextStyle(
                                            fontSize: 21,
                                            color: Colors.white70
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 21,),
                      Transform(
                        transform: Matrix4.translationValues(animation2!.value * MediaQuery.of(context).size.width, 0.0, 0.0),
                        child: Container(
                          height: 200,
                          width: 330,
                          decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Text("HEIGHT",style: TextStyle(fontSize: 26,color: Colors.white70),),
                                RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(text: "${ProviderTrue!.height} ",style: TextStyle(fontSize: 46,color: Colors.white,fontWeight: FontWeight.bold)),
                                          TextSpan(text: "cm", style: TextStyle(color: Colors.white,fontSize: 30),),
                                        ]
                                    )
                                ),
                                Slider(value: ProviderTrue!.height.toDouble(),
                                  onChanged: (double value){
                                  ProviderFalse!.ChangeHeight(value.round());
                                },
                                  min: 50,
                                  max: 300,divisions: 300,
                                  label: "${ProviderTrue!.height}",
                                  activeColor: Colors.pink,

                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 21,),
                      Row(
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(animation!.value * MediaQuery.of(context).size.width, 0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 30,top: 20),
                              child: Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 21),
                                        child: Text("WEIGHT",style: TextStyle(fontSize: 23,color: Colors.white70),)
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      "${ProviderTrue!.weight}",
                                      style: TextStyle(
                                          fontSize: 51,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              if(ProviderTrue!.weight != 0)
                                              {
                                                ProviderFalse!.MinWeight();
                                              }
                                              else
                                              {
                                                animationController3!.forward();
                                                Timer(Duration(seconds: 1), () {
                                                  if(animationController3!.isAnimating)
                                                  {
                                                    animationController3!.reset();
                                                  }
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white54
                                              ),
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "-",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 41
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          GestureDetector(
                                            onTap: (){
                                              ProviderFalse!.AddWeight();
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white54
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(animation2!.value * MediaQuery.of(context).size.width, 0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35,top: 20),
                              child: Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text("AGE",style: TextStyle(fontSize: 23,color: Colors.white70),)
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      "${ProviderTrue!.age}",
                                      style: TextStyle(
                                          fontSize: 51,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              if(ProviderTrue!.age != 0)
                                              {
                                                ProviderFalse!.MinAge();
                                              }
                                              else
                                              {
                                                animationController3!.forward();
                                                Timer(Duration(seconds: 1), () {
                                                  if(animationController3!.isAnimating)
                                                  {
                                                    animationController3!.reset();
                                                  }
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white54
                                              ),
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "-",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 41
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          GestureDetector(
                                            onTap: (){
                                              ProviderTrue!.AddAge();
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white54
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 36,),
                      Transform(
                        transform: Matrix4.translationValues(animation2!.value * MediaQuery.of(context).size.width, 0.0, 0.0),
                        child: GestureDetector(
                          onTap: (){
                            if(ProviderTrue!.weight != 0 && ProviderTrue!.age != 0 && (ProviderTrue!.vis || ProviderTrue!.vis2))
                              {
                                ProviderFalse!.Result();
                                showModalBottomSheet(context: context, builder: (context) => bottomsheet(context,ProviderTrue!.result),);
                              }
                            else
                              {
                                animationController2!.forward();
                                Timer(Duration(seconds: 1), () {
                                  if(animationController2!.isAnimating)
                                  {
                                    animationController2!.reset();
                                  }
                                });
                              }
                          },
                          child: Container(
                            height: 60,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "CALCULATE",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedBuilder(
                      animation: animationController2!.view,
                      child: Container(
                        height: 45,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Please Select All Inputs",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      builder: (context, child) => AnimatedOpacity(
                        duration: Duration(milliseconds: 10),
                        opacity: animationController2!.value,
                        child: child,
                      ),
                    )
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: animationController3!,
                        child: Container(
                          height: 45,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Wrong Argument",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        builder: (context, child) => AnimatedOpacity(
                          duration: Duration(milliseconds: 10),
                          opacity: animationController3!.value,
                          child: child,
                        ),
                      )
                  ),
                ],
              ),
            );
          },
        )
    );
  }
  /*
  * SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(
              "BMI CALCULATOR",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.white10,
          ),
          body: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30,top: 20),
                      child: GestureDetector(
                        onTap: (){
                          ProviderTrue!.ChangeBoolValue();
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Icon(Icons.male,color: (ProviderTrue!.vis)?Colors.pink:Colors.white,size: 90,),
                              ),
                              SizedBox(height: 12,),
                              Text(
                                "MALE",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.white70
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35,top: 20),
                      child: GestureDetector(
                        onTap: (){
                          ProviderTrue!.ChangeBoolValue2();
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female,color: (ProviderTrue!.vis2)?Colors.pink:Colors.white,size: 90,),
                              SizedBox(height: 12,),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white70
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 21,),
                Container(
                  height: 200,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text("HEIGHT",style: TextStyle(fontSize: 26,color: Colors.white70),),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text: "${ProviderTrue!.height}",style: TextStyle(fontSize: 46,color: Colors.white,fontWeight: FontWeight.bold)),
                                  TextSpan(text: "cm", style: TextStyle(color: Colors.white,fontSize: 30),),
                                ]
                            )
                        ),
                        Slider(value: ProviderTrue!.height, onChanged: (double value){
                          ProviderTrue!.ChangeHeight(value);
                        },
                          min: 50,
                          max: 300,divisions: 300,
                          activeColor: Colors.pink,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 21,),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30,top: 20),
                      child: Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 21),
                              child: Text("WEIGHT",style: TextStyle(fontSize: 23,color: Colors.white70),)
                            ),
                            SizedBox(height: 3,),
                            Text(
                              "${ProviderTrue!.weight}",
                              style: TextStyle(
                                  fontSize: 51,
                                  color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      ProviderFalse!.MinWeight();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white54
                                      ),
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 41
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  GestureDetector(
                                    onTap: (){
                                      ProviderFalse!.AddWeight();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white54
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35,top: 20),
                      child: Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text("AGE",style: TextStyle(fontSize: 23,color: Colors.white70),)
                            ),
                            SizedBox(height: 3,),
                            Text(
                              "${ProviderTrue!.age}",
                              style: TextStyle(
                                  fontSize: 51,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      ProviderFalse!.MinAge();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white54
                                      ),
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 41
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  GestureDetector(
                                    onTap: (){
                                      ProviderFalse!.AddAge();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white54
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 36,),
                GestureDetector(
                  onTap: (){
                    ProviderFalse!.Result();
                    Navigator.pushNamed(context, 'calc');
                  },
                  child: Container(
                    height: 60,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
    * */
}

