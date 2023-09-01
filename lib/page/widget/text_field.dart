import 'package:flutter/material.dart';
import 'package:flutter_demo/common/theme/icon_font.dart';
import 'package:flutter_demo/common/theme/theme.dart';
import 'package:get/get.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final _controller = TextEditingController();
  final _nodeOne = FocusNode();
  final _nodeTwo = FocusNode();
  final _count = 0.obs;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      debugPrint('_controller.listener: ${_controller.text}');
      _count.value = _controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                autofocus: true,
                maxLines: 1,
                maxLength: 30,
                style: AppTheme.callout.apply(color: Get.theme.textColorPrimary),
                focusNode: _nodeOne,
                controller: _controller,
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                  // _newName.value = value;
                  // _enable.value = (value.isNotEmpty && value != widget.name);
                },
                decoration: InputDecoration(
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 20)),
                    hintText: 'Enter display name',
                    hintStyle: AppTheme.callout.apply(color: Get.theme.disabledColor),
                    counterText: '',
                    suffixIcon: GestureDetector(
                        onTap: () {
                          // _newName.value = '';
                          // _enable.value = false;
                          // _textEditingController.clear();
                          _controller.clear();
                        },
                        child: Icon(MyIcons.close_clear, size: 16, color: Get.theme.textColorSecondary)))),
            Obx(() {
              return Text('$_count/30');
            }),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder()
              ),
              focusNode: _nodeTwo,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(_nodeOne);
                      },
                      child: const Text('last')),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(_nodeTwo);
                      },
                      child: const Text('next')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
