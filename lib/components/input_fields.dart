import 'package:eva_icons_flutter/eva_icons_flutter.dart' as eva;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/components/style_classes.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/colors.dart';
import 'general_model.dart';

//! Basic REUSABLE COMPONENT

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String lable,
  required IconData prefix,
  obscureText = false,
  FormFieldSetter<String>? onSubmit,
  FormFieldSetter<String>? onChange,
  required FormFieldValidator<String> validate,
  FocusNode? myFocusNode,
  bool? isEdit,
  FormFieldValidator<String>? validator,
  IconData? icon,
  String? title,
  String? hint,
  bool? messageError,
  Function()? onTap,
  Function(String?)? onSave,
  Color? errorColor,
  String? initialValue,
  Function()? isEditFunc,
}) {
  return Padding(
    padding: EdgeInsets.all(4.sp),
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      onSaved: onSave,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      keyboardType: type,
      validator: validate,
      cursorColor: primarySwitchColor,
      cursorWidth: 0.5.w,
      onTap: onTap,
      focusNode: myFocusNode,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.tajawal(fontSize: 15),
        hintText: lable,
        hoverColor: Colors.grey,
        fillColor: Colors.white,
        // labelText: lable,
        prefixIcon: Icon(
          prefix,
          color: Colors.grey.shade300,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0.sp),
          ),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 0.5.sp),
          borderRadius: BorderRadius.all(
            Radius.circular(5.sp),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
          // borderSide: BorderSide(color: kSecondary, width: 0.5.sp),
        ),
      ),
    ),
  );
}

//! ADVANCED COMPONENTS :::::
// ignore: camel_case_types
class buildInputTF extends StatefulWidget {
  const buildInputTF(
      {required this.myFocusNode,
      required this.icon,
      required this.title,
      required this.onTap,
      this.initialValue,
      this.isEditFunc,
      this.isEdit,
      this.hint,
      this.errorColor,
      this.validator,
      this.messageError,
      this.onSave,
      this.onChange,
      required this.mycontroller});
  final TextEditingController mycontroller;
  final FocusNode myFocusNode;
  final bool? isEdit;
  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final String title;
  final String? hint;
  final bool? messageError;
  final Function() onTap;
  final Function(String?)? onSave;
  final Function(String)? onChange;
  final Color? errorColor;
  final String? initialValue;
  final Function()? isEditFunc;

  @override
  _buildInputTFState createState() => _buildInputTFState();
}

