//
//  ViewController.m
//  CoreImageStartDemo
//
//  Created by FireHsia on 2018/1/16.
//  Copyright © 2018年 FireHsia. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>

#define WeakObj(o) autoreleasepool{} __weak typeof(o) WeakObj = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) StrongObj = o;
@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [UIView animateWithDuration:0.6 animations:^{
//
//        // 通过设置window的bounds 来形成大小的视觉差异
////        [UIApplication sharedApplication].delegate.window.center = CGPointMake(kWidth / 2, kHeight / 2);
////        [UIApplication sharedApplication].delegate.window.bounds = CGRectMake(0, 0, kWidth - 40, kHeight - 40);
//
//        CGAffineTransform transform = CGAffineTransformIdentity;
//        transform = CGAffineTransformMakeScale((kWidth - 40) / kWidth, (kHeight - 40) / kHeight);
////        CGAffineTransformScale(transform, (kWidth - 40) / kWidth, (kHeight - 40) / kHeight);
//        CGAffineTransformScale(transform, 0.5, 0.5);
//        [UIApplication sharedApplication].delegate.window.transform = transform;
////        self.view.transform = transform;
//
//
//    }];
    
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.frame = CGRectMake(100, 100, 200, 200);
    NSLog(@"---%@====", [NSDate date]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 创建CIImage
        CIImage *image = [CIImage imageWithCGImage:[UIImage imageNamed:@"iconImage"].CGImage];
        // 创建滤镜对象
        CIFilter *filter = [CIFilter filterWithName:@"CIZoomBlur"];
        // 通过KVC来设置滤镜属性的值
        //  [filter setValue:@10.0 forKey:@"inputRadius"];
        [filter setValue:image forKey:@"inputImage"];   // 设置输入图片源
        [filter setValue:[CIVector vectorWithX:100 Y:100] forKey:@"inputCenter"];
        [filter setValue:@20.0 forKey:@"inputAmount"]; // 设置数量
        // 获取CI上下文
        // 强制的使用OpenGL上下文渲染图片 比较消耗CPU资源
        EAGLContext *glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        CIContext *context = [CIContext contextWithEAGLContext:glContext];
        // 上下文通过滤镜输出图片和Rect输出CGImage
        [context drawImage:filter.outputImage inRect:image.extent fromRect:image.extent];
        CGImageRef outImage = [context createCGImage:filter.outputImage fromRect:image.extent];
        UIImage *outImageView = [UIImage imageWithCGImage:outImage];
        NSLog(@"---%@====", [NSDate date]);
        
        // 更新UI的时候只能在主线程中使用
        
        dispatch_async(dispatch_get_main_queue(), ^{
            imageV.image = outImageView;
        });
//        @WeakObj(imageV)
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            @StrongObj(WeakObj)
//            [self.view addSubview:imageV];
//            @WeakObj(StrongObj)
//            [UIView animateWithDuration:0.6 animations:^{
//
//
//                CGAffineTransform transform = CGAffineTransformIdentity;
//                transform = CGAffineTransformMakeScale((kWidth - 40) / kWidth, (kHeight - 40) / kHeight);
//
//                        self.view.transform = transform;
//
//
//            } completion:^(BOOL finished) {
//                NSLog(@"%.2f, %.2f", imageV.bounds.size.width, WeakObj.bounds.size.height);
//            }];
//        });
    });
    
    [self.view addSubview:imageV];

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
