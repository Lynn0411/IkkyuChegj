//
//  ZYLCounterOrClockWiseView.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/21.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "ZYLCounterOrClockWiseView.h"


@implementation ZYLCounterOrClockWiseView

//- (void)setImageView:(UIImageView *)imageView{
//    myImageView = imageView;
//    [self createSubView];
//    [self startAnimatew];
//}


- (UIImageView *)createImageViewWithFrame:(CGRect)frame tag:(NSInteger)tag named:(NSString *)name{
 UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
 imageView.tag = tag;
 imageView.image = [UIImage imageNamed:name];
 return imageView;
 }

- (void)createSubView{
 myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 40, 60, 60)];
 [self addSubview:myImageView];
 CGRect frame = myImageView.bounds;
 UIImageView *imageView = [self createImageViewWithFrame:frame tag:90 named:@"2.jpg"];
 //定位点,不写默认是中心点
 //    imageView.layer.anchorPoint = CGPointMake(28/45, 16/45);
 
 imageView.frame = frame;
 [myImageView addSubview:imageView];
 
 }
- (void)startAnimatew{
 id fromValue = [NSNumber numberWithFloat:-M_PI_4];
 id toValue = [NSNumber numberWithFloat:M_PI_4];
 UIImageView *imageView = [myImageView viewWithTag:90];
 [self animationWithView:imageView keyPath:@"transform.rotation.z" fromValue:fromValue toValue:toValue];
 
 }

- (void)animationWithView:(UIView *)view keyPath:(NSString *)keyPath fromValue:(id)fromValue toValue:(id)toValue{
 CAAnimation *animation = [self createAnimationWithKeyPath:keyPath fromValue:fromValue toValue:toValue];
 [view.layer addAnimation:animation forKey:nil];
 }
 - (CAAnimation *)createAnimationWithKeyPath:(NSString *)keyPath fromValue:(id)fromValue toValue:(id)toValue{
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
 animation.duration = 1.5; // 持续时间
 CAMediaTimingFunction *mediaTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 animation.timingFunction = mediaTiming;
 animation.repeatCount = HUGE_VALF; // 重复次数
 animation.fromValue =  fromValue;// 起始角度
 animation.toValue = toValue; // 终止角度
 animation.autoreverses = YES;
 return animation;
 }

 
@end
