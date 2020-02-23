import 'package:fitness_flutter/components/Header.dart';
import 'package:fitness_flutter/components/ImageCardWithBasicFooter.dart';
import 'package:fitness_flutter/models/exercise.dart';
import 'package:flutter/material.dart';

import '../data/Dishes.dart';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: Header(
                "Diet",
                rightSide: Container(
                  height: 35.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  margin: EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(100, 140, 255, 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      "Tracker",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: "Breakfast",
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: "Lunch",
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: "Dinner",
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: "Snacks",
                    ),
                  ),
                ],
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey[400],
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color.fromRGBO(215, 225, 255, 1.0),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                TabViewBase(
                  tabName: "Breakfast",
                ),
                TabViewBase(
                  tabName: "Lunch",
                ),
                TabViewBase(
                  tabName: "Dinner",
                ),
                TabViewBase(
                  tabName: "Snacks",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabViewBase extends StatelessWidget {
  final String tabName;

  TabViewBase({@required this.tabName});

  List<Widget> _renderItem(size) {
    return List<Widget>.generate(dishes.length, (index) {
      var tag = dishes[index]["title"] + index.toString();
      Exercise exercise = Exercise(
        image: dishes[index]["image"],
        title: dishes[index]["title"],
        time: dishes[index]["time"],
        difficult: dishes[index]["calories"],
      );
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: ImageCardWithBasicFooter(
          exercise: exercise,
          tag: tag,
          imageWidth: size.width,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(219, 228, 255, 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Track my " + this.tabName,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(122, 158, 255, 1.0),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    size: 25.0,
                    color: Color.fromRGBO(122, 158, 255, 1.0),
                  )
                ],
              ),
            ),
            Column(children: this._renderItem(size)),
          ],
        ),
      ),
    );
  }
}
