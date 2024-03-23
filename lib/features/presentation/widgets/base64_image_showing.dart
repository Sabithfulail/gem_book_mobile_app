import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Base64ImageShowingView extends StatefulWidget {
  final String base64Image;
  final VoidCallback onTapAction;

  const Base64ImageShowingView({
    super.key,
    required this.base64Image,
    required this.onTapAction,
  });

  @override
  State<Base64ImageShowingView> createState() => _Base64ImageShowingViewState();
}

class _Base64ImageShowingViewState extends State<Base64ImageShowingView> {
  late Uint8List _imageBytes;

  @override
  void initState() {
    super.initState();
    _decodeImage();
  }

  Future<void> _decodeImage() async {
    final decodedBytes = base64Decode(widget.base64Image);
    setState(() {
      _imageBytes = decodedBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapAction,
      child: Container(
        height: 30.h,
        width: 70.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _imageBytes != null
                ? Image.memory(
              _imageBytes,
              fit: BoxFit.fitHeight,
            )
                : Container(),
          ),
        ),
      ),
    );
  }
}
