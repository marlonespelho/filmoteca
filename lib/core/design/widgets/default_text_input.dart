import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultInputTextForm extends StatefulWidget {
  final String label;
  final String hint;
  final bool password;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function? suffixFunction;
  final bool readyOnly;
  final int maxLength;
  final Function? onSubmitted;
  final Function? onTap;
  final Function? onChanged;
  final bool showProgressIndicator;
  final Color? backgroundColor;
  final int maxLines;
  final EdgeInsets? margin;
  final List<TextInputFormatter>? inputFormatters;

  const DefaultInputTextForm(
      {super.key,
      this.label = '',
      this.hint = '',
      this.controller,
      this.password = false,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixFunction,
      this.readyOnly = false,
      this.maxLength = 0,
      this.onSubmitted,
      this.onTap,
      this.backgroundColor,
      this.showProgressIndicator = false,
      this.maxLines = 1,
      this.margin,
      this.inputFormatters,
      this.onChanged});

  @override
  State<DefaultInputTextForm> createState() => _DefaultInputTextFormState();
}

class _DefaultInputTextFormState extends State<DefaultInputTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        onTap: widget.onTap != null ? () => widget.onTap : null,
        readOnly: widget.readyOnly,
        controller: widget.controller,
        obscureText: widget.password,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength > 0 ? widget.maxLength : 255,
        focusNode: widget.focusNode,
        onFieldSubmitted: (text) => _onSubmittedField(),
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
        },
        decoration: InputDecoration(
            fillColor: widget.backgroundColor,
            counterText: '',
            suffixIcon: _suffixIcon(),
            prefix: _prefixIcon(),
            labelText: widget.label,
            hintText: widget.hint),
        inputFormatters: widget.inputFormatters,
      ),
    );
  }

  _prefixIcon() {
    if (widget.prefixIcon == null) {
      return null;
    }

    return Icon(
      widget.prefixIcon,
      color: Theme.of(context).inputDecorationTheme.prefixIconColor,
      size: MediaQuery.of(context).size.height * 0.025,
    );
  }

  _suffixIcon() {
    if (widget.suffixIcon == null) {
      return null;
    }

    if (widget.showProgressIndicator) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 1.0),
      );
    }

    return InkWell(
      onTap: () {
        if (widget.suffixFunction != null) {
          widget.suffixFunction!.call();
        }
      },
      borderRadius: BorderRadius.circular(4),
      child: Icon(
        widget.suffixIcon,
        color: Theme.of(context).inputDecorationTheme.suffixIconColor,
      ),
    );
  }

  _onSubmittedField() {
    if (widget.nextFocus != null) {
      FocusScope.of(context).requestFocus(widget.nextFocus);
    }
    if (widget.onSubmitted != null) {
      widget.onSubmitted!.call();
    }
  }
}
