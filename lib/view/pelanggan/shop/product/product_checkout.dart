import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/utils/global.colors.dart';

class ProductCheckout extends StatefulWidget {
  const ProductCheckout({
    super.key,
    required this.previousAction,
    required this.imgUrl,
  });

  final String previousAction;
  final String imgUrl;

  @override
  State<ProductCheckout> createState() => _ProductCheckoutState();
}

class _ProductCheckoutState extends State<ProductCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: 20,
              height: 20,
              child: Icon(
                FeatherIcons.arrowLeft,
                size: 20,
                color: GlobalColors.textColor,
              ),
            ),
          ),
        ),
        title: widget.previousAction == 'Beli'
            ? Text(
                'Beli langsung',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: GlobalColors.textColor,
                ),
              )
            : Text(
                'Tinjauan',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: GlobalColors.textColor,
                ),
              ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: GlobalColors.garis, width: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
