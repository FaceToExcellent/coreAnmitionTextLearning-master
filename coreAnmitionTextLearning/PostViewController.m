//
//  PostViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/9.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    UIButton * _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 33, 44)];
    [_backBtn setImage:[UIImage imageNamed:@"back_btn_yel"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * _backItem = [[UIBarButtonItem alloc] initWithCustomView:_backBtn];
    //NSArray * items = [NSArray arrayWithObjects:_backItem,_logoItem, nil];
    self.navigationItem.leftBarButtonItem = _backItem;
    
    
    
    
    
    _selfView =[[UIView alloc]initWithFrame:CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
   // _selfView.backgroundColor=[[UIColor redColor]colorWithAlphaComponent:0.4];
    [self.view addSubview:_selfView];
    

}



- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
