//
//  ContactsModel.h
//  WeChat
//
//  Created by apple on 12/23/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ContactsModel : NSObject

@property (nonatomic, copy) NSString     *name;
@property (nonatomic, copy) UIImage    *headimage;
@property (nonatomic, copy) NSString     *address;
@property (nonatomic, copy) NSString     *detail;
@property NSInteger sectionNumber;  // Index

- (id)initWithPropertiesDictionary:(NSDictionary *)dic;

- (id)initWithPropertiesName:(NSString *)name;

@end
