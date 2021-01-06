library strengthpassword;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'procedures.dart';

class PasswordField extends StatefulWidget {
  final IconData visibleIcon, visibleoffIcon;
  final Color visibleColor, visibleoffColor;
  final bool suffixicon;
  final String counterText;
  final String hintText, labelText, emptyPassword, weakPassword;
  final TextStyle hintStyle, labelStyle;
  final InputBorder border, enabledborder, focusedborder;
  final EdgeInsetsGeometry contentpadding;
  final spacebetween;
  TextEditingController textEditingController;
  final fillColor;
  final LinearGradient weakGradient, fairGradient, strongGradient;
  final Color unselectedColor;

  PasswordField({
    @required this.textEditingController,
    this.visibleIcon = Icons.visibility_off,
    this.visibleoffIcon = Icons.visibility,
    this.visibleColor = Colors.grey,
    this.visibleoffColor = Colors.grey,
    this.suffixicon = true,
    this.counterText = "",
    this.hintText = "Enter Password",
    this.labelText = "Password",
    this.emptyPassword = "Password is empty",
    this.weakPassword = "Password is too weak",
    this.hintStyle = const TextStyle(color: Colors.grey),
    this.labelStyle = const TextStyle(color: Colors.black),
    this.border = const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
    ),
    this.enabledborder = const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
    ),
    this.focusedborder = const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
    ),
    this.contentpadding =
        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
    this.spacebetween = 10.0,
    this.weakGradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          const Color(0xffff3346),
          const Color(0xFFFFCDD2),
        ]),
    this.fairGradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          const Color(0xFFFFCDD2),
          const Color(0xfffff633),
        ]),
    this.strongGradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          const Color(0xFFFFCDD2),
          const Color(0xfffff633),
          const Color(0xff39ff33),
        ]),
    this.fillColor = Colors.red,
    this.unselectedColor = const Color(0xFFD6D6D6),
  });

  InputBorder aa = new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(4.0));

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String check = "weak";
  bool passwordfield = true;

  @override
  Widget build(BuildContext context) {
    if (widget.suffixicon == false) {
      passwordfield = false;
    }
    return Column(children: [
      TextFormField(
          controller: widget.textEditingController,
          obscureText: passwordfield,
          decoration: InputDecoration(
            suffixIcon: widget.suffixicon
                ? InkWell(
                    child: passwordfield
                        ? Icon(
                            widget.visibleIcon,
                            color: widget.visibleColor,
                          )
                        : Icon(
                            widget.visibleoffIcon,
                            color: widget.visibleoffColor,
                          ),
                    onTap: () {
                      setState(() {
                        passwordfield = !passwordfield;
                      });
                    },
                  )
                : null,
            counterText: widget.counterText,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            fillColor: widget.fillColor,
            contentPadding: widget.contentpadding,
            enabledBorder: widget.enabledborder,
            border: widget.border,
            focusedBorder: widget.focusedborder,
          ),
          onChanged: (value) {
            setState(() {
              check = Strength(value);
            });
          },
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value.isEmpty) {
              return widget.emptyPassword;
            } else if (check == "weak") {
              return widget.weakPassword;
            }
            return null;
          }),
      SizedBox(
        height: widget.spacebetween,
      ),
      Visibility(
        visible: widget.textEditingController.text.length != 0 ? true : false,
        child: StepProgressIndicator(
          totalSteps: 9,
          currentStep: check == "weak"
              ? 3
              : check == "fair"
                  ? 6
                  : 9,
          size: widget.spacebetween,
          selectedGradientColor: check == "weak"
              ? widget.weakGradient
              : check == "fair"
                  ? widget.fairGradient
                  : widget.strongGradient,
          unselectedColor: widget.unselectedColor,
        ),
      )
    ]);
    ;
  }
}
