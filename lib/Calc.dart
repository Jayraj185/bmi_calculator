import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  @override
  Widget build(BuildContext context) {
    double res = ModalRoute.of(context)!.settings.arguments as double;
    double result = double.parse((res).toStringAsFixed(2));
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Result",style: TextStyle(color: Colors.white),),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30,top: 35),
                child: Text(
                  "YOUR RESULT",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 19,top: 60),
                height: 460,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: Colors.white24,blurRadius: 200,)
                  ]
                ),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        "NORMAL",
                        style: TextStyle(
                          color: Colors.greenAccent.shade700,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        "$result",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 85,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        "You Have A Normal Body Weight.",
                        style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        "Good Job....!",
                        style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 56),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      result = 0;
                    });
                    Navigator.pop(context,'/');
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink
                    ),
                    alignment: Alignment.center,
                    child: Text("Restart",style: TextStyle(fontSize: 40,color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
