import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/custom_font.dart';
import '../widgets/constants.dart';
import '../screens/detail_screen.dart';

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String profilePicture; 
  final String postContents;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? postImage; 
  final VoidCallback? onLike;
   final Widget? customFooter;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContents,
    required this.date,
    required this.numOfLikes,
    required this.profilePicture,
    this.hasImage = false,
    this.postImage,
    this.onLike, 
    this.customFooter,
  });

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  late int likes;

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  void _likePost() {
    setState(() {
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              userName: widget.userName,
              postContent: widget.postContents,
              date: widget.date,
              profileImageUrl: widget.profilePicture,
              profileImageAsset: widget.profilePicture.contains('assets') ? widget.profilePicture : '',
              imageUrl: widget.postImage ?? '',
              numOfLikes: likes,
            ),
          ),
        );
      },
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                
              // Advertisment
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: widget.profilePicture.isNotEmpty
                        ? CachedNetworkImageProvider(widget.profilePicture)
                        : null,
                    child: widget.profilePicture.isEmpty
                        ? const Icon(Icons.person, color: Colors.white)
                        : null,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: widget.userName,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            CustomFont(
                              text: widget.date,
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.public, size: 13.sp, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.more_horiz),
                ],
              ),

              SizedBox(height: 10.h),

              CustomFont(
                text: widget.postContents,
                fontSize: 14.sp,
                fontFamily: "Frutiger",
              ),

              /// POST IMAGE (CACHED NETWORK IMAGE) ENHANCEMENT 3
              if (widget.hasImage && widget.postImage != null) ...[
                SizedBox(height: 8.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.postImage!,
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => SizedBox(
                      height: 200.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (_, __, ___) => Container(
                      height: 200.h,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],

              SizedBox(height: 10.h),

              /// ACTION BUTTONS
                widget.customFooter ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: _likePost,
                      icon: const Icon(Icons.bug_report_rounded, color: YF_PRIMARY),
                      label: CustomFont(
                        text: likes == 0 ? 'Like' : likes.toString(),
                        fontSize: 12.sp,
                        color: YF_PRIMARY,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: YF_PRIMARY),
                      label: CustomFont(
                        text: 'Comment',
                        fontSize: 12.sp,
                        color: YF_PRIMARY,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share, color: YF_PRIMARY),
                      label: CustomFont(
                        text: 'Share',
                        fontSize: 12.sp,
                        color: YF_PRIMARY,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }
