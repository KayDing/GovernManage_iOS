//
//  ZYLTabBarView.h
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/17.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYLTabBarView;

@protocol ZYLTabBarViewDelegate <NSObject>

- (void)tabBarView:(ZYLTabBarView *) view didSelectedItemAtIndex:(NSInteger) index;

@end
NS_ASSUME_NONNULL_BEGIN

@interface ZYLTabBarView : UIView

@property (nonatomic, weak)id<ZYLTabBarViewDelegate> tbViewDelegate;
@property (strong, nonatomic) NSMutableArray *array;

@end

NS_ASSUME_NONNULL_END
