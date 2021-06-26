//
//  JZShowView.h
//  downBigImage
//
//  Created by shaolei on 17/2/17.
//  Copyright © 2017年 sl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ShowType)
{
    ShowYear,
    ShowMonth,
    ShowWeek
};

@interface SLHistogramView : UIView

- (instancetype)initWithFrame:(CGRect)frame dateArray:(NSArray *)dataArray Xtype:(ShowType)type leftX:(float)x;

@end
