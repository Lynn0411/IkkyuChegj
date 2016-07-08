//
//  UIFont+Extension.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/6/27.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)
+ (UIFont *)fontWithDevice:(CGFloat)fontSize {
    if (IkkyuChegjScreenW > 375) {
        fontSize = fontSize + 3;
    }else if (IkkyuChegjScreenW == 375){
        fontSize = fontSize + 1.5;
    }else if (IkkyuChegjScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

/**
 *  专门为客户性别，年龄电话写的
 */
+ (UIFont *)fontWithCustomer:(CGFloat)fontSize {
    if (IkkyuChegjScreenW > 375) {
        fontSize = fontSize + 2;
    }else if (IkkyuChegjScreenW == 375){
        fontSize = fontSize + 1.5;
    }else if (IkkyuChegjScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)navItemFontWithDevice:(CGFloat)fontSize {
    if (IkkyuChegjScreenW > 375) {
        fontSize = fontSize + 2;
    }else if (IkkyuChegjScreenW == 375){
        fontSize = fontSize + 1;
    }else if (IkkyuChegjScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)fontWithTwoLine:(CGFloat)fontSize {
    if (IkkyuChegjScreenW > 375) {
        fontSize = fontSize + 2;
    }else if (IkkyuChegjScreenW == 375){
        fontSize = fontSize + 1;
    }else if (IkkyuChegjScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)insuranceCellFont:(CGFloat)fontSize {
    if (IkkyuChegjScreenW > 375) {
        fontSize = fontSize + 3.5;
    }else if (IkkyuChegjScreenW == 375){
        fontSize = fontSize + 2;
    }else if (IkkyuChegjScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}
@end
