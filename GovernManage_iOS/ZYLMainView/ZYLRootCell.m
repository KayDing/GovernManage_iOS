//
//  ZYLRootCell.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/18.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLRootCell.h"
#import "ZYLCellBtnView.h"
#import "ZYLRootModelManage.h"
#import "ZYLImageScrollView.h"
#import <Masonry.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface ZYLRootCell () <ZYLCellBtnViewDelegate>

@end

@implementation ZYLRootCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier: reuseIdentifier])
    {
        if ([reuseIdentifier isEqualToString:@"cell00"]) {
            [self loadCellType1];
             self.backgroundColor = [UIColor whiteColor];
        }else if ([reuseIdentifier isEqualToString:@"cell10"]){
            [self loadCellType2];
            self.backgroundColor = [UIColor whiteColor];
        }
        else{
            [self loadCellType3];
             self.backgroundColor = [UIColor clearColor];
        }
    }
    
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexpath:(NSIndexPath *)indexPath
{
    NSString *Identifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    ZYLRootCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[ZYLRootCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    return (ZYLRootCell *)cell;
}

- (void)loadCellType1{
    NSArray *modelArr = [ZYLRootModelManage getCellBtnModel];
    for (int i = 0; i < modelArr.count; i++) {
        ZYLCellBtnView *btn = [[ZYLCellBtnView alloc] initWithFrame:CGRectMake(30+i%4*(WIDTH-60)/4, 15+i/4*((WIDTH-60)/4+20), (WIDTH-60)/4, (WIDTH-60)/4+20)];
        btn.model = modelArr[i];
        btn.delegate = self;
        [self.contentView addSubview: btn];
        
    }
}

- (void)loadCellType2{
    ZYLImageScrollView *imgSV = [[ZYLImageScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 120)];
    [imgSV setImgArr:[ZYLRootModelManage getImageArray]];
    [self.contentView addSubview: imgSV];
}

- (void)loadCellType3{
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, [UIScreen mainScreen].bounds.size.width-30, 135)];
    self.image.layer.cornerRadius = 5;
    self.image.layer.masksToBounds = YES;
    self.image.layer.shadowColor = [UIColor blackColor].CGColor;
    self.image.layer.shadowOffset = CGSizeMake(0, 0);
    self.image.layer.shadowOpacity = 0.05;
    self.image.layer.shadowRadius = 4.5;
    [self.contentView addSubview:self.image];
}

#pragma mark - button点击事件
- (void)didClickBtnWithTag:(NSInteger)tag{
    [self.delegate getTagOfBtn:tag];
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
