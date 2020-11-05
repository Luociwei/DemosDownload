//
//  HistogramView.h
//  Histogram
//
//  Created by admin on 17/5/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistogramView : UIView

@property(nonatomic,assign)float MAX_value;

@property(nonatomic,assign)float MIN_value;

//画柱状图
- (void)drawZhuZhuangTu:(NSArray *)x_itemArr and:(NSArray *)y_itemArr;

@end
