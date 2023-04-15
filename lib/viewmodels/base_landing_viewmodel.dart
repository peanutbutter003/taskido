import 'package:flutter/material.dart';
import 'package:task_dot_do/enums/nav_bar_items.dart';
import 'package:task_dot_do/ui/calender_view.dart';
import 'package:task_dot_do/ui/components/fab_body/add_task_dialog.dart';
import 'package:task_dot_do/ui/components/fab_body/group_function_bottom_sheet.dart';
import 'package:task_dot_do/ui/groups_view.dart';
import 'package:task_dot_do/ui/home_view.dart';
import 'package:task_dot_do/ui/profile_view.dart';
import 'package:task_dot_do/viewmodels/base_viewmodel.dart';

class BaseLandingViewmodel extends BaseViewModel {
  late NavBarItem _item;
  late Widget _body;
  late Widget _fabBody;
  late int _activeTab;
  bool _isVisible = true;

  Widget get body => _body;
  int get activeTab => _activeTab;
  Widget get fabBody => _fabBody;
  bool get isVisible => _isVisible;

  set isVisible(bool isVisible) {
    _isVisible = isVisible;
    notifyListeners();
  }

  void buildBody(NavBarItem item) {
    switch (item) {
      case NavBarItem.HOME:
        _body = HomeView();
        _fabBody = AddTaksDialog();
        _activeTab = 0;
        break;
      case NavBarItem.CALENDER:
        _body = CalenderView();
        _fabBody = AddTaksDialog();
        _activeTab = 1;
        break;
      case NavBarItem.GROUPS:
        _body = GroupsView();
        _fabBody = GroupFunctionBottomSheet();
        _activeTab = 2;
        break;
      case NavBarItem.PROFILE:
        _body = ProfileView();
        _activeTab = 3;
        break;
    }
  }

  void setState(NavBarItem item) {
    _item = item;
    buildBody(_item);
    notifyListeners();
  }

  void onModelReady() {
    _item = NavBarItem.HOME;
    buildBody(_item);
  }
}
