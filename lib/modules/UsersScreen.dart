
import 'package:flutter/material.dart';

import '../models/users/users.dart';


class UsersScreen extends StatelessWidget {
  List<UsersInfo> users =[
    UsersInfo(name: 'Salma Ramadan', id: 1, phone: '01101376526'),
  UsersInfo(name: 'Mustafa Ramadan', id: 2, phone: '011140246780'),
  UsersInfo(name: 'Mohamed Ramadan', id: 3, phone: '01102259632'),
  UsersInfo(name: 'Mariam Ramadan', id: 4, phone: '01101782325'),
  UsersInfo(name: 'Ahmed Ramadan', id: 5, phone: '01101376526'),
    UsersInfo(name: 'Salma Ramadan', id: 1, phone: '01101376526'),
    UsersInfo(name: 'Mustafa Ramadan', id: 2, phone: '011140246780'),
    UsersInfo(name: 'Mohamed Ramadan', id: 3, phone: '01102259632'),
    UsersInfo(name: 'Mariam Ramadan', id: 4, phone: '01101782325'),
    UsersInfo(name: 'Ahmed Ramadan', id: 5, phone: '01101376526'),
    UsersInfo(name: 'Salma Ramadan', id: 1, phone: '01101376526'),
    UsersInfo(name: 'Mustafa Ramadan', id: 2, phone: '011140246780'),
    UsersInfo(name: 'Mohamed Ramadan', id: 3, phone: '01102259632'),
    UsersInfo(name: 'Mariam Ramadan', id: 4, phone: '01101782325'),
    UsersInfo(name: 'Ahmed Ramadan', id: 5, phone: '01101376526'),
    UsersInfo(name: 'Salma Ramadan', id: 1, phone: '01101376526'),
    UsersInfo(name: 'Mustafa Ramadan', id: 2, phone: '011140246780'),
    UsersInfo(name: 'Mohamed Ramadan', id: 3, phone: '01102259632'),
    UsersInfo(name: 'Mariam Ramadan', id: 4, phone: '01101782325'),
    UsersInfo(name: 'Ahmed Ramadan', id: 5, phone: '01101376526'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text('Users',),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>buildChildRow(users[index]),
          separatorBuilder: (context,index)=>Container(
            height: 1,
            color: Colors.grey[300],
            width: double.infinity,
          ),
          itemCount: users.length,
      )



    );
  }
  Widget buildChildRow(UsersInfo user) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          child: Text('${user.id}',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),
        SizedBox(width: 10.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${user.name}',style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            Text('${user.phone}',style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,

            ),),
          ],

        ),
      ],
    ),
  );

}
