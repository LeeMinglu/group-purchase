//
//  ViewController.m
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "ViewController.h"
#import "Food.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *foods;

@property (weak, nonatomic) IBOutlet UITableView *foodTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --懒加载
- (NSArray *)foods {
    if (_foods == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSDictionary *dict in arrayDict) {
            Food *food = [Food foodWithDict:dict];
            [arrayM addObject:food];
        }
        
        _foods = [arrayM copy];
    }
    
    return _foods;
}



@end
