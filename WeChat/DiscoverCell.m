//
//  DiscoverCell.m
//  WeChat
//
//  Created by apple on 12/21/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "DiscoverCell.h"

@interface DiscoverCell()
{
    UIImageView *_photoImage;
    UILabel *_titleLabel;
}

@end


@implementation DiscoverCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        CGFloat xSize = 13.f;
        CGSize wSize = [UIScreen mainScreen].bounds.size;
    
        UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(xSize, 11, 25, 25)];
        [self.contentView addSubview:photoImage];
        _photoImage = photoImage;
        
        
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(photoImage.frame.origin.x+25+18, 15, 120, 14)];
        [self.contentView addSubview:titleLable];
        _titleLabel = titleLable;
        
        
        
        UIImageView *arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(wSize.width-24, 16, 9, 14)];
        [arrowImage setImage:[UIImage imageNamed:@"setting_arrow"]];
        [self.contentView addSubview:arrowImage];
        
        
        
    }
    return self;
}

-(void)updataWithDic:(NSDictionary *)dic
{
    if (!dic) {
        return;
    }
    
    _titleLabel.text = dic[@"title"];
    [_photoImage setImage:[UIImage imageNamed:dic[@"img"]]];
}

@end
