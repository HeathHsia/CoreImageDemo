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
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformMakeScale((kWidth - 40) / kWidth, (kHeight - 40) / kHeight);

        self.view.transform = transform;
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
