import 'package:flutter/material.dart';

class SliverListExample extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverPersistentHeaderDelegate(
        minHeight: 60.0,
        maxHeight: 150.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              color: Colors.green,
              child: Center(
                  child: Text(
                headerText,
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 95,
          backgroundColor: Colors.red,
          title: const Text("Sliver list & gridview"),
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
            background: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: SizedBox(
                  height: 42,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        makeHeader('SliverFixedExtentList Header'),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              Container(color: Colors.pink),
            ],
          ),
        ),

        makeHeader('SliverList Header'),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              leading: const Icon(Icons.book),
              title: Text('Item $index'),
            ),
            childCount: 50,
          ),
        ),
        makeHeader('SliverGrid Header'),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              color: Colors.teal[100 * (index % 9 + 1)],
              alignment: Alignment.center,
              child: Text('Grid Item $index'),
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
