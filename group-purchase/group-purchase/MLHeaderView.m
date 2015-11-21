//
//  MLHeaderView.m
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLHeaderView.h"

@interface MLHeaderView ()
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation MLHeaderView

+ (instancetype)headerView {
    return [[[NSBundle mainBundle] loadNibNamed:@"MLHeaderView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    
    CGRect scFrame = self.scrollView.bounds;
    CGFloat width = scFrame.size.width;
    CGFloat height = scFrame.size.height;
    
    
    NSUInteger imgCount = 5;
    
    self.scrollView.contentSize = CGSizeMake(imgCount * width, height);
    
    
    //设置属性
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    
    for (int i = 0; i < imgCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        CGFloat  x =0;
        x += i * width;
        NSLog(@"x的值:%f",x);
        CGRect imgViewFrame= CGRectMake(x, 0, width, height);
        
        imgView.frame = imgViewFrame;
        
        [self.scrollView addSubview:imgView];
    }

}

@end
