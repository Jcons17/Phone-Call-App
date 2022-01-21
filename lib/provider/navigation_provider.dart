import 'package:flutter/widgets.dart';

class NavigationProvider extends ChangeNotifier{

  final PageController _pageController = PageController(initialPage: 1);

  PageController get pageController => _pageController; 

  onNextPage(){
    _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    notifyListeners();
  }

  onIndexNavigation(int index){
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease); 
    notifyListeners();
  }



}