//
//  CustomDrawingViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/11.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CustomDrawingViewController.h"

@interface CustomDrawingViewController ()

@end

@implementation CustomDrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}

-(void)makeUI
{
    // -drawRect: 方法没有默认的实现，因为对UIView来说，寄宿图并不是必须的，它不在意那到底是单调的颜色还是有一个图片的实例。如果UIView检测到-drawRect: 方法被调用了，它就会为视图分配一个寄宿图，这个寄宿图的像素尺寸等于视图大小乘以 contentsScale的值。如果你不需要寄宿图，那就不要创建这个方法了，这会造成CPU资源和内存的浪费，这也是为什么苹果建议：如果没有自定义绘制的任务就不要在子类中写一个空的-drawRect:方法。
    
    
    //create sublayer
    _blueLayer = [CALayer layer];
    _blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    _blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //set controller as layer delegate
    
    //这里设置delegate 一定程度上会造成崩溃 原因不明 //这地方是弱引用 原因还是不明
    //_blueLayer.delegate = self ;
    
    //ensure that layer backing image uses correct scale
    _blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
    
    [_blueLayer display];
    [self.view.layer addSublayer:_blueLayer];
   // [self drawLayer:blueLayer inContext:nil];
   

    
    
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
   
}


//-(void)viewWillDisappear:(BOOL)animated
//{
//    _blueLayer =nil;
//    _blueLayer.delegate=nil;
//    [_blueLayer removeFromSuperlayer];
//    
//}


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
