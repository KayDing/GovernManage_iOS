//
//  ZYLImageScrollView.m
//  GovernManage_iOS
//
//  Created by 丁磊 on 2019/2/19.
//  Copyright © 2019 丁磊. All rights reserved.
//

#import "ZYLImageScrollView.h"

@implementation ZYLImageScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
}

- (void)setImgArr:(NSArray *)imgArr{
    _imgArr = imgArr;
    for (int i = 0; i < self.imgArr.count; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15 + i*165, 15, 150, 100)];
        img.image = self.imgArr[i];
        [self addSubview: img];
    }
    self.contentSize = CGSizeMake(15+imgArr.count*165, 100);
    self.scrollEnabled = YES;
}

@end
