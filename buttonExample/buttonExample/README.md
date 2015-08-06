按钮：点击后能做出响应的控件

实例1：ViewController.m
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

动态创建按钮
1. 创建按钮对象UIButton
2. 设置按钮在不同状态下的文字
3. 设置按钮在不同状态下的字体颜色
4. 设置按钮在不同状态下的背景图片
5. 设置按钮的frame（位置和大小）
6. 设置按钮的单击事件
7. 将按钮添加到view中

实例2: DynamicButtonViewController.m
动态创建按钮

transform改变位置，大小，旋转
在原始位置上进行操作
self.mybtn.transform = CGAffineTransformMakeTranslation(50, 0);
self.mybtn.transform = CGAffineTransformMakeScale(1.5, 1.5);
self.mybtn.transform = CGAffineTransformMakeRotation(M_PI_4);

在指定的transform上进行操作
self.mybtn.transform = CGAffineTransformTranslate(self.mybtn.transform, 50, 0);
self.mybtn.transform = CGAffineTransformScale(self.mybtn.transform, 1.5, 1.5);
self.mybtn.transform = CGAffineTransformRotate(self.mybtn.transform, M_PI_4);

UIView的常见属性
// 获取自己的父控件
@property(nonatomic, readonly) UIView *superview;
// 获取自己的所有子控件对象
@property(nonatomic, readonly) NSArray *subviews;
// 控件的id标识，父控件可以通过tag来找到对应的子控件
@property(nonatomic) NSInteger tag;
// 控件的形变属性（可以设置旋转的角度，比例缩放，平移等属性）
@property(nonatomic) CGAffineTransform transform;

UIView的常见方法
// 添加一个子控件
-(void) addSubview:(UIView *)view;
// 从父控件中移除
-(void) removeFromSuperview;
// 根据一个tag标识找出对应的控件
-(UIView *) viewWithTag:(NSInteger)tag;

实例3: PhotographViewController.m
图片浏览器
读取plist文件数据
