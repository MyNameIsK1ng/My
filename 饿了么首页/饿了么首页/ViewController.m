//
//  ViewController.m
//  饿了么首页
//
//  Created by xd-link on 2017/10/28.
//  Copyright © 2017年 k1ng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
static NSString * const reuseId = @"cell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation ViewController
{
    UIView              *_headerView;           // 顶部View
    UITableView         *_tableView;            //
    UIView              *_navigationView;       // 导航
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tableView = [[UITableView alloc]init];
    _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // 隐藏滑动条
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    header.backgroundColor = [UIColor orangeColor];
    // 设置header
    _tableView.tableHeaderView = header;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (SCREEN_HEIGHT == 812)
    {
        return 108;
    }
    else
    {
        return 64;
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _navigationView = [[UIView alloc]init];//创建一个视图
    _navigationView.backgroundColor = [UIColor redColor];
    
    return _navigationView;
}


// MARK: -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 30;
}


// MARK: -- cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseId];
    }
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat offSetY = scrollView.contentOffset.y + scrollView.contentInset.top;
//
//        //iPhone X 下 View 滑动后的高度
////        CGFloat minY = 32 ;
//        // 设置顶部视图Y轴坐标
//        _navigationView.y = -MIN(offSetY, 100);
//
//}



@end
