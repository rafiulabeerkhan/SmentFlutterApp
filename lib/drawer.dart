import 'package:flutter/material.dart';
import 'package:sment/homePage.dart';

class CollapsingAppbarWithTabsPage extends StatelessWidget {
  const CollapsingAppbarWithTabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      collapseMode: CollapseMode.parallax,
                      title: const Text("Your Trusted Place :) ",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16.0,
                          )),
                      background: Image.asset(
                        "images/smLogo.png",
                        fit: BoxFit.cover,
                      )),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.purple,
                      unselectedLabelColor: Colors.grey,
                      tabs: _tabs,
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [Text("asdjkfl")],
            ),
          ),
        ));
  }
}

var _tabs = [
  Tab(
    icon: Icon(Icons.home_rounded),
    child: HomeScreen(title: "hello"),
  ),
  Tab(
    icon: Icon(Icons.shopping_bag_rounded),
    child: const Text("Hello"),
  ),
  Tab(icon: Icon(Icons.person), child: const Text("Hello")),
];

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
