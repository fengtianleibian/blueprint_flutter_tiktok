import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

/// 表单字段组件
/// 用于在表单中创建一个可复用的输入字段组件
class InputFormFieldWidget extends FormField<String> {
  InputFormFieldWidget({
    super.key,
    required this.labelText, // 必须提供字段的标签文字
    this.tipText, // 可选的提示文字
    this.initValue, // 可选的初始值
    this.onChanged, // 值改变时的回调函数
    this.controller, // 输入框的控制器，用于操作输入值
    this.placeholder, // 输入框的占位符
    this.prefix, // 输入框前缀组件
    this.suffix, // 输入框后缀组件
    this.obscureText, // 是否隐藏输入文本
    this.cleanable, // 是否可以清空输入框
    this.keyboardType, // 输入框的键盘类型（如数字、文本等）
    this.autofocus, // 是否自动获得焦点
    Function(String?)? validator,
  }) : super(
          initialValue: initValue ?? controller?.text, // 使用初始值或控制器的文本
          validator: (val) {
            // 校验函数
            if (validator != null) {
              return validator(val); // 使用外部传入的校验函数
            }
            return null; // 如果没有校验函数，默认通过
          },
          builder: (field) {
            // 构建表单字段的 UI
            void onChangedHandler(String value) {
              field.didChange(value); // 更新表单字段的状态
              onChanged?.call(value); // 调用外部的回调函数
            }

            return <Widget>[
              // 字段说明
              TextWidget.label(
                labelText, // 字段标签文字
              ).paddingLeft(AppSpace.card), // 添加左边距

              // 输入框
              InputWidget(
                placeholder: placeholder, // 占位符
                prefix: prefix, // 前缀组件
                suffix: suffix, // 后缀组件
                controller: controller, // 控制器
                obscureText: obscureText ?? false, // 是否隐藏文本
                cleanable: cleanable ?? true, // 是否可清空
                onChanged: onChangedHandler, // 值改变时的回调
              ),

              // 提示词
              if (tipText != null)
                TextWidget.muted(
                  tipText, // 提示文字
                ).paddingLeft(AppSpace.card), // 添加左边距

              // 错误提示
              if (field.errorText != null)
                TextWidget.muted(
                  field.errorText!, // 错误信息
                  color: field.context.colors.scheme.error, // 使用错误颜色
                ).paddingLeft(AppSpace.card), // 添加左边距
            ].toColumnSpace(
              // 垂直排列子组件
              crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
            );
          },
        );

  /// 字段文字
  final String labelText;

  /// 提示词
  final String? tipText;

  /// 初始值
  final String? initValue;

  /// 输入框控制器
  final TextEditingController? controller;

  /// 占位符
  final String? placeholder;

  /// 前缀
  final Widget? prefix;

  /// 后缀
  final Widget? suffix;

  /// 是否隐藏文本
  final bool? obscureText;

  /// 是否可清空
  final bool? cleanable;

  /// 值被改变时的回调
  final void Function(String?)? onChanged;

  /// 输入法类型
  final TextInputType? keyboardType;

  /// 自动焦点
  final bool? autofocus;

  @override
  InputFormWidgetFieldState createState() => InputFormWidgetFieldState();
}

/// 表单字段的状态类
class InputFormWidgetFieldState extends FormFieldState<String> {
  @override
  InputFormFieldWidget get widget => super.widget as InputFormFieldWidget;
}
