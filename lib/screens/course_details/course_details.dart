import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/course_provider.dart';
import '../../resources/constants/colors.dart';
import '../../model/online_learning_pages.dart';
import '../../components/course_details/course_data.dart';
import '../../components/shared/button_primary.dart';

class CourseDetails extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: OnlineLearningPages.courseDetails,
      key: ValueKey(OnlineLearningPages.courseDetails),
      child: const CourseDetails(),
    );
  }

  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final course =
        Provider.of<CourseProvider>(context, listen: false).getSelectedCourse;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onTap: () => Navigator.pop(context),
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
                children: [
                  const Image(image: AssetImage('asset/images/tag.png')),
                  Text(
                    course?.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.kDarkBlue),
                  ),
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
                      onPressed: () {},
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
