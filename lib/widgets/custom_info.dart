import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/detail_screen.dart';
 
import 'custom_font.dart';
 
class CustomInformation extends StatelessWidget {
  const CustomInformation({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    this.icon = const Icon(Icons.person),
    this.profileImageUrl = '',
    this.atProfile = false,
    required this.date,
    this.imageUrl = '',
    required this.numOfLikes,
  });
 
  final String name;
  final String post;  
  final String description; 
  final Icon icon;
  final String profileImageUrl;
  final String date;
  final int numOfLikes;
  final String imageUrl;
  final bool atProfile;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: InkWell(
        onTap: () {
          (atProfile)
           ? () {}
            : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(
                  userName: name,
                  postContent: description,
                  date: date,
                  profileImageUrl: profileImageUrl,
                  imageUrl: imageUrl,
                  numOfLikes: numOfLikes, profileImageAsset: '',
                ),
              ),
            );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileImageUrl.isEmpty
                ? icon
                : CircleAvatar(
                    radius: 15.sp,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
            SizedBox(width: 10.w),
 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: name,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                  CustomFont(
                    text: 'Posted: $post',
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                  CustomFont(
                    text: description,
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  SizedBox(height: 5.h),
                  CustomFont(
                    text: date,
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
 
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}