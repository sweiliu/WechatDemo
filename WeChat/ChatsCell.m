//
//  ChatsCell.m
//  WeChat
//
//  Created by apple on 12/23/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "ChatsCell.h"

@implementation ChatsCell

{
    UIImageView *_photoImage;
    UILabel *_nameLabel;
    UILabel *_messageLable;

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGSize wSize = [UIScreen mainScreen].bounds.size;
        CGFloat yOrigin = 15.f;
        
        UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 11, 45,45)];
        photoImage.layer.masksToBounds = YES;
        photoImage.layer.cornerRadius = 5.0;
        [self.contentView addSubview:photoImage];
        _photoImage = photoImage;
        
        
        UILabel *timeLable = [[UILabel alloc]initWithFrame:CGRectMake(wSize.width-41, yOrigin, wSize.width-75.f, 10.f)];
        timeLable.textColor = [UIColor grayColor];
        timeLable.font = [UIFont fontWithName:@"Arial" size:12];
        [self.contentView addSubview:timeLable];
        NSDate *now = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"hh:mm";
        [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        NSString *nss = [dateFormatter stringFromDate:now];
        timeLable.text = nss;
    
        
        
        UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(55+12, 15, 100, 18)];
        [self.contentView addSubview:nameLable];
        _nameLabel = nameLable;
        
        
        UILabel *messageLable = [[UILabel alloc]initWithFrame:CGRectMake(55+12, 38, 250, 18)];
        messageLable.textColor = [UIColor grayColor];

        [self.contentView addSubview:messageLable];
        _messageLable = messageLable;
        
    }
    return self;
}


-(void)updata:(NSDictionary *)dic
{
    if (!dic) {
        return;
    }
    
    [_photoImage setImage:[UIImage imageNamed:dic[@"img"]]];
    
    _nameLabel.text = dic[@"name"];
    
    _messageLable.text = dic[@"message"];
    
}
@end
