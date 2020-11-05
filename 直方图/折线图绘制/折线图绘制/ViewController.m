//
//  ViewController.m
//  折线图绘制
//
//  Created by AG_TigerNong on 17/3/22.
//  Copyright © 2017年 Saftop. All rights reserved.
//

#import "ViewController.h"
#import "TNAxleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@"922",@"345",@"256",@"546",@"955",@"351",@"421",@"220",@"304",@"553",@"656",@"158"];
    
    TNAxleView *axleView = [[TNAxleView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 300) withArray:arr];
    [self.view addSubview:axleView];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
