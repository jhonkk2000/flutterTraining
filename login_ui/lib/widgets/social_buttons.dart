import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){}, icon: Image.asset('assets/fb.png')),
        IconButton(onPressed: (){}, icon: Image.asset('assets/linkedin.png')),
        IconButton(onPressed: (){}, icon: Image.asset('assets/twitter.png')),
      ],
    );
  }
}