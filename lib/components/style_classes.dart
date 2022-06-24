import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart' as eva;
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../utils/colors.dart';

class ChangeTextStyleMainMajor extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLine;
  const ChangeTextStyleMainMajor(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Text(
      title!,
      textAlign: textAlign,
      style: lang == 'ar_AE'
          ? TextStyle(
              color: color,
              fontFamily: "Tajawal",
              fontSize: mainMajorTextSize,
              fontWeight: fontWeight,
              decoration: textDecoration)
          : TextStyle(
              color: color,
              fontFamily: "SFPro",
              fontSize: mainMajorTextSize,
              fontWeight: fontWeight,
              decoration: textDecoration,
            ),
    );
  }
}

class ChangeTextStyleMajor extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const ChangeTextStyleMajor(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Text(title!,
        textAlign: textAlign,
        style: lang == 'ar_AE'
            ? TextStyle(
                color: color,
                fontFamily: "Tajawal",
                fontSize: majorTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration)
            : TextStyle(
                color: color,
                fontFamily: "SFPro",
                fontSize: majorTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration,
              ));
  }
}

class ChangeTextStyleLarge extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const ChangeTextStyleLarge(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Text(title!,
        textAlign: textAlign,
        style: lang == 'ar_AE'
            ? TextStyle(
                color: color,
                fontFamily: "Tajawal",
                fontSize: largeTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration)
            : TextStyle(
                color: color,
                fontFamily: "SFPro",
                fontSize: largeTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration));
  }
}

class ChangeTextStyleMedium extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLine;
  const ChangeTextStyleMedium(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.maxLine,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Text(title!,
        textAlign: textAlign,
        maxLines: maxLine,
        style: lang == 'ar_AE'
            ? TextStyle(
                color: color,
                fontFamily: "Tajawal",
                fontSize: mediumTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration)
            : TextStyle(
                color: color,
                fontFamily: "SFPro",
                fontSize: mediumTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration));
  }
}

class ChangeTextStyleSmall extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const ChangeTextStyleSmall(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Text(title!,
        textAlign: textAlign,
        style: lang == 'ar_AE'
            ? TextStyle(
                color: color,
                fontFamily: "Tajawal",
                fontSize: smallTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration)
            : TextStyle(
                color: color,
                fontFamily: "SFPro",
                fontSize: smallTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration));
  }
}

class ChangeTextStyleXSmall extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLine;
  const ChangeTextStyleXSmall(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Text(title!,
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: lang == 'ar_AE'
            ? TextStyle(
                color: color,
                fontFamily: "Tajawal",
                fontSize: smallTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration)
            : TextStyle(
                color: color,
                fontFamily: "SFPro",
                fontSize: smallTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration));
  }
}

class ChangeTextStyleTinySmall extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLine;
  const ChangeTextStyleTinySmall(
      {this.title,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    String lang = context.toString();

    return Text(title!,
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: lang == 'ar_AE'
            ? TextStyle(
                color: color,
                fontFamily: "Tajawal",
                fontSize: tinySmallTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration)
            : TextStyle(
                color: color,
                fontFamily: "SFPro",
                fontSize: tinySmallTextSize,
                fontWeight: fontWeight,
                decoration: textDecoration));
  }
}

