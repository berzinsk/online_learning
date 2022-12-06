import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_learning/routing/app_router.dart';

import '../../../../resources/constants/colors.dart';
import 'course_data.dart';
import '../../../../common_widgets/button_primary.dart';
import '../../domain/course.dart';

class CourseDetails extends StatelessWidget {
  final Course? course;

  const CourseDetails({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onTap: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 375,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: Image.network(course?.imageUrl ?? '').image,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(image: AssetImage('asset/images/tag.png')),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 250),
            child: CourseData(course: course),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kShadow.withOpacity(0.2),
                    spreadRadius: 0.2,
                    blurRadius: 12,
                    offset: const Offset(0, -8),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Container(
                      width: 89,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.kLighOrange,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage('asset/images/icon_favorite.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    ButtonPrimary(
                      title: 'Buy Now',
                      onPressed: () {
                        context.goNamed(AppRoute.payment.name, params: {
                          'tab': '1',
                          'id': '${course?.id}',
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
