//
//  DrawingView.h
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/7/6.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingView : UIView
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end
