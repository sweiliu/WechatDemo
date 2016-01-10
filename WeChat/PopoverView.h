//
//  PopoverView.h
//  WeChat
//
//  Created by apple on 12/25/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverView : UIView

-(id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images;
-(void)show;
-(void)dismiss;
-(void)dismiss:(BOOL)animated;

@property (nonatomic, copy) UIColor *borderColor;
@property (nonatomic, copy) void (^selectRowAtIndex)(NSInteger index);

@end
