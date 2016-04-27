//
//  Layer01ViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/9.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "Layer01ViewController.h"

@interface Layer01ViewController ()

@end

@implementation Layer01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _view01=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CALayer * blueLayer =[CALayer layer];
    blueLayer.frame=CGRectMake(100, 100, 100, 100);
    blueLayer.backgroundColor=[UIColor blueColor].CGColor;
    [_view01.layer addSublayer:blueLayer];
    _view01.backgroundColor=[UIColor redColor];
    // NSLog(@"wooork");
    
    [self.view addSubview:_view01];
    
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
