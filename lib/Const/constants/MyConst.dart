import 'package:flutter/material.dart';
import 'package:zohatech/Const/Colors/App_Colors.dart';

TextStyle appbartextstyle = const TextStyle(color: Colors.white, fontSize: 18.0);
TextStyle hometextstylef18cs = const TextStyle(color: App_Colors.secondaryColor, fontSize: 18.0, fontWeight: FontWeight.w300);
TextStyle maincontainerhomecpf16= const TextStyle(color: App_Colors.primaryColor,fontSize: 18.0,fontWeight: FontWeight.bold);
TextStyle maincontainerhomecss12= const TextStyle(color: App_Colors.secondaryColor,fontSize: 14.0);
TextStyle maincontainerhomecfs14= const TextStyle(color: App_Colors.forthColor,fontSize: 16.0);
TextStyle maincontainerhomecfs12 = const TextStyle(color: App_Colors.forthColor,fontSize: 12.0);
TextStyle maincontainerhomecps14= const TextStyle(color: App_Colors.primaryColor,fontSize: 14);


EdgeInsets h25v15 = const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0);
EdgeInsets eih25 = const EdgeInsets.symmetric(horizontal: 25.0);
EdgeInsets w25 = const EdgeInsets.symmetric(horizontal: 25.0);
EdgeInsets w20 =  const EdgeInsets.symmetric(horizontal: 20.0);
EdgeInsets wi10 =  const EdgeInsets.symmetric(horizontal: 10.0);

EdgeInsets h5w12= const EdgeInsets.symmetric(vertical: 12.0,horizontal: 5.0);
EdgeInsets h20v5= const EdgeInsets.symmetric(horizontal: 20,vertical: 5);
EdgeInsets hi20= const EdgeInsets.symmetric(horizontal: 20);
EdgeInsets hi25= const EdgeInsets.symmetric(horizontal: 25);


EdgeInsets h15v10= const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0);
EdgeInsets h20v15= const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0);
EdgeInsets h20v10= const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0);
EdgeInsets h30v10= const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0);
EdgeInsets all15 = const EdgeInsets.all(15.0);
EdgeInsets h10v5= const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0);

SizedBox h10 = const SizedBox(height: 10.0);
SizedBox h15 = const SizedBox(height: 15.0);
SizedBox h20 = const SizedBox(height: 20.0);
SizedBox h30 =  const SizedBox(height: 30.0);
SizedBox h40 =  const SizedBox(height: 40.0);
SizedBox h60 =  const SizedBox(height: 60.0);
SizedBox h7 =  const SizedBox(height: 7.0);
SizedBox h5=  const SizedBox(height: 5.0);

SizedBox h50 =  const SizedBox(height: 50.0);
SizedBox h25 =  const SizedBox(height: 25.0);
SizedBox h35 =  const SizedBox(height: 35.0);

SizedBox w50 =  const SizedBox(width: 50.0);

SizedBox w35 =  const SizedBox(width: 35.0);
SizedBox w7 =  const SizedBox(width: 7.0);
SizedBox w10 =  const SizedBox(width: 10.0);
SizedBox wi20 =  const SizedBox(width: 20.0);
SizedBox w40 =  const SizedBox(width: 40.0);
SizedBox w30 =  const SizedBox(width: 30.0);
SizedBox w5 =  const SizedBox(width: 5.0);




// Widget IosBackButton({Color iconcolor = App_Colors.THEME_COLOR_BLACK,double? size}){
//   return GestureDetector(
//       onTap: (){
//         Get.back();
//       },
//
//       child: Image.asset(AssetsPath.back_arrow,scale: size,));
//       // child: Icon(Icons.arrow_back_sharp,color: iconcolor,size: size));
// }



const kGold = Color(0xffffd700);
const kMetalicGold = Color(0xffd4af37);
const kOldGold = Color(0xffcfb53b);
const kGoldenYellow = Color(0xffffdf00);
const kGoldenPoppy = Color(0xfffcc200);
const kAmericanGold = Color(0xffd3af37);
const kGolden = Color(0xfff5bf03);
const kGoldCoin = Color(0xfffcd975);
const kGoldenCrest = Color(0xfff6ca69);
const kGoldenKiwi = Color(0xfff3dd3e);

const kAPIKEY = '9e9f5d5ff75d1c5db7adb8aeab20d5ff';

BoxDecoration kNextPrayerTileDecoration = BoxDecoration(
  color: kGoldenYellow.withAlpha(80),
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(15.0),
    bottomRight: Radius.circular(15.0),
  ),
);

const kCardShadow = [
  BoxShadow(
    color: Color(0xFFE1E1E1),
    offset: Offset(15, 20),
    blurRadius: 40.0,
    spreadRadius: 40.0,
  ),
];

const kCardShape = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(35),
  ),
);

const kCardPadding = 20.0;

// Sahur constant
int sahurConstant = 50;
