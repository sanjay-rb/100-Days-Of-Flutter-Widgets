import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Day70ShaderMask extends StatelessWidget {
  const Day70ShaderMask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        /**
         * ? What is ShaderMask....
         * ! ShaderMask is the cool effect for the any white screen....
         * ! Where every white screen filled by shader....
         */
        child: ShaderMask(
          // ! here comes the ShaderMask....
          shaderCallback: (bounds) => RadialGradient(
            // ! With RadialGradient as the [shaderCallback]....
            colors: [
              Colors.yellow,
              Colors.orange,
              Colors.deepOrange,
              Colors.red
            ],
            radius: 5.0,
          ).createShader(bounds), // ! createShader with the [bounds]....
          child: Stack(
            // ! here we apply the ShaderMask for the Stack....
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors
                    .white, // ! This White [Container] filled by the ShaderMask Gradient....
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "This is Shaded Text",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors
                          .white, // ! This White [Text] filled by the ShaderMask Gradient....
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('ShaderMask'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day070_shader_mask.dart';
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
