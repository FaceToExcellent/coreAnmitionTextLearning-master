//
//  CAMediaTimingViewController.h
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/5/4.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "PostViewController.h"

@interface CAMediaTimingViewController : PostViewController
@property (nonatomic, strong)  UITextField *durationField;
@property (nonatomic, strong)  UITextField *repeatField;
@property (nonatomic, strong)  UIButton *startButton;
@property (nonatomic, strong) CALayer *shipLayer;


//@property (nonatomic, strong)  UILabel *speedLabel;
//@property (nonatomic, strong)  UILabel *timeOffsetLabel;
@property (nonatomic, strong)  UISlider *speedSlider;
@property (nonatomic, strong)  UISlider *timeOffsetSlider;
@property (nonatomic, strong)  UIBezierPath *bezierPath;
@property (nonatomic, strong)  CALayer *shipLayer2;
@end
