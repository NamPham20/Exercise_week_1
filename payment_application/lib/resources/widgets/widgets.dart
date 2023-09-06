import 'package:flutter/material.dart';

Widget enterInfo({required String title,required dynamic controller,required bool typeData,FocusNode? focus}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Expanded(
          flex:3,
          child: TextField(
            focusNode: focus,
            keyboardType: typeData? TextInputType.text : TextInputType.number,
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter Here',
            ),
          ),
        )
      ],
    ),
  );
}

Widget infomation({required String title, required String value}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
       Expanded(
        flex: 2,
        child: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child:  Text(
              value,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ))
    ],
  );
}
