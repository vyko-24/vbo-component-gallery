import 'package:flutter/material.dart';

enum InputVariant { standard, outlined, filled }

class CustomInput extends StatefulWidget {
  final String hintText; 
  final InputVariant variant; 
  final IconData? prefixIcon; 
  final bool obscureText; 
  final TextEditingController? controller; 

  const CustomInput({
    Key? key,
    required this.hintText,
    required this.variant,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  InputDecoration _buildDecoration() {
    final baseColor = Colors.grey.shade400;
    final focusedColor = Colors.blue.shade600;

    switch (widget.variant) {
      case InputVariant.standard:
        return InputDecoration(
          labelText: widget.hintText,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          border: const UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: focusedColor, width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: baseColor, width: 1),
          ),
        );

      case InputVariant.outlined:
        return InputDecoration(
          labelText: widget.hintText,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: baseColor, width: 1.2),
            borderRadius: BorderRadius.circular(8),
          ),
        );

      case InputVariant.filled:
        return InputDecoration(
          labelText: widget.hintText,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          filled: true,
          fillColor:
              _isFocused ? Colors.blue.shade50 : Colors.grey.shade200, // Fondo
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, 
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      focusNode: _focusNode,
      decoration: _buildDecoration(),
      cursorColor: Colors.blue.shade600,
    );
  }
}
