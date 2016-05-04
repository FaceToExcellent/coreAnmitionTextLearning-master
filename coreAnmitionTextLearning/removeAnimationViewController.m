//
//  removeAnimationViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/5/4.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "removeAnimationViewController.h"

@interface removeAnimationViewController ()

@end

@implementation removeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self MakeUI];
}

-(void)MakeUI
{
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake(150, 150);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"22"].CGImage;
    [self.view.layer addSublayer:self.shipLayer];
    
    
    UIButton * start =[[UIButton alloc]init];
    start.frame=CGRectMake(50, 230, 100, 30);
    [start setBackgroundColor:[UIColor greenColor]];
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
    
    UIButton * stop =[[UIButton alloc]init];
    stop.frame=CGRectMake(175, 230, 100, 30);
    [stop setBackgroundColor:[UIColor redColor]];
    [stop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stop];

    
}

- (void)start
{
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
}

- (void)stop
{
    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //log that the animation stopped
    NSLog(@"The animation stopped (finished: %@)", flag? @"YES": @"NO");
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
