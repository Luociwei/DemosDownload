//
//  ViewController.m
//  Histogram
//
//  Created by admin on 17/5/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "HistogramView.h"

#define KWidth    [UIScreen mainScreen].bounds.size.width
#define KHeight   [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@property(nonatomic, strong)HistogramView *histogramView;//画图的view
@property(nonatomic, strong)NSArray *x_arr;//x轴数据数组
@property(nonatomic, strong)NSArray *y_arr;//y轴数据数组

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.histogramView];
    
//    _histogramView.MAX_value = 80;
    
    _histogramView.MIN_value = 60;
    
    [self.histogramView drawZhuZhuangTu:self.x_arr and:self.y_arr];
    
    UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(0,KHeight-150,KWidth,50)];
    textLab.text = @"Value<=60:red Value>=80:green else:blue";
    textLab.textColor = [UIColor redColor];
    textLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLab];

}
- (NSArray *)x_arr{
    
    if (!_x_arr) {
        
        _x_arr = @[@"北京", @"上海", @"广州", @"深圳", @"武汉", @"成都"];
        
    }
    
    return _x_arr;
}


- (NSArray *)y_arr{
    
    if (!_y_arr) {
        
        _y_arr = @[@"66", @"70", @"90", @"60", @"40", @"77"];
    }
    
    return _y_arr;
}




- (HistogramView *)histogramView{
    
    if (!_histogramView) {
        
        _histogramView = [[HistogramView alloc] init];
        _histogramView.frame = CGRectMake(0, 100, KWidth, KWidth);

    }
    
    return _histogramView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
