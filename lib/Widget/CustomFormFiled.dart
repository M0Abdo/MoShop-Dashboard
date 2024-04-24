import 'dart:io';

import 'package:flutter/material.dart';

import '../Controller/Color.dart';
import '../Controller/ValidInput.dart';

class CustomFormFiled extends StatelessWidget {
  final String title;
  final bool islast;
  final TextEditingController controller;
  final File? file;
  final bool isNumber;
  final bool isFile;

  final Function(String)? onChanged;
  const CustomFormFiled({
    super.key,
    required this.title,
    required this.controller,
    required this.islast,
    required this.file,
    required this.isNumber,
    required this.isFile,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the filed data";
              } else {
                if (file == null && islast && isFile) {
                  return "Please select image";
                }
              }
            },
            
            onChanged: onChanged,
            cursorColor: Colors.black,
            maxLines: 1,
            textInputAction:
                islast ? TextInputAction.done : TextInputAction.next,
            keyboardType: isNumber ? TextInputType.number : null,
            
            decoration: InputDecoration(
           
             
                hintText: "Enter ${title}",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Appcolor.primaryColor))),
          ),
        ],
      ),
    );
  }
}
