//
//  visualeffectViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/11.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "visualeffectViewController.h"

@interface visualeffectViewController ()

@end

@implementation visualeffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
    [self makeUI2];
    //[self makeUI3];
   }

-(void)makeUI
{
    
   
    UIImageView * whiteView=[[UIImageView alloc]initWithFrame:CGRectMake(75, 125, 100, 100)];
    whiteView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    UIImageView * redView=[[UIImageView alloc]initWithFrame:CGRectMake(-50, -50, 100,100)];
    redView.backgroundColor=[UIColor redColor];
    [whiteView addSubview:redView];
    
    redView.layer.cornerRadius = 20.0f;
    whiteView.layer.cornerRadius = 20.0f;
    
    //add a border to our layers
    redView.layer.borderWidth = 5.0f;
    whiteView.layer.borderWidth = 5.0f;
    
    //enable clipping on the second layer maskToBounds属性裁剪掉了阴影和内容
    //whiteView.layer.masksToBounds = YES;
    
   //   给shadowOpacity属性一个大于默认值（也就是0）的值，阴影就可以显示在任意图层之下。shadowOpacity是一个必须在0.0（不可见）和1.0（完全不透明）之间的浮点数。如果设置为1.0，将会显示一个有轻微模糊的黑色阴影稍微在图层之上。
    whiteView.layer.shadowOpacity=0.5;
    //shadowColor属性控制着阴影的颜色，和borderColor和backgroundColor一样，它的类型也是CGColorRef。阴影默认是黑色，
    whiteView.layer.shadowColor= [UIColor greenColor].CGColor;
    // shadowOffset属性控制着阴影的方向和距离。它是一个CGSize的值，宽度控制这阴影横向的位移，高度控制着纵向的位移。shadowOffset的默认值是 {0, -3}，意即阴影相对于Y轴有3个点的向上位移。
    whiteView.layer.shadowOffset=CGSizeMake(13.0f, 1.0f);
    
    //whiteView 上面加阴影 子视图也会有阴影效果，超出部分
    
}


-(void)makeUI2
{
    UIImageView * whiteView2=[[UIImageView alloc]initWithFrame:CGRectMake(20,300, 100, 132)];
    whiteView2.backgroundColor=[UIColor clearColor];
    whiteView2.image=[UIImage imageNamed:@"3"];
    [self.view addSubview:whiteView2];
    
    UIImageView * redView=[[UIImageView alloc]initWithFrame:CGRectMake(150,300, 100,132)];
    redView.backgroundColor=[UIColor clearColor];
    redView.image=[UIImage imageNamed:@"3"];
    [self.view addSubview:redView];
    
    whiteView2.layer.shadowOpacity=0.5;
    redView.layer.shadowOpacity=0.5;
    
//    redView.layer.borderWidth = 0.5f;
//    whiteView2.layer.borderWidth = 0.5f;
    
    
    whiteView2.layer.shadowOffset=CGSizeMake(3, 3);
     redView.layer.shadowOffset=CGSizeMake(3, 3);
    //方形阴影
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL,whiteView2.bounds);
    whiteView2.layer.shadowPath = squarePath; CGPathRelease(squarePath);
   //圆形阴影
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, redView.bounds);
    redView.layer.shadowPath = circlePath; CGPathRelease(circlePath);
    
    
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
