import 'package:flutter_svg/svg.dart';
import 'package:stride_sync/constant/assets.dart';

class PlanModel {
  final String title;
  final String price;
  final String buttonText;
  final bool isRecommended;
  final List<String> features;
  final String icon;

  PlanModel({
    required this.title,
    required this.price,
    required this.buttonText,
    required this.isRecommended,
    required this.features,
    required this.icon,
  });
}

List<PlanModel> mothlyPlans = [
  PlanModel(
    title: 'Free',
    price: '0.00',
    buttonText: 'Start 7-day free trial',
    isRecommended: false,
    features: ["Max 5 Horses", "Max 5 Career Events / Month"],
    icon: SvgAssets.star,
  ),
   PlanModel(
    title: 'Personal Pro',
    price: '6.99',
    buttonText: 'Choose Plan',
    isRecommended: true,
    features: ["Unlimited Horses", "Track Earnings","Calendar Events","Events Reminder"],
    icon: SvgAssets.flower,
  ),
   PlanModel(
    title: 'Trainer Pro',
    price: '11.49',
    buttonText: 'Choose Plan',
    isRecommended: false,
     features: ["Unlimited Horses", "Track Earnings","Calendar Events","Events Reminder","Client/Owner Management","Invoicing Capabilities"],
    icon: SvgAssets.star,
  ),
];

List<PlanModel> yearlyPlans = [
  PlanModel(
    title: 'Free',
    price: '0.00',
    buttonText: 'Start 7-day free trial',
    isRecommended: false,
    features: ["Max 5 Horses", "Max 5 Career Events / Month"],
    icon: SvgAssets.star,
  ),
   PlanModel(
    title: 'Personal Pro',
    price: '71.99',
    buttonText: 'Choose Plan',
    isRecommended: true,
    features: ["Unlimited Horses", "Track Earnings","Calendar Events","Events Reminder"],
    icon: SvgAssets.flower,
  ),
   PlanModel(
    title: 'Trainer Pro',
    price: '114.49',
    buttonText: 'Choose Plan',
    isRecommended: false,
     features: ["Unlimited Horses", "Track Earnings","Calendar Events","Events Reminder","Client/Owner Management","Invoicing Capabilities"],
    icon: SvgAssets.star,
  ),
];
