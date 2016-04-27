//
//  CAEmitterLayerViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/26.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CAEmitterLayerViewController.h"

@interface CAEmitterLayerViewController ()

@end

@implementation CAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeUI];
}
-(void)makeUI
{
    //create particle emitter layer
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = CGRectMake(150, 200, 50, 50);
    [self.view.layer addSublayer:emitter];
    
    //configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive;//控制着在视觉上粒子图片是如何混合的
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);//位置
    
    //create a particle template
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"21"].CGImage;//粒子内容
    cell.birthRate = 150;//这个必须要设置，具体含义是每秒某个点产生的effectCell数量
    cell.lifetime = 5.0;//在屏幕上的显示时间要多长
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;//粒子透明度在生命周期内的改变速度；
    cell.velocity = 50;//飞行的速度
    cell.velocityRange = 50;//什么范围内飞行
    cell.emissionRange = M_PI * 2.0;//＋－角度扩散
    
    //add particle template to emitter
    emitter.emitterCells = @[cell];
    

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
