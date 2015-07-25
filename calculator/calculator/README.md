 掌握知识点：
1. 往storyboard中添加控件
2. UIViewController和UIView之间的关系
3. 程序的运行过程
    程序启动->
    Main interface找到启动显示的storyboard->
    在storyboard中找到“is initial view controller”->
    根据custom class中的view controller进行初始化->
    创建该类的对象，创建self.view，创建该控件的所有子控件->
    显示view
4. IBAction和IBOutlet的作用
    用于拖线，将控件和属性或方法关联起来
5. 如何监听控件的事件（比如按钮的点击事件）
6. 父控件和子控件的概念
7. 退出键盘的两种方式
    7.1 辞去控件的第一响应者，调用每个控件的resignFirstResponder方法
    7.2 当前view停止编辑[self.view endEditing:YES];
8. 拖线方式
    8.1 点击控件，右键连线
    8.2 按住ctrl拖线（从控件到代码，从代码到控件）
    8.3 属性和方法写好后，打开view controller scene，选择view controller右键将对应的属性或方法拖到对应的控件上

练习1: qq登录页面，QQLoginUIViewController
1. 文本框带有输入提示，placeholder
2. qq只能输入数字，keyboard type：number pad
3. 密码暗文显示，Secure text entry
4. 点击登录后，输出QQ和密码， 并退出键盘
5. 文本框右边显示“清除”按钮，clear button属性