// ignore: camel_case_types
class _buildInputTFState extends State<buildInputTF> {
  @override
  Widget build(BuildContext context) {
    // String lang = context.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: ChangeTextStyleSmall(
            title: widget.title,
            color: widget.myFocusNode.hasFocus ? primaryDarkColor : grayColor,
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: TextFormField(
                  controller: widget.mycontroller,
                  initialValue: widget.initialValue,
                  onSaved: widget.onSave,
                  validator: widget.validator,
                  onChanged: widget.onChange,
                  onTap: widget.onTap,
                  focusNode: widget.myFocusNode,
                  cursorColor: primaryColor,
                  cursorWidth: 3,
                  // style: TextStyle(
                  //   fontFamily: lang == 'ar_AE' ? "SFPro" : "SFPro",
                  //   color: widget.myFocusNode.hasFocus
                  //       ? primaryDarkColor
                  //       : grayColor,
                  //   fontSize: smallTextSize,
                  //   fontWeight: FontWeight.w500,
                  // ),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: grayColor, fontSize: smallTextSize),
                    hintText: widget.hint,
                    labelStyle: TextStyle(
                      // fontFamily: lang == 'ar_AE' ? "SFPro" : "SFPro",
                      color: widget.myFocusNode.hasFocus
                          ? primaryDarkColor
                          : grayColor,
                      fontSize: smallTextSize,
                      fontWeight: FontWeight.w500,
                    ),
                    hoverColor: grayColor,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                        color: primaryDarkColor,
                        width: 1.8,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                          color: widget.myFocusNode.hasFocus
                              ? primaryDarkColor
                              : grayColor,
                          width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 10.0),
                  ),
                ),
              ),
              Expanded(
                flex: widget.isEdit! ? 1 : 0,
                child: Visibility(
                  visible: widget.isEdit!,
                  child: GestureDetector(
                    onTap: widget.isEditFunc,
                    child: Container(
                      height: widget.isEdit! ? 50 : 0,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: const Center(
                          child: ChangeTextStyleSmall(
                        title: "Edit",
                        color: whiteColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class buildInputPasswordTF extends StatefulWidget {
  buildInputPasswordTF(
      {Key? key,
      required this.myFocusNode,
      required this.title,
      required this.onTap,
      this.errorColor,
      this.validator,
      this.onSave,
      this.onChange})
      : super(key: key);

  final FocusNode myFocusNode;
  final FormFieldValidator? validator;
  final String title;
  final Function() onTap;
  final Function(String)? onChange;
  final Function(String?)? onSave;
  final Color? errorColor;
  var obscureText = true;

  @override
  State<StatefulWidget> createState() => _buildInputPasswordTFState();
}

// ignore: camel_case_types
class _buildInputPasswordTFState extends State<buildInputPasswordTF> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: ChangeTextStyleSmall(
            title: widget.title,
            color: widget.myFocusNode.hasFocus ? primaryDarkColor : grayColor,
          ),
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            TextFormField(
              validator: widget.validator,
              onSaved: widget.onSave,
              onChanged: widget.onChange,
              obscureText: widget.obscureText,
              onTap: widget.onTap,
              focusNode: widget.myFocusNode,
              cursorColor: primaryColor,
              cursorWidth: 3,
              style: TextStyle(
                color:
                    widget.myFocusNode.hasFocus ? primaryDarkColor : grayColor,
                fontSize: xSmallTextSize,
                fontWeight: FontWeight.w500,
                fontFamily: "Tomorrow",
              ),
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  fontSize: xSmallTextSize,
                ),
                hoverColor: grayColor,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(color: primaryDarkColor, width: 1.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(color: grayColor, width: 1.5),
                ),
//              icon: Icon( flutt.MaterialCommunityIcons.lock_outline,),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
              ),
            ),
            IconButton(
              icon: Icon(
                widget.obscureText ? Icons.visibility_off : Icons.visibility,
                color: primaryDarkColor,
              ),
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

/////////// frop dwon

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.h, bottom: 20.h, left: 23.w, right: 23.w),
      child: Visibility(
        visible: true,
        child: ChangeTextStyleSmall(
          title: message,
          color: dangerColor,
        ),
      ),
    );
  }
}

class ServerMessage extends StatelessWidget {
  const ServerMessage({Key? key, required this.message, this.color, this.icon})
      : super(key: key);

  final String message;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      transform: Matrix4.translationValues(0.0, -15.0, 0.0),
      child: Wrap(
        children: <Widget>[
          Icon(
            icon,
            color: color,
            size: 20.sp,
          ),
          SizedBox(
            width: 1.w,
          ),
          ChangeTextStyleMedium(
            title: message,
            textAlign: TextAlign.left,
            color: color!,
          ),
        ],
      ),
    );
  }
}

