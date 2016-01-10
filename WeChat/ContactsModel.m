//
//  ContactsModel.m
//  WeChat
//
//  Created by apple on 12/23/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "ContactsModel.h"

@implementation ContactsModel

- (id)initWithPropertiesDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (dic != nil) {
            self.name = [dic objectForKey:@"name"];
            self.headimage = [dic objectForKey:@"headimage"];
            self.address = [dic objectForKey:@"address"];
            self.detail = [dic objectForKey:@"detail"];
            
        }
    }
    
    return self;
}

- (id)initWithPropertiesName:(NSString *)name {
    if (self = [super init]) {
        self.name = name;
    }
    
    return self;
}

- (NSString *)description
{
    NSString *result = @"";
    result = [result stringByAppendingFormat:@"name : %@\n",self.name];
    result = [result stringByAppendingFormat:@"headimage : %@\n",self.headimage];
    result = [result stringByAppendingFormat:@"address : %@\n",self.address];
    result = [result stringByAppendingFormat:@"detail: %@\n",self.detail];
    return result;
}

@end
