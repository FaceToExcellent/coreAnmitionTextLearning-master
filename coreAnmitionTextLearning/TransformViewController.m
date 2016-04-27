//
//  TransformViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/12.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];//2D
    [self makeUI2];//3D
    [self makeUI3];//灭点
    [self makeUI4];//2D 两个变换将被相互抵消。
}

-(void)makeUI
{
    
    //2D
    _whiteView2=[[UIImageView alloc]initWithFrame:CGRectMake(50,120,150, 150)];
    _whiteView2.backgroundColor=[UIColor clearColor];
    _whiteView2.image=[UIImage imageNamed:@"10"];
    [self.view addSubview:_whiteView2];
    
    
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
    
}

-(void)changeView
{
    static BOOL n = YES;
    if (n) {
        [UIView animateWithDuration:.3 animations:^{
            CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
            _whiteView2.layer.affineTransform =transform;
        }];
        n = NO;
        
    }else
    {
        [UIView animateWithDuration:.3 animations:^{
            //复合变换
            CGAffineTransform transform =CGAffineTransformIdentity;
            //缩小至 20%
            transform = CGAffineTransformScale(transform, 0.2, 0.2);
            //旋转30度
            transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
            //向右移动200
            transform = CGAffineTransformTranslate(transform, 200, 0);
            
            _whiteView2.layer.affineTransform = transform;
            
        }];
        
        n=YES;
    }
    
    
    
}


-(void)makeUI2
{
    //3D
    _whiteView=[[UIImageView alloc]initWithFrame:CGRectMake(200,250,100, 100)];
    _whiteView.backgroundColor=[UIColor clearColor];
    _whiteView.image=[UIImage imageNamed:@"1"];
    [self.view addSubview:_whiteView];
    
    //Y轴方向 旋转45度
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    
  //看起来图层并没有被旋转，而是仅仅在水平方向上的一个压缩
    _whiteView.layer.transform = transform;
    
     [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changeView2) userInfo:nil repeats:YES];
    
    
}
-(void)changeView2
{
   
    
    
    static BOOL n = YES;
    if (n) {
        [UIView animateWithDuration:3 animations:^{
            CATransform3D transform = CATransform3DIdentity;
            //m34的默认值是0，我们可以通过设置m34为-1.0 / d来应用透视效果，d代表了想象中视角相机和屏幕之间的距离，以像素为单位 那应该如何计算这个距离呢？实际上并不需要，大概估算一个就好了。
            transform.m34 =- 1.0 / 500.0;
            //rotate by 45 degrees along the Y axis
            transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
            //apply to layer
            _whiteView.layer.transform = transform;
        }];
        n = NO;
        
    }else
    {
        [UIView animateWithDuration:3 animations:^{
            CATransform3D transform = CATransform3DIdentity;
            transform.m34 = -1.0 / 500.0;
            //rotate by 45 degrees along the Y axis
            transform = CATransform3DRotate(transform, -M_PI_4, 0, 1, 0);
            //apply to layer
            _whiteView.layer.transform = transform;

            
        }];
        
        n=YES;
    }
    
    
}


-(void)makeUI3
{
    _whiteView3=[[UIImageView alloc]initWithFrame:CGRectMake(20,400, 100, 100)];
    _whiteView3.backgroundColor=[UIColor clearColor];
    _whiteView3.image=[UIImage imageNamed:@"6"];
    [self.view addSubview:_whiteView3];
    
   _redView=[[UIImageView alloc]initWithFrame:CGRectMake(150,400, 100,100)];
    _redView.backgroundColor=[UIColor clearColor];
    _redView.image=[UIImage imageNamed:@"6"];
    [self.view addSubview:_redView];
     [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeView3) userInfo:nil repeats:YES];
    
    
}
-(void)changeView3
{
    static BOOL n = YES;
    if (n) {
        [UIView animateWithDuration:2 animations:^{
            CATransform3D perspective = CATransform3DIdentity;
            perspective.m34 = - 1.0 / 500.0;
            self.view.layer.sublayerTransform = perspective;
            //rotate layerView1 by 45 degrees along the Y axis
            CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
            _whiteView3.layer.transform = transform1;
            //rotate layerView2 by 45 degrees along the Y axis
            CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
            _redView.layer.transform = transform2;
        }];
        n = NO;
        
    }else
    {
        [UIView animateWithDuration:2 animations:^{
            CATransform3D perspective = CATransform3DIdentity;
            perspective.m34 = - 1.0 / 500.0;
            self.view.layer.sublayerTransform = perspective;
            CATransform3D transform1 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
            _whiteView3.layer.transform = transform1;
            CATransform3D transform2 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
            _redView.layer.transform = transform2;
            
            
        }];
        
        n=YES;
    }

}

-(void)makeUI4
{
    //CALayer有一个叫做doubleSided的属性来控制图层的背面是否要被绘制。这是一个BOOL类型，默认为YES，如果设置为NO，那么当图层正面从相机视角消失的时候，它将不会被绘制。
    
    
    _whiteView4=[[UIImageView alloc]initWithFrame:CGRectMake(0,300, 100, 100)];
    _whiteView4.backgroundColor=[UIColor grayColor];
//    _whiteView4.image=[UIImage imageNamed:@"6"];
    [self.view addSubview:_whiteView4];
    
    _redView2=[[UIImageView alloc]initWithFrame:CGRectMake(25,325, 50,50)];
    _redView2.backgroundColor=[UIColor yellowColor];
//    _redView2.image=[UIImage imageNamed:@"6"];
    [self.view addSubview:_redView2];

         [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeView4) userInfo:nil repeats:YES];
}
-(void)changeView4
{
    static BOOL n = YES;
    if (n) {
        [UIView animateWithDuration:2 animations:^{
            CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
            _whiteView4.layer.transform = outer;
            //rotate the inner layer -45 degrees
            CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
            _redView2.layer.transform = inner;
        }];
        n = NO;
        
    }else
    {
        [UIView animateWithDuration:2 animations:^{
            CATransform3D outer = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
            _whiteView4.layer.transform = outer;
            //rotate the inner layer -45 degrees
            CATransform3D inner = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
            _redView2.layer.transform = inner;
            
            //3D 的时候不会抵消
//            CATransform3D outer1 = CATransform3DIdentity;
//            outer1.m34 = -1.0 / 500.0;
//            outer1 = CATransform3DRotate(outer1, M_PI_4, 0, 1, 0);
//            _whiteView4.layer.transform = outer1;
//            //rotate the inner layer -45 degrees
//            CATransform3D inner1 = CATransform3DIdentity;
//            inner1.m34 = -1.0 / 500.0;
//            inner1 = CATransform3DRotate(inner1, -M_PI_4, 0, 1, 0);
//            _redView2.layer.transform = inner1;
            

            
            
        }];
        
        n=YES;
    }

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
