import 'package:flutter/material.dart';
import '../configs/wechat_icons.dart';
import '../configs/wechat_colors.dart';

enum ActionItems {
  GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}

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
            icon: Icon(icon, color: WeCatColors.gray),
            activeIcon: Icon(activeIcon, color: WeCatColors.green
              ,),
            title: Text(title, style: TextStyle(color: WeCatColors.gray, fontSize: 14.0),),
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

  _buildPopupMenuItem(IconData iconData, String title) {
    return Row(
      children: <Widget>[
        Icon(iconData),
        Container(width: 12.0,),
        Text(title)
      ],
    );
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
          Container(width: 16.0,),
//          IconButton(
//            icon: Icon(Icons.add),
//            onPressed: () => debugPrint('add click'),
//          ),
          PopupMenuButton(
            icon: Icon(Icons.add),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(WeChatIcons.groupChat, '发起群聊'),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(WeChatIcons.addFriend, '添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(WeChatIcons.qrScan, '扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(WeChatIcons.payment, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(WeChatIcons.help, '帮助与反馈'),
                  value: ActionItems.HELP,
                ),
              ];
            },
            onSelected: (ActionItems selected) {
              debugPrint('click $selected');
            },
          ),
          Container(width: 16.0,)
        ],
      ),
      body: Container(
        color: Colors.amber,
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
}
}
