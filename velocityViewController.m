//
//  velocityViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/5/4.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "velocityViewController.h"

@interface velocityViewController ()

@end

@implementation velocityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    UIButton * button =[[UIButton alloc]init];
    button.frame=CGRectMake(100, 400, 50, 30);
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
- (void)changeColor
{
    //create a keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //add timing function
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
     CAMediaTimingFunction *fn1 = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    animation.timingFunctions = @[fn,fn1,fn];//什么用？看不出来
    
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //configure the transaction
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    /*kCAMediaTimingFunctionLinear
//     kCAMediaTimingFunctionEaseIn
//     kCAMediaTimingFunctionEaseOut
//     kCAMediaTimingFunctionEaseInEaseOut
//     kCAMediaTimingFunctionDefault*/
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    //set the position
//    self.colorLayer.position = [[touches anyObject] locationInView:self.view];
//    //commit transaction
//    [CATransaction commit];
    
    /*UIViewAnimationOptionCurveEaseInOut
     UIViewAnimationOptionCurveEaseIn
     UIViewAnimationOptionCurveEaseOut
     UIViewAnimationOptionCurveLinear*/
    [UIView animateWithDuration:1.0 delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         //set the position
                         self.colorLayer.position = [[touches anyObject] locationInView:self.view];
                     }
                     completion:NULL];
}
/*kCAMediaTimingFunctionLinear选项创建了一个线性的计时函数，同样也是CAAnimation的timingFunction属性为空时候的默认函数。线性步调对于那些立即加速并且保持匀速到达终点的场景会有意义（例如射出枪膛的子弹），但是默认来说它看起来很奇怪，因为对大多数的动画来说确实很少用到。
 
 kCAMediaTimingFunctionEaseIn常量创建了一个慢慢加速然后突然停止的方法。对于之前提到的自由落体的例子来说很适合，或者比如对准一个目标的导弹的发射。
 
 kCAMediaTimingFunctionEaseOut则恰恰相反，它以一个全速开始，然后慢慢减速停止。它有一个削弱的效果，应用的场景比如一扇门慢慢地关上，而不是砰地一声。
 
 kCAMediaTimingFunctionEaseInEaseOut创建了一个慢慢加速然后再慢慢减速的过程。这是现实世界大多数物体移动的方式，也是大多数动画来说最好的选择。如果只可以用一种缓冲函数的话，那就必须是它了。那么你会疑惑为什么这不是默认的选择，实际上当使用UIView的动画方法时，他的确是默认的，但当创建CAAnimation的时候，就需要手动设置它了。
 
 最后还有一个kCAMediaTimingFunctionDefault，它和kCAMediaTimingFunctionEaseInEaseOut很类似，但是加速和减速的过程都稍微有些慢。它和kCAMediaTimingFunctionEaseInEaseOut的区别很难察觉，可能是苹果觉得它对于隐式动画来说更适合（然后对UIKit就改变了想法，而是使用kCAMediaTimingFunctionEaseInEaseOut作为默认效果），虽然它的名字说是默认的，但还是要记住当创建显式的CAAnimation它并不是默认选项（换句话说，默认的图层行为动画用kCAMediaTimingFunctionDefault作为它们的计时方法）。*/


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
