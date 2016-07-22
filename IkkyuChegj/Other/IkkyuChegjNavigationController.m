//
//  IkkyuChegjNavigationController.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/6/27.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "IkkyuChegjNavigationController.h"
#import "UIImage+Extension.h"
#import "UIBarButtonItem+Extension.h"

@interface IkkyuChegjNavigationController ()<UINavigationControllerDelegate>

@end

@implementation IkkyuChegjNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    self.delegate = self;
    
}
+(void)initialize{
    //设置 UINAvigationBar 的主题
    [self setUpNavigationBarTheme];
}

/**
 *  设置 UIBarButtonItem的主题
 */
+(void)setUpNavigationBarTheme{
    // 通过appearance对象能修改整个项目中所有UIBarbuttonItem的样式
    UINavigationBar *appearance = [UINavigationBar appearance];
    //设置导航条的背景
    [appearance setBackgroundImage:[UIImage createImageWithColor:RGBA(233, 84, 18, 1)] forBarMetrics:UIBarMetricsDefault];
    //设置文字
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    att[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:att];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置按钮
    
//    UIButton *button = [[UIButton alloc] init];
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {// 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -5;
        
        //设置导航栏的按钮
        UIBarButtonItem *backButton = [UIBarButtonItem itemWithImageName:@"ShangJiaTabBarImage" highImageName:@"ShangJiaSelectedTabBarImage" target:self action:@selector(back)];//navigationbar_back_image/navigationbar_back_image
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
        
        // 就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    [self popViewControllerAnimated:YES];
}
@end
