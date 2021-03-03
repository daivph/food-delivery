import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/modules/home/home_page.dart';
import 'package:food/modules/order/order_page.dart';
import 'package:food/modules/profile/profile_page.dart';
import 'package:food/modules/saved/saved_page.dart';
import 'package:food/routes/routes.dart';

class TabbarScreen extends StatefulWidget {
  static final GlobalKey<NavigatorState> homeKey =
      GlobalKey(debugLabel: 'homeNavigatorKey');
  static final GlobalKey<NavigatorState> orderKey =
      GlobalKey(debugLabel: 'orderNavigatorKey');
  static final GlobalKey<NavigatorState> savedKey =
      GlobalKey(debugLabel: 'savedNavigatorKey');
  static final GlobalKey<NavigatorState> profileKey =
      GlobalKey(debugLabel: 'profileNavigatorKey');

  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  GlobalKey<NavigatorState> get homeKey => TabbarScreen.homeKey;
  GlobalKey<NavigatorState> get orderKey => TabbarScreen.orderKey;
  GlobalKey<NavigatorState> get savedKey => TabbarScreen.savedKey;
  GlobalKey<NavigatorState> get profileKey => TabbarScreen.profileKey;

  int oldTab = 0;
  CupertinoTabController _tabController;
  List<Widget> listTab;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController();
    listTab = [
      CupertinoTabView(
        builder: (BuildContext context) {
          return const HomePage();
        },
        navigatorKey: homeKey,
        onGenerateRoute: Routes.homeRoute,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return const OrderPage();
        },
        navigatorKey: orderKey,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return const SavedPage();
        },
        navigatorKey: orderKey,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return const ProfilePage();
        },
        navigatorKey: profileKey,
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        controller: _tabController,
        tabBuilder: (BuildContext context, int index) {
          return listTab[index];
        },
        tabBar: _buildTabBar(),
      ),
    );
  }

  Widget _buildTabBar() {
    return CupertinoTabBar(
      onTap: onTabTap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  void onTabTap(int index) {
    switch (index) {
      case 0:
        if (index != oldTab) {
          break;
        }
        if (homeKey.currentState.canPop()) {
          homeKey.currentState.pop();
        }
        break;
      case 1:
        if (index != oldTab) {
          break;
        }
        if (orderKey.currentState.canPop()) {
          orderKey.currentState.pop();
        }
        break;
      case 2:
        if (index != oldTab) {
          break;
        }
        if (savedKey.currentState.canPop()) {
          savedKey.currentState.pop();
        }
        break;
      case 3:
        if (index != oldTab) {
          break;
        }
        if (profileKey.currentState.canPop()) {
          profileKey.currentState.pop();
        }
        break;
    }
    oldTab = index;
  }
}
