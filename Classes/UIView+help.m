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
    return self.frame.size.heigth;
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
    CGPoint pt = rectToCut.origin;
    UIImage *screenImage;
    UIGraphicsBeginImageContextWithOptions((rectToCut.size), NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context,CGAffineTransformMakeTranslation(-(int)pt.x, -(int)pt.y));
    [self.layer renderInContext:context];
    screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenImage;
}

@end





