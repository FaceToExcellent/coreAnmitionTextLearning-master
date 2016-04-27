//
//  CATransformLayerViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/18.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CATransformLayerViewController.h"

@interface CATransformLayerViewController ()

@end

@implementation CATransformLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
-(void)makeUI
{
    
    _scrollview =[[UIScrollView alloc]init];
    _scrollview.frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollview.backgroundColor = [UIColor whiteColor];
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.pagingEnabled = YES;
    _scrollview.delegate = self;
    _scrollview.contentSize=CGSizeMake(SCREEN_WIDTH *2, SCREEN_HEIGHT);
    
    [self.view addSubview:_scrollview];
    
    
    _image1 =[[UIImageView alloc]init];
    _image1.frame=CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT-64);
    _image1.backgroundColor=[UIColor greenColor];
    _image1.image=[UIImage imageNamed:@"10"];
    [_scrollview addSubview:_image1];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [_panGesture setMinimumNumberOfTouches:1];
    [_panGesture setMaximumNumberOfTouches:1];
    [self.view addGestureRecognizer:_panGesture];
    _image1.userInteractionEnabled=YES;
    
}
// 处理拖拉手势
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
   
    
    UIImageView *view = _image1;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }
}
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIImageView *view = _image1;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
        if (scrollView == _scrollview)
        {
            CGFloat sectionHeaderHeight = 150;
            if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
                scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
            }
            else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
                scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            }
            
            
            CGFloat sectionHeaderwith = 150;
            if (scrollView.contentOffset.x<=sectionHeaderwith&&scrollView.contentOffset.x>=0) {
                scrollView.contentInset = UIEdgeInsetsMake(0, 0, -scrollView.contentOffset.x, 0);
            }
            else if (scrollView.contentOffset.x>=sectionHeaderwith) {
                scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionHeaderwith, 0);
            }
    
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
