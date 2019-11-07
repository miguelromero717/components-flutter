import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;
  bool _sliderBlockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _createSlider(),
              _createCheckBox(),
              _createSwitch(),
              Expanded(child: _createImage()),
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
      value: _sliderValue,
      min: 10,
      max: 500,
      onChanged: (_sliderBlockCheck) ? null : (value) {
        setState(() {
          _sliderValue = value;
        });
      },
      activeColor: Colors.indigoAccent,
      label: 'Image Size',
      divisions: 20,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://i0.wp.com/metro.co.uk/wp-content/uploads/2019/07/GettyImages-815435542.jpg?quality=90&strip=all&zoom=1&resize=644%2C432&ssl=1'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _sliderBlockCheck,
      onChanged: (value) {
        setState(() {
          _sliderBlockCheck = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _sliderBlockCheck,
      onChanged: (value) {
        setState(() {
          _sliderBlockCheck = value;
        });
      },
    );
  }
}
