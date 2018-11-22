//
//  ZQModel.h
//  关于OC中的储存
//
//  Created by 周周旗 on 2018/11/22.
//  Copyright © 2018 ZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZQModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@end

NS_ASSUME_NONNULL_END
