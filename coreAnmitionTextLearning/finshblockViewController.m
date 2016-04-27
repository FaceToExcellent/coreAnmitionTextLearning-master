//
//  finshblockViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "finshblockViewController.h"

@interface finshblockViewController ()

@end

@implementation finshblockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
-(void)makeUI
{
    //这其实就是所谓的隐式动画。之所以叫隐式是因为我们并没有指定任何动画的类型。我们仅仅改变了一个属性
    //事务实际上是Core Animation用来包含一系列属性动画集合的机制，任何用指定事务去改变可以做动画的图层属性都不会立刻发生变化,而是当事务一旦提交的时候开始用一个动画过渡到新值。
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
    //begin a new transaction
    [CATransaction begin];
    //set the animation duration to 1 second
    [CATransaction setAnimationDuration:1.0];
    //add the spin animation on completion
    [CATransaction setCompletionBlock:^{
        //rotate the layer 90 degrees
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    //commit the transaction
    [CATransaction commit];
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
