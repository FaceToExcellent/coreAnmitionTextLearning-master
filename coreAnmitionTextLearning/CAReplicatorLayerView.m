//
//  CAReplicatorLayerView.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/26.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CAReplicatorLayerView.h"

@implementation CAReplicatorLayerView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self makeUI];
        
    }
    return self;
}
-(void)makeUI
{
    _firstView=[[UIImageView alloc]init];
    _firstView.frame=CGRectMake(50, 70, 150, 150);
    _firstView.image=[UIImage imageNamed:@"10"];
    [self addSubview:_firstView];
    
    
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame =_firstView.bounds;
//    [_firstView.layer addSublayer:gradientLayer];
//    
//    //set gradient colors
//    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
//    
//    //set gradient start and end points
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
}

+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}


@end
