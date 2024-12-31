import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:buleprint_frame/common/index.dart';
import 'package:buleprint_frame/common/services/config.dart';
import 'package:buleprint_frame/global.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  //加载本地配置
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 按比例适配屏幕
      designSize: const Size(375, 812), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字

      // 构建
      builder: (context, child) => AdaptiveTheme(
        // 主题样式
        light: AppTheme.light, // 亮色主题
        dark: AppTheme.dark, // 暗色主题
        initial: ConfigService.to.themeMode, // 初始主题
        debugShowFloatingThemeButton: true, // 显示主题按钮 调试用

        // 构建
        builder: (theme, darkTheme) => GetMaterialApp(
          title: 'Flutter Demo',
          // 主题
          theme: theme,
          darkTheme: darkTheme,

          // 初始路由
          initialRoute: RouteNames.systemSplash,
          // 路由列表
          getPages: RoutePages.list,
          //监听导航行为
          navigatorObservers: [RoutePages.observer],

          // 多语言
          translations: Translation(), // 词典
          localizationsDelegates: Translation.localizationsDelegates, // 代理
          supportedLocales: Translation.supportedLocales, // 支持的语言种类
          locale: ConfigService.to.locale, // 当前语言种类
          fallbackLocale: Translation.fallbackLocale, // 默认语言种类
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
