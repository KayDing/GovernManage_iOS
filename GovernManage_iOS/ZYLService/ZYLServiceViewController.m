//
//  ZYLServiceViewController.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/17.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLServiceViewController.h"
#import "ZYLServiceCell.h"
#import "ZYLURLManage.h"
#import "ZYLWebViewController.h"

@interface ZYLServiceViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *serviceTab;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation ZYLServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.serviceTab];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLServiceCell *cell = [ZYLServiceCell cellWithTableView:tableView];
    cell.img = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *urlStr = [[NSString alloc] init];
    NSString *titleStr = [[NSString alloc] init];
    switch (indexPath.row) {
        case 0:
            urlStr = lifeURL;
            titleStr = @"生活";
            break;
        case 1:
            urlStr = readURL;
            titleStr = @"学习";
            break;
        case 2:
            urlStr = exerciseURL;
            titleStr = @"锻炼";
            break;
        case 3:
            urlStr = tourURL;
            titleStr = @"旅游";
            break;
        default:
            break;
    }
    ZYLWebViewController *vc = [[ZYLWebViewController alloc] init];
    vc.urlStr = urlStr;
    vc.titleStr = titleStr;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (int i = 0; i < 4; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"a%d",i+1]];
            [_dataArray addObject: image];
        }
    }
    return _dataArray;
}

- (UITableView *)serviceTab{
    if (!_serviceTab) {
        _serviceTab = [[UITableView alloc] initWithFrame: self.view.frame style:UITableViewStylePlain];
        _serviceTab.dataSource = self;
        _serviceTab.delegate = self;
        _serviceTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _serviceTab.rowHeight = 150;
    }
    return _serviceTab;
}

@end
