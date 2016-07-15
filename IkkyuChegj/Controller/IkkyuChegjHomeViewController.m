//
//  IkkyuChegjHomeViewController.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/8.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "IkkyuChegjHomeViewController.h"
#import "CitySelectedViewController.h"
#import "MessageViewController.h"

#import "HomeTopCollectionViewCell.h"
#import "HomeModel_1.h"

@interface IkkyuChegjHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong)UICollectionView *collectionView;
@property (nonatomic , strong)NSMutableArray *dataArr;
@property (nonatomic , strong)UICollectionViewFlowLayout *flowLayout;
@end

@implementation IkkyuChegjHomeViewController

- (void)setNav{
    [self showCity:@"城市"];
    //nav右边按钮
    UIButton *rightNavButton = [[UIButton alloc] initWithFrame:CGRectMake(IkkyuChegjScreenW - 40, 10, 40, 40)];
    
    //    UIButton *rightNavButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightNavButton setImage:[UIImage imageNamed:@"downPic"] forState:UIControlStateNormal];
    //    [rightNavButton setTitle:@"消息" forState:UIControlStateNormal];
    [rightNavButton addTarget:self action:@selector(rightBarButtonTap:) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *rightNavButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightNavButton];
    self.navigationItem.rightBarButtonItem = rightNavButtonItem;
    
    
}
#pragma mark - 城市
- (void)showCity:(NSString *)cityname{
    //实现富文本
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:cityname attributes:nil];
    //进行图文混排
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
    textAttachment.image = [UIImage imageNamed:@"downPic"];
    textAttachment.bounds = CGRectMake(0, 0, 12,10);
    NSAttributedString * textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment ];
    //判断选择的城市名称长度是否大于5个字符的长度，如果大于五个字符就取前四个字符，然后再在最后添加一个图标
    if (string.length >= 5) {
        //去前四个字符
        NSAttributedString *str = [string attributedSubstringFromRange:NSMakeRange(0, 4)];
        //将NSAttributedString类型转换成NSString类型
        NSString *cityString = [str string];
        string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@...",cityString] attributes:nil];
    }
    //在城市名称后插入图片
    [string insertAttributedString:textAttachmentString atIndex:string.length];
    //自定义按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 70, 30);
    [btn addTarget:self action:@selector(navBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lbText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width+50, btn.frame.size.height)];
    lbText.attributedText = string;
    lbText.textColor = [UIColor whiteColor];
    lbText.font = [UIFont systemFontOfSize:15];
    [btn addSubview:lbText];
    btn.backgroundColor = [UIColor clearColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
- (void)navBtnCLick{
    NSLog(@"%@", kDocumentPath);
    CitySelectedViewController *citySelectVC = [[CitySelectedViewController alloc] init];
    //block传过来的值
    citySelectVC.cityBlock = ^(NSString *str){
        NSLog(@"城市 ＝ %@",str);
        [self showCity:str];
    };
    citySelectVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:citySelectVC animated:YES];
}
- (void)rightBarButtonTap:(UIButton *)_b{
    NSLog(@"qwweghugf");
    MessageViewController *message = [[MessageViewController alloc] init];
    message.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:message animated:YES];
    
}
#pragma mark 懒加载存放数据的数组
-(NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
#pragma mark 添加UIControllerView
-(void)reloadCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.flowLayout = flowLayout;
    self.collectionView = collectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    self.collectionView.showsVerticalScrollIndicator= NO;
}
#pragma make -注册cell
- (void)registerCell{
    [self.collectionView registerNib:[UINib nibWithNibName:@"GGMovieCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
}
#pragma mark -解析网络数据
- (void)httpRequest{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:DirectSeedingUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (self.dataArr.count) {
            [self.dataArr removeAllObjects];
        }
        for (NSDictionary *dic in responseObject[@"data"]) {
            [self.collectionView headerEndRefreshing];
        }
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"1111111111111");
    }];
  /*  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:DirectSeedingUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (self.dataArr.count) {
            [self.dataArr removeAllObjects];
        }
        for (NSDictionary *dic in responseObject[@"data"]) {
            [self.collectionView headerEndRefreshing];
            GGMovieModel *GameM = [[GGMovieModel alloc]init];
            GameM.avatar = dic[@"avatar"];
            GameM.thumb  = dic[@"thumb"];
            GameM.title  = dic[@"title"];
            GameM.nick   = dic[@"nick"];
            GameM.view   = dic[@"view"];
            GameM.uid    = dic[@"uid"];
            [self.dataArr addObject:GameM];
        }
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    }];*/
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"壹修车管家";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self reloadCollectionView];
    [self registerCell];
    [self httpRequest];
    //添加下拉刷新控件
    [self.collectionView addHeaderWithTarget:self action:@selector(httpRequest)];
    //自动下拉刷新
    [self.collectionView headerBeginRefreshing];
    // Do any additional setup after loading the view.
}
#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((IkkyuChegjScreenW-15)/2, (IkkyuChegjScreenW-15)/2-10);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    HomeTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell setCellModel:self.dataArr[indexPath.row]];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5,5 , 5);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    HomeModel_1 *model = self.dataArr[indexPath.row];
//    GGPlayViewCtl *playCtl= [[GGPlayViewCtl alloc]initWithVideoId:model.uid];
//    playCtl.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:playCtl animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
