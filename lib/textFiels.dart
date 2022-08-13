import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  final TextEditingController controller;

  final String hintText;
   TextFields({Key? key, required this.controller, required this.hintText,})
      : super(key: key);

  @override
  
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
    
  Widget build(BuildContext context) {
   
    return Container(
      height: MediaQuery.of(context).size.height*.06,
      margin: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.only(left: 10),
            border: InputBorder.none, 
            hintStyle: const TextStyle(
              
            ),
        ),
        controller: widget.controller,
      ),
    );
  }
}
