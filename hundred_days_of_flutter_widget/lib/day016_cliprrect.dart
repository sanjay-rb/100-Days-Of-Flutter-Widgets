import 'package:flutter/material.dart';

class Day16ClipRRect extends StatelessWidget {
  const Day16ClipRRect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect( // ? What is ClipRRect.... 
        borderRadius: BorderRadius.circular(50.0),
        /**
         * ! we can simply make the [borderRadius] for any Rectangle Widgets....
         */
        clipBehavior: Clip.antiAlias,
        /**
         * ! we can specify the border look with the help of.... 
         * * antiAlias - This mode has anti-aliased clipping edges to achieve a smoother look.
         * * antiAliasWithSaveLayer - This mode not only clips with anti-aliasing, but also allocates an offscreen buffer.
         * * hardEdge - This mode enables clipping, but curves and non-axis-aligned straight lines will be jagged as no effort is made to anti-alias.
         */
        child: Container( // ! a simple container to text the working....
          color: Colors.orange,
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
