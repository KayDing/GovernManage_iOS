//
//  ZYLCellBtnModel.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/19.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLCellBtnModel.h"

@implementation ZYLCellBtnModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.btnName = dic[@"btnName"];
        self.btnImg = dic[@"btnImg"];
        self.tag = dic[@"tag"];
    }
    return self;
}

+ (instancetype)ZYLCellBtnModelModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDic: dict];
}

@end
