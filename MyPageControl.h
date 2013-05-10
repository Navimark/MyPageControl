//
//  MyPageControl.h
//  YHChildGrowUp
//
//  Created by Achievo on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPageControl : UIView
{
    UIImage         *_normalDotImage;
    UIImage         *_highlightedDotImage;
//    NSMutableArray  *__dotsArray;
    NSInteger       __pageNumbers;
    float           __dotsSize;
}

- (id)initWithFrame:(CGRect)frame normalImage:(UIImage *)nImage highlightedImage:(UIImage *)hImage dotsNumber:(NSInteger)pageNum sideLength:(NSInteger)size;

- (void)setCurrentPage:(NSInteger)pages;

@end
