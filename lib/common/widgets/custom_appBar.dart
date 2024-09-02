import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget ? title;
  final Widget ? action;
  final bool? hideBack;
  final Color? backgroundColor;
  const CustomAppbar({super.key,this.action,this.title,this.backgroundColor,this.hideBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title??const Text(''),
      actions: [action??Container()],
      centerTitle: true,
      backgroundColor: backgroundColor??Colors.transparent,
      elevation: 0,
      leading: hideBack==true?null:IconButton(onPressed: (){Navigator.pop(context);}, icon: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          shape: BoxShape.circle
        ),
        child: const Icon(Icons.arrow_back_ios_new,size: 15,color:Colors.black,),
      )),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}