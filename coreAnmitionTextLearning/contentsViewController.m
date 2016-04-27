//
//  contentsViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/11.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "contentsViewController.h"

@interface contentsViewController ()

@end

@implementation contentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
-(void)makeUI
{
    UIImage *image = [UIImage imageNamed:@"10.png"];
    
    self.view.layer.contents = (__bridge id _Nullable)(image.CGImage);//到这是全屏的
    self.view.contentMode=UIViewContentModeScaleAspectFit;//这里用图片适应大小
    //contentsGravity的目的是为了决定内容在图层的边界中怎么对齐，我们将使用kCAGravityResizeAspect，它的效果等同于UIViewContentModeScaleAspectFit， 同时它还能在图层中等比例拉伸以适应图层的边界。
    /*kCAGravityCenter
     kCAGravityTop
     kCAGravityBottom
     kCAGravityLeft
     kCAGravityRight
     kCAGravityTopLeft
     kCAGravityTopRight
     kCAGravityBottomLeft
     kCAGravityBottomRight
     kCAGravityResize
     kCAGravityResizeAspect
     kCAGravityResizeAspectFill*/
    self.view.layer.contentsGravity = kCAGravityResizeAspect;
    //self.view.layer.contentsGravity = kCAGravityCenter;
    //寄宿图的像素尺寸和视图大小的比例，默认情况下它是一个值为1.0的浮点数。
    //这并不会对我们在使用kCAGravityResizeAspect时产生任何影响，因为它就是拉伸图片以适应图层而已，根本不会考虑到分辨率问题。但是如果我们把contentsGravity设置为kCAGravityCenter（这个值并不会拉伸图片），那将会有很明显的变化（如图2.3
    self.view.layer.contentsScale =1.0;
    
    //UIView有一个叫做clipsToBounds的属性可以用来决定是否显示超出边界的内容，CALayer对应的属性叫做masksToBounds，把它设置为YES
    self.view.layer.masksToBounds =YES;
    //CALayer的contentsRect属性允许我们在图层边框里显示寄宿图的一个子域。这涉及到图片是如何显示和拉伸的，所以要比contentsGravity灵活多了和bounds，frame不同，contentsRect不是按点来计算的，它使用了单位坐标，单位坐标指定在0到1之间，是一个相对值（像素和点就是绝对值）。所以他们是相对与寄宿图的尺寸的
    //self.view.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
    //这个属性 就是去掉右 左 下 上 %多少 然后拉伸到原来大小
    self.view.layer.contentsCenter =CGRectMake(0, 0, 1, .25);
    
    
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
