//
//  MaskViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/12.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self   makeUI3];
    [self makeUI ];
    // Do any additional setup after loading the view.
}
-(void)makeUI3
{
    self.view.backgroundColor=[UIColor grayColor];
  
    //蒙版 是这么做 但是 还是不是很清楚
    
    //image
    UIImageView * imagemask =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4"]];
    imagemask.frame=CGRectMake(100, 100, 150, 150);
    imagemask.backgroundColor=[UIColor clearColor];
    [self.view addSubview:imagemask];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame =self.view.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"1"];
    maskLayer.contents = (__bridge id _Nullable)(maskImage.CGImage);
   // maskLayer.contents = (__bridge id _Nullable)(maskImage.CGImage);
    // [self.view.layer addSublayer:maskLayer];
    
    //核心
    /*这个属性本身就是个CALayer类型，有和其他图层一样的绘制和布局属性。它类似于一个子图层，相对于父图层（即拥有该属性的图层）布局，但是它却不是一个普通的子图层。不同于那些绘制在父图层中的子图层，mask图层定义了父图层的部分可见区域。
     
     mask图层的Color属性是无关紧要的，真正重要的是图层的轮廓。mask属性就像是一个饼干切割机，mask图层实心的部分会被保留下来，其他的则会被抛弃。（如图4.12）
     
     如果mask图层比父图层要小，只有在mask图层里面的内容才是它关心的，除此以外的一切都会被隐藏起来。*/
    imagemask.layer.mask=maskLayer;
    
    
}


-(void)makeUI
{
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(75, 300);
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(225, 300);
    button2.alpha = 0.5;
    [self.view addSubview:button2];
    
    
/*理想状况下，当你设置了一个图层的透明度，你希望它包含的整个图层树像一个整体一样的透明效果。你可以通过设置Info.plist文件中的UIViewGroupOpacity为YES来达到这个效果，但是这个设置会影响到这个应用，整个app可能会受到不良影响。如果UIViewGroupOpacity并未设置，iOS 6和以前的版本会默认为NO（也许以后的版本会有一些改变）*/
    
    // iOS9 已经不需要设置这句话 
//    button2.layer.shouldRasterize = YES;
//    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    //ios6 以前不加上两句 效果如下
    UIImageView * imagegone =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"11"]];
    imagegone.frame = CGRectMake(0 ,350, 300, 60);
    [self.view addSubview:imagegone];
    
    
}

//封装式 button
- (UIButton *)customButton
{
    //create button
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    
    //add label
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"Hello World";
    label.backgroundColor=[UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return button;
    
    
    
    
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
