import 'package:aurelia_app/ui/core/app_theme.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget{
  final String title;
  final String? subtitle;
  final VoidCallback? onProfileTap;

  const MainHeader({
    super.key,
    required this.title,
    this.subtitle = "Como você está hoje?",
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.lightTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppTheme.lightTextColor,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}