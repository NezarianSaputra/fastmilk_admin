import 'package:fastmilk_admin/size_config.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton2 extends StatelessWidget {
  const DefaultButton2({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 30,
      height: SizeConfig.blockSizeVertical * 5,
      child: OutlineButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        borderSide: BorderSide(color: kPrimaryColor),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: kPrimaryColor),
        ),
        onPressed: press,
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 7,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
