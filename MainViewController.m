//
//  MainViewController.m
//  MyPageControl
//
//  Created by Achievo on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MyPageControl.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor grayColor];
    UIImage *normalImage = [UIImage imageNamed:@"normal.png"];
    UIImage *highlightedImage = [UIImage imageNamed:@"highlighted.png"];
    myPageControl = [[MyPageControl alloc] initWithFrame:CGRectMake(300 , 700 , 5 * highlightedImage.size.width, highlightedImage.size.width) normalImage:normalImage highlightedImage:highlightedImage dotsNumber:5 sideLength:highlightedImage.size.width];
    [myPageControl setCurrentPage:0];
    myPageControl.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:myPageControl];
    
    UIScrollView *testScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width, 640)];
    testScrollView.delegate = self;
    [testScrollView setContentSize:CGSizeMake(self.view.bounds.size.width * 5, 640)];
    testScrollView.pagingEnabled = YES;
    testScrollView.showsVerticalScrollIndicator = NO;
    testScrollView.directionalLockEnabled = YES;
    [self.view addSubview:testScrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"我滚动玩了");
    int index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    NSLog(@"index = %d",index);
    [myPageControl setCurrentPage:index];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
