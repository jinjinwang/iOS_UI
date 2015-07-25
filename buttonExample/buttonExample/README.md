按钮：点击后能做出响应的控件

实例：
1. 按钮的状态（普通状态normal，高亮状态highlighted，禁用状态disabled）
2. 图片的移动
3. 图片的放大缩小

按钮的type设置为custom，则点击后不会变灰色
控件可以单独连线，也可以多个控件同时连线一个方法，此时可通过控件的tag值进行区分

frame：既可改变位置，也可改变大小
center：只能改变位置
bounds：只能改变大小
transform：可以修改位置，大小，旋转

animate动画：头尾式，block方式
头尾式：
1. 开启动画[UIView beginAnimations:nil context:nil];
2. 设置动画执行的时间[UIView setAnimationDuration:0.5];
3. 执行动画的动作
4. 提交动画[UIView commitAnimations];

block方式：
[UIView animateWithDuration:0.5 animations:^{
// 执行动画的代码...
}];

