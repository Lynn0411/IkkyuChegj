//
//  ZYLCounterOrClockWiseView.h
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/21.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 *自定义代理
 */
@protocol ZYLCounterOrClockWiseViewDelegate <NSObject>

@required
//- (void)setImageView:(UIImageView *)imageView;
- (void)createSubView;
- (void)startAnimatew;
@end


@interface ZYLCounterOrClockWiseView : UIView
{
    UIImageView *myImageView;
}
- (void)createSubView;
- (void)startAnimatew;
@property (nonatomic, assign) id<ZYLCounterOrClockWiseViewDelegate>myDelegate;
@end
