import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day20FittedBox extends StatelessWidget {
  const Day20FittedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            // ? this Container is going to be have Image....
            color: Colors.amber,
            width: double.infinity,
            height: 100,
            child: FittedBox(
              // ? What is FittedBox....
              /**
           * ! we can easy fit one widget with another by [FittedBox]....
           * ! yes, this example fitted the Image.asset() into the Container of height 100....
           */
              fit: BoxFit.fill,
              /**
           * ! [fit] is the important property to say how the fit should be....
           * ! There are few predefine fits like :-
           * * none - Align the source within the target box (by default, centering) without change in image.
           * * contain - As large as possible while still containing the source entirely within the target box.
           * * cover - As small as possible while still covering the entire target box.
           * * fill - Fill the target box by distorting the source's aspect ratio.
           * * fitHeight - fitted to the parent height.
           * * fitWidth - fitted to the parent width.
           * * scaleDown - Align the source within the target box (by default, centering) with change in image.
           */
              alignment: Alignment.center,
              /**
           * ! [alignment] yes we can align the child. its defaut value is center....
           */
              child: Image.asset(
                  "images/coffee.jpg"), // ? this Image is going to be fitted inside....
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("FittedBox"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () async {
                const url =
                    'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                        'blob/master/hundred_days_of_flutter_widget/' +
                        'lib/day020_fittedbox.dart';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            )
          ],
        ));
  }
}
