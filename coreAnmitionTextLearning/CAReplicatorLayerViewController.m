//
//  CAReplicatorLayerViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/26.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CAReplicatorLayerViewController.h"
#import "CAReplicatorLayerView.h"
@interface CAReplicatorLayerViewController ()

@end

@implementation CAReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   //倒影
    CAReplicatorLayerView *view =[[CAReplicatorLayerView alloc]init];
    view.frame=CGRectMake(50, 70, 150, 150);
    [self.view addSubview:view];
    CAReplicatorLayer *layer = (CAReplicatorLayer *)view.layer;
    layer.instanceCount = 2;
    
    //layer.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    
    
    //move reflection instance below original and flip vertically
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = self.view.bounds.size.height/2 + 5;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    layer.instanceTransform = transform;
    
    //reduce alpha of reflection layer
    layer.instanceAlphaOffset = -0.6;
    [self setUp];
    
}

- (void)setUp
{
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = CGRectMake(150.0f, 100.0f, 10.0f, 10.0f);
    [self.view.layer addSublayer:replicator];
    
    //configure the replicator
    replicator.instanceCount = 10;
    
    //apply a transform for each instance
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 100, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -100, 0);
    replicator.instanceTransform = transform;
    
    //apply a color shift for each instance
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    //create a sublayer and place it inside the replicator
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100.0f, 100.0f, 10.0f, 10.0f);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [replicator addSublayer:layer];
   
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
