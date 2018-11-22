//
//  ZQModel.m
//  关于OC中的储存
//
//  Created by 周周旗 on 2018/11/22.
//  Copyright © 2018 ZQ. All rights reserved.
//

#import "ZQModel.h"

@implementation ZQModel

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeObject:_phone forKey:@"phone"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _phone = [aDecoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
