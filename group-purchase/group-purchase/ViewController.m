//
//  ViewController.m
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "ViewController.h"
#import "Food.h"
#import "MLFoodCell.h"
#import "MLFooterView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, MLFooterViewDelegate>
@property (nonatomic, strong) NSMutableArray *foods;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    MLFooterView *footerView = [MLFooterView footerView];
    self.tableView.tableFooterView = footerView;
    
    footerView.delegate = self;
    
}


#pragma mark 实现footerView的代理方法

- (void)footerViewDidClickLoadMoreBtn:(MLFooterView *)footerView {
//    向模型中添加数据
    Food *food = [[Food alloc] init];
    food.title = @"味妙烤鱼吧";
    food.price =@"32";
    food.buyCount = @"98";
    food.icon = @"37e4761e6ecf56a2d78685df7157f097";
    
    [self.foods addObject:food];
    
    
//    刷新tableView
    [self.tableView reloadData];
    
}



#pragma mark 实现数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取出模型
    Food *food = self.foods[indexPath.row];
    
    //创建cell
    MLFoodCell *cell = [MLFoodCell foodCellWithTableView:tableView]
    ;
    
    //赋值
    cell.food = food;
    
    return  cell;

}


//返回行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


#pragma mark --懒加载
- (NSMutableArray *)foods {
    if (_foods == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSDictionary *dict in arrayDict) {
            Food *food = [Food foodWithDict:dict];
            [arrayM addObject:food];
        }
        
        _foods = arrayM;
    }
    
    return _foods;
}



@end
