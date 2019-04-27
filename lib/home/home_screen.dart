import 'package:flutter/material.dart';
import '../configs/wechat_icons.dart';

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
        _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
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
          icon: WeChatIcons.wechat,
          activeIcon: WeChatIcons.wechatActive,
      ),
      NavigationIconView(
          title: '通讯录',
          icon: WeChatIcons.addressBook,
          activeIcon: WeChatIcons.addressBookActive,
      ),
      NavigationIconView(
          title: '发现',
          icon: WeChatIcons.discovery,
          activeIcon: WeChatIcons.discoveryActive,
      ),
      NavigationIconView(
          title: '我',
          icon: WeChatIcons.mine,
          activeIcon: WeChatIcons.mineActive,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint('search click'),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => debugPrint('add click'),
          )
        ],
      ),
      body: Container(
        color: Colors.amber,
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
}
}
