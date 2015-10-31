//
//  ProfileScreenVC.m
//  WIT
//
//  Created by Chris David on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "ProfileScreenVC.h"

@interface ProfileScreenVC ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userJobTitle;
@property (weak, nonatomic) IBOutlet UILabel *userCompanyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userBackgroundImageView;

@end

@implementation ProfileScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.frame  =CGRectMake(0,50,self.view.bounds.size.width,self.view.bounds.size.height-50);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
//    self.view.frame  =CGRectMake(0,50,self.view.bounds.size.width,self.view.bounds.size.height-50);

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
