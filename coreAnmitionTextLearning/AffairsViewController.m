//
//  AffairsViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "AffairsViewController.h"

@interface AffairsViewController ()

@end

@implementation AffairsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
-(void)makeUI
{
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(100.0f, 70.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.view.layer addSublayer:self.colorLayer];
    
    UIButton * changeColorButton =[[UIButton alloc]init];
    changeColorButton.frame=CGRectMake(125, 180, 50, 30);
    [changeColorButton setBackgroundColor:[UIColor redColor]];
    [changeColorButton addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeColorButton];
    
    
}
- (void)changeColor
{
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;                                                                                      
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
