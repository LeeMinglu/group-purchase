//
//  MLFoodCell.h
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Food;

@interface MLFoodCell : UITableViewCell

@property (nonatomic, strong) Food *food;

+ (instancetype)foodCellWithTableView:(UITableView *)tableView;


@end
