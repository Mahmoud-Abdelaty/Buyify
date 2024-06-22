import 'package:Buyify/core/common/error_state.dart';
import 'package:Buyify/core/common/loading_state.dart';
import 'package:Buyify/core/utils/app_colors.dart';
import 'package:Buyify/core/utils/app_text.dart';
import 'package:Buyify/features/home/view/widget/widgets.dart';
import 'package:Buyify/features/product_details/bloc/product_details_bloc.dart';
import 'package:Buyify/features/product_details/data/repo/product_details_repo_impl.dart';
import 'package:Buyify/features/wishlist_view/bloc/wishlist_bloc.dart';
import 'package:Buyify/features/wishlist_view/data/models/WishhlistProductModel.dart';
import 'package:Buyify/features/wishlist_view/data/repo/wishlist_repo_impl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconic/iconic.dart';

part '../wishlist_view.dart';
part 'wishlist_item.dart';
