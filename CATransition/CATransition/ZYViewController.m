//
//  ZYViewController.m
//  CATransition
//
//  Created by lixing.wang on 15/4/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYViewController.h"

@interface ZYViewController () {
    IBOutlet UIImageView* _imageView;
}

@end

@implementation ZYViewController

- (IBAction)changeImage:(UIButton* )sender {
    sender.tag++;
    
    if (sender.tag == 3) {
        sender.tag = 0;
    }
    
    NSString* imageName = [NSString stringWithFormat:@"%@", @(sender.tag)];
    _imageView.image = [UIImage imageNamed:imageName];
    

    
    //获得一个动画对象
    CATransition* transition = [CATransition animation];
    
    
    //系统私有的切换方式，使用了，app 就不能通过审核
    //cube，suckEffect，oglFlip，rippleEffect，pageCurl，pageUnCurl，cameraIrisHollowOpen，cameraIrisHollowClose
    
    //但是都有对应的开源第三方库去实现。
    
    //动画的方式
    //系统提供给我们用的有四种。kCATransitionFade 等。
    transition.type = @"pageUnCurl";
    //动画的四种方向
    transition.subtype = kCATransitionFromLeft;
    
    transition.duration = 0.35f;
    
    [_imageView.layer addAnimation:transition forKey:@"transition"];
}

@end
