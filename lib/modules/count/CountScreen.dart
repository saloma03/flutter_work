import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test3/modules/count/cubit/cubit.dart';
import 'package:test3/modules/count/states/States.dart';

class CountScreen extends StatelessWidget {
  int cnt = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => CountCubit(),
      child: BlocConsumer<CountCubit,CountStates>(
        listener: (context,state) {

        },
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      CountCubit.get(context).minus();
                    },
                    child: Text('Minus',style: TextStyle(fontSize: 20.0),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('${CountCubit.get(context).counter}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),

                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      CountCubit.get(context).plus();
                    },
                    child: Text('Plus',style: TextStyle(fontSize: 20.0),),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
}


}
