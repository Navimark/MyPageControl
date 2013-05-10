//
//  MyPageControl.m
//  YHChildGrowUp
//
//  Created by Achievo on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyPageControl.h"

@interface MyPageControl ()

@property (nonatomic , strong)UIImage *normalDotImage;
@property (nonatomic , strong)UIImage *highlightedDotImage;
@property (nonatomic , strong)NSMutableArray *dotsArray;
@property (nonatomic , assign)NSInteger pageNumbers;
@property (nonatomic , assign)float dotsSize;

@end

@implementation MyPageControl

@synthesize normalDotImage = _normalDotImage;
@synthesize highlightedDotImage = _highlightedDotImage;
@synthesize dotsArray = __dotsArray;
@synthesize pageNumbers = __pageNumbers;
@synthesize dotsSize = __dotsSize;

- (void)dealloc
{
    [_normalDotImage release];
    [_highlightedDotImage release];
    [__dotsArray release];
    [super dealloc];
}

/*
 *pageNum是pageControl的页面总个数
 *size是单个dot的边长
*/
- (id)initWithFrame:(CGRect)frame normalImage:(UIImage *)nImage highlightedImage:(UIImage *)hImage dotsNumber:(NSInteger)pageNum sideLength:(NSInteger)size
{
    if ((self = [super initWithFrame:frame])) {
        self.dotsSize = size;
        self.dotsArray = [NSMutableArray array];
        self.normalDotImage = [nImage retain];
        self.highlightedDotImage = [hImage retain];
        self.pageNumbers = pageNum;
        for (int i = 0; i != __pageNumbers; ++ i) {
            UIView *dotsView = [[UIView alloc] init];
            dotsView.frame = CGRectMake(size * i, 0, size, size);
            dotsView.tag = 100 + i;
            if (i == 0) {
                dotsView.backgroundColor = [UIColor colorWithPatternImage:_highlightedDotImage];
            } else {
                dotsView.backgroundColor = [UIColor colorWithPatternImage:_normalDotImage];
            }
            [self addSubview:dotsView];
            NSLog(@"是不是执行了");
        }
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)pages
{
    [UIView beginAnimations:@"SelfDefinePageControl" context:nil];
    [UIView setAnimationDuration:0.3];
    if (_normalDotImage || _highlightedDotImage) {
        for (int i = 0 ; i != __pageNumbers; ++ i) {
//            if (i != pages) {
////                [[__dotsArray objectAtIndex:i] setBackgroundImage:_normalDotImage];
//                [((UIView *)[self viewWithTag:100 + i]) setBackgroundImage:_normalDotImage forState:UIControlStateNormal];
//            } else {
////                [[__dotsArray objectAtIndex:i] setBackgroundImage:_highlightedDotImage];
//                [((UIView *)[self viewWithTag:100 + i]) setBackgroundImage:_highlightedDotImage forState:UIControlStateNormal];
//            }
            if (i == pages) {
                [((UIView *)[self viewWithTag:100 + i]) setCenter:CGPointMake((0.5 + i) * __dotsSize, 0.5 * __dotsSize)];
                [((UIView *)[self viewWithTag:100 + i]) setBackgroundColor:[UIColor colorWithPatternImage:_highlightedDotImage]];
            } else {
                [((UIView *)[self viewWithTag:100 + i]) setBackgroundColor:[UIColor colorWithPatternImage:_normalDotImage]];
            }
        }
    }
    [UIView commitAnimations];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
