//
//  ZYLStarView.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/22.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "ZYLStarView.h"

@implementation ZYLStarView{
    UIView *xuanZhongDeStarView;
}

//如果通过该方法初始化StarView对象 那么该方法将作为入口方法
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建星星视图
        [self createStarView];
    }
    return self;
}
/*////如果StarView是被画在xib文件中 则系统默认调用该方法（入口方法）
-(void)awakeFromNib{
    
    [self createStarView];
}
*/
-(void)createStarView{
    
    //获取灰色与黄色图片对象
    UIImage *weiXuanZhongDeXingXing = [UIImage imageNamed:@"WeiXuanZhongDeXingXing"];
    UIImage *xuanZhongDeXingXing = [UIImage imageNamed:@"XuanZhongDeXingXing"];
    
    //获取灰色图片的高度与宽度
    CGFloat width = weiXuanZhongDeXingXing.size.width;
    
    CGFloat height = weiXuanZhongDeXingXing.size.height;
    
    //创建灰色视图对象
    UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width*5, height)];
    
    //设置灰色星星视图背景图 图片会平铺展示
    grayView.backgroundColor = [UIColor colorWithPatternImage:weiXuanZhongDeXingXing];
    
    [self addSubview:grayView];
    
    //创建黄色星星视图
    xuanZhongDeStarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width*5, height)];
    
    xuanZhongDeStarView.backgroundColor = [UIColor colorWithPatternImage:xuanZhongDeXingXing];
    
    [self addSubview:xuanZhongDeStarView];
    
    //缩小或放大星星视图
    //获取缩放倍数
    CGFloat scale = self.frame.size.width/xuanZhongDeStarView.frame.size.width;
    
    //视图的变化
    xuanZhongDeStarView.transform = CGAffineTransformMakeScale(scale, scale);
    
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //重新设置frame
    xuanZhongDeStarView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    grayView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
//根据传入分数设置黄色星星视图
-(void)setRatingFinal:(NSNumber *)ratingFinal{
    
    _ratingFinal = ratingFinal;
    
    CGFloat ratingFinalf = [_ratingFinal floatValue];
    
    if(ratingFinalf < 0){
        
        ratingFinalf = 0;
    }
    
    //宽度比例
    CGFloat widthScale = ratingFinalf/10.0;
    
    //设置黄图比例
    xuanZhongDeStarView.frame = CGRectMake(0, 0, self.frame.size.width*widthScale, self.frame.size.height);
}


@end
