import 'package:mencoba_1/utils/config.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String social;

  const SocialButton({super.key, required this.social});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        side: const BorderSide(width: 1, color: Colors.grey),
      ),
      onPressed: () {},
      child: SizedBox(
        width: Config.widthSize * 0.275,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/$social.png', width: 20, height: 20),
            const SizedBox(width: 5,),
            Text(
              
              social.toUpperCase(),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
