//
//  CAMediaTimingViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/5/4.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CAMediaTimingViewController.h"

@interface CAMediaTimingViewController ()

@end

@implementation CAMediaTimingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
    [self MakeUI2];
}

-(void)makeUI
{
    //持续和重复
    /*CAMediaTiming另外还有一个属性叫做repeatCount，代表动画重复的迭代次数。如果duration是2，repeatCount设为3.5（三个半迭代），那么完整的动画时长将是7秒。
     
     duration和repeatCount默认都是0。但这不意味着动画时长为0秒，或者0次，这里的0仅仅代表了“默认”，也就是0.25秒和1次*/
    
    
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 100, 100);
    self.shipLayer.position = CGPointMake(150, 150);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"22"].CGImage;
    [self.view.layer addSublayer:self.shipLayer];
    
    _durationField =[[UITextField alloc]init];
    _durationField.frame=CGRectMake(100, 210, 50, 30);
    _durationField.textColor=[UIColor blackColor];
    _durationField.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_durationField];
    
    _repeatField =[[UITextField alloc]init];
    _repeatField.frame=CGRectMake(170, 210, 50, 30);
    _repeatField.textColor=[UIColor blackColor];
    _repeatField.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_repeatField];
    
    _startButton =[[UIButton alloc]init];
    _startButton.frame=CGRectMake(230, 210, 50, 30);
    [_startButton setBackgroundColor:[UIColor redColor]];
    [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_startButton];
    
    
}
- (void)start
{
    CFTimeInterval duration = [self.durationField.text doubleValue];
    float repeatCount = [self.repeatField.text floatValue];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
    //disable controls
    [self setControlsEnabled:NO];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //reenable controls
    [self setControlsEnabled:YES];
}


- (void)setControlsEnabled:(BOOL)enabled
{
    
    //这个写法。。。
    for (UIControl *control in @[self.durationField, self.repeatField, self.startButton]) {
        control.enabled = enabled;
        control.alpha = enabled? 1.0f: 0.25f;
    }
}

//
/*我们用了autoreverses来使门在打开后自动关闭，在这里我们把repeatDuration设置为INFINITY，于是动画无限循环播放，设置repeatCount为INFINITY也有同样的效果。注意repeatCount和repeatDuration可能会相互冲突，所以你只要对其中一个指定非零值。对两个属性都设置非0值的行为没有被定义。*/

/*  CABasicAnimation *animation = [CABasicAnimation animation];
 animation.keyPath = @"transform.rotation.y";
 animation.toValue = @(-M_PI_2);
 animation.duration = 2.0;
 animation.repeatDuration = INFINITY;
 animation.autoreverses = YES;
 [doorLayer addAnimation:animation forKey:nil];*/


/*********相对时间**********/

-(void)MakeUI2{
    
    
    self.bezierPath = [[UIBezierPath alloc] init];
    [self.bezierPath moveToPoint:CGPointMake(0, 300)];
    [self.bezierPath addCurveToPoint:CGPointMake(300, 300) controlPoint1:CGPointMake(75, 150) controlPoint2:CGPointMake(225,450)];
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = self.bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.view.layer addSublayer:pathLayer];
    //add the ship
    self.shipLayer2 = [CALayer layer];
    self.shipLayer2.frame = CGRectMake(0, 0, 64, 64);
    self.shipLayer2.position = CGPointMake(0, 300);
    self.shipLayer2.contents = (__bridge id)[UIImage imageNamed: @"22"].CGImage;
    [self.view.layer addSublayer:self.shipLayer2];
    
    
    UIButton * button =[[UIButton alloc]init];
    button.frame=CGRectMake(230, 400, 50, 30);
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
}

- (void)updateSliders
{
    CFTimeInterval timeOffset = self.timeOffsetSlider.value;
    self.timeOffsetLabel.text = [NSString stringWithFormat:@"%0.2f", timeOffset];
    float speed = self.speedSlider.value;
    self.speedLabel.text = [NSString stringWithFormat:@"%0.2f", speed];
}

- (void)play
{
    //create the keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.timeOffset = self.timeOffsetSlider.value;
    animation.speed = self.speedSlider.value;
    animation.duration = 1.0;
    animation.path = self.bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.removedOnCompletion = NO;
    [self.shipLayer2 addAnimation:animation forKey:@"slide"];
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
