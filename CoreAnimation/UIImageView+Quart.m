//
//  UIImageView+Quart.m
//  Quart2D
//
//  Created by shang_uai on 2017/2/20.
//  Copyright © 2017年 shang_uai. All rights reserved.
//

#import "UIImageView+Quart.h"

@implementation UIImageView (Quart)

+ (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"点赞.png" ofType:nil]];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    [tintColor setFill];
    
    CGRect bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [image drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}




@end
