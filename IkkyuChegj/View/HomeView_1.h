//
//  HomeView_1.h
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/8.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel_1.h"

@interface HomeView_1 : UIView
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIButton *tapButton;
@property (nonatomic, strong) HomeModel_1 *homeModel_1;
-(void)setCellModel:(id)obj;

@end
