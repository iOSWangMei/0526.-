//
//  ViewController.m
//  CALayerTest_01
//
//  Created by SuperWang on 16/5/26.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = self.view.layer.sublayers;
    NSLog(@"%@",arr);
    
   //在UIView当中,其实,CALayer才是负责绘制和显示UI内容的对象
    //UIView 其实是负责响应和用户交互
    
    //每一个UIView当中,都至少包含一个CALayer,UIView在这里可以被认为是CALayer的管理值,可以做添加,删除的操作
    
    //基本使用
    //平时对UIView设置的一些属性,最终体现到CALayer中,但是CALayer还包含一些UIView没有的属性
    
//    self.view.layer.backgroundColor = [UIColor blackColor].CGColor;
    
    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    //设置大小
    layer.frame = CGRectMake(0, 0, 200, 200);
    
    //设置一些layer独有的属性
    layer.borderWidth = 10;
    layer.borderColor = [UIColor blackColor].CGColor;
    //设置半径
    //layer.cornerRadius = 100;
    //在layer上显示图片.CGImage
    //layer.contents = (id)[UIImage imageNamed:@"a.jpg"].CGImage;
    
    //剪切多余部分
    //layer.masksToBounds = YES;
    
    //添加到view.layer
    //[self.view.layer addSublayer:layer];
    
    
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(100, 0, 200, 200);
    //放在红色的下面
    //[self.view.layer insertSublayer:blueLayer below:layer];
    
    CALayer *yellowLayer = [CALayer layer];
    yellowLayer.backgroundColor = [UIColor yellowColor].CGColor;
    yellowLayer.frame = CGRectMake(0, 0, 300, 200);
    
//    [self.view.layer insertSublayer:yellowLayer below:layer];
    //[self.view.layer insertSublayer:yellowLayer atIndex:3];
    
    //layer其他的操作跟view一样
    //插入到某一个layer上面
//    [self.view.layer insertSublayer:<#(nonnull CALayer *)#> above:<#(nullable CALayer *)#>];
    
    //根据index插入指定位置
//    [self.view insertSubview:<#(nonnull UIView *)#> atIndex:<#(NSInteger)#>];
    
    //插入到某一个layer下面
//    [self.view insertSubview:<#(nonnull UIView *)#> belowSubview:<#(nonnull UIView *)#>];
    
    
    //layer的子类
    //优化tableview
    CATextLayer *textLayer = [CATextLayer layer];
    
    textLayer.frame = CGRectMake(0, 300, 300, 50);
    //设置显示的文字
    textLayer.string = @"ABCDEFG!!!";
    //设置字体的颜色
    textLayer.foregroundColor = [UIColor redColor].CGColor;
    //设置字体大小
    textLayer.fontSize = 20.f;
    
    textLayer.backgroundColor = [UIColor blackColor].CGColor;
    //[self.view.layer addSublayer:textLayer];
    
    //渐变色
    CAGradientLayer *gLayer = [CAGradientLayer layer];
    gLayer.frame = CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 100);
    //需要设置渐变所包含的颜色
    gLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor orangeColor].CGColor,
                      (id)[UIColor yellowColor].CGColor,
                      (id)[UIColor greenColor].CGColor,
                      (id)[UIColor cyanColor].CGColor,
                      (id)[UIColor blueColor].CGColor,
                      (id)[UIColor purpleColor].CGColor];
    //设置渐变色的起点和终点位置
    gLayer.startPoint = CGPointMake(0, 0);
    gLayer.endPoint = CGPointMake(1, 1);
    
    //point 锚点
    gLayer.anchorPoint = CGPointMake(0, 0);
    
    //position 位置(锚点在父视图的位置)
    gLayer.position = CGPointMake(0, 0);
    
    [self.view.layer addSublayer:gLayer];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
