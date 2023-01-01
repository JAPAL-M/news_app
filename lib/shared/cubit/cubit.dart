import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/Screens/business_screen.dart';
import 'package:news_app/modules/Screens/science_screen.dart';
import 'package:news_app/modules/Screens/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_volleyball),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessPage(),
    SportsPage(),
    SciencePage(),
  ];
  void changeIndex(int index){
    currentIndex = index;
    if(index == 1)
      getSportsData();
    if(index == 2)
      getScienceData();
    emit(NewsBottomNavigationState());

  }

  List<dynamic> business = [];
  void getBusinessData(){
    emit(NewsGetBusinessLoading());
    if(business.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apiKey':'c738708a965a4b7fb7828db2f6ca1f57',
          }
      ).then((value){
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessData());
      }).catchError((error){
        emit(NewsGetBusinessDataError(error.toString()));
        print(error.toString());
      });
    } else{
      emit(NewsGetBusinessData());
    }

  }

  List<dynamic> sports = [];

  void getSportsData(){
    emit(NewsGetSportsLoading());
    if(sports.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'c738708a965a4b7fb7828db2f6ca1f57',
          }
      ).then((value){
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsData());
      }).catchError((error){
        emit(NewsGetSportsDataError(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetSportsData());
    }

  }

  List<dynamic> science = [];

  void getScienceData(){
    emit(NewsGetScienceLoading());
    if(science.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'c738708a965a4b7fb7828db2f6ca1f57',
          }
      ).then((value){
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceData());
      }).catchError((error){
        emit(NewsGetScienceDataError(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetScienceData());
    }

  }

  List<dynamic> search = [];

  void getSearchData(String value){

    emit(NewsGetSearchLoading());
    //if(search.length == 0){
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q':'${value}',
            'apiKey':'c738708a965a4b7fb7828db2f6ca1f57',
          }
      ).then((value){
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchData());
      }).catchError((error){
        emit(NewsGetSearchDataError(error.toString()));
        print(error.toString());
      });
  //  }else{
    //  emit(NewsGetScienceData());
    }
  }