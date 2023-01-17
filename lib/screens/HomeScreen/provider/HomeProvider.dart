import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  bool vis = false;
  bool vis2 = false;
  double height = 50;
  double cm = 0;
  int weight = 0;
  int age = 0;
  double result = 0;

  void ChangeBoolValue()
  {
    vis = true;
    vis2 = false;
    notifyListeners();
  }
  void ChangeBoolValue2()
  {
    vis = false;
    vis2 = true;
    notifyListeners();
  }
  void ChangeHeight(value)
  {
    height = double.parse((value).toStringAsFixed(0));
    notifyListeners();
  }
  void MinWeight()
  {
    if(weight>0)
    {
      weight--;
    }
    notifyListeners();
  }
  void AddWeight()
  {
    weight++;
    notifyListeners();
  }
  void MinAge()
  {
    if(age>0)
    {
      age--;
    }
    notifyListeners();
  }
  void AddAge()
  {
    age++;
    notifyListeners();
  }
  void Result()
  {
    cm = height/100;
    result = ((weight)/(cm*cm));
    notifyListeners();
  }
  void Refresh()
  {
     vis = false;
     vis2 = false;
     height = 50;
     cm = 0;
     weight = 0;
     age = 0;
     result = 0;
    notifyListeners();
  }
  Widget bottomsheet(BuildContext context)
  {
    return Transform.scale(
      scale: 2.5,
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "YOUR RESULT",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 21),
              height: 180,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.white24,blurRadius: 200,)
                  ]
              ),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 21),
                    child: Text(
                      "NORMAL",
                      style: TextStyle(
                          color: Colors.greenAccent.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "${result.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "You Have A Normal Body Weight.",
                      style: TextStyle(
                          color: Colors.greenAccent.shade700,
                          fontSize: 9,
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
                          fontSize: 9,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 36),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 21,
                  width: 85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink
                  ),
                  alignment: Alignment.center,
                  child: Text("Restart",style: TextStyle(fontSize: 12,color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}