//
//  CAGradientLayerViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/25.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
    [self setselfView];
}

-(void)makeUI
{
    _firstView=[[UIView alloc]init];
    _firstView.frame=CGRectMake(50, 70, 150, 150);
    [self.view addSubview:_firstView];
    
    _firstView2=[[UIView alloc]init];
    _firstView2.frame=CGRectMake(50, 270, 150, 150);
    [self.view addSubview:_firstView2];
    
}

-(void)setselfView
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame =_firstView.bounds;
    [_firstView.layer addSublayer:gradientLayer];
    
    //set gradient colors
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    
    //set gradient start and end points
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    
    //create gradient layer and add it to our container view
    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
    gradientLayer2.frame = _firstView2.bounds;
    [_firstView2.layer addSublayer:gradientLayer2];
    
    //set gradient colors
    gradientLayer2.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id) [UIColor yellowColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];
    
    //set locations
    gradientLayer2.locations = @[@0.0, @0.5, @0.25];
    
    //set gradient start and end points
    gradientLayer2.startPoint = CGPointMake(0, 0);
    gradientLayer2.endPoint = CGPointMake(1, 1);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
