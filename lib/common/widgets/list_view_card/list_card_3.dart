import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mr_garage/utils/global.colors.dart';

class ListCard3 extends StatelessWidget {
  const ListCard3({
    super.key,
    required this.onTap,
    required this.image,
    required this.storeName,
    required this.location,
    required this.active,
  });

  final VoidCallback? onTap;
  final String image;
  final String storeName;
  final String location;
  final String active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: GlobalColors.garis,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: GlobalColors.textColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.mapPin,
                            size: 10,
                            color: HexColor('363636'),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            location,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 10,
                              color: HexColor('363636'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.clock,
                            size: 10,
                            color: HexColor('363636'),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            active,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 10,
                              color: HexColor('363636'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                FeatherIcons.arrowRight,
                size: 20,
                color: GlobalColors.textColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
