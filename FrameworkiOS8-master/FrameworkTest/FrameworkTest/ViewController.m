//
//  ViewController.m
//  FrameworkTest
//
//  Created by ArthurWang on 16/5/30.
//  Copyright © 2016年 Arthur. All rights reserved.
//

#import "ViewController.h"

#import <FrameworkiOS8/FrameworkiOS8.h>

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UIButton *btnview;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Target Methods

- (IBAction)onClickFrameworkBtn:(id)sender
{
    NSBundle *bundle = [NSBundle bundleForClass:[FrameworkViewController class]];

    FrameworkViewController *frameworkVC = [[FrameworkViewController alloc] initWithNibName:@"FrameworkViewController" bundle:bundle];

    [self presentViewController:frameworkVC animated:YES completion:^{
        [frameworkVC displayImageView];
        
        [frameworkVC displayImageView1];
    }];
    
//    NSBundle *bundle = [NSBundle bundleForClass:[FrameworkViewController class]];
//    UIImage *image = [UIImage imageNamed:@"Canvas 4.png" inBundle:bundle compatibleWithTraitCollection:nil];
////    UIImage *image = [UIImage imageNamed:@"Canvas 4.png"];
//
//    [self.imageview setImage:image];
//
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
}

- (IBAction)onClickImageBtn:(id)sender
{
    NSBundle *bundle = [NSBundle bundleForClass:[FrameworkViewController class]];
    
    UIImage *image = [UIImage imageNamed:@"Images.bundle/LuFei" inBundle:bundle compatibleWithTraitCollection:nil];
    
    [self.imageview setImage:image];
    
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
}

@end
