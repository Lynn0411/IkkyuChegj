//
//  CitySelectTableViewCell.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/8.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "CitySelectTableViewCell.h"

@implementation CitySelectTableViewCell{
    UILabel *titleLab;
}
-  (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 40)];
        titleLab.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:titleLab];
    }
    return self;
}
- (void)contentCityTableViewCell:(CitySelectedModel *)model{
    titleLab.text = model.city_name;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
