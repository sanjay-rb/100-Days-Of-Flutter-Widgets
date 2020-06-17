import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day12SliverGridList extends StatefulWidget {
  Day12SliverGridList({Key key}) : super(key: key);

  @override
  _Day12SliverGridListState createState() => _Day12SliverGridListState();
}

class _Day12SliverGridListState extends State<Day12SliverGridList> {
  @override
  Widget build(BuildContext context) {
    childrenList(text, pickColor) {
      return <Widget>[
        Container(
          alignment: Alignment.center,
          color: pickColor[100],
          child: Text('$text Items 1'),
        ),
        Container(
          alignment: Alignment.center,
          color: pickColor[200],
          child: Text('$text Items 2'),
        ),
        Container(
          alignment: Alignment.center,
          color: pickColor[300],
          child: Text('$text Items 3'),
        ),
        Container(
          alignment: Alignment.center,
          color: pickColor[400],
          child: Text('$text Items 4'),
        ),
        Container(
          alignment: Alignment.center,
          color: pickColor[500],
          child: Text('$text Items 5'),
        ),
        Container(
          alignment: Alignment.center,
          color: pickColor[600],
          child: Text('$text Items 6'),
        ),
        Container(
          alignment: Alignment.center,
          color: pickColor[700],
          child: Text('$text Items 7'),
        ),
        Container(
          alignment: Alignment.center,
          color: pickColor[800],
          child: Text('$text Items 8'),
        ),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day012_slivergrid_list.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            elevation: 20.0,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('SliverGridList'),
            ),
          ),
          SliverGrid(
            // ? What is SliverGrid....
            /**
         * ! [SliverGrid] accept the two properties [delegate], [gridDelegate]....
         */
            delegate: SliverChildBuilderDelegate(
              // ? [delegate] is the place where the grid items are generated....
              (BuildContext context, int index) {
                // ! build generate the items countiously....
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[200 * ((index % 4) + 1)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount:
                  20, // ! with the help of child count we can stop the item generations....
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // ? [gridDelegate] the look of the grid is given here ....
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.9,
              /**
             * ! we can specify the size and space between the grid by properties like...
             * * maxCrossAxisExtent
             * * mainAxisSpacing
             * * crossAxisSpacing
             * * childAspectRatio
             */
            ),
          ),
          SliverGrid.extent(
            // ? What is SliverGrid.extent....
            /**
           * ! we can create the grid with the help of extent value....
           * ! the important and required property is [maxCrossAxisExtent]....
           * ! [children] to populate the Grid....
           */
            maxCrossAxisExtent: 150,
            children: childrenList("SliverGrid.extent", Colors.orange),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          SliverGrid.count(
            // ? What is SliverGrid.count....
            /**
           * ! we can create the grid with the help of count value....
           * ! the important and required property is [crossAxisCount]....
           * ! [children] to populate the Grid....
           */
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: childrenList("SliverGrid.count", Colors.green),
          ),
          SliverList(
            // ? What is SliverList....
            /**
         * ! [SliverList] accept the one required properties [delegate]....
         */
            delegate: SliverChildListDelegate(
                childrenList("SliverList Items", Colors.red)),
            /**
               * ! we can give the listed Widgets to the [SliverChildListDelegate]....
               */
          ),
          SliverFixedExtentList(
            // ? or we can create the list by [SliverFixedExtentList]....
            /**
           * ! it requried the [itemExtent] as the property....
           * ! that [itemExtent] decide the property of height factor....
           */
            itemExtent: 100.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