class ServerMessage2 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ServerMessage2(
      {Key? key, required this.message, this.color, this.icon});

  final String message;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: <Widget>[
          Icon(
            icon,
            color: color,
            size: 20.sp,
          ),
          SizedBox(
            width: 1.w,
          ),
          ChangeTextStyleMedium(
            title: message,
            textAlign: TextAlign.left,
            color: color!,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class buildInputNumberTF extends StatefulWidget {
  const buildInputNumberTF(
      {Key? key,
      required this.myFocusNode,
      required this.icon,
      required this.title,
      required this.onTap,
      this.colorHint,
      this.hint,
      this.messageError,
      this.onChange})
      : super(key: key);

  final FocusNode myFocusNode;
  final Color? colorHint;
  final IconData icon;
  final String title;
  final String? hint;
  final bool? messageError;
  final Function()? onTap;
  final Function(String)? onChange;

  @override
  State<StatefulWidget> createState() => _buildInputNumberTF();
}

// ignore: camel_case_types
class _buildInputNumberTF extends State<buildInputNumberTF> {
  @override
  Widget build(BuildContext context) {
    String lang = context.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.w),
          child: ChangeTextStyleSmall(
            title: widget.title,
            color: widget.colorHint!,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: widget.onChange,
          onTap: widget.onTap,
          focusNode: widget.myFocusNode,
          cursorColor: primaryColor,
          cursorWidth: 3,
          style: TextStyle(
            fontFamily: lang == 'ar_AE' ? "Tajawal" : "SFPro",
            color: widget.myFocusNode.hasFocus ? primaryDarkColor : grayColor,
            fontSize: mediumTextSize,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintStyle:
                const TextStyle(color: grayColor, fontSize: xSmallTextSize),
            hintText: widget.hint,
            labelStyle: TextStyle(
              fontFamily: 'Tajawal',
              color: widget.myFocusNode.hasFocus ? primaryColor : grayColor,
              fontSize: largeTextSize,
              height: 1.1,
            ),
            hoverColor: grayColor,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(
                color: primaryDarkColor,
                width: 1.2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(
                  color: widget.myFocusNode.hasFocus
                      ? primaryDarkColor
                      : grayColor,
                  width: 1.2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
      ],
    );
  }
}

/////////// frop dwon

// ignore: camel_case_types
class buildInputDropDonTF extends StatefulWidget {
  const buildInputDropDonTF(
      {Key? key,
      this.myFocusNode,
      this.title,
      this.onTap,
      this.onChange,
      this.hint})
      : super(key: key);

  final FocusNode? myFocusNode;
  final String? title;
  final String? hint;
  final Function()? onTap;
  final Function()? onChange;

  @override
  State<StatefulWidget> createState() => _buildInputDropDonTFState();
}

Day? daySelected;
Time timeSelected = times[0];

class _buildInputDropDonTFState extends State<buildInputDropDonTF> {
  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.w),
            child: ChangeTextStyleXSmall(
              title: widget.title!,
              color: primaryDarkColor,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 0.5, style: BorderStyle.solid, color: grayColor),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            width: double.infinity,
            child: DropdownButton<Day>(
              elevation: 1,
              focusNode: widget.myFocusNode,
              dropdownColor: whiteColor,
              icon: const Icon(
                eva.EvaIcons.arrowDown,
                size: 15,
              ),
              hint: ChangeTextStyleXSmall(
                title: widget.hint!,
                color: grayColor,
              ),
              value: daySelected,
              onChanged: (value) {
                setState(() {
                  daySelected = value;
                });
              },
              items: days.map((Day day) {
                return DropdownMenuItem<Day>(
                  value: day,
                  child: Row(
                    children: <Widget>[
                      Text(
                        day.name,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField1 extends StatelessWidget {
  String text;
  double fieldWidth;
  double fieldHeigh;
  TextEditingController mycontroller;
  FocusNode myFocusNode;
  bool? isEdit;
  FormFieldValidator<String>? validator;
  IconData? icon;
  String? title;
  String? hint;
  bool? messageError;
  Function()? onTap;
  Function(String?)? onSave;
  Function(String)? onChange;
  Color? errorColor;
  String? initialValue;
  Function()? isEditFunc;
  FormFieldSetter<String>? onSubmit;
  TextInputType? type;
  var obscureText = false;

  CustomTextField1(
      {Key? key,
      required this.text,
      required this.fieldWidth,
      required this.fieldHeigh,
      required this.myFocusNode,
      this.icon,
      this.title,
      this.onTap,
      this.type,
      this.onSubmit,
      this.initialValue,
      this.isEditFunc,
      this.isEdit,
      this.hint,
      this.errorColor,
      this.validator,
      this.messageError,
      this.onSave,
      this.onChange,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 5, left: 5, bottom: 10),
      child: Container(
        width: fieldWidth,
        height: fieldHeigh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              // spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    obscureText: obscureText,
                    controller: mycontroller,
                    onSaved: onSave,
                    onChanged: onChange,
                    onFieldSubmitted: onSubmit,
                    keyboardType: type,
                    validator: validator,
                    cursorColor: primarySwitchColor,
                    cursorWidth: 0.5.w,
                    onTap: onTap,
                    focusNode: myFocusNode,
                    maxLines: 10,
                    decoration: InputDecoration(
                      // focusedBorder: InputBorder.none,

                      border: InputBorder.none,

                      hintText: text,
                      hintStyle: GoogleFonts.tajawal(
                          fontSize: 20, color: Colors.grey[400]),
                    ),
                  ),
                ),
              )

              // SvgPicture.asset(
              //   'assets/icons/scanicon1.svg',
              //   width: 25,
              //   // color: Colors.grey,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
