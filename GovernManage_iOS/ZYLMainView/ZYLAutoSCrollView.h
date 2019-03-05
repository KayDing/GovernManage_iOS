//
//  ZYLAutoSCrollView.h
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/19.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYLAutoSCrollView;

NS_ASSUME_NONNULL_BEGIN

@protocol ZYLAutoScrollViewDelegate <NSObject>

- (void)didClickPage:(ZYLAutoSCrollView *)view atIndex:(NSInteger)index;

@end

@interface ZYLAutoSCrollView : UIView
{
    __unsafe_unretained id <ZYLAutoScrollViewDelegate> _delegate;
}
@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, copy) NSArray *imageViewAry;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) id <ZYLAutoScrollViewDelegate> delegate;

-(void)shouldAutoShow:(BOOL)shouldStart;
@end

NS_ASSUME_NONNULL_END
