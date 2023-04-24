import 'package:flutter/material.dart';

class TabBarViewWidget extends StatefulWidget {
  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('TabBar Widget'),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.lime,
            indicatorWeight: 5.0,
            labelColor: Colors.white,
            labelPadding: const EdgeInsets.only(top: 10.0),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                text: 'Cake',
                icon: Icon(
                  Icons.cake,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              //child: Image.asset('images/android.png'),

              Tab(
                text: 'Radio',
                icon: Icon(
                  Icons.radio,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                text: 'Gift',
                icon: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(
                child: Text(
              'This is Cake Tab',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'This is Radio Tab',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'This is Gift Tab',
              style: TextStyle(fontSize: 32),
            )),
          ],
        ),
      ),
    );
  }
}
