import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onTap;
  final double width;
  final Color color, textColor,secondColor;
  const RoundedButton({
    Key key,
    this.text,
    this.onTap,
    this.color = Colors.red,
    this.textColor = Colors.white, this.secondColor, this.icon, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 50,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: secondColor
          ),
          onPressed: onTap,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Text(text),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
