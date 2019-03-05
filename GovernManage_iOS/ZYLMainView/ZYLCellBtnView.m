//
//  cellBtnView.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/19.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLCellBtnView.h"
#import "ZYLCellBtnModel.h"
#import <Masonry.h>

@implementation ZYLCellBtnView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    self.btn = [[UIButton alloc] init];
    [self.btn addTarget:self action:@selector(didClick:) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.centerX.equalTo(self.mas_centerX).mas_offset(0);;
        make.width.mas_equalTo(self.mas_width).mas_offset(0);
        make.height.mas_equalTo(self.mas_height).mas_offset(-20);
    }];
    
    self.lab = [[UILabel alloc] init];
    self.lab.textAlignment = NSTextAlignmentCenter;
    self.lab.textColor = [UIColor blackColor];
    [self addSubview: self.lab];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn.mas_bottom).mas_offset(0);
        make.centerX.equalTo(self.mas_centerX).mas_offset(0);;
        make.width.mas_equalTo(self.mas_width).mas_offset(0);
        make.height.mas_equalTo(15);
    }];
    
    return self;
}

- (void)setModel:(ZYLCellBtnModel *)model{
    _model = model;
    self.btn.tag = [self.model.tag integerValue];
    [self.btn addTarget:self action:@selector(didClick:) forControlEvents: UIControlEventTouchUpInside];
    [self.btn setImage: [UIImage imageNamed:_model.btnImg] forState: UIControlStateNormal];
    self.lab.text = _model.btnName;
}

- (void)didClick:(UIButton *)sender{
    [self.delegate didClickBtnWithTag: sender.tag];
}
@end
