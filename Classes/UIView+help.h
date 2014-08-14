//
//  UIView+frame.h
//  WWWBO
//
//  Created by LiuWenYang on 14-7-21.
//  Copyright (c) 2014年 liuwenyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Marco.h"
@interface UIView (frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat heigth;

-(CGSize)size;

-(void)setSize:(CGSize)size;

-(CGPoint)origin;

-(void)setOrigin:(CGPoint)origin;


@end


@interface UIView (subView)

-(void)removeAllSubviews;

-(void)removeSubviewWithTag:(NSInteger)tag;

@end

@interface UIView (crop)

-(UIImage *)cropImageFromView;
-(UIImage *)cropRectImageFromView:(CGRect)rectToCut;

@end




