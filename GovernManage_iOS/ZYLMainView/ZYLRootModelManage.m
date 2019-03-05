//
//  ZYLRootModelManage.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/19.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLRootModelManage.h"
#import <UIKit/UIKit.h>
#import "ZYLCellBtnModel.h"

@implementation ZYLRootModelManage

+ (NSArray *)getCellBtnModel{
    NSMutableArray *modelArr = [NSMutableArray array];
    NSArray *arr = @[@{@"btnName": @"事件上传",
                       @"btnImg": @"index_icon1",
                       @"tag":@0
                         },
                     @{@"btnName": @"任务发布",
                       @"btnImg": @"index_icon2",
                       @"tag":@1
                           },
                     @{@"btnName": @"工作上传",
                       @"btnImg": @"index_icon3",
                       @"tag":@2
                           },
                     @{@"btnName": @"生活服务",
                       @"btnImg": @"index_icon4",
                       @"tag":@3
                           },
                     @{@"btnName": @"事件处理",
                       @"btnImg": @"index_icon5",
                       @"tag":@4
                           },
                     @{@"btnName": @"任务处理",
                       @"btnImg": @"index_icon6",
                       @"tag":@5
                           },
                     @{@"btnName": @"日常工作",
                       @"btnImg": @"index_icon7",
                       @"tag":@6
                           },
                     @{@"btnName": @" 城市服务",
                       @"btnImg": @"index_icon8",
                       @"tag":@7
                           }];
    for (int i = 0; i < arr.count; i++) {
        ZYLCellBtnModel *model = [ZYLCellBtnModel ZYLCellBtnModelModelWithDict: arr[i]];
        [modelArr addObject: model];
    }
    return [modelArr copy];
}

+ (NSArray *)getImageArray{
    NSArray *arr = @[[UIImage imageNamed: @"pop_activity1"],
                     [UIImage imageNamed: @"pop_activity2"],
                     [UIImage imageNamed: @"pop_activity3"],
                     [UIImage imageNamed: @"pop_activity4"],
                     [UIImage imageNamed: @"pop_activity5"],
                     [UIImage imageNamed: @"pop_activity6"]
                     ];
    return arr;
}

+(NSArray *)getCellImageArray{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"a%d",i+1]];
        [arr addObject: image];
    }
    return [arr copy];
}

+ (NSArray *)getBannerImageArray{
    NSArray *arr = @[[UIImage imageNamed: @"banner1"],
                     [UIImage imageNamed: @"banner2"],
                     [UIImage imageNamed: @"banner1"],
                     [UIImage imageNamed: @"banner1"]
                            ];
    NSMutableArray *imgViewArr = [NSMutableArray array];
    for (int i = 0; i < arr.count; i++) {
        UIImageView *img = [[UIImageView alloc] init];
        img.image = arr[i];
        [imgViewArr addObject: img];
    }
    return [imgViewArr copy];
}

@end
