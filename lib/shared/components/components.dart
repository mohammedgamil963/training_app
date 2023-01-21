import 'package:flutter/material.dart';

void navigateWithoutArrowBack({required context,required newScreen})=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context)=>newScreen,
    ),
      (route) => false,
);

void navigateTo({required context,required nextScreen})=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=> nextScreen),
);

Widget defaultTextFormField({var controller,keyboardType,bool obscureText=false,required validator, var onFieldSubmitted,required String label,var prefixIcon,var suffixIcon})=>TextFormField(
    style: const TextStyle(
        color: Colors.black,
    ),
    obscureText: obscureText,
    controller: controller,
    validator: validator,
    onFieldSubmitted:onFieldSubmitted,
    keyboardType: keyboardType,
    decoration:  InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        label:  Text(
            label,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
        ),
    ),
);

Widget defaultButton({required var onPressed,required String buttonName ,Color buttonColor=Colors.blue,Color buttonTextColor=Colors.white})=>MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: onPressed,
    color: buttonColor,
    child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child:  Center(child: Text(buttonName,style:TextStyle(color: buttonTextColor,fontSize: 25.0),)),
    ),
);

