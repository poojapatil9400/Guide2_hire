import 'package:flutter/material.dart';
import 'package:place_vitaapp/pages/forumInternal.dart';


class BottomSheetClass extends StatefulWidget {
  const BottomSheetClass({super.key});

  @override
  State createState() {
    return _BottomSheetClass();
  }

  void showBottomSheet() {}
}

class _BottomSheetClass extends State {
  void showBottomSheet() {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:  EdgeInsets.only(bottom:  MediaQuery.of(context).viewInsets.bottom),
            child: ClipPath(
              clipper: ConvexConcaveClipper(),
              child: Container(
                height:
                    MediaQuery.of(context).size.height / 1.2, // Half screen height
            
                child: Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Expanded(
                        child: Forum(),
                      ),
                    ],
                  ),
                ),
            
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(130.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet();
      },
    );
  }
}

class ConvexConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);

    // Create a convex curve (bulging outward) from top-left
    path.quadraticBezierTo(
      size.width * -2, // Control point X
      -200, // Control point Y
      size.width / 2, // Endpoint X
      10, // Endpoint Y
    );

    // Create a concave curve (curving inward) towards top-right
    path.quadraticBezierTo(
      size.width * 3 / 4, // Control point X
      30, // Control point Y
      size.width, // Endpoint X
      10, // Endpoint Y
    );

    // Line to bottom-right corner
    path.lineTo(size.width, size.height);

    // Line to bottom-left corner
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
}
}
