//
//  ViewController.m
//  CoreAnimation_02
//
//  Created by SuperWang on 16/5/26.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *_redLayer;
    UIVisualEffectView *effectView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //一些简单的动画,你可以使用UIView的animation就可以搞定了
    //但是一些相对复杂的动画就要使用CoreAnimation
    //CoreAnimation是作用在layer上的
    
    //CAAnimation -- 动画的顶级父类
    //CABasicAnimation --基本动画
    //CAKeyframeAnimation --关键帧动画
    //CAAnimationGroup -- 动画组
    //CATransition -- 专场动画
    
    _redLayer = [CALayer layer];
    _redLayer.backgroundColor = [UIColor redColor].CGColor;
    _redLayer.frame = CGRectMake(100, 100, 200, 200);
    _redLayer.anchorPoint = CGPointMake(0, 0);
    _redLayer.position = CGPointMake(0, 0);
    [self.view.layer addSublayer:_redLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -  动画
-(void)baseAnimation
{
    //创建一个动画对象
    CABasicAnimation *baseAn = [CABasicAnimation animation];
    
    //用法,用于修改layer的某个属性
    //同时只能修改一个属性值
    
    //position
    /*
     //设置需要做动画的属性
    baseAn.keyPath =@"position";
    //设置动画变化 fromValue toValue 需要的id对象类型
    //开始位置
    baseAn.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    //结束位置
    //baseAn.toValue
    baseAn.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
     */
    
    /*
     //backgroundcolor
    baseAn.keyPath = @"backgroundColor";
    baseAn.toValue = (id)[UIColor cyanColor].CGColor;
     */
    
    /*
     //frame 无效的
    //bounds 有效
    baseAn.keyPath = @"bounds";
    baseAn.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 20)];
     */
    
    //transform
    //平移,旋转,缩放
    baseAn.keyPath = @"transform";
    
    //平移
    //baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 400, 0)];
    //旋转
    //baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 1)];
    
    //缩放
    baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)];
    
    
    
    baseAn.repeatCount = 20;
    
    //设置动画的时间
    baseAn.duration = 0.3;
    //设置动画的变化速率
    //ease in 先慢后快
    //ease out 先快后慢
    //EaseinEaseOut 慢快慢
    baseAn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //让动画停留在结束位置
    baseAn.removedOnCompletion = NO;
    baseAn.fillMode = kCAFillModeForwards;
    //kCAFillModeForwards
    //动画结束后一直保持在结束状体
    //kCAFillModeBackwards
    //和forwards相对的,只要动画加入到一个layer,laer会立即进入动画的初始状体
    //kCAFillModeBoth 之前的两个同事支持
    //kCAFillModeRemoved
    //动画对layer没有影响,动画结束的时候layer回恢复
    
    //直接将animation添加到layer执行
    [_redLayer addAnimation:baseAn forKey:@"baseAn"];
}

//关键帧动画
-(void)keyFrameAnimation
{
    //基本上跟base一样.控制动画的过程
    CAKeyframeAnimation *keyFrameAn = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    keyFrameAn.duration = 1;
    keyFrameAn.removedOnCompletion =NO;
    keyFrameAn.fillMode = kCAFillModeForwards;
    
    //动画过程中经过的值
    keyFrameAn.values = @[@(100),@(300),@(200),@(260)];
    //到达每一帧,时间比例,数值是从0一直到1来表示整个过程
    //如果你的写错,直接忽略
    //0.1 0.3 0.5 1
    keyFrameAn.keyTimes = @[@(0),@(0.8),@(0.9),@(1)];
    
    [_redLayer addAnimation:keyFrameAn forKey:@"key"];
}

