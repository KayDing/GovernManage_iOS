//
//  ZYLCellBtnModel.h
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/19.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYLCellBtnModel : NSObject
@property (copy, nonatomic) NSString *btnName;
@property (copy, nonatomic) NSString *btnImg;
@property (assign, nonatomic) NSNumber *tag;

- (instancetype)initWithDic:(NSDictionary*)dic;
+ (instancetype)ZYLCellBtnModelModelWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
