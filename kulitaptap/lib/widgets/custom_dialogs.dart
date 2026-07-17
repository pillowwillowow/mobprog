import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kulitaptap/widgets/custom_font.dart';
import '../widgets/constants.dart';


void customOptionDialog(BuildContext context,
    {required title,
    required content,
    required Function onYes}) {
  AlertDialog alertDialog = AlertDialog(
    title: CustomFont(
      text: title, 
      fontSize: 30.sp,
      ),
    content: CustomFont(text: content, fontSize: 18.sp,),
    actions: <Widget>[
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: CustomFont(text:'No', fontSize: 18.sp,),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: YF_PRIMARY, foregroundColor: YF_LIGHT),
        onPressed: () {
          Navigator.of(context).pop();
          onYes();
        },
        child:  CustomFont(
          text:'Yes', 
          fontSize: 18.sp,
          color: YF_LIGHT,
        ),
      ),
    ],
  );
        
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

void customShowImageDialog(BuildContext context, {required imageUrl}) {
  AlertDialog alertDialog = AlertDialog(
    content: SizedBox (
      height: 300.h,
      child: Center(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 100.sp,
        ),
      ),
    ),
  ),
);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}