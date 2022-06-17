import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:caffe/theme/fonts.dart';
import 'package:caffe/theme/icons.dart';

class SecureInput extends StatefulWidget {
  final String hint;
  Function? validation;
  final Function setError;
  final TextEditingController controller;
  SecureInput(
      {Key? key,
      required this.hint,
      required this.setError,
      required this.controller,
      this.validation})
      : super(key: key);

  @override
  SecureInputState createState() => SecureInputState();
}

class SecureInputState extends State<SecureInput> {
  bool _passwordVisible = false;
  bool _isError = false;
  String _errorText = '';
  Color _borderColor = Colors.grey.withOpacity(0.33);

  void obscureText() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void onFocusChange() {
    if (!_isError) {
      setState(() {
        _borderColor = Colors.black;
      });
    }
  }

  void setError(bool isError, String text) {
    setState(() {
      _errorText = text;
      _isError = isError;
    });
    widget.setError(isError);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Focus(
          onFocusChange: (hasFocus) => {
            onFocusChange(),
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  color: _isError
                      ? const Color.fromARGB(255, 206, 36, 24)
                      : _borderColor,
                ),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: widget.controller,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorStyle: const TextStyle(fontSize: 14, height: 0.5),
                        prefix:
                            const Padding(padding: EdgeInsets.only(left: 10.0)),
                        suffix: const Padding(
                            padding: EdgeInsets.only(right: 24.0)),
                        contentPadding:
                            const EdgeInsets.only(bottom: 0.0, top: 0),
                      ),
                      validator: (value) {
                        var validationResult = widget.validation!(value);
                        if (validationResult == null) {
                          setError(false, '');
                          return null;
                        }
                        setError(true, validationResult);
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: obscureText,
                    child: _passwordVisible
                        ? SvgPicture.asset(CustomIcons.eyeClosed)
                        : SvgPicture.asset(CustomIcons.eyeOpen),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isError == true)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _errorText,
                style: const TextStyle(
                    color: Color.fromARGB(255, 206, 36, 24),
                    fontSize: FontSize.small,
                    height: 0.5),
              ),
            ),
          )
      ],
    );
  }
}
