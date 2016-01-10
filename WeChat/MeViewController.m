//
//  Me.m
//  WeChat
//
//  Created by apple on 12/20/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "MeViewController.h"
#import "MeInfoTableViewCell.h"
#import "MeOtherTableViewCell.h"

@interface Me ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *p_Arr2;
    NSDictionary *p_dic3;
    NSDictionary *p_dic4;
    
    UITableView *_tableView;
}

@end

@implementation Me

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    [self p_loadData];
}

- (void)p_loadData {
    p_Arr2 = @[@{@"img":@"MoreMyAlbum", @"title":@"My Posts"},
               @{@"img":@"MyCardPackageIcon-1", @"title":@"Favorites"},
               @{@"img":@"MoreMyBankCard", @"title":@"Wallet"},
               @{@"img":@"MyCardPackageIcon", @"title":@"Card Pack"}];
    
    p_dic3 = @{@"img":@"MoreExpressionShops", @"title":@"Sticker Gallery"};
    
    p_dic4 = @{@"img":@"MoreSetting", @"title":@"Settings"};
    
    [_tableView  reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 4;
    }
    else if (section == 2) {
        return 1;
    }
    else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
    {
        MeInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
        if (!cell)
        {
            cell = [[MeInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCell"];
        }
        
        return cell;
    }
    else
    {
        MeOtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"otherCell"];
        if (!cell)
        {
            cell = [[MeOtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"otherCell"];
        }
        
        if (indexPath.section == 1)
        {
            NSDictionary *dic = p_Arr2[indexPath.row];
            [cell updateWithDic:dic];
        }
        else if (indexPath.section == 2)
        {
            [cell updateWithDic:p_dic3];
        }
        else
        {
            [cell updateWithDic:p_dic4];
        }
        
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 89.f;
    }
    else {
        return 45.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 15.f;
    }
    else {
        return 20.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.f;
}

@end
