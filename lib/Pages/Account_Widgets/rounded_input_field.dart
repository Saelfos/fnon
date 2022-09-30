
import 'package:flutter/material.dart';






class RoundedInputField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;


  RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container();
  }}