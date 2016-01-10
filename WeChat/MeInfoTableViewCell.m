//
//  MeInfoTableViewCell.m
//  WeChat
//
//  Created by apple on 12/20/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "MeInfoTableViewCell.h"

@implementation MeInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *headImageView = [[UIImageView alloc] init];
        headImageView.frame = CGRectMake(13, 11, 65, 65);
        headImageView.image = [UIImage imageNamed:@"me_info"];
        [self.contentView addSubview:headImageView];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.frame = CGRectMake(headImageView.frame.size.width+headImageView.frame.origin.x+11, 22, 198, 20);
        nameLabel.textColor = [UIColor colorWithRed:0x00 / 255.f green:0x00 / 255.f blue:0x00 / 255.f alpha:1.f];
        nameLabel.font = [UIFont boldSystemFontOfSize:14.f];
        nameLabel.text = @"市伟";
        [self.contentView addSubview:nameLabel];
        
        UILabel *idLabel = [[UILabel alloc] init];
        idLabel.frame = CGRectMake(headImageView.frame.size.width+headImageView.frame.origin.x+11, nameLabel.frame.origin.y+nameLabel.frame.size.height+12, 198, 15);
        idLabel.textColor = [UIColor colorWithRed:0x00 / 255.f green:0x00 / 255.f blue:0x00 / 255.f alpha:1.f];
        idLabel.font = [UIFont boldSystemFontOfSize:12.f];
        idLabel.text = @"WeChat ID: flowsylxaj";
        [self.contentView addSubview:idLabel];

        
        UIImageView *arrowImageView = [[UIImageView alloc] init];
        CGSize bSize = [UIScreen mainScreen].bounds.size;
        arrowImageView.frame = CGRectMake(bSize.width-24, 37, 9, 14);
        arrowImageView.image = [UIImage imageNamed:@"setting_arrow"];
        [self.contentView addSubview:arrowImageView];
        
        UIImageView *qRImageView = [[UIImageView alloc] init];
        qRImageView.frame = CGRectMake(arrowImageView.frame.origin.x-28, 34, 18, 18);
        qRImageView.image = [UIImage imageNamed:@"setting_myQR"];
        [self.contentView addSubview:qRImageView];

    }
    
    return self;
}

@end
