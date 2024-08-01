import 'package:flutter/material.dart';

abstract class NewsStates {}

class NewsIntialState extends NewsStates{}

class NewsBottomNavStates extends NewsStates{}

class NewsGetBusinessSucsessState extends NewsStates{}

class NewsGetBusinessFailedState extends NewsStates{
  final String error;
  NewsGetBusinessFailedState(this.error);
}

class NewsLoadingStates extends NewsStates{}

class NewsGetheadphonesSucsessState extends NewsStates{}

class NewsGetheadphonesFailedState extends NewsStates{
  final String error;
  NewsGetheadphonesFailedState(this.error);
}

class NewsheadphonesLoadingStates extends NewsStates{}

class NewsGetgetMacBookProSucsessState extends NewsStates{}

class NewsGetgetMacBookProFailedState extends NewsStates{
  final String error;
  NewsGetgetMacBookProFailedState(this.error);
}

class NewsgetMacBookProLoadingStates extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{
}

