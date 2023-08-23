import 'package:animation_demo/components/landed_content.dart';
import 'package:animation_demo/components/signup_content.dart';
import 'package:flutter/material.dart';

class OnboardContent extends StatefulWidget {
  const OnboardContent({Key? key}) : super(key: key);

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _onboardPageController;


  @override
  void initState() {
    _onboardPageController = PageController()..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final double progress = _onboardPageController.hasClients ?_onboardPageController.page ?? 0 : 0;
    return SizedBox(
      height: 400 + progress * 140,
      child: Stack(
        fit: StackFit.expand,
        children:[
          Column(
          children: [
            const SizedBox(height: 16,),
            Expanded(child: PageView(
              controller: _onboardPageController,
              children: const [
                LandingContent(),
                SignUpForm()
              ],
            ))
          ],
        ),
          Positioned(
            height: 56,
              bottom: 32 + progress * 140,
              right: 16,
              child: GestureDetector(
                onTap: (){
                  if(_onboardPageController.page == 0){
                    _onboardPageController.animateToPage(1,
                        duration: Duration(milliseconds: 400), curve: Curves.ease);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.4,0.8],
                      colors: [
                        Color.fromARGB(255, 239, 104, 80),
                        Color.fromARGB(255, 139, 33, 146)
                      ]
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 92 + progress * 32,
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 1 - progress,
                              child: Text('Get Started',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white
                              ),),
                            ),
                            Opacity(
                              opacity: progress,
                              child: Text('Create Account',
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                              )),
                            )
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right,color: Colors.white,size: 24,)
                    ],
                  ),
                ),
              )
          )
      ]
      ),
    );
  }
}