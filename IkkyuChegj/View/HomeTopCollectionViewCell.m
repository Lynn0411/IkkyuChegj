//
//  HomeTopCollectionViewCell.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/11.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "HomeTopCollectionViewCell.h"

@implementation HomeTopCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)Tap:(UIButton *)_b{
    NSLog(@"wdfghj");
}
- (void)setCellModel:(id)obj{
    UIImageView *viewsArray = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IkkyuChegjScreenW, IkkyuChegjScreenH)];
    viewsArray.alpha = 0.3f;
    viewsArray.image = [UIImage imageNamed:@"2.jpg"];
    [self.contentView addSubview:viewsArray];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, IkkyuChegjScreenW, 20)];
    label.text = @"111";
    [self.contentView addSubview:label];
    UIButton *tapButton = [[UIButton alloc] initWithFrame:CGRectMake(IkkyuChegjScreenW - 90, 60, 80, 80)];
    tapButton.layer.cornerRadius = 40;
    tapButton.layer.masksToBounds = YES;
    tapButton.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:tapButton];
    [tapButton addTarget:self action:@selector(Tap:) forControlEvents:UIControlEventTouchDown];
    
}

@end
