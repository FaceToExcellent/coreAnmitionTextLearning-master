//
//  CATransformLayerViewController.h
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/18.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CATransformLayerViewController : UIViewController<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIImageView * image1;
@property(nonatomic,strong)UIScrollView * scrollview;
@property(nonatomic,strong)UIPanGestureRecognizer *panGesture;
@end
