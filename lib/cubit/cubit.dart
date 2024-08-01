import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/Bussiness.dart';
import 'package:newssapp/Science.dart';
import 'package:newssapp/Sports.dart';
import '../network/remote/dio_helper.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center,
      ),
      label: 'Apple'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.headphones,
        ),
        label: 'Headphones'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.devices_rounded,
        ),
        label: 'MacBook'
    ),
  ];

  void changeBottom(int index){

    currentIndex=index;
    if(index==1)
      getheadphones();
    if(index==2)
      getMacBookPro();

    emit(NewsBottomNavStates());
  }

  List<dynamic> business=[];


  void getBusiness(){
    emit(NewsLoadingStates());
    DioHelper.getdata(
      url: 'v2/everything' ,
      query:
      {
        'q':'Business',
        'from':'2024-07-21',
        'to': '2024-07-21',
        'sortBy':'popularity',
        'apiKey':'5aa9575a433e47688e1244abbcaa00cc',
      }).then((value){
    // print(value.data['articles'][0]['title'].toString());
    business =value.data['articles'];
    print(business[0]['description']);
    emit(NewsGetBusinessSucsessState());
  }).catchError((error){
    print(error.toString() );
    emit(NewsGetBusinessFailedState(error.toString()));

  });
}


  List<dynamic> headphones=[];

  void getheadphones(){
    emit(NewsheadphonesLoadingStates());
    if(headphones.length==0){

      DioHelper.getdata(
          url: 'v2/everything' ,
          query:
          {
            'q':'Headphones-apple',
            'from':'2024-07-21',
            'to': '2024-07-21',
            'sortBy':'popularity',
            'apiKey':'5aa9575a433e47688e1244abbcaa00cc',
          }).then((value){
        // print(value.data['articles'][0]['title'].toString());
        headphones =value.data['articles'];
        print(headphones[0]['description']);
        emit(NewsGetheadphonesSucsessState());
      }).catchError((error){
        print(error.toString() );
        emit(NewsGetheadphonesFailedState(error.toString()));

      });

    }else{
      emit(NewsGetheadphonesSucsessState());
    }
  }




  List<dynamic> MacBookPro=[];

  void getMacBookPro(){
    emit(NewsgetMacBookProLoadingStates());

    if(MacBookPro.length==0){
      DioHelper.getdata(
          url: 'v2/everything' ,
          query:
          {
            'q':'macbook',
            'from':'2024-07-21',
            'to': '2024-07-21',
            'sortBy':'popularity',
            'apiKey':'5aa9575a433e47688e1244abbcaa00cc',
          }).then((value){
        // print(value.data['articles'][0]['title'].toString());
        MacBookPro =value.data['articles'];
        print(MacBookPro[0]['description']);
        emit(NewsGetgetMacBookProSucsessState());
      }).catchError((error){
        print(error.toString() );
        emit(NewsGetgetMacBookProFailedState(error.toString()));

      });
    }else{
      emit(NewsGetgetMacBookProSucsessState());
    }

  }

  List<Widget> Screens =[
    Business(),
    HeadPhones(),
    getMacBookProo(),
  ];

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getdata(
      url: 'v2/everything',
      query:
      {
        'q':'${value}',
        'from':'2024-07-21',
        'to': '2024-07-21',
        'sortBy':'popularity',
        'apiKey':'5aa9575a433e47688e1244abbcaa00cc',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }


}

