// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/utils/global.colors.dart';

class ModalAddDetails extends StatefulWidget {
  ModalAddDetails({
    super.key,
    required this.image,
    required this.titleProduct,
    required this.price,
    this.currencySign = 'Rp',
    this.quantity = 1,
    required this.textButton,
    required this.onTap,
    required this.catatan,
    required this.quantityController,
  });

  final String image;
  final String titleProduct;
  final int price;
  final String currencySign;
  int quantity;
  final String textButton;
  final VoidCallback onTap;
  final TextEditingController catatan;
  final TextEditingController quantityController;

  @override
  State<ModalAddDetails> createState() => _ModalAddDetailsState();
}

class _ModalAddDetailsState extends State<ModalAddDetails> {
  final TextEditingController _quantityController = TextEditingController();

  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _quantityController.text = widget.quantity.toString();
    updateTotalPrice();
  }

  void incrementQuantity() {
    setState(() {
      widget.quantity++;
      _quantityController.text = widget.quantity.toString();
      updateTotalPrice();
    });
  }

  void decrementQuantity() {
    if (widget.quantity > 1) {
      setState(() {
        widget.quantity--;
        _quantityController.text = widget.quantity.toString();
        updateTotalPrice();
      });
    }
  }

  void onTextChanged(String value) {
    final int? newQuantity = int.tryParse(value);
    if (newQuantity != null && newQuantity > 0) {
      setState(() {
        widget.quantity = newQuantity;
        updateTotalPrice();
      });
    }
  }

  void updateTotalPrice() {
    setState(() {
      totalPrice = widget.quantity * widget.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.63,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.titleProduct,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: GlobalColors.textColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.currencySign + widget.price.toString(),
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 13,
                            color: GlobalColors.thirdColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: GlobalColors.garis,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: IconButton(
                                    onPressed: decrementQuantity,
                                    iconSize: 13,
                                    color: GlobalColors.secondColor,
                                    icon: const Icon(FeatherIcons.minus),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 20,
                                  child: TextField(
                                    controller: _quantityController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 13,
                                      color: GlobalColors.textColor,
                                    ),
                                    onChanged: onTextChanged,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: GlobalColors.mainColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: IconButton(
                                    onPressed: incrementQuantity,
                                    iconSize: 13,
                                    color: Colors.white,
                                    icon: const Icon(FeatherIcons.plus),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Catatan (opsional)',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: GlobalColors.textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tulis catatan buat barangnya',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 12,
                    color: GlobalColors.secondColor,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: widget.catatan,
                  maxLines: 6,
                  style: GoogleFonts.openSans(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Catatan...',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: GlobalColors.mainColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 155,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: GlobalColors.garis),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 13,
                              color: GlobalColors.secondColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${widget.currencySign}$totalPrice',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: GlobalColors.textColor,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/img/icon/icons8-money.png',
                        width: 50,
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: widget.onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      widget.textButton,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
