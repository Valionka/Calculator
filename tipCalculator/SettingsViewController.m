//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Valentin Mihaylov on 9/8/16.
//  Copyright © 2016 codepath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (IBAction)onSettingChange:(UISegmentedControl *)sender {
    // save the tip percentage setting
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger selectorIndex = self.tipControl.selectedSegmentIndex;
    [defaults setInteger:selectorIndex forKey:@"index"];
    [defaults synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateTipControl];
}

- (void) updateTipControl {
    // read the saved tip percentage and set segmented control selected index
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"index"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
