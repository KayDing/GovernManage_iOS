//
//  ZYLServiceCell.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/18.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLServiceCell.h"

@implementation ZYLServiceCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier: reuseIdentifier])
    {
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, [UIScreen mainScreen].bounds.size.width-30, 135)];
        self.image.layer.cornerRadius = 5;
        self.image.layer.masksToBounds = YES;
        self.image.layer.shadowColor = [UIColor blackColor].CGColor;
        self.image.layer.shadowOffset = CGSizeMake(0, 0);
        self.image.layer.shadowOpacity = 0.05;
        self.image.layer.shadowRadius = 4.5;
        [self.contentView addSubview:self.image];
    }
    return self;
}

- (void)setImg:(UIImage *)img{
    _img = img;
    self.image.image = img;
}

//复用
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *Identifier = @"cellID";
    ZYLServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[ZYLServiceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    return (ZYLServiceCell *)cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
