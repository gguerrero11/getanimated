//
//  ViewController.m
//  AnimatingBlocks
//
//  Created by Gabriel Guerrero on 2/27/15.
//  Copyright (c) 2015 Gabe Guerrero. All rights reserved.
//

#import "ViewController.h"
#include <math.h>
//            return |name-|  pType |param--| |-Function-----------------|
static inline double radians (double degrees) {return degrees * M_PI/180;}

@interface ViewController ()

@property (nonatomic,strong) UIView *rect;
@property (nonatomic,strong) UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
#pragma mark rotating transforming boxes
    //    self.rect = [[UIView alloc]initWithFrame:CGRectMake(150, 30, 60, 60)];
    //    self.rect.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:self.rect];
    
//        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(2, 2);
//        CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(radians (-90.0));
//    
//        [UIView animateWithDuration:3.0 animations:^{
//            self.rect.alpha = 0.0;
//            self.rect.center = CGPointMake(self.rect.center.x, self.rect.center.y + 360);
//            self.rect.transform = CGAffineTransformConcat(scaleTransform, rotationTransform);
//        } completion:^(BOOL finished) {
//            self.rect.alpha = 1.0;
//        }];
//    
//        self.yellowView = [[UIView alloc]initWithFrame:CGRectMake(150, 30, 60, 60)];
//        self.yellowView.backgroundColor = [UIColor yellowColor];
//        [self.view addSubview:self.yellowView];
//    
//        CGAffineTransform yellowScaleTransform = CGAffineTransformMakeScale(.5, .5);
//        CGAffineTransform yellowRotationTransform = CGAffineTransformMakeRotation(radians(-90.0));
//    
//        [UIView animateWithDuration:3.0 animations:^{
//            self.yellowView.alpha = 0;
//            self.yellowView.center = CGPointMake(150, -70);
//            self.yellowView.transform = CGAffineTransformConcat(yellowScaleTransform, yellowRotationTransform);
//        } completion:nil];
    
#pragma mark box going corners
    
    NSInteger sizeOfBox = 60;
    
    self.rect = [[UIView alloc]initWithFrame:CGRectMake(0, 0, sizeOfBox, sizeOfBox)];
    self.rect.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.rect];
    
    NSNumber *keyframe1 = @(self.view.frame.size.height-sizeOfBox);
    NSNumber *keyframe2 = @(self.view.frame.size.width-sizeOfBox);
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"position";
    //keyFrameAnimation.values = @[ @0, keyframe1, keyframe1, @0 , @0];
    //keyFrameAnimation.keyTimes = @[ @0, @(1 / 4.0), @(2 / 4.0), @(3 / 4.0), @4 ];
    
    
    keyFrameAnimation.path = CFAutorelease(CGPathCreateWithRect(CGRectMake(0,0,self.view.frame.size.width-sizeOfBox, self.view.frame.size.height-sizeOfBox), NULL));
    keyFrameAnimation.duration = 4.0;
    keyFrameAnimation.repeatCount = HUGE_VAL;
    
    keyFrameAnimation.additive = YES;
    

    
    [self.rect.layer addAnimation:keyFrameAnimation forKey:@"shake"];
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
