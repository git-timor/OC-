//
//  NSUserDefaultVC.m
//  关于OC中的储存
//
//  Created by 周周旗 on 2018/11/22.
//  Copyright © 2018 ZQ. All rights reserved.
//

#import "NSUserDefaultVC.h"
#import "NSCoderVC.h"
/**
 NSUserDefault:用于存储少量的数据文件，主要用于用户名，密码，setting设置，等少量的数据文件，只可存储基础数据类型。
 
 存于 library/prefercence： 保存应用 偏好设置 ，setting里的所有设置信息， 会被iTunes备份
 
 
 注意：NSUserDefault 的使用并不是实时保存，是手机根据某个特定的时间进行批量存储，如果要进行实时的保存，则需要使用 [defaults synchronize];进行强制保存。
 */
@interface NSUserDefaultVC ()

@end

@implementation NSUserDefaultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    // Do any additional setup after loading the view.
}

/**
 创建子控件键
 */
- (void)initSubViews{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 100, 100, 40)];
    [saveBtn setBackgroundColor:[UIColor greenColor]];
    [saveBtn setTitle:@"存入" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(savePlist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
    UIButton *readBtn = [[UIButton alloc]initWithFrame:CGRectMake(130, 100, 100, 40)];
    [readBtn setBackgroundColor:[UIColor redColor]];
    [readBtn setTitle:@"读取" forState:UIControlStateNormal];
    [readBtn addTarget:self action:@selector(readPlist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readBtn];
    
    UIButton *nextPageBtn = [[UIButton alloc]initWithFrame:CGRectMake(130, 300, 100, 40)];
    [nextPageBtn setBackgroundColor:[UIColor redColor]];
    [nextPageBtn setTitle:@"跳转进下一个页面" forState:UIControlStateNormal];
    [nextPageBtn addTarget:self action:@selector(gotoNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextPageBtn];
}

- (void)savePlist{
    //NSUserDefaults 为单例 使用方法与 字典Dictionary 类似
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"基础数据类型" forKey:@"type"];
    [defaults setBool:YES forKey:@"setting"];
    [defaults synchronize];
    
}

- (void)readPlist{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *type =[defaults objectForKey:@"type"];
    BOOL setting = [defaults objectForKey:@"setting"];
    NSLog(@" 读取到的plist数据 %@ +++ %d",type,setting);
}

- (void)gotoNextPage{
    NSCoderVC *coderVC = [[NSCoderVC alloc]init];
    [self.navigationController pushViewController:coderVC animated:YES];
}

@end
