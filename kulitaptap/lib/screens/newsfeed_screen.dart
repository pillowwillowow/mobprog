import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kulitaptap/widgets/constants.dart';
import 'package:kulitaptap/widgets/custom_font.dart';
import '../widgets/post_card.dart';


class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  final List<Map<String, dynamic>> posts = const [
    
    {
      'userName': 'alt ni yen',
      'postContents': 'YAHOOOOOO NTAPOS Q NAH ACT2 XA MOBPROG!',
      'numOfLikes': 444,
      'hasImage': true,
      'postImage': 'https://i.pinimg.com/736x/67/f5/c5/67f5c530a6558a6cccdb4a4fe12b9629.jpg',
      'date': 'December 6, 2025',
      'profilePicture': 'https://i.pinimg.com/736x/9e/1b/64/9e1b64a3a8797626e6a80b589c946e96.jpg',
    },
    {
      'userName': 'Himori',
      'postContents': '1v1 po CODM, kahit magsama pa yung papalag:))',
      'numOfLikes': 1308,
      'hasImage': false,
      'postImage': null,
      'date': 'May 29, 2020',
      'profilePicture': 'https://i.pinimg.com/736x/0b/05/2d/0b052d822f547a7e7a268f71444a0a75.jpg',
    },
    {
      'userName': 'Kang Je Sun',
      'postContents': 'Hoy! Mag-request ka na sa DOH @Yentin',
      'numOfLikes': 999,
      'hasImage': false,
      'postImage': null,
      'date': 'July 12, 2025',
      'profilePicture': 'https://i.pinimg.com/736x/55/3b/a7/553ba7f2c7a1634e9614aa967b9dee8b.jpg',
    },
    {
      'userName': 'Leobik',
      'postContents': 'open po guys VALORANT',
      'numOfLikes': 780,
      'hasImage': true,
      'postImage': 'https://i.pinimg.com/736x/54/77/9b/54779b02b09548b8b45b96117b1b283e.jpg',
      'date': 'March 12, 2025',
      'profilePicture': 'https://i.pinimg.com/1200x/72/87/2e/72872ecaaf90c4e61f7691619a7ac49e.jpg',
    },
    {
      'userName': 'Gary the Snake',
      'postContents':
          'Wooohoo having fun here at Zootopia with the best Cops, @Nick & @Judy!!',
      'numOfLikes': 30000,
      'hasImage': true,
      'postImage': 'https://i.pinimg.com/736x/75/df/c3/75dfc323dc998d3ea51abf3845cd4c5d.jpg',
      'date': 'November 25, 2025',
      'profilePicture': 'https://i.pinimg.com/736x/6b/a0/39/6ba0396d66c1dc1b430772dafb31113e.jpg',
    },
    {
      'userName': 'Itanation',
      'postContents': 'Ang saya ng 21st celeb q huhhu, lalo na wla si yen..🥰',
      'numOfLikes': 10000,
      'hasImage': false,
      'postImage': null,
      'date': 'November 20, 2025',
      'profilePicture': 'https://i.pinimg.com/736x/8f/bd/15/8fbd15fdd38091dd67669bec6271510f.jpg',
    },
    {
      'userName': '普萨日圆',
      'postContents':
          '1KkaAw aAnN9 LHUnNAaS sAa zZAkItH KhOng ! mHiZ5 yY0uU,,,',
      'numOfLikes': 50,
      'hasImage': true,
      'postImage': 'https://i.pinimg.com/736x/9d/8b/82/9d8b82177c9f1bba482bf7d68d1c8e27.jpg',
      'date': 'Jan 1, 2015',
      'profilePicture': 'https://i.pinimg.com/736x/f0/84/db/f084db2a724fed85b209fd0e87f32081.jpg',
    },
    {
      'userName': 'Tutubi',
      'postContents':
          'Free Robux to 100 Lucky Winners! Just Like and Share this Post!',
      'numOfLikes': 500000,
      'hasImage': true,
      'postImage': 'https://i.pinimg.com/736x/08/41/f2/0841f214682d6ba107341dea3be23647.jpg',
      'date': 'April 1, 2024',
      'profilePicture': 'https://i.pinimg.com/736x/77/19/00/77190088c8605dde08fdd0b3ab1a5441.jpg',
    },
    {
      'userName': 'Kunyare 2012',
      'postContents': 'shoutout kay user KANG JE SUN???',
      'numOfLikes': 2012,
      'hasImage': true,
      'postImage': 'https://i.pinimg.com/736x/a3/7c/18/a37c1848e71b233a6440f31e159284cb.jpg',
      'date': 'March 10, 2025',
      'profilePicture': 'https://i.pinimg.com/1200x/dd/9a/f4/dd9af49889662633c1400e0303802b96.jpg',
    },
  ];

