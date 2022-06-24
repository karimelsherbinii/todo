import 'package:flutter/material.dart';
import '../utils/colors.dart';

class GeneralModel {
  String? name;
  String? image;
  String? route;
  GeneralModel({this.name, this.image, this.route});
}

List<GeneralModel> profileArray = [
  GeneralModel(
      name: 'Notifications',
      image: 'assets/notificationPr.svg',
      route: '/notification'),
  GeneralModel(
      name: 'My Orders', image: 'assets/shoppingbagPr.svg', route: '/myOrders'),
  GeneralModel(name: 'Cars', image: 'assets/carPr.svg', route: '/myCars'),
  GeneralModel(
      name: 'Payment', image: 'assets/creditcardPr.svg', route: '/payment'),
  GeneralModel(
      name: 'Account Settings',
      image: 'assets/settingsPr.svg',
      route: '/accountSettings'),
  GeneralModel(
      name: 'Terms & Conditions',
      image: 'assets/settingsPr.svg',
      route: '/termsConditions'),
];

class Day {
  Day(this.name);
  final String name;
}

List<Day> days = <Day>[
  Day('Saturday'),
  Day('Sunday'),
  Day('Monday'),
  Day('Tuesday'),
  Day('Wednesday'),
  Day('Thursday'),
  Day('Friday'),
];

class Time {
  Time(this.name);
  final String name;
}

List<Time> times = <Time>[
  Time('9 AM : 12 PM'),
  Time('12 PM : 3 PM'),
  Time('3 PM : 6 PM'),
  Time('6 PM : 9 PM'),
];

class CarColor {
  CarColor({this.name, this.color, this.isSelected, this.arrowColor});

  String? name;
  Color? color;
  Color? arrowColor;
  bool? isSelected;
}

List<CarColor> colorCarArray = [
  CarColor(
    name: 'Black',
    color: carBlack,
    isSelected: true,
    arrowColor: whiteColor,
  ),
  CarColor(
    name: 'White',
    color: whiteColor,
    isSelected: false,
    arrowColor: primaryDarkColor,
  ),
  CarColor(
    name: 'Silver',
    color: carSilver,
    isSelected: false,
    arrowColor: primaryDarkColor,
  ),
  CarColor(
    name: 'Red',
    color: carRed,
    isSelected: false,
    arrowColor: whiteColor,
  ),
  CarColor(
    name: 'Blue',
    color: carBlue,
    isSelected: false,
    arrowColor: whiteColor,
  ),
  CarColor(
    name: 'Brown',
    color: carBrown,
    isSelected: false,
    arrowColor: whiteColor,
  ),
  CarColor(
    name: 'DarkGreen',
    color: carDarkGreen,
    isSelected: false,
    arrowColor: whiteColor,
  ),
  CarColor(
    name: 'Gold',
    color: carGold,
    isSelected: false,
    arrowColor: primaryDarkColor,
  ),
  CarColor(
    name: 'Gray',
    color: carGray,
    isSelected: false,
    arrowColor: whiteColor,
  ),
  CarColor(
    name: 'DarkRed',
    color: carDarkRed,
    isSelected: false,
    arrowColor: whiteColor,
  ),
];
