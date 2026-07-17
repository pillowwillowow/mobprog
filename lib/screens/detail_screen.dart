import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_font.dart';
import '../widgets/constants.dart';

class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final String? profileImageUrl;   
  final String? profileImageAsset;
  final String imageUrl;
  final int numOfLikes;
  final VoidCallback? onLike;

  const DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    required this.profileImageUrl,
    this.imageUrl = '',
    this.numOfLikes = 0,
    this.onLike, 
    required this.profileImageAsset,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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

    if (widget.onLike != null) {
      widget.onLike!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomFont(
          text: widget.userName,
          fontSize: 18.sp,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.imageUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  widget.profileImageUrl == null || widget.profileImageUrl!.isEmpty
                      ? const Icon(Icons.person)
                      : CircleAvatar(
                    radius: 25.sp,
                    backgroundImage: widget.profileImageAsset != null &&
                            widget.profileImageAsset!.isNotEmpty
                        ? AssetImage(widget.profileImageAsset!)
                        : (widget.profileImageUrl != null &&
                                widget.profileImageUrl!.isNotEmpty
                            ? CachedNetworkImageProvider(widget.profileImageUrl!)
                            : null) as ImageProvider?,
                    child: (widget.profileImageAsset == null &&
                            widget.profileImageUrl == null)
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: widget.userName,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          CustomFont(
                            text: widget.date,
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4.w),
                          Icon(Icons.public, size: 14.sp, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: widget.postContent,
                  fontSize: 16.sp,
                  fontFamily: 'Frutiger',
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 30.h),
            const Divider(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}



         