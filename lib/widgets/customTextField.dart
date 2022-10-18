import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    Key? key, required this.word,
    required this.fun,
    this.inputType
  }) : super(key: key);
final String word ;
 TextInputType ? inputType;
final ValueChanged<String> fun ;
  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      keyboardType: inputType,
      onChanged:   fun,
      decoration: InputDecoration(
        hintText: word,
          labelText: word,
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }
}
