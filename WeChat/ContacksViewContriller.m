//
//  Contacks.m
//  WeChat
//
//  Created by apple on 12/20/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "ContacksViewContriller.h"
#import "ContacksCell.h"
#import "ContactsModel.h"



@interface ContacksViewContriller ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSMutableArray *_arr;
    NSMutableArray *_topArr;
    UITableView *_tableView;
    NSDictionary *_dict;

    NSMutableArray *searchResults;
    BOOL _isSearch;
    NSMutableArray *tmpArr;
    NSMutableArray *_indexTitles;
}
@property (nonatomic,retain) UISearchBar *searchBar;
@property (nonatomic,retain) UISearchDisplayController *searchDisplayController;


@end

@implementation ContacksViewContriller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    
    UITableView *contaksTV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    contaksTV.dataSource = self;
    contaksTV.delegate = self;
    contaksTV.sectionIndexBackgroundColor = [UIColor clearColor];
    [self.view addSubview:contaksTV];
    _tableView = contaksTV;
    
    [self initData];
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 21)];
    [rightButton setImage:[UIImage imageNamed:@"IMG_1025"] forState:UIControlStateNormal];
    rightButton.backgroundColor = [UIColor clearColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    
    self.searchBar =[[UISearchBar alloc]init];
    self.searchBar.delegate = self;
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.searchBar sizeToFit];
    contaksTV.tableHeaderView = self.searchBar;
    self.searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    [self setSearchDisplayController:self.searchDisplayController];
    [self.searchDisplayController setDelegate:self];
    [self.searchDisplayController setSearchResultsDataSource:self];
    
    
//    tmpArr = [_arr copy];
//    for (NSArray *arr in tmpArr) {
//        NSLog(@"%@",arr);
//    }
}

-(void)right:(UIBarButtonItem *)sender
{
    NSLog(@"点击了");
}
-(void)initData
{
//    _dict =@{@"img":@"Portrait_72px_1187341_easyicon",
//             @"title":@"还没有写名字",};
//
//     [NSMutableArray arrayWithObjects:@"#",nil];
//    for (char ch='A'; ch<='Z'; ch++) {
//        if (ch=='I' || ch=='O' || ch=='U' || ch=='V')
//            continue;
//        [_indexTitles addObject:[NSString stringWithFormat:@"%c",ch]];
//    }
//
    
    
    _indexTitles = [NSMutableArray array];
    [_indexTitles addObject:@""];
    
    
    _isSearch = NO;
    
    NSArray *topArray = @[@{@"headimage":@"plugins_FriendNotify",@"name":@"Recommended Friengs"},
                          @{@"headimage":@"add_friend_icon_addgroup",@"name":@"Group Chats"},
                          @{@"headimage":@"Contact_icon_ContactTag",@"name":@"Tags"},
                          @{@"headimage":@"add_friend_icon_offical",@"name":@"Official Accounts"}];
    
    _topArr = [NSMutableArray array];
    for (int i = 0; i < topArray.count; i++) {
        ContactsModel *contact = [[ContactsModel alloc] initWithPropertiesDictionary:topArray[i]];
        [_topArr addObject:contact];
    }
    
    // json数据解析
    NSString *contactPath = [[NSBundle mainBundle] pathForResource:@"contacts1" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:contactPath];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    tmpArr = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSEnumerator *enumerator = [obj objectEnumerator];
        [tmpArr addObject:[enumerator nextObject]];
    }];
    
    NSMutableArray *contactArraytemp = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        ContactsModel *contact = [[ContactsModel alloc] initWithPropertiesDictionary:array[i]];
        [contactArraytemp addObject:contact];
    }
    
    // 对数据进行排序，并按首字母分类
    UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];
    for (ContactsModel *contact in contactArraytemp) {
        NSInteger sect = [theCollation sectionForObject:contact
                                collationStringSelector:@selector(name)];
        contact.sectionNumber = sect;
    }
    
    NSInteger highSection = [[theCollation sectionTitles] count];
    NSMutableArray *sectionArrays = [NSMutableArray arrayWithCapacity:highSection];
    for (int i=0; i<=highSection; i++) {
        NSMutableArray *sectionArray = [NSMutableArray arrayWithCapacity:1];
        [sectionArrays addObject:sectionArray];
    }
    
    for (ContactsModel *contact in contactArraytemp) {
        [(NSMutableArray *)[sectionArrays objectAtIndex:contact.sectionNumber] addObject:contact];
    }
    
    NSMutableArray *allArray = [[NSMutableArray alloc] init];
    for (NSMutableArray *sectionArray in sectionArrays) {
        NSArray *sortedSection = [theCollation sortedArrayFromArray:sectionArray collationStringSelector:@selector(name)];
        [allArray addObject:sortedSection];
    }
    
    // 只取有数据的Array
    _arr = [NSMutableArray array];
    
    [_arr addObject:_topArr];
    for (NSMutableArray *sectionArray0 in allArray) {
        if (sectionArray0.count) {
            [_arr addObject:sectionArray0];
        }
    }
    
    
    for (int i = 0; i < _arr.count; i++) {
        if ([[_arr objectAtIndex:i] count]) {
            [_indexTitles addObject:[[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:i]];
        }
    }
    
    
    [_tableView reloadData];
    
}



#pragma mark - UITableView DataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 1;
    }
    else{
       
    return _arr.count;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    else{
        
    return [_arr[section] count];

    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContacksCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[ContacksCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        ContactsModel *model = [[ContactsModel alloc] initWithPropertiesName:tmpArr[indexPath.row]];
        model.headimage = [UIImage imageNamed:@"add_friend_icon_addgroup"];
        [cell updataWithDic:model];
    }
    else
    {
    NSArray *arr = _arr[indexPath.section];
    ContactsModel *model = arr[indexPath.row];
    model.headimage = [UIImage imageNamed:@"add_friend_icon_addgroup"];
    [cell updataWithDic:model];
        
    }
    
    return cell;
}



#pragma mark - 生成索引 
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return nil;
    }
    else{
        return _indexTitles;
        
    }
}
    
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_indexTitles objectAtIndex:section];
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0)
    {
        return 20.f;
    }
    else
    {
        return 24.f;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.f;
}
#pragma mark - UISearchDisplayDelegate
- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [searchResults removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchString];//用于过滤
    searchResults = [NSMutableArray arrayWithArray:[tmpArr filteredArrayUsingPredicate:predicate]];
    return  YES;
}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    //当scope改变时调用
    return YES;
}

@end
