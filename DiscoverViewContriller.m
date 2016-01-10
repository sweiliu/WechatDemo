//
//  Discover.m
//  WeChat
//
//  Created by apple on 12/20/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "DiscoverViewContriller.h"
#import "DiscoverCell.h"
#import "OtherCell.h"

@interface Discover ()<UITableViewDataSource,UITableViewDelegate>
{
    NSDictionary *_dic0;
    UITableView *_tableView;
    NSDictionary *_dic1;
    NSDictionary *_dic2;
}

@end

@implementation Discover

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *discoverVC = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    discoverVC.dataSource = self;
    discoverVC.delegate = self;
    [self.view addSubview:discoverVC];
    _tableView = discoverVC;
    [self _loadData];

}
-(void)_loadData
{
    _dic0 = @{@"img":@"ff_IconShowAlbum",@"title":@"Moments",@"pImg":@"heard_image"};
    
    _dic1 = @{@"img":@"ff_IconQRCode",@"title":@"Scan QR Code"};
    
    _dic2 = @{@"img":@"MoreGame",@"title":@"Games"};
    [_tableView reloadData];
    
}
#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0)
    {
        OtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OtherCell"];
        if (!cell)
        {
            cell = [[OtherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OtherCell"];
        }
        [cell setData:_dic0];

        return cell;
    
    }
    else
    {
        DiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Discover"];
        if (!cell)
        {
            cell = [[DiscoverCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Discover"];
            if (indexPath.section == 1)
            {
                [cell updataWithDic:_dic1];
            }
            else
            {
                [cell updataWithDic:_dic2];
            }
        }
        return cell;
    }
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return 15.f;
    }
    else
    {
        return 22.f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.f;
}

@end
