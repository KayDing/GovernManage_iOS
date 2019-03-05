//
//  ZYLPersonalViewController.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/17.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLPersonalViewController.h"
#import <Masonry.h>

@interface ZYLPersonalViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *personalTab;
@property (strong, nonatomic) UIButton *userIconBtn;
@property (strong, nonatomic) UILabel *userNameLab;
@property (strong, nonatomic) UIImageView *bkgImg;
@property (strong, nonatomic) NSArray *dataArr;
@end

@implementation ZYLPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHue:0.0000 saturation:0.0000 brightness:0.9183 alpha:1.0];
    
    [self loadingView];
}


- (void)loadingView{
    [self.view addSubview: self.bkgImg];
    [self.view addSubview: self.userIconBtn];
    [self.view addSubview: self.userNameLab];
    [self.view addSubview: self.personalTab];
    
    [_bkgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(0);
        make.centerX.equalTo(self.view.mas_centerX).mas_offset(0);;
        make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
        make.height.mas_equalTo(350);
    }];
    
    //添加约束
    [_userIconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(180);
        make.centerX.equalTo(self.view.mas_centerX).mas_offset(0);;
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70);
    }];
    
    [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(260);
        make.centerX.equalTo(self.view.mas_centerX).mas_offset(0);;
        make.width.mas_equalTo(self.view.mas_width).mas_offset(-60);
        make.height.mas_equalTo(30);
    }];
    
    [_personalTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(300);
        make.centerX.equalTo(self.view.mas_centerX).mas_offset(0);;
        make.width.mas_equalTo(self.view.mas_width).mas_offset(-30);
        make.height.mas_equalTo(300);
    }];
}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataArr[indexPath.row][@"text"];
    cell.imageView.image = [UIImage imageNamed: self.dataArr[indexPath.row][@"image"]];
    return cell;
}



#pragma mark - 懒加载
//头像加载
- (UIButton *)userIconBtn{
    if (!_userIconBtn) {
        _userIconBtn = [[UIButton alloc] init];
        [_userIconBtn setImage:[UIImage imageNamed:@"head"] forState:UIControlStateNormal];
        _userIconBtn.layer.cornerRadius = 35;
        _userIconBtn.clipsToBounds = YES;
    
    }
    return _userIconBtn;
}

//用户名标签
- (UILabel *)userNameLab{
    if (!_userNameLab) {
        _userNameLab = [[UILabel alloc] init];
        _userNameLab.textAlignment = NSTextAlignmentCenter;
        _userNameLab.textColor = [UIColor blackColor];
        _userNameLab.text = @"1111111";
    }
    return _userNameLab;
}

- (UIImageView *)bkgImg{
    if (!_bkgImg) {
        _bkgImg = [[UIImageView alloc] init];
        _bkgImg.image = [UIImage imageNamed: @"head"];
        //毛玻璃效果 （背景）
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
        effectview.frame = CGRectMake(0, 0, self.view.frame.size.width, 350);
        //修改透明度
        effectview.alpha = 0.8f;
        [_bkgImg addSubview: effectview];
    }
    return _bkgImg;
}

- (UITableView *)personalTab{
    if (!_personalTab) {
        _personalTab = [[UITableView alloc] initWithFrame:CGRectMake(15, 400, 200, 800) style:UITableViewStylePlain];
        _personalTab.delegate = self;
        _personalTab.dataSource = self;
        _personalTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _personalTab.rowHeight = 60;
    }
    return _personalTab;
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@{@"text": @"修改昵称",
                       @"image": @"shoucang"
                       },
                     @{@"text": @"修改密码",
                       @"image": @"shoucang"
                       },
                     @{@"text": @"注销登录",
                       @"image": @"lishi"
                       },
                     @{@"text": @"版本更新",
                       @"image": @"update"
                       },
                     @{@"text": @"关于",
                       @"image": @"about"}];
    }
    return _dataArr;
}
@end
