import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/contants.dart';
import 'package:shop_app/models/Product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  color: product.color,
                ),
                borderRadius: BorderRadius.circular(18)),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                    'assets/icons/add_to_cart.svg',color: product.color,)),
          ),
          Expanded(
            child: SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: product.color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                  ),
                  child: Text('Buy Now'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )),
                )),
          )
        ],
      ),
    );
  }
}
