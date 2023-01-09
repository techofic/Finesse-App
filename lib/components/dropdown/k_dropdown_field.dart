import 'package:finesse/src/features/product_details/model/product_details_model.dart';
import 'package:finesse/styles/b_style.dart';
import 'package:finesse/styles/k_size.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KDropdownField extends StatefulWidget {
  final String? title;
  final String? disabledHint;
  final List<Value> dropdownFieldOptions;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  String? errorMessage;
  final Function? callbackFunction, onTap;
  final bool? isCallback;
  final bool isDisabled;
  final bool isEdit;
  final String? initialValue;

  KDropdownField({
    Key? key,
    this.title,
    this.disabledHint,
    required this.dropdownFieldOptions,
    this.controller,
    this.validator,
    this.errorMessage = "",
    this.callbackFunction,
    this.onTap,
    this.isCallback = false,
    this.isDisabled = false,
    this.isEdit = false,
    this.initialValue,
  }) : super(key: key);

  @override
  State<KDropdownField> createState() => _KDropdownFieldState();
}

class _KDropdownFieldState extends State<KDropdownField> {
  @override
  void initState() {
    // widget.initialValue == null
    //     ? widget.controller!.text = widget.dropdownFieldOptions.firstWhere((element) => !element.isDisabled).value!
    //     : widget.controller!.text = widget.initialValue!;
    // // if (widget.selectedIdController != null) widget.selectedIdController!.text = widget.dropdownFieldOptions[0].pvariationId.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        children: <Widget>[
          if (widget.title != null)
            SizedBox(
                width: context.screenWidth,
                child: Text(
                  widget.title ?? '',
                  textAlign: TextAlign.start,
                  style: KTextStyle.subtitle2.copyWith(color: KColor.black),
                )),
          Container(
            width: context.screenWidth,
            margin: const EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(left: KSize.getWidth(context, 10), right: KSize.getWidth(context, 10), bottom: 3, top: 3),
            decoration: BoxDecoration(
              color: KColor.searchColor,
              boxShadow: [BoxShadow(color: KColor.white.withOpacity(0.1), blurRadius: 2, spreadRadius: 0, offset: const Offset(0, 1))],
              border: Border.all(
                color: widget.errorMessage == null
                    ? KColor.grey
                    : widget.errorMessage!.isEmpty
                        ? KColor.grey
                        : KColor.buttonBackground,
                width: 0.7,
                style: widget.errorMessage == null || widget.errorMessage!.isEmpty ? BorderStyle.none : BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                validator: (String? value) {
                  setState(() {
                    widget.errorMessage = widget.validator!(value);
                  });

                  return widget.errorMessage == null || widget.errorMessage!.isEmpty ? null : widget.errorMessage;
                },
                decoration: const InputDecoration(border: InputBorder.none, errorStyle: TextStyle(fontSize: 0, height: 0)),
                hint: Text('Select ${widget.title}', style: KTextStyle.bodyText3.copyWith(color: KColor.grey)),
                disabledHint: Text(widget.disabledHint ?? "Select", style: KTextStyle.bodyText3.copyWith(color: KColor.grey)),
                isExpanded: true,
                value: widget.isEdit ? widget.controller!.text : null,
                icon: Padding(
                  padding: EdgeInsets.only(right: KSize.getWidth(context, 12)),
                  child: const Icon(Icons.keyboard_arrow_down, size: 25, color: KColor.grey),
                ),
                items: widget.dropdownFieldOptions.map((dynamic dropDownStringItem) {
                  return DropdownMenuItem<String>(
                      value: dropDownStringItem.value,
                      child: Text(
                        dropDownStringItem.value,
                        textAlign: TextAlign.left,
                        style: KTextStyle.bodyText3.copyWith(
                          color: widget
                                  .dropdownFieldOptions[
                                      widget.dropdownFieldOptions.indexWhere((element) => element.value == dropDownStringItem.value)]
                                  .isDisabled
                              ? KColor.grey350
                              : KColor.blackbg.withOpacity(.4),
                        ),
                      ));
                }).toList(),
                onChanged: widget.isDisabled
                    ? null
                    : (String? value) {
                        print('onChanged... onChanged... onChanged...');
                        if (!widget.dropdownFieldOptions[widget.dropdownFieldOptions.indexWhere((element) => element.value == value)].isDisabled) {
                          {
                            setState(() {
                              widget.controller!.text = value ?? '';
                            });

                            if (widget.isCallback!) widget.callbackFunction!();
                          }
                        }
                      },
              ),
            ),
          )
        ],
      ),
    );
  }
}
