import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  bool vis = false;
  bool vis2 = false;
  int height = 50;
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
    height = value;
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



}