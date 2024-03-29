/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:third_year_project/contest/AppColors.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:third_year_project/ui/constants.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var profileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: NetworkImage(
                      "https://imageio.forbes.com/specials-images/imageserve/627bd4c60412e4343323ad21/0x0.jpg?format=jpg&crop=1478,1478,x467,y0,safe&height=416&width=416&fit=bounds"),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      //color: Theme.of(context).accentColor,
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: kDarkPrimaryColor,
                      size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text('Lionel Messi', style: kTitleTextStyle),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text('messilm10@gmail.com', style: kCaptionTextStyle),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              //color: Theme.of(context).accentColor,
              color: Colors.deepOrangeAccent
            ),
            child: Center(
              child: Text(
                'Upgrade Profile',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //     body: Column(children: <Widget>[
    //   SizedBox(height: kSpacingUnit.w * 5),
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        Icon(LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3)),
        profileInfo,
        Icon(LineAwesomeIcons.sun,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3)),
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5),
          header,
          //AccountListItem(),
          Expanded(
            child: ListView(
              children: const <Widget>[
                ProfileListItem(
                  //AccountListItem(),
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Privacy',
                  hasNavigation: true,
                ),
                ProfileListItem(
                  //AccountListItem(),
                  icon: LineAwesomeIcons.lock,
                  text: 'Change Password',
                  hasNavigation: true,
                ),
                ProfileListItem(
                  //AccountListItem(),
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                  hasNavigation: true,
                ),
                ProfileListItem(
                  //AccountListItem(),
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Invite Friend',
                  hasNavigation: true,
                ),
                ProfileListItem(
                  //AccountListItem(),
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Logout',
                  hasNavigation: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    this.text,
    required this.hasNavigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4)
          .copyWith(bottom: kSpacingUnit.w * 2),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        //color: Theme.of(context).backgroundColor,
        color: AppColors.deep_orange,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(width: kSpacingUnit.w * 2.5),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              //this.icon,
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 1.5,
            ),
        ],
      ),
    );
  }
}
*/
