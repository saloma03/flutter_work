import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test3/modules/count/states/States.dart';

class CountCubit extends Cubit<CountStates>{
  CountCubit() : super(CountInitStates());

  static CountCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void minus(){
    counter--;
    emit(CountMinusStates());
  }

  void plus(){
    counter++;
    emit(CountPlusStates());

  }

}