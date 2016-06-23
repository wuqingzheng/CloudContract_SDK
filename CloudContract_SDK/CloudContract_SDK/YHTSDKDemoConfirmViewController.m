//
//  YHTSDKDemoConfirmViewController.m
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/6/7.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import "YHTSDKDemoConfirmViewController.h"
#import "YHTSdk.h"
#import "YHT_MBProgressHUD+Wqz.h"
#import "YHTSDKDemoTokenListener.h"
@interface YHTSDKDemoConfirmViewController ()
@property (nonatomic, strong)NSNumber *contractID;
@end

@implementation YHTSDKDemoConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"确认业务细节";
    [self setRadiusAndBorderWithButton:self.confirmBtn];
}

- (IBAction)confirmBtn_Action:(id)sender {

    [YHT_MBProgressHUD showHTTPMessage:@""];
    [[YHTSDKDemoTokenListener sharedManager] getTokenContractWithCompletionHander:^(id obj) {

        [[YHTTokenManager sharedManager] setTokenWithString:obj[@"value"][@"token"]];

        self.contractID = obj[@"value"][@"contractId"];
        YHTContractContentViewController *vc = [YHTContractContentViewController instanceWithContractID:_contractID];
        vc.title= @"签署合同";
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)setRadiusAndBorderWithButton:(UIButton *)button{
    button.layer.cornerRadius = 8.0f;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end