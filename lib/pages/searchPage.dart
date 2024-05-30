import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen/widget/profileTile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Delay the focus request using Future.delayed
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            collapsedHeight: 70,
            pinned: true,
            backgroundColor: const Color(0xFFC32422),
            flexibleSpace: const FlexibleSpaceBar(
              expandedTitleScale: 1,
              title: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/image121.png"),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "The Weekend",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Community +11K members",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => _showBottomSheet(context),
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 30, // Adjust this height as needed
                              child: TextField(
                                focusNode: _searchFocusNode,
                                controller: _searchController,
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  fillColor: const Color(0xFFE9E9EB),
                                  filled: true,
                                  hintText: 'Search member',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                              onPressed: () {}, child: const Text("Cancel")),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 8.0,
                        children: List.generate(
                          20,
                          (index) => ProfileTile(
                            color: index == 0
                                ? const Color(0xFFAAABAB)
                                : const Color(0xFFEF456F),
                            text: index == 0 ? 'Following' : 'Add',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    SvgPicture.asset('assets/link.svg'),
                    const SizedBox(width: 5),
                    const Text(
                      'Invite',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle clear chat action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    SvgPicture.asset('assets/user-add.svg'),
                    const SizedBox(width: 5),
                    const Text(
                      'Add member',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle archive chat action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    SvgPicture.asset('assets/user-add1.svg'),
                    const SizedBox(width: 5),
                    const Text(
                      'Add Group',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle delete chat action
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
