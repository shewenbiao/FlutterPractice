import 'package:flutter/material.dart';

class NestedScrollViewRoute extends StatelessWidget {

  const NestedScrollViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                // pinned: true,
                floating: true,
                snap: true,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "images/liu_shen.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: Builder(builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverFixedExtentList(
                itemExtent: 56, //列表项高度固定
                delegate: SliverChildBuilderDelegate(
                      (_, index) => ListTile(title: Text('$index')),
                  childCount: 100,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}