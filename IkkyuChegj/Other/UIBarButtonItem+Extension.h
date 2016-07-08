//
//  UIBarButtonItem+Extension.h
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/6/27.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  返回没有调整图片
 */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:target action:(SEL)action;

/**
 *  没有文字调整的按钮
 */
+ (UIBarButtonItem *)itemWithName:(NSString *)Name font:(CGFloat)font target:target action:(SEL)action;

/**
 *  返回调整文字
 */
+ (NSArray *)itemsWithName:(NSString *)Name font:(CGFloat)font target:target action:(SEL)action;

/**
 *  返回调整图片
 */
+ (NSArray *)itemsWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:target action:(SEL)action;
@end
