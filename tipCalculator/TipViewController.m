//
//  ViewController.m
//  tipCalculator
//
//  Created by Valentin Mihaylov on 9/7/16.
//  Copyright © 2016 codepath. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;


@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    // update the control selected index
    [self updateTipControl];
    // update the values of the tip calculator
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateTipControl];
    [self updateValues];
}

- (void) updateTipControl {
    // read the saved tip percentage and set segmented control selected index
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"index"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    // get the bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // compute the tip and total
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    // update the UI
    self.tipLabel.text = [NSString stringWithFormat: @"$%.02f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.02f", totalAmount];
}

@end
