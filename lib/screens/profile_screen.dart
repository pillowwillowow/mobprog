import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_button.dart';
import '../widgets/post_card.dart';

class ProfileScreen extends StatefulWidget {
  final String profileName;
  final String profileImage;

  const ProfileScreen({
    super.key,
    required this.profileName,
    this.profileImage = 'https://i.pinimg.com/736x/64/2f/90/642f9088bdc10b6c5326aa66cf28ddca.jpg', 
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _aboutSection({required String title, required List<Widget> children}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFont(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 8.h),
          ...children,
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _aboutItem({required IconData icon, required String text, String? subtitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFont(text: text, fontSize: 14.sp, color: Colors.black),
                if (subtitle != null)
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: CustomFont(
                      text: subtitle,
                      fontSize: 13.sp,
                      color: Colors.grey[700]!,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider('https://i.pinimg.com/736x/f6/6e/a7/f66ea7e7bd0d22bfdb910e52cd7b0ed8.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        left: 20.w,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider('https://i.pinimg.com/736x/64/2f/90/642f9088bdc10b6c5326aa66cf28ddca.jpg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 55.h),

                  //Profile Details With Enhancement
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: widget.profileName,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            CustomFont(text: '2.1K', fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),
                            SizedBox(width: 6.w),
                            CustomFont(text: 'followers', fontSize: 14.sp, color: Colors.grey),
                            SizedBox(width: 8.w),
                            Icon(Icons.circle, size: 4.sp, color: Colors.grey),
                            SizedBox(width: 8.w),
                            CustomFont(text: '444', fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),
                            SizedBox(width: 6.w),
                            CustomFont(text: 'following', fontSize: 14.sp, color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            CustomButton(
                              buttonName: 'Follow',
                              onPressed: () {},
                              fontWeight: FontWeight.bold,
                              fontColor: YF_LIGHT,
                              backgroundColor: YF_PRIMARY,
                            ),
                            SizedBox(width: 10.w),
                            CustomButton(
                              buttonName: 'Message',
                              buttonType: 'outlined',
                              onPressed: () {},
                              outlineColor: YF_PRIMARY, 
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
            //TabBar 
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  indicatorColor: YF_PRIMARY,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: CustomFont(
                        text: 'Posts',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: YF_SECONDARY,
                      ),
                    ),
                    Tab(
                      child: CustomFont(
                        text: 'About',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: YF_SECONDARY,
                      ),
                    ),
                    Tab(
                      child: CustomFont(
                        text: 'Photos',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: YF_SECONDARY,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              //Posts
              ListView(
                padding: EdgeInsets.all(10.w),
                children: [
                  NewsfeedCard(
                    userName: widget.profileName,
                    profilePicture: widget.profileImage,
                    postContents: '⋆˚꩜｡🐛🪲🐞🦗🐜⋆˚꩜｡',
                    date: 'Just now',
                    numOfLikes: 126,
                    hasImage: true,
                    postImage: 'https://i.pinimg.com/1200x/2a/3e/2e/2a3e2e48f63e5e7e9553d978cd86ef80.jpg',
                  ),
                  SizedBox(height: 10.h),
                  NewsfeedCard(
                    userName: widget.profileName,
                    profilePicture: widget.profileImage,
                    postContents: 'yuuuuuup!! stream Sumpa by Fitterkarma <3',
                    date: '2h ago',
                    numOfLikes: 444,
                    hasImage: false,
                  ),
                ],
              ),
              //About Me
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: 'About Me',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(height: 12.h),
                    _aboutSection(title: 'Work', children: [
                      _aboutItem(icon: Icons.computer, text: 'Flutter Developer', subtitle: 'Builds mobile applications')
                    ]),
                    _aboutSection(title: 'Education', children: [
                      _aboutItem(icon: Icons.school, text: 'BSIT – Mobile & Web Applications', subtitle: 'National University – Manila')
                    ]),
                    _aboutSection(title: 'Birthday', children: [
                      _aboutItem(icon: Icons.cake_rounded, text: 'June 17, 2005')
                    ]),
                    _aboutSection(title: 'Places', children: [
                      _aboutItem(icon: Icons.location_on, text: 'Lives in San Juan City, Metro Manila')
                    ]),
                    _aboutSection(title: 'Other Info', children: [
                      _aboutItem(icon: Icons.pets, text: 'Loves cats and coffee'),
                      _aboutItem(icon: Icons.favorite_border, text: 'Collects charms'),
                      _aboutItem(icon: Icons.adb_rounded, text: 'Aside bugs, I love minions'),
                      _aboutItem(icon: Icons.videogame_asset, text: 'Plays mobile games occasionally'),
                      _aboutItem(icon: Icons.ramen_dining, text: 'Enjoys Buldak noodles'),
                      _aboutItem(icon: Icons.movie_outlined, text: 'Prefers movies over series'),
                    ]),
                  ],
                ),
              ),
              //Photos
              GridView.count(
                padding: EdgeInsets.all(8),
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
                childAspectRatio: 1,
                children: <Widget>[
                  GestureDetector(
                    child: Image.network(
                      'https://i.pinimg.com/736x/c7/e8/9e/c7e89edb1dc1d3f1cffa5f93474276a2.jpg',
                      scale: 1,
                      fit: BoxFit.cover,
                    ),
                    onTap: () => customShowImageDialog(context, 
                      imageUrl: 'https://i.pinimg.com/736x/c7/e8/9e/c7e89edb1dc1d3f1cffa5f93474276a2.jpg'),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                      imageUrl: 'https://i.pinimg.com/736x/3d/7d/28/3d7d28e097fcbe35d5084f7bb8326607.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.network(
                        'https://i.pinimg.com/736x/3d/7d/28/3d7d28e097fcbe35d5084f7bb8326607.jpg',
                          fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                      imageUrl: 'https://i.pinimg.com/736x/4c/5d/1b/4c5d1b095991a894d3e8752fdc0da1d7.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.network(
                        'https://i.pinimg.com/736x/4c/5d/1b/4c5d1b095991a894d3e8752fdc0da1d7.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                      imageUrl: 'https://i.pinimg.com/736x/a2/8f/35/a28f35aeba8603d33c379c4628d355dc.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.network(
                        'https://i.pinimg.com/736x/a2/8f/35/a28f35aeba8603d33c379c4628d355dc.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                      imageUrl: 'https://i.pinimg.com/736x/73/9b/ea/739bea15b924232cb7194a9c3afdaef7.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.network(
                        'https://i.pinimg.com/736x/73/9b/ea/739bea15b924232cb7194a9c3afdaef7.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                      imageUrl: 'https://i.pinimg.com/736x/cb/bd/2e/cbbd2ea72877b826ec6b0a4ca16d8bc6.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.network(
                        'https://i.pinimg.com/736x/cb/bd/2e/cbbd2ea72877b826ec6b0a4ca16d8bc6.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/bug7.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/bug7.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/bug8.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/bug8.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/mouse.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/mouse.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/mouse2.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/mouse2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/mouse3.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/mouse3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/mouse4.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/mouse4.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/mouse5.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/mouse5.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/mouse6.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/mouse6.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => customShowImageDialog(context, 
                    assetPath: 'assets/images/mouse7.jpg'),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/mouse7.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Enhancement 3: Added a Close button and Dynamic Image (DONE)
Widget _buildImage(String? imageUrl, String? assetPath) {
  if (imageUrl != null) {
    return Image.network(imageUrl, fit: BoxFit.cover);
  } else if (assetPath != null) {
    return Image.asset(assetPath, fit: BoxFit.cover);
  }
  return const SizedBox.shrink();
}

void customShowImageDialog(
  BuildContext context, {
  String? imageUrl,
  String? assetPath,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildImage(imageUrl, assetPath),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: YF_PRIMARY.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: YF_LIGHT,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(color: Colors.white, child: tabBar);

  @override
  bool shouldRebuild(_) => false;
}
