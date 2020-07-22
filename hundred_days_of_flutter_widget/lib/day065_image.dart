import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day65Image extends StatelessWidget {
  const Day65Image({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 2,
                child: Center(
                  // ? What is Image....
                  /**
                   * ! to display the image in the ui....
                   * ! assets:
                   * !  - images/logo.gif
                   * !  - images/coffee.jpg
                   */
                  child: Image.asset(
                    "images/coffee.jpg",
                    fit: BoxFit.fill,
                  ), // ! get image from the asset file....
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 2,
                child: Center(
                  // ! get image from the network file....
                  child: Image.network(
                    "https://www.emanprague.com/en/wp-content/uploads/2018/05/flutter_eman_blog.png",
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : LinearProgressIndicator(
                                value: loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes ??
                                    0.1, // ! loader value get from the [loadingProgress]....
                              ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Image'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day065_image.dart';
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
