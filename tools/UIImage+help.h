//
//  UIImage+help.h
//  NiceTake
//
//  Created by LiuWenYang on 14-7-23.
//  Copyright (c) 2014年 liuwenyang. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface UIImage (help)
//
//
////-(UIImage*)getSubImage:(CGRect)rect;
////-(UIImage*)scaleToSize:(CGSize)size;
////-(UIImage *) scaleImagetoScale:(float)scaleSize;
//
//@end


@interface UIImage(ResizeCategory)
-(UIImage*)resizedImageToSize:(CGSize)dstSize;
-(UIImage*)resizedImageToFitInSize:(CGSize)boundingSize scaleIfSmaller:(BOOL)scale;
@end


@interface UIImage (crop)
- (UIImage *)croppedImage:(CGRect)bounds;
@end