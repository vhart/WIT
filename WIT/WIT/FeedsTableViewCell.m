//
//  FeedsTableViewCell.m
//  WIT
//
//  Created by Diana Elezaj on 11/1/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "FeedsTableViewCell.h"




@implementation FeedsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
    
    self.hi5ClickedIcon = [UIImage imageNamed:@"hi5IconTapped"];


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)hi5ButtonTapped:(UIButton *)sender {
    NSLog(@"Hi5");
    [self.hi5Button setBackgroundImage:self.hi5ClickedIcon forState:UIControlStateNormal];
}

@end