final List<String> ads = const [
  'https://www.adobomagazine.com/wp-content/uploads/2021/06/Chupa-Chups-Brings-MLBB-and-UniPin-Philippines-in-New-Product-Collaboration-for-Gamers-HERO.jpg',
  'https://i.pinimg.com/736x/9a/d6/3f/9ad63f4aae5c60059bb927f4959e76f6.jpg',
  'https://i.ytimg.com/vi/3fzFvZToh8o/maxresdefault.jpg',
  'https://res.klook.com/image/upload/v1659495066/lgen3lyfmotsa4jnkftd.jpg',
   'https://images.tokopedia.net/img/cache/700/aphluv/1997/1/1/e41f4ea45d744bffaea28f8febdcd93b~.jpeg',
];

  //Enhancement 1: Alternate Posts with Ads (DONE)
  final List<Map<String, dynamic>> adPosts = const [
    {
      'userName': 'ChupaChups',
      'profilePicture': 'https://i.pinimg.com/736x/3c/b5/76/3cb576852a506a110e604d6123b3df12.jpg',
      'postContents': 'Check out our latest deal!',
      'hasImage': true,
      'postImage': 'https://www.adobomagazine.com/wp-content/uploads/2021/06/Chupa-Chups-Brings-MLBB-and-UniPin-Philippines-in-New-Product-Collaboration-for-Gamers-HERO.jpg',
      'numOfLikes': 100,
      'date': 'Feb 26, 2025',
    },
    {
      'userName': 'Burger King',
      'profilePicture': 'https://i.pinimg.com/736x/53/93/6d/53936d30b57e24603afe6858f94d41cc.jpg',
      'postContents': 'Limited time offer, don’t miss out!',
      'hasImage': true,
      'postImage': 'https://i.pinimg.com/736x/9a/d6/3f/9ad63f4aae5c60059bb927f4959e76f6.jpg',
      'numOfLikes': 200,
      'date': 'Dec 26, 2025',
    },
    {
      'userName': 'Netflix',
      'profilePicture': 'https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456',
      'postContents': 'Very Exciting Journey!',
      'hasImage': true,
      'postImage': 'https://i.ytimg.com/vi/3fzFvZToh8o/maxresdefault.jpg',
      'numOfLikes': 300,
      'date': 'Jan 10, 2026',
    },
    {
      'userName': ' LiveNation',
      'profilePicture': 'https://static.pollstar.com/wp-content/uploads/2022/02/3696accc-7e66-4743-b971-ebdf3a590835-livenatnewa.jpg',
      'postContents': 'Give it up for Beabadoobee!',
      'hasImage': true,
      'postImage': 'https://res.klook.com/image/upload/v1659495066/lgen3lyfmotsa4jnkftd.jpg',
      'numOfLikes': 2500,
      'date': 'Jan 1, 2025',
    },
    {
      'userName': 'Goojodoq',
      'profilePicture': 'https://images.51microshop.com/14201/snippet/1715073016680_0.png',
      'postContents': 'Goojodoq X Nailong, Limited Stocks Only',
      'hasImage': true,
      'postImage': 'https://images.tokopedia.net/img/cache/700/aphluv/1997/1/1/e41f4ea45d744bffaea28f8febdcd93b~.jpeg',
      'numOfLikes': 502,
      'date': 'Nov 11, 2024',
    },
  ];

 @override
Widget build(BuildContext context) {
  final List<Widget> feedItems = [];

  for (int i = 0; i < posts.length; i++) {
    feedItems.add(
      NewsfeedCard(
        userName: posts[i]['userName'],
        postContents: posts[i]['postContents'],
        numOfLikes: posts[i]['numOfLikes'],
        hasImage: posts[i]['hasImage'],
        postImage: posts[i]['postImage'],
        date: posts[i]['date'],
        profilePicture: posts[i]['profilePicture'],
      ),
    );

  // Enhancement 2, 5-7 Advertisment (DONE)
    if ((i + 1) % 2 == 0) {
      feedItems.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Advertisement / Promotion",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),

              SizedBox(
                height: null, 
                child: CarouselSlider.builder(
                  itemCount: adPosts.length,
                  itemBuilder: (context, index, realIndex) {
                    final ad = adPosts[index];
                    return SingleChildScrollView(
                      child: NewsfeedCard(
                        userName: ad['userName'],
                        profilePicture: ad['profilePicture'],
                        postContents: ad['postContents'],
                        date: ad['date'],
                        hasImage: ad['hasImage'],
                        postImage: ad['postImage'],
                        numOfLikes: ad['numOfLikes'],
                        customFooter: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                              Align(
                                alignment: Alignment.centerRight, 
                                child: Container(
                                  width: 60.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: YF_PRIMARY,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(Icons.arrow_forward, color: YF_LIGHT, size: 18.sp),
                                ),
                              ),
                            Positioned(
                                  left: 5.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start, 
                                    children: [
                                      CustomFont(
                                        text: "More Details", 
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: YF_TEXT,
                                      ),
                                       SizedBox(height: 1.h), 
                                        CustomFont(
                                        text: "Click To View", 
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: YF_PRIMARY,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          )
                        ),
                      );
                    },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.9,
                    height: 350.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  return ListView(
    padding: EdgeInsets.all(10.sp),
    children: feedItems,
  );
}
}