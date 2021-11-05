import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/common/state_enum.dart';
import 'package:e_wallet_new/persentation/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    image: DecorationImage(
                      image: AssetImage('assets/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: blackFontStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Consumer<UserNotifier>(
                        builder: (context, user, child) {
                          if (user.userRequestState == RequestState.Loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (user.userRequestState ==
                              RequestState.Loaded) {
                            return Text(
                              "@${user.user.name}",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: blackFontStyle.copyWith(
                                fontSize: 16,
                              ),
                            );
                          } else {
                            return Text(user.message);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.exit_to_app,
                    color: blackColor,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem({String text = "", Function? onTap}) {
      return InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: blackFontStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: blackColor,
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: secondaryColor,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "General",
                  style: blackFontStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                menuItem(
                  text: "Help",
                  onTap: () {},
                ),
                menuItem(
                  text: "Privacy & Policy",
                  onTap: () {},
                ),
                menuItem(
                  text: "Term of Service",
                  onTap: () {},
                ),
                menuItem(
                  text: "Rate App",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
