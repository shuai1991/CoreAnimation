//
//  ViewController.m
//  CoreAnimation
//
//  Created by shang_uai on 2017/2/27.
//  Copyright © 2017年 shang_uai. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+Quart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(160, 530, 40, 40);
    [button setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)btnClicked:(UIButton *)btn {
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 500, 40, 40)];
    UIColor *color = [UIColor colorWithRed:(arc4random() % 256 / 255.0) green:(arc4random() % 256 / 255.0) blue:(arc4random() % 256 / 255.0) alpha:1];
    imageView.image = [UIImageView imageWithTintColor: color];
    [self.view addSubview:imageView];
    
    // 路线
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(165 + arc4random() % 10, 500)];
    [path addCurveToPoint:CGPointMake(180, 100) controlPoint1:CGPointMake(100 + arc4random() % 100, 400 + arc4random() % 50) controlPoint2:CGPointMake(250 + arc4random() % 100, 250 + arc4random() % 50)];
    animation.path = path.CGPath;
    
    // 变大
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnimation.duration = 0.05f;
    expandAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    expandAnimation.toValue = [NSNumber numberWithFloat:1.3f];
    expandAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = 0.05f;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:1.3f];
    narrowAnimation.duration = 1.95f;
    narrowAnimation.toValue = [NSNumber numberWithFloat:1.2f];
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    // 透明度
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    rotationAnimation.fromValue = @(1);
    rotationAnimation.toValue = @(0);
    
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation, narrowAnimation, expandAnimation, rotationAnimation];
    groups.duration = 2;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    
    [imageView.layer addAnimation:groups forKey:@"group"];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(groups.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [imageView removeFromSuperview];
    });
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


@end
