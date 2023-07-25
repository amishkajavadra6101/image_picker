import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(const MaterialApp(home: CurevedNavBar()));

class CurevedNavBar extends StatefulWidget {
  const CurevedNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurevedNavBarState createState() => _CurevedNavBarState();
}

class _CurevedNavBarState extends State<CurevedNavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("curved nav bar"),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0, // index of NavigationBar, can be used to change current index or to set initial index
          height: 60.0, // Height of NavigationBar, min 0.0, max 75.0
          items: const <Widget>[  //List of Widgets
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white, //Color of NavigationBar, default Colors.white
          buttonBackgroundColor: Colors.white, //background color of floating button, default same as color attribute
          backgroundColor: _page == 0 // Color of NavigationBar's background, default Colors.blueAccent
              ? Colors.grey
              : _page == 1
                  ? Colors.red
                  : _page == 2
                      ? Colors.yellow
                      : _page == 3
                          ? Colors.blueAccent
                          : _page == 4
                              ? Colors.green
                              : Colors.transparent,
          animationCurve: Curves.easeInOut, //Curves interpolating button change animation, default Curves.easeOutCubic
          animationDuration: const Duration(milliseconds: 600), //Duration of button change animation, default Duration(milliseconds: 600)
          onTap: (index) { //Function handling taps on items
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true, //Function which takes page index as argument and returns bool. If function returns false then page is not changed on button tap. It returns true by default
        ),
        body: _page == 0
            ? Container(
                color: Colors.grey,
              )
            : _page == 1
                ? Container(
                    color: Colors.red,
                  )
                : _page == 2
                    ? Container(
                        color: Colors.yellow,
                      )
                    : _page == 3
                        ? Container(
                            color: Colors.blueAccent,
                          )
                        : _page == 4
                            ? Container(
                                color: Colors.green,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton(
                                        child:
                                            const Text('Go To Page of index 1'),
                                        onPressed: () {
                                          final CurvedNavigationBarState? navBarState =
                                              _bottomNavigationKey.currentState;
                                          navBarState?.setPage(0);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox());
  }
}
