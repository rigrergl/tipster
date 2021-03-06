//
//  TipViewController.m
//  Tipster
//
//  Created by Rigre Reinier Garciandia Larquin on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;


@property Boolean areLabelsHidden;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect billFrame = self.billAmountField.frame;
    billFrame.origin.y += 200;
    self.billAmountField.frame = billFrame;
    
    CGRect labelsFrame = self.labelsContainerView.frame;
    labelsFrame.origin.y += 200;
    self.labelsContainerView.frame = labelsFrame;
    
    self.labelsContainerView.alpha = 0;
    
    self.areLabelsHidden = true;
    
    self.billAmountField.placeholder = @"$";
    
    [self.billAmountField becomeFirstResponder];
    
    
    //Defaults
    NSInteger defaultPercentageIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"selectedPercentageIndex"];
    self.tipPercentageControl.selectedSegmentIndex = defaultPercentageIndex;
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}

- (IBAction)updateLabels:(id)sender {
    if(self.billAmountField.text.length == 0){
        [self hideLabels];
    } else if (self.areLabelsHidden){
        [self showLabels];
    }
    
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", total];
}

- (void) hideLabels {
    self.areLabelsHidden = true;
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y += 200;
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
    }];
}

- (void) showLabels {
    self.areLabelsHidden = false;
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y -= 200;
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -= 200;
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 1;
    }];
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
