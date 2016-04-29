//
//  CATransitionViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/29.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
-(void)makeUI
{
    self.images = @[[UIImage imageNamed:@"1.png"],
                    [UIImage imageNamed:@"2.png"],
                    [UIImage imageNamed:@"4.png"],
                    [UIImage imageNamed:@"6.png"],
                    [UIImage imageNamed:@"10.png"]
                    ];
    
    _imageView=[[UIImageView alloc]init];
    _imageView.frame=CGRectMake(100, 70, 150, 150);
    _imageView.image=[UIImage imageNamed:@"初音未来"];
    [self.view addSubview:_imageView];
    
    UIButton * changeColorButton =[[UIButton alloc]init];
    changeColorButton.frame=CGRectMake(125, 230, 100, 30);
    [changeColorButton setBackgroundColor:[UIColor redColor]];
    [changeColorButton addTarget:self action:@selector(switchImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeColorButton];
}



- (void)switchImage
{
    //set up crossfade transition
    CATransition *transition = [CATransition animation];
    /*kCATransitionFade
     kCATransitionMoveIn
     kCATransitionPush
     kCATransitionReveal
     
*/
    transition.type = kCATransitionPush;//方式控制
    
    /*kCATransitionFromRight
     kCATransitionFromLeft
     kCATransitionFromTop
     kCATransitionFromBottom*/
    transition.subtype=kCATransitionFromRight;//方向控制
    //apply transition to imageview backing layer
    
    //和属性动画不同的是，对指定的图层一次只能使用一次CATransition，因此，无论你对动画的键设置什么值，过渡动画都会对它的键设置成“transition”，也就是常量kCATransition。
    [self.imageView.layer addAnimation:transition forKey:nil];
    //cycle to next image
    UIImage *currentImage = self.imageView.image;
    NSUInteger index = [self.images indexOfObject:currentImage];
    index = (index + 1) % [self.images count];
    self.imageView.image = self.images[index];
    
    //自定义 UIview 的方法写法
    /*  [UIView transitionWithView:self.imageView duration:1.0
     options:UIViewAnimationOptionTransitionFlipFromLeft
     animations:^{
     //cycle to next image
     UIImage *currentImage = self.imageView.image;
     NSUInteger index = [self.images indexOfObject:currentImage];
     index = (index + 1) % [self.images count];
     self.imageView.image = self.images[index];
     }
     completion:NULL];
     }*/
    
    /* uiview 自定义动画 的 type 类型
     UIViewAnimationOptionTransitionFlipFromLeft
     UIViewAnimationOptionTransitionFlipFromRight
     UIViewAnimationOptionTransitionCurlUp 
     UIViewAnimationOptionTransitionCurlDown 
     UIViewAnimationOptionTransitionCrossDissolve 
     UIViewAnimationOptionTransitionFlipFromTop 
     UIViewAnimationOptionTransitionFlipFromBottom*/
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
