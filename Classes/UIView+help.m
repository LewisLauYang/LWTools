//
//  UIView+frame.m
//  WWWBO
//
//  Created by LiuWenYang on 14-7-21.
//  Copyright (c) 2014年 liuwenyang. All rights reserved.
//

#import "UIView+help.h"

@implementation UIView (frame)

-(CGFloat)x{
    return  self.frame.origin.x;
}

-(void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.y, self.width, self.heigth);
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.x, y, self.width, self.heigth);
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.x, self.y, width, self.heigth);
}

-(CGFloat)heigth
{
    return self.frame.size.height;
}

-(void)setHeigth:(CGFloat)heigth
{
    self.frame = CGRectMake(self.x, self.y, self.width, heigth);
}

-(CGSize)size
{
    return self.frame.size;
}

-(void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

-(CGPoint)origin
{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.heigth);
}

@end


@implementation UIView (subView)

-(void)removeAllSubviews
{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}

-(void)removeSubviewWithTag:(NSInteger)tag
{
    for (UIView *subView in self.subviews) {
        if (subView.tag == tag) {
            [subView removeFromSuperview];
        }
    }
}

@end


@implementation UIView (crop)

-(UIImage *)cropImageFromView{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIImage *)cropRectImageFromView:(CGRect)rectToCut
{
    UIImage *snapshot;
    CGImageRef UIGetScreenImage();
    CGImageRef cgScreen = UIGetScreenImage();
    if (cgScreen)
    {
        snapshot = [UIImage imageWithCGImage:cgScreen];
        CGImageRelease(cgScreen);
    }
    
    CGRect rect;
    //高清截图需要扩大2倍范围 不高清得就直接按范围切，注意高清版本的ios7系统 妈的20px导航也要考虑在内，如果是ios7以上得 （CGRectMake（，y，，）这个y 要多加20也就是IsIOS7?0:20*2）多加个判断
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2)
    {
        //获取高清size
        rect = CGRectMake(rectToCut.origin.x*2, rectToCut.origin.y*2+(ios7?0:20*2), (rectToCut.size.width)*2, rectToCut.size.height*2);//创建要剪切的矩形框
    }
    else
    {
        //获取低清size
        rect=CGRectMake(rectToCut.origin.x, rectToCut.origin.y+20, rectToCut.size.width, rectToCut.size.height);
    }
    
    UIImage *res = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([snapshot CGImage], rect)];
    //存到像册
    
    return res;
}

@end





