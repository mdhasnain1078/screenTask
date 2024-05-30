import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen/pages/searchPage.dart';
import 'package:screen/widget/HimageScroll.dart';
import 'package:screen/widget/hScrolling.dart';
import 'package:screen/widget/profileTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarContent = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final pixels = _scrollController.position.pixels;

    // Calculate the percentage of how much FlexibleSpaceBar is visible
    final percentageVisible = pixels / maxScrollExtent;

    // Threshold value to determine when FlexibleSpaceBar becomes content of SliverAppBar
    const threshold = 0.1;

    setState(() {
      _isAppBarContent = percentageVisible >= threshold;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFC32422),
            pinned: true,
            toolbarHeight: 70,
            collapsedHeight: 70,
            automaticallyImplyLeading: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.15,
                centerTitle: true,
                background: Image.asset(
                  "assets/image121.png",
                  fit: BoxFit.cover,
                ),
                title: _isAppBarContent
                    ? AnimatedOpacity(
                        opacity: _isAppBarContent ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          width: double.infinity,
                          color: _isAppBarContent
                              ? Colors.transparent
                              : const Color(0xFFC32422),
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  _isAppBarContent
                                      ? const CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              AssetImage("assets/image121.png"),
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Weekend",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Community +11K members",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              _isAppBarContent
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      'assets/share.svg',
                                      color: Colors.white,
                                    )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox()),
          ),

          // Items
          SliverToBoxAdapter(
            child: AnimatedOpacity(
              opacity: _isAppBarContent ? 0 : 1,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                color: const Color(0xFFC32422),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Weekend",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Community +11K members",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/share.svg',
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus nec consequat. Proin '
                  'nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. '
                  'Vivamus vel semper ame...Read more',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const HScroll(
                  itemCount: 6,
                ),
                const SizedBox(height: 16),
                const HImageScroll(),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Mute notification',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: true,
                        onChanged: (value) {},
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset('assets/trash.svg'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Clear chat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/iconamoon_lock-light.svg',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Encryption',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/dislike.svg',
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Exit community',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: () {},
                        textColor: Colors.red,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/logout.svg',
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Report',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: () {},
                        textColor: Colors.red,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Members',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage()));
                            },
                            icon: SvgPicture.asset(
                              'assets/search-normal.svg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Wrap(
                    spacing: 8.0,
                    children: List.generate(
                        20,
                        (index) => index == 0
                            ? const ProfileTile(
                                color: Color(0xFFAAABAB),
                                text: 'Following',
                              )
                            : const ProfileTile(
                                color: Color(0xFFEF456F),
                                text: 'Add',
                              ))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