-(void)keyFrameColorAnimation
{
    //基本上跟base一样.控制动画的过程
    CAKeyframeAnimation *keyFrameAn = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    keyFrameAn.duration = 4;
    keyFrameAn.removedOnCompletion =NO;
    keyFrameAn.fillMode = kCAFillModeForwards;
    
    
    //动画过程中经过的值
    keyFrameAn.values = @[(id)[UIColor redColor].CGColor,(id)[UIColor orangeColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor cyanColor].CGColor,(id)[UIColor blueColor].CGColor,(id)[UIColor purpleColor].CGColor];
    //到达每一帧,时间比例,数值是从0一直到1来表示整个过程
    //如果你的写错,直接忽略
    //0.1 0.3 0.5 1
    keyFrameAn.keyTimes = @[@(0),@(0.2),@(0.4),@(0.6),@(0.7),@(0.8),@(1)];
    
    [_redLayer addAnimation:keyFrameAn forKey:@"key"];
}

//动画组
-(void)animationGroup
{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 3;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    //旋转
    CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"transform"];
    a1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    a1.duration = 3;
    //放大
    CABasicAnimation *a2 = [CABasicAnimation animationWithKeyPath:@"transform"];
    a2.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)];
    a2.duration = 3;
    //变颜色
    
    //基本上跟base一样.控制动画的过程
    CAKeyframeAnimation *keyFrameAn = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    keyFrameAn.duration = 3;
//    keyFrameAn.removedOnCompletion =NO;
//    keyFrameAn.fillMode = kCAFillModeForwards;
//    
    
    //动画过程中经过的值
    keyFrameAn.values = @[(id)[UIColor redColor].CGColor,(id)[UIColor orangeColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor cyanColor].CGColor,(id)[UIColor blueColor].CGColor,(id)[UIColor purpleColor].CGColor];
    //到达每一帧,时间比例,数值是从0一直到1来表示整个过程
    //如果你的写错,直接忽略
    //0.1 0.3 0.5 1
    keyFrameAn.keyTimes = @[@(0),@(0.2),@(0.4),@(0.6),@(0.7),@(0.8),@(1)];
    
    group.animations = @[a1,a2,keyFrameAn];
    [_redLayer addAnimation:group forKey:@"group"];
}

-(void)groupThrowAn
{
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:M_PI * 2],[NSNumber numberWithFloat:0.0f], nil];
    rotateAnimation.duration = 0.5f;
    rotateAnimation.keyTimes = [NSArray arrayWithObjects:
                                [NSNumber numberWithFloat:.0],
                                [NSNumber numberWithFloat:.4],
                                [NSNumber numberWithFloat:.5], nil];
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 0.5f;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 300, 300);
    CGPathAddLineToPoint(path, NULL, 220, 220);
    CGPathAddLineToPoint(path, NULL, 256, 256);
    positionAnimation.path = path;
    CGPathRelease(path);
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, rotateAnimation, nil];
    animationgroup.duration = 0.5f;
    animationgroup.fillMode = kCAFillModeForwards;
    animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [_redLayer addAnimation:animationgroup forKey:@"a"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //触发
//    [self effect];
}


//转场动画
-(void)transitionAnimation
{
    _redLayer.backgroundColor = [UIColor yellowColor].CGColor;
    CATransition *transition = [CATransition animation];
    
    //动画类型
    //kCATransitionFade 隐藏
    //kCATransitionMoveIn 移入
    //kCATransitionPush 推
    //kCATransitionReveal
    
    //系统私有的切换方式，使用了，app 就不能通过审核
    //cube，suckEffect，oglFlip，rippleEffect，pageCurl，pageUnCurl，cameraIrisHollowOpen，cameraIrisHollowClose
    
    
    transition.type = @"cameraIrisHollowClose";
    //top left rigth bottom
    transition.subtype = kCATransitionFromTop;
    
    transition.duration = 3.f;
    
    [_redLayer addAnimation:transition forKey:@"t"];
}

-(void)effect
{
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    if (!effectView) {
        effectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
        effectView.frame = self.view.frame;
        
        [self.view addSubview:effectView];
    }else{
        [effectView removeFromSuperview];
        effectView = nil;
    }
    
    
    
}
@end

