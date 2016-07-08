//
//  CitySelectedViewController.h
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/8.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CityBlock)(NSString *cityName);//block
@interface CitySelectedViewController : UIViewController
@property (nonatomic, copy) CityBlock cityBlock;//block对象
@end
