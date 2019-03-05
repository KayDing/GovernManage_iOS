//
//  ZYLRootCell.h
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/18.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYLRootCell;

NS_ASSUME_NONNULL_BEGIN
@protocol ZYLCellDelegate <NSObject>

- (void)getTagOfBtn:(NSInteger)tag;

@end

@interface ZYLRootCell : UITableViewCell

@property (strong, nonatomic) UIImageView *image;
@property (assign, nonatomic) id<ZYLCellDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexpath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
