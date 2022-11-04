import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double? _deviceHeight, _deviceWidth;
  List difficulties = ['Easy', 'Medium', 'Hard'];
  double _currentDifficulty = 0;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return MenuPageUI();
  }

  Widget MenuPageUI() {
    return Builder(builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            width: _deviceWidth,
            padding: EdgeInsets.symmetric(horizontal: _deviceHeight! * 0.05),
            child: _menuWidgets(),
          ),
        ),
      );
    });
  }

  TextStyle textsStyle(double _fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: _fontSize,
    );
  }

  Widget titleTexts() {
    return Column(
      children: [
        Text(
          "Frivia",
          style: textsStyle(55),
        ),
        SizedBox(
          height: _deviceHeight! * 0.05,
        ),
        Text(
          "${difficulties[_currentDifficulty.toInt()]}",
          style: textsStyle(30),
        ),
      ],
    );
  }

  Widget _playButton() {
    return MaterialButton(
      color: Colors.blue,
      minWidth: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.1,
      onPressed: () {
        Navigator.pushNamed(context, '/game',
            arguments: difficulties[_currentDifficulty.toInt()]);
      },
      child: const Text(
        "Start",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _difficultySlider() {
    return Slider(
      label: "${difficulties[_currentDifficulty.toInt()]}",
      value: _currentDifficulty,
      min: 0,
      max: difficulties.length - 1,
      divisions: difficulties.length - 1,
      onChanged: (_value) {
        setState(() {
          _currentDifficulty = _value;
        });
      },
    );
  }

  Widget _menuWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        titleTexts(),
        _difficultySlider(),
        _playButton(),
      ],
    );
  }
}
