//
//  anchorPoint ViewController.h
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/11.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface anchorPointViewController : PostViewController

@property(nonatomic,strong)UIImageView * timeView;
@property(nonatomic,strong)UIImageView * hourHand;
@property(nonatomic,strong)UIImageView * minuteHand;
@property(nonatomic,strong)UIImageView * secondHand;
@property(nonatomic,strong)UIImageView * greenView;
@property(nonatomic,strong)UIImageView * redView;

@property (nonatomic) NSTimer *timer;
@end
