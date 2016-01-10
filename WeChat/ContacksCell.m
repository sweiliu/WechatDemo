//
//  ContacksCell.m
//  WeChat
//
//  Created by apple on 12/21/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "ContacksCell.h"
@interface ContacksCell()
{
    UIImageView *_imageView;
    UILabel *_titleLable;
}
@end

@implementation ContacksCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat  xSize = 10.f;
        CGFloat  hSizae = xSize;
        
        UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(xSize, hSizae, 36, 36)];
        [self.contentView addSubview:photoImage];
        _imageView = photoImage;
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(xSize+photoImage.frame.size.width+12, 22, 180, 18)];
        [self.contentView addSubview:titleLabel];
        _titleLable = titleLabel;
    }
    return self;
}
-(void)updataWithDic:(ContactsModel *)model
{
    if (!model) {
        return;
    }
    
    [_imageView setImage:model.headimage];
    _titleLable.text = model.name;
    
    
}
@end
