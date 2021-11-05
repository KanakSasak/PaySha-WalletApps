import 'package:e_wallet_new/common/constants.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: DraggableScrollableSheet(
        initialChildSize: 0.95,
        maxChildSize: 0.95,
        minChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),

                  // Note: Top
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Cards",
                              style: blackFontStyle.copyWith(
                                fontSize: 24,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              "2 Physical Cards, and 1 Virtual Cards",
                              style: greyFontStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.lightBlue[900],
                            size: 30,
                          ),
                          onPressed: () {
                            print("Pressed");
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),

                  // Note: Button Card
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Row(
                      children: [
                        // Note: Physical Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300]!,
                                blurRadius: 10.0,
                                spreadRadius: 4.5,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            "Physical Card",
                            style: blackFontStyle.copyWith(
                              fontWeight: bold,
                              color: Colors.grey[900],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        // Note: Virtual Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300]!,
                                blurRadius: 10.0,
                                spreadRadius: 4.5,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            "Virtual Card",
                            style: blackFontStyle.copyWith(
                              fontWeight: bold,
                              color: Colors.grey[900],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // Note: Container For Card
                  Container(
                    height: 210,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 210,
                          width: MediaQuery.of(context).size.width -
                              (2 * defaultMargin),
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: primaryColor2,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: greenColor,
                                    child: Icon(
                                      Icons.check,
                                      color: whiteColor,
                                      size: 24,
                                    ),
                                  ),
                                  Text(
                                    "VISA",
                                    style: whiteFontStyle.copyWith(
                                      fontSize: 28,
                                      fontWeight: bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: defaultMargin,
                              ),
                              Text(
                                "**** **** **** 5642",
                                style: whiteFontStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(
                                height: defaultMargin,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Note: CARD HOLDER
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CARD HOLDER",
                                        style: whiteFontStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: bold,
                                          letterSpacing: 2.0,
                                          color: Colors.blue[100],
                                        ),
                                      ),
                                      Text(
                                        "Ziad Alfian",
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: whiteFontStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: bold,
                                          letterSpacing: 2.0,
                                          color: Colors.grey[100],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Note: EXPIRES
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "EXPIRES",
                                        style: whiteFontStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: bold,
                                          letterSpacing: 2.0,
                                          color: Colors.blue[100],
                                        ),
                                      ),
                                      Text(
                                        "8/24",
                                        style: whiteFontStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: bold,
                                          letterSpacing: 2.0,
                                          color: Colors.grey[100],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Note: EXPIRES
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CVV",
                                        style: whiteFontStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: bold,
                                          letterSpacing: 2.0,
                                          color: Colors.blue[100],
                                        ),
                                      ),
                                      Text(
                                        "845",
                                        style: whiteFontStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: bold,
                                          letterSpacing: 2.0,
                                          color: Colors.grey[100],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // Note: Container For Card Settings Text
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "Card Settings",
                      style: blackFontStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // Note: Container For Card Settings
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[100]!,
                          spreadRadius: 10.0,
                          blurRadius: 4.5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wifi_tethering,
                              color: Colors.lightBlue[900],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Contacless Payment",
                              style: greyFontStyle.copyWith(
                                color: Colors.grey[700],
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (val) {},
                          activeColor: greenColor,
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  // Note: Container For Card Settings
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[100]!,
                          spreadRadius: 10.0,
                          blurRadius: 4.5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.credit_card,
                              color: Colors.lightBlue[900],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Online Payment",
                              style: greyFontStyle.copyWith(
                                color: Colors.grey[700],
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (val) {},
                          activeColor: greenColor,
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  // Note: Container For Card Settings
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[100]!,
                          spreadRadius: 10.0,
                          blurRadius: 4.5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wifi_tethering,
                              color: Colors.lightBlue[900],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "ATM Withdrwas",
                              style: greyFontStyle.copyWith(
                                color: Colors.grey[700],
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (val) {},
                          activeColor: greenColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xffF2F4F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          );
        },
      ),
    );
  }
}
