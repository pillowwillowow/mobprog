import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'detail_screen.dart'; // your detail screen import

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, String>> notifications = [
        {
      'name': 'SEVENTEEN',
      'action': 'posted',
      'content': 'uploaded new concept photos of Wen Junhui.',
      'profilePicture': 'assets/images/svt.jpg',
      'time': '2h'
    },
    {
      'name': 'Kuya Ben',
      'action': 'commented',
      'content': 'on your post: “Hey, papaxok ka now??!?”',
      'profilePicture': 'assets/images/kuyaben.jpg',
      'time': '1h'
    },
    {
      'name': 'Bebeth',
      'action': 'shared',
      'content': 'your post from Tutubi: “Free Robux to 100 Lucky Winners! #noSpam #notScamNer”',
      'profilePicture': 'assets/images/bebeth.jpg',
      'time': '3h'
    },
    {
      'name': 'Himori',
      'action': 'liked',
      'content': 'your post: “YAHOOOOOO NTAPOS Q NAH ACT2 XA MOBPROG!”',
      'profilePicture': 'assets/images/omnom.png',
      'time': '5h'
    },
    {
      'name': 'Mama Malou',
      'action': 'liked',
      'content': 'your post: “YAHOOOOOO NTAPOS Q NAH ACT2 XA MOBPROG!”',
      'profilePicture': 'assets/images/mama.jpg',
      'time': '6h'
    },
    {
      'name': 'Sir Cy',
      'action': 'posted',
      'content': 'a new update: “Enjoying my vacation :)”',
      'profilePicture': 'assets/images/sir.png',
      'time': '8h'
    },
    {
      'name': 'Kirk Kome',
      'action': 'posted',
      'content': '@BINI Concert Let’s goooooo!!',
      'profilePicture': 'assets/images/sana.jpg',
      'time': '9h'
    },
    {
      'name': 'NewJeans Golagat',
      'action': 'commented',
      'content': 'on your photo: “Comeback gusto, stream ayaw???😝”',
      'profilePicture': 'assets/images/NWJ.jpg',
      'time': '10h'
    },
    {
      'name': 'Debe',
      'action': 'tagged',
      'content': 'you in a post: “Tag mo yung tropa mong wlang makain,,,”',
      'profilePicture': 'assets/images/debe.png',
      'time': '12h'
    },
    {
      'name': 'Sunshine Daisy Butter Mellow',
      'action': 'liked',
      'content': 'Itan’s post: “Ang saya ng 21st celeb q huhhu, lalo na wla si yen..🥰”',
      'profilePicture': 'assets/images/daisy.png',
      'time': '1d'
    },
    {
      'name': 'Wayne',
      'action': 'mentioned',
      'content': 'you in a post: “Oy @Yentin set na gala…😘”',
      'profilePicture': 'assets/images/wayne.jpg',
      'time': '1d'
    },
    {
      'name': 'Dino',
      'action': 'liked',
      'content': 'SEVENTEEN’s new post: “concept photos of Wen Junhui.”',
      'profilePicture': 'assets/images/dino.png',
      'time': '2d'
    },
    {
      'name': 'Beatriz Faye Borres',
      'action': 'liked',
      'content': 'Gary the Snake’s post: “Wooohoo! Having fun here at Zootopia with the best Cops, @Nick & @Judy!”',
      'profilePicture': 'assets/images/yves.jpg',
      'time': '3d'
    },
    {
      'name': 'Beabadubii',
      'action': 'posted',
      'content': 'a new post: “Happy 3yrs to Beatopia <3”',
      'profilePicture': 'assets/images/beabadubi.jpg',
      'time': '3d'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(10.sp),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => Divider(color: Colors.grey[300]),
        itemBuilder: (context, index) {
          final notif = notifications[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(
                    userName: notif['name']!,
                    postContent: notif['content']!,
                    date: notif['time']!,
                    profileImageUrl: notif['profilePicture']!,
                    imageUrl: notif['imageUrl'] ?? '',
                    numOfLikes: int.tryParse(notif['likes'] ?? '0') ?? 0, 
                    profileImageAsset: notif['profilePicture'] ?? '',
                  ),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25.sp,
                  backgroundImage: AssetImage(notif['profilePicture']!),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: notif['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp),
                            ),
                            TextSpan(
                              text: ' ${notif['action']} ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp),
                            ),
                            TextSpan(
                              text: notif['content'],
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        notif['time']!,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
