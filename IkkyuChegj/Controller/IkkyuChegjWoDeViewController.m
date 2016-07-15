//
//  IkkyuChegjWoDeViewController.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/8.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "IkkyuChegjWoDeViewController.h"
#define NavigationBarHight 64.0f
#define  ImageHight 200.0f
@interface IkkyuChegjWoDeViewController () <UITableViewDataSource, UITableViewDelegate>
//底层背景图
@property(nonatomic,strong)UIImageView *zoomImageView;
//图像
@property(nonatomic,strong)  UIImageView *circleView;
//昵称
@property(nonatomic,strong)UILabel *label;
@end

@implementation IkkyuChegjWoDeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化_tableView
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //2.设置代理
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    //3.设置contentInset属性（上左下右 的值）
    self.tableView.contentInset = UIEdgeInsetsMake(ImageHight+64, 0, 0, 0);
    //4.添加tableView
    [self.view addSubview:self.tableView];
    
    //5.配置ImageView
    self.zoomImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"123.jpg"]];
    self.zoomImageView.frame=CGRectMake(0, -ImageHight , self.view.frame.size.width, ImageHight);

    //核心就是这句代码!
    //UIViewContentModeScaleAspectFill高度改变,宽度也会改变
    //不设置那将只会被纵向拉伸
    self.zoomImageView.contentMode=UIViewContentModeScaleAspectFill;
    
    [self.tableView addSubview: self.zoomImageView];
    
    
    //6.设置autoresizesSubviews让子类自动布局
    self.zoomImageView.autoresizesSubviews = YES;
    
    self.circleView = [[UIImageView alloc]initWithFrame:CGRectMake(10, ImageHight-50, 40, 40)];
    self.circleView.backgroundColor = [UIColor redColor];
    self.circleView.layer.cornerRadius = 7.5f;
    self.circleView.image = [UIImage imageNamed:@"123.jpg"];
    self.circleView.clipsToBounds = YES;
    self.circleView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
    [_zoomImageView addSubview:_circleView];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(60, ImageHight-40, 280, 20)];
    self.label.textColor = [UIColor whiteColor];
    self.label.text = @"范东东";
    self.label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
    [_zoomImageView addSubview: self.label];
    //解决tableView  在nav 遮挡的时候 还会透明的显示问题;
    self.edgesForExtendedLayout=UIRectEdgeNone;

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Jay"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Jay"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset=UIEdgeInsetsZero;
        cell.clipsToBounds = YES;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第-%ld-天 ",indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 毛玻璃效果:App设计时往往会用到一些模糊效果或者毛玻璃效果,iOS目前已提供一些模糊API可以让我们方便是使用。
 话说苹果在iOS7.0之后,很多系统界面都使用了毛玻璃效果,增加了界面的美观性,比如下图的通知中心界面;
 
 但是其iOS7.0的SDK并没有提供给开发者实现毛玻璃效果的API,所以很多人都是通过一些别人封装的框架来实现,后面我也会讲到一个;
 其实在iOS7.0(包括)之前还是有系统的类可以实现毛玻璃效果的, 就是 UIToolbar这个类,并且使用相当简单,几行代码就可以搞定.
 -----------------------------------------
 创建一个UIToolbar实例,设置它的frame或者也可以通过添加约束
 然后UIToolbar有一个属性:barStyle,设置对应的枚举值来呈现毛玻璃的样式,最后再添加到需要进行毛玻璃效果的view上即可.
 
 毛玻璃的样式(枚举)
 UIBarStyleDefault = ,  有点偏白
 UIBarStyleBlack =,     有点类似于通知中心的样式
 UIBarStyleBlackOpaque =,
 UIBarStyleBlackTranslucent =,
 
 UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
 bgImgView.image = [UIImage imageNamed:@"huoying.jpg"];
 [self.view addSubview:bgImgView];
 UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(, , bgImgView.frame.size.width*., bgImgView.frame.size.height)];
 toolbar.barStyle = UIBarStyleBlackTranslucent;
 [bgImgView addSubview:toolbar];
 =======================================================
 在iOS8.0之后,苹果新增了一个类UIVisualEffectView,通过这个类来实现毛玻璃效果与上面的UIToolbar一样,而且效率也非常之高,使用也是非常简单,几行代码搞定. UIVisualEffectView是一个抽象类,不能直接使用,需通过它下面的三个子类来实现(UIBlurEffect, UIVisualEffevt, UIVisualEffectView);
 子类UIBlurEffect只有一个类方法,用来快速创建一个毛玻璃效果,参数是一个枚举,用来设置毛玻璃的样式,而UIVisualEffectView则多了两个属性和两个构造方法,用来快速将创建的毛玻璃添加到这个UIVisualEffectView上.
 特别注意: 这个类是iOS8.0之后才适用, 所以如果项目要兼容iOS7.0的话, 还是要考虑其它的两种方法了.
 
 同样是先快速的实例化UIBlurEffect并设置毛玻璃的样式,然后再通过UIVisualEffectView的构造方法将UIBlurEffect的实例添加上去最后设置frame或者是通过添加约束, 将effectView添加到要实现了毛玻璃的效果的view控件上
 下面来看看实现代码:
 
 毛玻璃的样式(枚举)
 UIBlurEffectStyleExtraLight,
 UIBlurEffectStyleLight,
 UIBlurEffectStyleDark
 
 UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
 UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
 effectView.frame = CGRectMake(, , bgImgView.frame.size.width*., bgImgView.frame.size.height);
 [bgImgView addSubview:effectView];
 
 
 这些都知识简单的实现效果,例如1.那些推送图片 毛玻璃大小也跟随着变化,  2.托大的时候 毛玻璃效果减轻  等等的功能,这些都可以具体参考我在后续更新中的效果;
 */

@end
