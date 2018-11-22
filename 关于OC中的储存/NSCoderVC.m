//
//  NSCoderVC.m
//  关于OC中的储存
//
//  Created by 周周旗 on 2018/11/22.
//  Copyright © 2018 ZQ. All rights reserved.
//

#import "NSCoderVC.h"
#import "ZQModel.h"
#define KPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contant.data"]

/**
 归档 假如名字一样则会覆盖之前已经有的文件，所以如果文件数目不多应该以 数组 的方式进行归档
 或者 采取每次命名不一样的方式
 
 */
@interface NSCoderVC ()

@end

@implementation NSCoderVC

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
    ZQModel *model = [[ZQModel alloc]init];
    model.name = @"zq";
    model.phone = @"1111";
    
    //获取doc path

    [NSKeyedArchiver archiveRootObject:model toFile:KPath];
    
}

- (void)readPlist{
   NSData *data = [NSKeyedUnarchiver unarchiveObjectWithFile:KPath];
    NSLog(@"%@", KPath);
    NSLog( @"%@ data",data);
}

- (void)gotoNextPage{
    NSCoderVC *coderVC = [[NSCoderVC alloc]init];
    [self.navigationController pushViewController:coderVC animated:YES];
}


@end
