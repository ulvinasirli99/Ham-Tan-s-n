import 'package:flutter/material.dart';

class SplashImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? widthSize, heightSize;

  const SplashImageWidget({
    Key? key,
    this.widthSize,
    this.heightSize,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize ?? 139,
      height: heightSize ?? 139,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl ??
              'https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg'),
        ),
      ),
    );
  }
}
