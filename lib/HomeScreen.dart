
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool vis = false;
  bool vis2 = false;
  double height = 0;
  double cm = 0;
  int weight = 20;
  int age = 10;
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          setState(() {
                            vis = !vis;
                            vis2 = !vis2;
                          });
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            color: (vis==true) ? Colors.white12 : Colors.white24,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Icon(Icons.male,color: Colors.white,size: 90,),
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
                          setState(() {
                            vis2 = !vis2;
                            vis = !vis;
                          });
                        },
                        child: Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              color: (vis2==true) ? Colors.white24 : Colors.white12,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female,color: Colors.white,size: 90,),
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
                                  TextSpan(text: "$height",style: TextStyle(fontSize: 46,color: Colors.white,fontWeight: FontWeight.bold)),
                                  TextSpan(text: "cm", style: TextStyle(color: Colors.white,fontSize: 30),),
                                ]
                            )
                        ),
                        Slider(value: height, onChanged: (double value){
                          setState(() {
                            height = double.parse((value).toStringAsFixed(2));
                          });
                        },
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
                              "$weight",
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
                                      setState(() {
                                        if(weight>15)
                                          {
                                            weight--;
                                          }
                                      });
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
                                      setState(() {
                                        weight++;
                                      });
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
                              "$age",
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
                                      setState(() {
                                        if(age>1)
                                        {
                                          age--;
                                        }
                                      });
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
                                      setState(() {
                                        age++;
                                      });
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
                    setState(() {
                      cm = height/100;
                      result = ((weight)/(cm*cm));
                    });
                    Navigator.pushNamed(context, 'calc',arguments: result);
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
  }
}
