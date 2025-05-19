import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButon extends StatelessWidget {
  final String text;
  final String image;
  final Function() onPress;
  const CustomSocialButon(
      {Key? key,
      required this.text,
      required this.image,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPress,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              // ignore: unnecessary_string_interpolations
              child: Image.asset('$image'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            CusomText(
              text: text,
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
