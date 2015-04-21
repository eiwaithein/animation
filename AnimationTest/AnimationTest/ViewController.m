//
//  ViewController.m
//  AnimationTest
//
//  Created by Ei Wai Wai Thein on 21/4/15.
//  Copyright (c) 2015 SAP. All rights reserved.
//

#import "ViewController.h"
#import "JNWSpringAnimation.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self addRedBall];
    //[self addRedToGreenBall];
    //[self addRedBallWithSpringAnimation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addRedToGreenBall{
    // 1. add - circle
    UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 50;
    [self.view addSubview:redBall];
    
    // 2. animation - (change background, ).
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        redBall.backgroundColor = [UIColor greenColor];
        redBall.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(2.0, 2.0), CGAffineTransformMakeTranslation(75, 0));
    } completion:nil];
}

- (void)addRedBall{
    // 1. animation - circle
    UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.width/2, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 50;
    [self.view addSubview:redBall];
    
    // 2. animation - scaling.
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        redBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
    } completion:nil];
    
}

- (void)addRedBallWithSpringAnimation{

    // 1. animation - circle
    UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.width/2, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 50;
    [self.view addSubview:redBall];
    
    // 2. spring animation.
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:0 options:0 animations:^{
        redBall.transform = CGAffineTransformMakeTranslation(70, 0);
    } completion:nil];
}

- (void)showAlertView{
    
    CGFloat alertDimension = 250;
    CGRect alertViewFrame = CGRectMake(self.view.bounds.size.width/2 - alertDimension/2, self.view.bounds.size.height/2 - alertDimension/2, alertDimension, alertDimension);
    
    UIView *overlayView  = [[UIView alloc] initWithFrame:alertViewFrame];
    overlayView.backgroundColor = [UIColor greenColor];
    overlayView.alpha = 0.0f;
    overlayView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    overlayView.layer.cornerRadius = 10;
    
    overlayView.layer.shadowColor = [UIColor blackColor].CGColor;
    overlayView.layer.shadowOffset = CGSizeMake(0, 5);
    overlayView.layer.shadowOpacity = 0.3f;
    overlayView.layer.shadowRadius = 10.0f;
    
    [self.view addSubview:overlayView];
    
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        overlayView.alpha = 0.3f;
        overlayView.alpha = 1.0f;
    } completion:nil];
    
    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    scale.damping = 14;
    scale.stiffness = 14;
    scale.mass = 1;
    scale.fromValue = @(1.2);
    scale.toValue = @(1.0);
    
    [overlayView.layer addAnimation:scale forKey:scale.keyPath];
    overlayView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    
}

- (IBAction)showAlert:(id)sender {
    [self showAlertView];
}
@end
