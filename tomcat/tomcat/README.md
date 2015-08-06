实例：汤姆猫

UIImageView帧动画相关属性和方法
// 需要播放的序列帧图片数组，里面都是UIImage对象，会按顺序显示里面的图片
@property(nonatomic, copy) NSArray *animationImages;

// 帧动画的持续时间
@property(nonatomic) NSTimeInterval animationDuration;

// 帧动画的执行次数，默认是无限循环
@property(nonatomic) NSInteger animationRepeatCount;

// 开始执行帧动画
-(void) startAnimating;

// 停止执行帧动画
-(void) stopAnimating;

// 是否正在执行帧动画
-(BOOL) isAnimating;

问题记录：
1. 内存的处理
    加载图片不使用缓存方式加载
    [UIImage imageWithContentsOfFile:path]
    动画执行完之后延迟清除缓存
    [self.imageViewCat performSelector]