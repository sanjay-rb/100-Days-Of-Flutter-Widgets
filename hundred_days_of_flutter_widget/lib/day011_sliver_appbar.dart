import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day11SliverAppBar extends StatefulWidget {
  Day11SliverAppBar({Key key}) : super(key: key);

  @override
  _Day11SliverAppBarState createState() => _Day11SliverAppBarState();
}

class _Day11SliverAppBarState extends State<Day11SliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // ? what is SliverAppBar
              /**
                 * ! it is the simple appbar which is used specifically in [CustomScrollView]....
                 * ! you can done many function other then the normal appbar....
                 * ! some of the important are given below....
                 */
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text('SliverAppBar'),
              ),
              /**
                 * ! [flexibleSpace] is used to give the fexble app bar....
                 * ! this gives you the cool animation in the appbar like....
                 * ! strink and strech....
                 */
              // ? title: Text("Head"),
              /**
                 * ! [title] to perform the simple appbar text....
                 */
              // ? centerTitle: true,
              /**
                 * ! [centerTitle] to center the text in simple app bar....
                 */
              backgroundColor:
                  Colors.green, // ! to provide the bg color for tha app bar....
              brightness: Brightness
                  .light, // ! to provide the [brightness] like dark or light....
              floating: true, // ! to make the appbar floating...
              elevation: 10.0, // ! to give cool shadow effect....
              expandedHeight: 150.0, // ! max expand or strech size....
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.help),
                  onPressed: () async {
                    const url =
                        'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                            'blob/master/hundred_days_of_flutter_widget/' +
                            'lib/day011_sliver_appbar.dart';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                )
              ],
            ),
            SliverList(
                // ! these are some of the List elements....
                // ! we are going to learn it tomorrow....
                delegate: SliverChildListDelegate([
              ListTile(
                title: Text("Hello 1"),
              ),
              ListTile(
                title: Text("Hello 2"),
              ),
              ListTile(
                title: Text("Hello 3"),
              ),
              ListTile(
                title: Text("Hello 4"),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
