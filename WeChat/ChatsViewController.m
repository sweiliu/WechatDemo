//
//  Chats.m
//  WeChat
//
//  Created by apple on 12/20/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "ChatsViewController.h"
#import "ChatsCell.h"
#import "PopoverView.h"
@interface Chats ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{

    UITableView *_tableView;
    NSMutableArray *searchResults;
    NSArray *_dataArr;
    NSMutableArray *data;

}
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,retain) UISearchDisplayController *searchDisplayController;

@end

@implementation Chats

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *chatsTV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    chatsTV.dataSource = self;
    chatsTV.delegate = self;
    [self.view addSubview:chatsTV];
    _tableView = chatsTV;
    [self initData];
    
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightButton.backgroundColor = [UIColor clearColor];
    [rightButton setImage:[UIImage imageNamed:@"Card_AddIcon"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 48, 48);
    [rightButton addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    
    
    self.searchBar =[[UISearchBar alloc]init];
    self.searchBar.delegate = self;
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.searchBar sizeToFit];
    chatsTV.tableHeaderView = self.searchBar;
    self.searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    [self setSearchDisplayController:self.searchDisplayController];
    [self.searchDisplayController setDelegate:self];
    [self.searchDisplayController setSearchResultsDataSource:self];
    

    

}

-(void)button2Clicked:(UIButton *)sender
{
    CGPoint point = CGPointMake(sender.frame.origin.x+20, sender.frame.origin.y + sender.frame.size.height + 20);
    NSArray *titles = @[@"item1", @"选项2", @"选项3"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:nil];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%lu", index);
    };
    [pop show];
}

-(void)initData
{
  
    
    _dataArr = @[@{@"img":@"images (0)",@"name":@"测试的名字00",@"message":@"测试的信息00"},
                 @{@"img":@"images (1)",@"name":@"测试的名字01",@"message":@"测试的信息01"},
                 @{@"img":@"images (2)",@"name":@"测试的名字02",@"message":@"测试的信息02"},
                 @{@"img":@"images (3)",@"name":@"测试的名字03",@"message":@"测试的信息03"},
                 @{@"img":@"Plugins_QQMail",@"name":@"测试的名字04",@"message":@"测试的信息04"},
                 @{@"img":@"images (4)",@"name":@"测试的名字05",@"message":@"测试的信息05"}];
    
    [_tableView reloadData];
}
#pragma mark - UISearchBarDelegate
- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [searchResults removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchString];//用于过滤
    NSMutableArray *message = [NSMutableArray array];
    for (NSUInteger i= 0; i<_dataArr.count; i++)
    {
        NSMutableDictionary *dic = _dataArr[i];
        [message addObject:[NSString stringWithFormat:@"%@",dic[@"name"]]];
        [message addObject:[NSString stringWithFormat:@"%@",dic[@"message"]]];
    }
    

    searchResults = [NSMutableArray arrayWithArray:[message filteredArrayUsingPredicate:predicate]];
    return  YES;
}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    //当scope改变时调用
    return YES;
}
#pragma mark - UITableVIewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    else
    {
        return _dataArr.count;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return (tableView == self.searchDisplayController.searchResultsTableView)?1:1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ChatsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = searchResults[indexPath.row];
    }
    else
    {
        [cell updata:_dataArr[indexPath.row]];
    }
    return cell;
}



#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 9.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.f;
}
@end