//
//  DrawingViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/7/6.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "DrawingViewController.h"
#import "DrawingView.h"
@interface DrawingViewController ()
@property(nonatomic,strong)DrawingView * Dview;
@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Dview  =[[DrawingView alloc]init];
    _Dview.frame=CGRectMake(0, 0, 300, 300);
    _Dview.backgroundColor=[UIColor blackColor];
    [self.view addSubview:_Dview];
    
    UIButton * button = [[UIButton alloc]init];
    button.frame=CGRectMake(50, 320, 100, 30);
    button.backgroundColor=[UIColor lightGrayColor];
    [button setTitle:@"换色" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(removeDrawed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)removeDrawed{
    _Dview.shapeLayer.strokeColor= [UIColor whiteColor].CGColor;
    [_Dview setNeedsDisplay];
    
    
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
