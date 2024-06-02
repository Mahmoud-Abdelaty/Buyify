import 'package:Buyify/features/user_profile/data/models/option_model.dart';
import 'package:Buyify/features/user_profile/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconic/iconic.dart';

List<OptionModel> getMainOptionList(data, context) {
  return [
    OptionModel(
      title: 'Account',
      icon: Iconic.user,
      actionIcon: Iconic.angle_small_right,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountView(
              name: data.name,
              email: data.email,
              phone: data.phone,
            ),
          ),
        );
      },
    ),
    OptionModel(
      title: 'Address',
      icon: Iconic.location_alt,
      actionIcon: Iconic.angle_small_right,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddressView(),
          ),
        );
      },
    ),
  ];
}

List<OptionModel> getOptionList(data, context) {
  return [
    OptionModel(
      title: 'My Order',
      icon: Iconic.shopping_bag,
      actionIcon: Iconic.angle_small_right,
      onTap: () {
        // Add navigation logic for My Order
      },
    ),
    OptionModel(
      title: 'Payment Method',
      icon: Iconic.credit_card,
      actionIcon: Iconic.angle_small_right,
      iconSize: 18.sp,
      onTap: () {
        // Add navigation logic for Payment Method
      },
    ),
    OptionModel(
      title: 'Notification',
      icon: Iconic.bell,
      actionIcon: Iconic.angle_small_right,
      onTap: () {
        // Add navigation logic for Notification
      },
    ),
    OptionModel(
      title: 'Dark Mode',
      icon: Iconic.moon,
      actionIcon: Iconic.angle_small_right,
      switchButton: true,
      onTap: () {
        // Add logic for toggling Dark Mode
      },
    ),
    OptionModel(
      title: 'Log out',
      icon: Iconic.sign_out,
      actionIcon: Iconic.angle_small_right,
      onTap: () {
        // Add logout logic
      },
    ),
  ];
}
