1. flutter pub add get //getX 插件
2. flutter pub add package_info_plus //获取包信息
3. flutter pub add shared_preferences //本地存储

语言代码
https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes
国家代码
https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes

//解决 Translations 插件不兼容问题
flutter config --jdk-dir /Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home

4. flutter pub add dio //数据拉取

5. 改程序名、包名
    - flutter pub global activate rename
    - flutter pub global run rename setBundleId --value com.blueprint
    - flutter pub global run rename setAppName --value 蓝图
    - https://www.canva.com/logos/templates/  //图标设计
    - https://icon.kitchen/  //图标工具
    - flutter pub add icons_launcher -d 图标加工插件 -d 开发环境依赖
    // 打包图片
    - flutter pub get
    - dart run icons_launcher:create

6. 主题配置 （明亮、黑暗）
    - https://material-foundation.github.io/material-theme-builder/  //下载颜色配置
    - adaptive_theme 主题功能切换插件
        - flutter pub add adaptive_theme 

7. 字体封装
    - https://fonts.google.com/ google 字体

8. 核心插件 ducafe_ui_core
    - flutter pub add ducafe_ui_core
    - 功能:
        - 屏幕适配工具 （ScreenUtil）
        - Widget 扩展方法
        - 上下文 （Context） 扩展方法
        - 字符串扩展方法
        - 列表扩展方法
        - 主题访问扩展方法
        - 平台判断扩展方法
        - UI 工具类   

9. 图片组件插件 flutter: pub add cached_network_image flutter_svg    

10. 图标组件插件 flutter_svg: flutter pub add flutter_svg

11. 按钮组件插件 ducafe_ui_core: flutter pub add ducafe_ui_core

12. native 启动图 : 
    - flutter pub add flutter_native_splash -d
    - dart run flutter_native_splash:create // 修改后执行操作
