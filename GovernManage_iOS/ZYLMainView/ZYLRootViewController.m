//
//  ZYLRootViewController.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/17.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLRootViewController.h"
#import "ZYLRootCell.h"
#import "ZYLRootModelManage.h"
#import "ZYLAutoSCrollView.h"
#import "ZYLCellBtnView.h"
#import "ZYLURLManage.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface ZYLRootViewController () <UITableViewDelegate, UITableViewDataSource, ZYLAutoScrollViewDelegate, ZYLCellDelegate>

@property (strong, nonatomic) UITableView *rootTab;
@property (copy, nonatomic) NSArray *dataArr;

@end

@implementation ZYLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview: self.rootTab];
}


#pragma mark - Tab's delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 4;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLRootCell *cell = [ZYLRootCell cellWithTableView:tableView andIndexpath: indexPath];
    cell.delegate = self;
    if (indexPath.section == 2) {
        cell.image.image = self.dataArr[indexPath.row];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 2*((WIDTH-60)/4+20)+30;
    }
    else if (indexPath.section == 1){
        return 130;
    }
    else
        return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        NSString *urlStr = [[NSString alloc] init];
        switch (indexPath.row) {
            case 0:
                urlStr = lifeURL;
                break;
            case 1:
                urlStr = readURL;
                break;
            case 2:
                urlStr = exerciseURL;
                break;
            case 3:
                urlStr = tourURL;
                break;
            default:
                break;
        
        }
    }
}

#pragma mark - banner's 点击事件

- (void)didClickPage:(ZYLAutoSCrollView *)view atIndex:(NSInteger)index{
    NSLog(@"点击了第%ld页", (long)index);
}

#pragma mark - button点击事件
- (void)getTagOfBtn:(NSInteger)tag{
    NSLog(@"点击了第%ld个button",tag);
}

#pragma mark - 懒加载
- (UITableView *)rootTab{
    if (!_rootTab) {
        _rootTab = [[UITableView alloc] initWithFrame: self.view.frame style: UITableViewStyleGrouped];
        _rootTab.dataSource = self;
        _rootTab.delegate = self;
        _rootTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        ZYLAutoSCrollView *bannerView = [[ZYLAutoSCrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 250)];
        bannerView.delegate = self;
        [bannerView setImageViewAry: [ZYLRootModelManage getBannerImageArray]];
        _rootTab.tableHeaderView = bannerView;
    }
    return _rootTab;
}
- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [ZYLRootModelManage getCellImageArray];
    }
    return _dataArr;
}
@end
