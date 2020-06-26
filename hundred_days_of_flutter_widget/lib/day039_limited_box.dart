import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day39LimitedBox extends StatelessWidget {
  const Day39LimitedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * ? What is LimitedBox....
     * ! LimitedBox is the setting up the size of the child Widget if parent Widget is non constrained....
     * ! Best example of LimitedBox is for controlling the size of ListView items.....
     * ! because ListView items don't follow any constraines....
     */
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              /**
               * ! you can see that LimitedBox is not works on the Container or any constrained boxes....
               * ! it will works only in some Unconstrained spaces like UnconstrainedBox, ListView....
               */
              Container(
                width: 300,
                height: 300,
                child: LimitedBox(
                  /**
                   * ! here the LimitedBox size in useless bcos Parent Container have it's own width and height....
                   */
                  maxWidth: 150,
                  maxHeight: 150,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              UnconstrainedBox(
                // ! here I added the UnconstrainedBox which is dont have any width and height....
                child: LimitedBox(
                  maxWidth: 150,
                  maxHeight: 150,
                  child: Container(
                    /**
                     * ! so, The with and height of the Container is fixed to the it's parent LimitedBox 
                     */
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("LimitedBox"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day039_limited_box.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
    );
  }
}
