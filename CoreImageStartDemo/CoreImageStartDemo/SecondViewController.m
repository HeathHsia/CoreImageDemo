//
//  SecondViewController.m
//  CoreImageStartDemo
//
//  Created by FireHsia on 2018/1/17.
//  Copyright © 2018年 FireHsia. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:0.6 animations:^{
        
        // 通过设置window的bounds 来形成大小的视觉差异
        //        [UIApplication sharedApplication].delegate.window.center = CGPointMake(kWidth / 2, kHeight / 2);
        //        [UIApplication sharedApplication].delegate.window.bounds = CGRectMake(0, 0, kWidth - 40, kHeight - 40);
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformMakeScale((kWidth - 40) / kWidth, (kHeight - 40) / kHeight);
        //        CGAffineTransformScale(transform, (kWidth - 40) / kWidth, (kHeight - 40) / kHeight);
        //                CGAffineTransformScale(transform, 0.5, 0.5);
        //        [UIApplication sharedApplication].delegate.window.transform = transform;
        self.view.transform = transform;
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
