
//
//  OtherCell.m
//  WeChat
//
//  Created by apple on 12/21/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "OtherCell.h"

@interface OtherCell()
{
    UIImageView *_photoImage;
    UIImageView *_heardImage;
    UILabel *_titleLable;
}

@end
@implementation OtherCell

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
        
        
        
        UIImageView *heardImage = [[UIImageView alloc]initWithFrame:CGRectMake(wSize.width-67, 6, 32, 32)];
        [self.contentView addSubview:heardImage];
        _heardImage = heardImage;
        
        
        UIImageView *arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(wSize.width-24, 16, 9, 14)];
        [arrowImage setImage:[UIImage imageNamed:@"setting_arrow"]];
        [self.contentView addSubview:arrowImage];
        
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(photoImage.frame.origin.x+18+25, 15, 75, 14)];
        [self.contentView addSubview:titleLable];
        _titleLable = titleLable;
        
        

    }
    return self;
}

-(void)setData:(NSDictionary *)Dic
{
    if (!Dic)
    {
        return;
    }
    
    _titleLable.text = Dic[@"title"];
    [_heardImage setImage:[UIImage imageNamed:Dic[@"pImg"]]];
    [_photoImage setImage:[UIImage imageNamed:Dic[@"img"]]];
}

@end
