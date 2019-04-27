import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, Widget icon, Widget activeIcon}) :
        _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: icon,
            activeIcon: activeIcon,
            title: Text(title),
            backgroundColor: Colors.white
        );
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<NavigationIconView> _naviViews;

  @override
  void initState() {
    super.initState();
    _naviViews = [
      NavigationIconView(
          title: '微信',
          icon: Icon(Icons.ac_unit),
          activeIcon: Icon(Icons.alarm)
      ),
      NavigationIconView(
          title: '通讯录',
          icon: Icon(Icons.ac_unit),
          activeIcon: Icon(Icons.alarm)
      ),
      NavigationIconView(
          title: '发现',
          icon: Icon(Icons.ac_unit),
          activeIcon: Icon(Icons.alarm)
      ),
      NavigationIconView(
          title: '我',
          icon: Icon(Icons.ac_unit),
          activeIcon: Icon(Icons.alarm)
      )
    ];
  }



  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
      items: _naviViews.map((NavigationIconView view) => view.item).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
    );

    return Scaffold(
      appBar:  AppBar(
        title: Text('wechat'),
      ),
      body: Container(
        color: Colors.amber,
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
}
}
