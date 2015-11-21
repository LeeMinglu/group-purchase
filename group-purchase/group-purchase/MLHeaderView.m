//
//  MLHeaderView.m
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLHeaderView.h"
#define count 5


@interface MLHeaderView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation MLHeaderView

+ (instancetype)headerView {
    return [[[NSBundle mainBundle] loadNibNamed:@"MLHeaderView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    
    CGRect scFrame = self.scrollView.bounds;
    CGFloat width = scFrame.size.width;
    CGFloat height = scFrame.size.height;
    
    self.scrollView.delegate = self;
    
    NSUInteger imgCount = count;
    
    self.scrollView.contentSize = CGSizeMake(imgCount * width, height);
    
    
    //设置scroll属性
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    
    //设置pageControl属性
    self.pageControl.numberOfPages = imgCount;
    self.pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    for (int i = 0; i < imgCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        NSString *imgName = [NSString stringWithFormat:@"ad_%02d",i];
        
        imgView.image = [UIImage imageNamed:imgName];
        
        CGFloat  x =0;
        x += i * width;
        NSLog(@"x的值:%f",x);
        CGRect imgViewFrame= CGRectMake(x, 0, width, height);
        
        imgView.frame = imgViewFrame;
        
        [self.scrollView addSubview:imgView];
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}

- (void)nextImage {
    
    CGFloat width = self.scrollView.bounds.size.width;
    NSUInteger page = 0;
    
    if (self.pageControl.currentPage == count - 1) {
        page = 0;
    }else {
        page = self.pageControl.currentPage + 1;
    }
    
    CGFloat offSetX = page * width;
    
    [self.scrollView setContentOffset:CGPointMake(offSetX, 0)];
    
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offSetX = scrollView.contentOffset.x;
    CGFloat width = scrollView.bounds.size.width;
    
    NSUInteger page = (offSetX + width * 0.5) / width;
    
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}


@end
