//
//  anchorPoint ViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/11.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "anchorPointViewController.h"

@interface anchorPointViewController ()

@end

@implementation anchorPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
    [self makeUI2];
    
}

-(void)makeUI
{
    
    _timeView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"表盘"]];
    _timeView.frame= CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_WIDTH);
    [self.view addSubview:_timeView];
    
    _hourHand =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"时针"]];
    _hourHand.frame= CGRectMake(SCREEN_WIDTH/2 -30 ,100, 60, SCREEN_WIDTH/2-40);
    _hourHand.backgroundColor=[UIColor clearColor];
    [_timeView  addSubview:_hourHand];
    
    _minuteHand =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"分针"]];
    _minuteHand.frame= CGRectMake(SCREEN_WIDTH/2 -20 , 100, 40, SCREEN_WIDTH/2-40);
    _minuteHand.backgroundColor=[UIColor clearColor];
    [_timeView  addSubview:_minuteHand];
    
    _secondHand =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"秒针"]];
    _secondHand.frame= CGRectMake(SCREEN_WIDTH/2 -10 , 100, 20, SCREEN_WIDTH/2-40);
    _secondHand.backgroundColor=[UIColor clearColor];
    [_timeView  addSubview:_secondHand];
    
    
    //锚点
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    [self tick];
    
}


- (void)tick
{
    NSCalendar * calender =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute| NSCalendarUnitSecond;
    
    
    
    NSDateComponents *components =[calender components:units fromDate:[NSDate date]];
     CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    
     CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
     CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
    
}


-(void)makeUI2
{
    _greenView =[[UIImageView alloc]init];
    _greenView.frame=CGRectMake(100, SCREEN_WIDTH+70, 50, 50);
    _greenView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_greenView];
    
    _redView =[[UIImageView alloc]init];
    _redView.frame=CGRectMake(125, SCREEN_WIDTH+95, 50, 50);
    _redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_redView];
    
    //这句能改变视图的上下顺序
    //greenView.layer.zPosition = 1.0f;
    
    
    
   [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
    
}

-(void)changeView
{
    static BOOL n = YES;
    if (n) {
        [UIView animateWithDuration:0.2 animations:^{
            _greenView.layer.zPosition = 1.0f;
            _redView.layer.zPosition=0.0f;
        }];
        n = NO;
        
    }else
    {
        [UIView animateWithDuration:1.0 animations:^{
            _greenView.layer.zPosition = 0.0f;
            _redView.layer.zPosition=1.0f;
        }];
        
        n=YES;
    }
    
   
    
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
