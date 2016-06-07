//
//  ViewController.m
//  05-UIScrollView的代理(delegate)
//
//  Created by xiaomage on 16/6/7.
//  Copyright © 2016年 赵恩峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(20, 20, 300, 200);
    [self.view addSubview:scrollView];
    // 如果是通过代码创建scrollView,一开始subviews为nil
//    NSLog(@"%@",scrollView.subviews);
    
    // 2.创建UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    
    // 3.设置contentSize
    scrollView.contentSize = image.size;
    
    // 4.设置代理
    scrollView.delegate = self;
}

#pragma mark - UIScrollViewDelegate 代理方法

/**
 *  scrollView正在滚动的时候会自动调用这个方法  1   拖动中ing
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollViewDidScroll");
}

/**
 *  当用户即将开始拖拽scrollView会自动调用这个方法  2    开始拖动
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

/**
 *  当用户即将停止拖拽scrollView会自动调用这个方法  3     停止拖动
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollViewWillEndDragging");
}

/**
 *  当用户已经停止拖拽scrollView会自动调用这个方法  4    停止拖动+进入减速
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(decelerate == NO) {
        NSLog(@"用户已经停止拖拽scrollView,scrollView停止滚动");
    } else {
        NSLog(@"用户已经停止拖拽scrollView,但是scrollView由于惯性会继续滚动,并且减速");
    }
    
}

/**
 *  减速完毕的时候回自动调用这个方法,停止滚动  5    减速停止
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollView减速完毕,停止滚动");
}
@end
