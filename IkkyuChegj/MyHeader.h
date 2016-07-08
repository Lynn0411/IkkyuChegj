//
//  MyHeader.h
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/8.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#ifndef MyHeader_h
#define MyHeader_h


// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(33, 192, 174)
#define separaterColor RGB(200, 199, 204)


// 3.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 4.屏幕大小尺寸
#define IkkyuChegjScreenH [UIScreen mainScreen].bounds.size.height
#define IkkyuChegjScreenW [UIScreen mainScreen].bounds.size.width
// 5.常用对象
#define APPDELE GATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

// 6.经纬度
//#define LATITUDE_DEFAULT 39.983497
//#define LONGITUDE_DEFAULT 116.318042

// 7.
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// 8.tabBarImage
    //tabBar的图标--未选中时的图片
#define ShouYeTabBarImage @"ShouYeTabBarImage"
#define ShangJiaTabBarImage @"ShangJiaTabBarImage"
#define XiaoXiTabBarImage @"XiaoXiTabBarImage"
#define WoDeTabBarImage @"WoDeTabBarImage"
    //tabBar的图标--选中时的图片
#define ShouYeSelectedTabBarImage @"ShouYeSelectedTabBarImage"
#define ShangJiaSelectedTabBarImage @"ShangJiaSelectedTabBarImage"
#define XiaoXiSelectedTabBarImage @"XiaoXiSelectedTabBarImage"
#define WoDeSelectedTabBarImage @"WoDeSelectedTabBarImage"
   /* //未选中tabBarImage
#define ShouYeTabBarImage @"ShouYeTabBarImage"
#define WoDeTabBarImage @"WoDeTabBarImage"

//#define ShouYeTabBarImage [UIImage imageNamed:@"ShouYeTabBarImage"]
//#define WoDeTabBarImage [UIImage imageNamed:@"WoDeTabBarImage"]

    //选中tabBarImage
#define ShouYeSelectedTabBarImage @"ShouYeSelectedTabBarImage"
#define WoDeSelectedTabBarImage @"WoDeSelectedTabBarImage"

//#define ShouYeSelectedTabBarImage [UIImage imageNamed:@"ShouYeSelectedTabBarImage"]
//#define WoDeSelectedTabBarImage [UIImage imageNamed:@"WoDeSelectedTabBarImage"]

*/

// 9.
#endif /* MyHeader_h */
