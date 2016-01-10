//
//  MeOtherTableViewCell.m
//  WeChat
//
//  Created by apple on 12/20/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "MeOtherTableViewCell.h"

@interface MeOtherTableViewCell() {
    UILabel *_titleLb;
    UIImageView *_photoImageView;
    UIImageView *_arrowImageView;
}

@end

@implementation MeOtherTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat xsize = 13.f;
        
        UIImageView *photoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MoreMyAlbum"]];
        photoImageView.frame = CGRectMake(xsize, 12, 25,25);
        photoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:photoImageView];
        _photoImageView = photoImageView;
        
        
        UILabel *titleLb = [[UILabel alloc]initWithFrame:CGRectMake(xsize+photoImageView.frame.size.width+18, 15, 111, 18)];
        [self.contentView addSubview:titleLb];
        _titleLb = titleLb;
        
        

        UIImageView *arrowImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"setting_arrow"]];
        CGSize bSize = [UIScreen mainScreen].bounds.size;
        arrowImageView.frame = CGRectMake(bSize.width-23, 17, 9, 14);
        [self.contentView addSubview:arrowImageView];
//        _arrowImageView = arrowImageView;
        
    }
    return self;
}

- (void)updateWithDic:(NSDictionary *)dic {
    if (!dic) {
        return;
    }

    
    [_photoImageView setImage:[UIImage imageNamed:dic[@"img"]]];
    
    _titleLb.text = dic[@"title"];
}

@end