// ignore: must_be_immutable
class StatusLine extends StatelessWidget {
  double? thickness;
  Color? color;
  StatusLine({this.thickness, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        thickness: thickness,
        color: color,
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {@required this.title,
      this.titleColor,
      this.onTap,
      this.color,
      this.reduis,
      this.fontWeight});

  final String? title;
  final Color? titleColor;
  final Function()? onTap;
  final Color? color;
  final FontWeight? fontWeight;
  final double? reduis;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(widget.color!),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: widget.color!),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.reduis ?? 15),
          ),
        ),
        child: Center(
          child: ChangeTextStyleMedium(
            title: widget.title,
            color: widget.titleColor ?? whiteColor,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({required this.title, this.onTap, this.color});

  final String title;
  final Function()? onTap;
  final Color? color;

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(widget.color!),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: widget.color!),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
              width: 2.0, color: widget.color!, style: BorderStyle.solid),
        ),
        child: Center(
          child: ChangeTextStyleMedium(
            title: widget.title,
            color: widget.color,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SecondaryButtonBorder extends StatefulWidget {
  const SecondaryButtonBorder({required this.title, this.onTap, this.color});

  final String title;
  final Function()? onTap;
  final Color? color;

  @override
  _SecondaryButtonBorderState createState() => _SecondaryButtonBorderState();
}

class _SecondaryButtonBorderState extends State<SecondaryButtonBorder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(width: 1.0, color: widget.color!),
        ),
        child: Center(
          child: ChangeTextStyleMedium(
            title: widget.title,
            color: widget.color,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SecondaryButtonWithIcon extends StatefulWidget {
  const SecondaryButtonWithIcon(
      {required this.title, this.onTap, this.color, this.icon});

  final String title;
  final IconData? icon;
  final Function()? onTap;
  final Color? color;

  @override
  _SecondaryButtonWithIconState createState() =>
      _SecondaryButtonWithIconState();
}

class _SecondaryButtonWithIconState extends State<SecondaryButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
              width: 2.0, color: widget.color!, style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.color,
              size: 30,
            ),
            ChangeTextStyleLarge(
              title: widget.title,
              color: widget.color,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TwoButtonAction extends StatelessWidget {
  const TwoButtonAction(
      {this.leftBtnTitle,
      this.rightBtnTitle,
      this.leftBtnClick,
      this.rightBtnClick,
      this.btnColor});

  final String? leftBtnTitle;
  final Function()? leftBtnClick;
  final String? rightBtnTitle;
  final Function()? rightBtnClick;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: SecondaryButton(
                title: rightBtnTitle!,
                color: primaryColor,
                onTap: rightBtnClick!,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: PrimaryButton(
                  title: leftBtnTitle,
                  color: btnColor,
                  fontWeight: FontWeight.w500,
                  onTap: leftBtnClick),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialBotton extends StatelessWidget {
  const SocialBotton(
      {required this.title,
      this.color,
      this.colorText,
      this.colorBorder,
      this.onTap,
      this.icon});

  final String title;
  final Function()? onTap;
  final Color? color;
  final Color? colorText;
  final Color? colorBorder;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: colorBorder!,
          width: 0.5,
        ),
      ),
      child: SizedBox(
        width: 30.w,
        // height: 4.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              icon!,
              width: 4.w,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              width: 1.w,
            ),
            ChangeTextStyleMedium(
              fontWeight: FontWeight.w200,
              title: title,
              color: colorText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class arrowBack extends StatelessWidget {
  const arrowBack({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    var lang = context.toString();
    return IconButton(
      icon: Icon(
        lang == 'ar_AE'
            ? eva.EvaIcons.arrowIosForward
            : eva.EvaIcons.arrowIosBack,
        color: color ?? primaryDarkColor,
        size: 20.sp,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({this.title, this.icon, this.onTap});

  final String? title;
  final String? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            icon!,
            color: primaryColor,
            width: 12,
          ),
          const SizedBox(
            width: 5,
          ),
          ChangeTextStyleXSmall(
            title: title,
            color: primaryColor,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4.0
          ..color = primaryColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    //canvas.drawCircle(circleOffset, radius, _paint);
//    canvas.drawRRect(
//      RRect.fromRectAndRadius(
//          Rect.fromLTWH(cfg.size.width / 2, cfg.size.height - radius - 5,
//             20,  10),
//          Radius.circular(15)),
//      _paint,
//    );
    canvas.drawLine(Offset(cfg.size!.width / 2, 30), circleOffset, _paint);

//    canvas.drawRect(
//        new Rect.fromLTRB(
//            0.0, 0.0, cfg.size.width , cfg.size.height - radius - 5),
//        new Paint()..color = new Color(0xFF0099FF));
  }
}

class AddingPrimaryButton extends StatelessWidget {
  const AddingPrimaryButton({this.onTap, this.buttonTitle});

  final String? buttonTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          child: ChangeTextStyleXSmall(
            title: buttonTitle,
            color: primaryColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class CountryLang extends StatelessWidget {
  const CountryLang({
    required String countryLangFlag,
    required String countryLangTitle,
    required bool choosencountryLang,
    required Animation<double> countryLangAnimation,
  })  : _choosencountryLang = choosencountryLang,
        _countryLangFlag = countryLangFlag,
        _countryLangTitle = countryLangTitle,
        _countryLangAnimation = countryLangAnimation;

  final String _countryLangFlag;
  final String _countryLangTitle;
  final bool _choosencountryLang;
  final Animation<double> _countryLangAnimation;

  @override
  Widget build(BuildContext context) {
//    if(_choosencountryLang == "ar" || _choosencountryLang == "en"){
//
//    }
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 10, bottom: 8),
      child: Row(
        children: <Widget>[
          Image.asset(
            _countryLangFlag,
            width: 50,
          ),
          Container(
            child: ChangeTextStyleXSmall(
              title: _countryLangTitle,
              color: primaryDarkColor,
            ),
          ),
          const Spacer(),
          Visibility(
            visible: _choosencountryLang,
            child: Container(
              margin: EdgeInsets.only(right: _countryLangAnimation.value),
              child: const Icon(
                Icons.done,
                color: primaryColor,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Container NotificationSwitchs() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Expanded(
          child: ChangeTextStyleTinySmall(
            title:
                "For faster and more secure checkout, save your card details.",
            color: primaryDarkColor,
            fontWeight: FontWeight.normal,
            maxLine: 2,
          ),
        ),
        Switch(
          value: true,
          onChanged: (value) {},
          activeTrackColor: inActivePrimaryColor,
          activeColor: primaryColor,
        ),
      ],
    ),
  );
}

class LoaderButton extends StatelessWidget {
  const LoaderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      width: 60,
      height: 60,
      child: const LoadingIndicator(
        indicatorType: Indicator.circleStrokeSpin,
        colors: [Colors.white],
      ),
    ));
  }
}

class HomeTitleSection extends StatelessWidget {
  const HomeTitleSection({@required this.title, this.onPressed, this.noSeeAll});

  final String? title;
  final Function()? onPressed;
  final bool? noSeeAll;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ChangeTextStyleLarge(
              title: title,
              color: primaryDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Visibility(
            visible: noSeeAll!,
            child: TextButton(
              onPressed: onPressed,
              child: const ChangeTextStyleXSmall(
                title: "see-all",
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
