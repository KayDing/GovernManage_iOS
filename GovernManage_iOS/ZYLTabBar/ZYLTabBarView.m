//
//  ZYLTabBarView.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/17.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLTabBarView.h"
@interface ZYLTabBarView ()
@property (assign, nonatomic) NSInteger selectIndex;
@end

@implementation ZYLTabBarView

- (void)setFrame:(CGRect)frame{
    const CGFloat WIDTH = frame.size.width;
    const CGFloat HEIGHT = frame.size.height;
    for (int i = 0; i < _array.count; i++) {
        UIButton *btn = _array[i];
        btn.tag = i;
        btn.frame = CGRectMake(50+i*WIDTH/_array.count, 0, HEIGHT/3*1.3, HEIGHT/3*1.3);
        [btn addTarget:self action:@selector(selectedItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: btn];
    }
}

- (void)selectedItem:(UIButton *)sender
{
    // button的tag对应tabBarController的selectedIndex
    // 设置选中button的样式
    self.selectIndex = sender.tag;
    // 让代理来处理切换viewController的操作
    if ([self.tbViewDelegate respondsToSelector:@selector(tabBarView:didSelectedItemAtIndex:)]) {
        [self.tbViewDelegate tabBarView:self didSelectedItemAtIndex:sender.tag];
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    // 先把上次选择的item设置为可用
    UIButton *lastItem = _array[_selectIndex];
    lastItem.enabled = YES;
    // 再把这次选择的item设置为不可用
    UIButton *item = _array[selectIndex];
    item.enabled = NO;
    _selectIndex = selectIndex;
}

@end
