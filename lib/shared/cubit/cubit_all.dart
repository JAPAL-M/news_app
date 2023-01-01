import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states_all.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super (AppIntialStates());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeThem(){
    isDark = !isDark;
      emit(AppChangeThemeStates());
  }
}