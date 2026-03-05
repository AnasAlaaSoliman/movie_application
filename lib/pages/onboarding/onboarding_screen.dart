import 'package:flutter/material.dart';

import '../../customWidget/custom_onboarding_widget.dart';
import '../../customWidget/elevated_button__custom_widget.dart';
import '../../models/onboarding_data_model.dart';
import '../login/login_screen.dart';
import 'package:movie_app/customWidget/custom_onboarding_widget.dart';
import '../../customWidget/elevated_button__custom_widget.dart';
import '../../models/onboarding_data_model.dart';
import '../../screens/auth_screens/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        currentIndex = _controller.page?.toInt() ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: OnboardingDataModel.onboardingList.length,
          itemBuilder: (context, index) {
            OnboardingDataModel onboardingDataModel = OnboardingDataModel(
              image: OnboardingDataModel.onboardingList[index].image,
              title: OnboardingDataModel.onboardingList[index].title,
              description:
                  OnboardingDataModel.onboardingList[index].description,
            );
            return CustomOnboardingWidget(
              onboardingDataModel: onboardingDataModel,
              linearGradient: setGradient(index),
              nextElevatedButton: ElevatedButtonCustomWidget(
                onPressed: goNext,
                text: (index == 0)
                    ? 'Explore Now'
                    : (index == OnboardingDataModel.onboardingList.length - 1)
                    ? 'Finish'
                    : 'Next',
              ),

              backElevatedButton: (index == 0)
                  ? null
                  : ElevatedButtonCustomWidget(
                      text: 'Back',
                      onPressed: goBack,
                      backGroundColor: Colors.black,
                      foreGroundColor: Color(0xFFF6BD00),
                      borderColor: Color(0xFFF6BD00),
                    ),
              containerColor: (index == 0) ?  Colors.transparent:Color(0xFF121312) ,
              fontSizeTitle: (index == 0) ? 35 : 24,
              titleFontWeight: (index == 0) ? FontWeight.w500 : FontWeight.w700,
              textColor: (index != 0) ? Colors.white : Colors.white60,
            );
          },
        ),
      ),
    );
  }
  void goNext() {
    if (currentIndex < OnboardingDataModel.onboardingList.length - 1) {
      _controller.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }
  void goBack()  {
    _controller.animateToPage(
      currentIndex - 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  LinearGradient setGradient(int index) {
    switch (index) {
      case 0:
        return LinearGradient(
          colors: [
            Color(0xFF1E1E1E),
            Color(0xFF121312).withAlpha(50),
            Color(0xFF121312).withAlpha(90),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.3, 0.7, 1],
        );
      case 1:
        return LinearGradient(
          colors: [
            Color(0xFF084250).withAlpha(0),
            Color(0xFF084250)

          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.7],
        );
      case 2:
        return LinearGradient(
          colors: [

            Color(0xFF85210E).withAlpha(0),
            Color(0xFF85210E),
          ],
          begin:Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.7],
        );
      case 3:
        return LinearGradient(
          colors: [

            Color(0xFF4C2471).withAlpha(0),
            Color(0xFF4C2471),
          ],
          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter,
          stops: [0, 0.7,],
        );
      case 4:
        return LinearGradient(
          colors: [

            Color(0xFF601321).withAlpha(0),
            Color(0xFF601321)
          ],
          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter,
          stops: [0, 0.7,]
        );
      case 5:
        return LinearGradient(
          colors: [

            Color(0xFF2A2C30).withAlpha(0),
            Color(0xFF2A2C30),
          ],
          begin:Alignment.topCenter,
          end:  Alignment.bottomCenter,
          stops: [0, 0.7,],
        );
      default:
        return LinearGradient(
          colors: [
            Color(0xFF1E1E1E),
            Color(0xFF121312).withAlpha(50),
            Color(0xFF121312).withAlpha(90),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.3, 0.7, 1],
        );
    }
  }


}
