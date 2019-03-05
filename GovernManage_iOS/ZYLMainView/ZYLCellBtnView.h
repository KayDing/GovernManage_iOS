//
//  cellBtnView.h
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/19.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYLCellBtnModel;

NS_ASSUME_NONNULL_BEGIN
@protocol ZYLCellBtnViewDelegate <NSObject>

- (void)didClickBtnWithTag:(NSInteger)tag;

@end

@interface ZYLCellBtnView : UIView

@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) UILabel *lab;
@property (strong, nonatomic) ZYLCellBtnModel *model;
@property (assign, nonatomic) id <ZYLCellBtnViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
