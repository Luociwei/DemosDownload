//
//  HistogramView.m
//  Histogram
//
//  Created by admin on 17/5/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "HistogramView.h"

#define margin      30
#define KWidth     self.bounds.size.width
#define KHeight    self.bounds.size.height

@implementation HistogramView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
    }
    
    return self;
}

//画柱状图
- (void)drawZhuZhuangTu:(NSArray *)x_itemArr and:(NSArray *)y_itemArr{

    float max;
    float min;
    
    if (_MAX_value) {
        max = _MAX_value;
    }else{
        max = 101;
    }
    
    if (_MIN_value) {
        min = _MIN_value;
    }else{
        min = -1;
    }
    //建立坐标轴
    [self drawZuoBiaoXi:x_itemArr];
    
    //画柱状图
    for (int i=0; i<x_itemArr.count; i++) {
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(2*margin+1.5*margin*i, KHeight-margin-3*[y_itemArr[i] floatValue], 0.8*margin, 3*[y_itemArr[i] floatValue])];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        
        UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(2*margin+1.5*margin*i, KHeight-margin-3*[y_itemArr[i] floatValue]-20, 0.8*margin, 20)];
        textLab.text = y_itemArr[i];
        [self addSubview:textLab];
        
        if ([y_itemArr[i] floatValue]<=min) {
            layer.fillColor = [UIColor redColor].CGColor;
        }else if ([y_itemArr[i] floatValue]>=max){
            layer.fillColor = [UIColor greenColor].CGColor;
        }else{
            layer.fillColor = [UIColor blueColor].CGColor;
        }
//        layer.fillColor = zzRandomColor.CGColor;
        layer.strokeColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:layer];
    }
    
}

//画坐标轴
- (void)drawZuoBiaoXi:(NSArray *)x_itemArr{
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //坐标轴原点
    CGPoint rPoint = CGPointMake(margin, KHeight-margin);
    
    //画y轴
    [path moveToPoint:rPoint];
    [path addLineToPoint:CGPointMake(margin, margin)];
    
    //画y轴的箭头
    [path moveToPoint:CGPointMake(margin, margin)];
    [path addLineToPoint:CGPointMake(margin-5, margin+5)];
    [path moveToPoint:CGPointMake(margin, margin)];
    [path addLineToPoint:CGPointMake(margin+5, margin+5)];
    
    //画x轴
    [path moveToPoint:rPoint];
    [path addLineToPoint:CGPointMake(KWidth-margin, KHeight-margin)];
    
    //画x轴的箭头
    [path moveToPoint:CGPointMake(KWidth-margin, KHeight-margin)];
    [path addLineToPoint:CGPointMake(KWidth-margin-5, KHeight-margin-5)];
    [path moveToPoint:CGPointMake(KWidth-margin, KHeight-margin)];
    [path addLineToPoint:CGPointMake(KWidth-margin-5, KHeight-margin+5)];
    
    
    //画x轴上的标度
    for (int i=0; i<x_itemArr.count; i++) {
        
        [path moveToPoint:CGPointMake(2*margin+1.5*margin*i, KHeight-margin)];
        [path addLineToPoint:CGPointMake(2*margin+1.5*margin*i, KHeight-margin-3)];
        
    }
    
    //画y轴上的标度
    for (int i=0; i<10; i++) {
        
        [path moveToPoint:CGPointMake(margin, KHeight-2*margin-margin*i)];
        [path addLineToPoint:CGPointMake(margin+3, KHeight-2*margin-margin*i)];
    }
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.lineWidth = 2.0;
    [self.layer addSublayer:layer];
    
    //给y轴加标注
    for (int i=0; i<11; i++) {
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(margin-25, KHeight-margin-margin*i-10, 25, 20)];
        lab.text = [NSString stringWithFormat:@"%d", 10*i];
        lab.textColor = [UIColor blackColor];
        lab.font = [UIFont boldSystemFontOfSize:12];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
    }
    
    //给x轴加标注
    for (int i=0; i<x_itemArr.count; i++) {
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(2*margin+1.5*margin*i, KHeight-margin, 1*margin, 20)];
        lab.text = x_itemArr[i];
        lab.textColor = [UIColor blackColor];
        lab.font = [UIFont boldSystemFontOfSize:12];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
    }

    
}


@end
