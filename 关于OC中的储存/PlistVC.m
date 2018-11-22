//
//  PlistVC.m
//  关于OC中的储存
//
//  Created by 周周旗 on 2018/11/22.
//  Copyright © 2018 ZQ. All rights reserved.
//

#import "PlistVC.h"
#import "NSUserDefaultVC.h"
/**
 每一个应用都有自己一个独立的沙盒（应用程序包）用来存放数据，包含了所有的文件和可执行文件，
 
 应用沙盒结构划分：
 
 doucment：保存运行时生成的  需要持久化储存的数据， iTunes同步设备备份该目录。（如游戏h关卡）
 temp：临时数据文件，不可备份
 library/caches： 存储大数据， 不是很重要的数据， 不可iTunes备份（如：音视频，文件）
 library/prefercence： 保存应用 偏好设置 ，setting里的所有设置信息， 会被iTunes备份

 */


/**
 Plist 储存：
 */

/**
 查询是否储存好数据，可以根据 docPath（见代码），通过finder-> 前往 ->输入路径 进行查验
 */
@interface PlistVC ()

@end

@implementation PlistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}

/**
 创建子控件键
 */
- (void)initSubViews{
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
    //读取docment路径
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //拼接具体文件路径
    NSString *plistPath = [docPath stringByAppendingPathComponent:@"xx.plist"];
    NSLog(@"plist存储路径 %@",plistPath);
    //需要存储的数据
    NSArray *plistArr = @[@"name",@"mobile",@"password"];
    
    //写入数据
    [plistArr writeToFile:plistPath atomically:YES];
}

- (void)readPlist{
    //读取docment路径
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //拼接具体文件路径
    NSString *plistPath = [docPath stringByAppendingPathComponent:@"xx.plist"];
    
    //读取plist文件传入的arr
    NSArray *plistArr = [NSArray arrayWithContentsOfFile:plistPath];
    NSLog(@" 读取到的plist数据 %@",plistArr);
}

- (void)gotoNextPage{
    NSUserDefaultVC *userdefVC = [[NSUserDefaultVC alloc]init];
    [self.navigationController pushViewController:userdefVC animated:YES];
}
@end
