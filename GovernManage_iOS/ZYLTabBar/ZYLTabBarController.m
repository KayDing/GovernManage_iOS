//
//  ZYLTabBarController.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/17.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLTabBarController.h"
#import "ZYLBaseTabBar.h"
#import "ZYLRootViewController.h"
#import "ZYLServiceViewController.h"
#import "ZYLPersonalViewController.h"

@interface ZYLTabBarController () <ZYLTabBarViewDelegate>
@property (strong, nonatomic) ZYLBaseTabBar *tabBar;
@property (strong, nonatomic) NSMutableArray *btnArr;
@end

@implementation ZYLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnArr = [NSMutableArray array];
    // 利用 KVC 来使用自定义的tabBar；
    self.tabBar = [[ZYLBaseTabBar alloc] init];
    self.tabBar.tabBarView.tbViewDelegate = self;
    [self setValue:self.tabBar forKey:@"tabBar"];
    
    [self addAllChildViewController];
    [self.tabBar.tabBarView setArray: self.btnArr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

// 添加全部的 childViewcontroller
- (void)addAllChildViewController
{
    ZYLRootViewController *homeVC = [[ZYLRootViewController alloc] init];
    [self addChildViewController:homeVC title:@"首页" imageNamed: @"house_default" selectedImageNamed: @"house_highlight"];
    
    
    ZYLServiceViewController *findVC = [[ZYLServiceViewController alloc] init];
    [self addChildViewController:findVC title:@"服务列表" imageNamed:@"service_default" selectedImageNamed:@"service_highlight"];
    
    ZYLPersonalViewController *mineVC = [[ZYLPersonalViewController alloc] init];
    [self addChildViewController:mineVC title:@"个人中心" imageNamed: @"personal_default" selectedImageNamed:@"personal_highlight"];
}

// 添加某个 childViewController
- (void)addChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageNamed selectedImageNamed:(NSString *)selectedImageName
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    // 如果同时有navigationbar 和 tabbar的时候最好分别设置它们的title
    vc.navigationItem.title = title;
    nav.tabBarItem.title = title;
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed: imageNamed] forState: UIControlStateNormal];
    [btn setImage:[UIImage imageNamed: selectedImageName] forState: UIControlStateDisabled];
    [self.btnArr addObject: btn];
    
    [self addChildViewController:nav];
}

#pragma mark - MSCustomTabBarViewDelegate
-(void)tabBarView:(ZYLTabBarView *)view didSelectedItemAtIndex:(NSInteger)index
{
    // 切换到对应index的viewController
    self.selectedIndex = index;
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
