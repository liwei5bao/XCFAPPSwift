//
//  UIImage+MJ.h
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MJ)
/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)getSubImage:(CGRect)rect;
- (UIImage *)circleImageWithParam:(CGFloat)inset;
/*!
 * @author huxq, 16-06-07
 *
 * @brief 按固定比例压缩图片
 * @param img  原图
 * @param size 大小
 * @return 处理之后的图片
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
@end
