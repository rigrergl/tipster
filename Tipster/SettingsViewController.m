//
//  SettingsViewController.m
//  Tipster
//
//  Created by Rigre Reinier Garciandia Larquin on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultSelection;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)setDefaultPercentage:(id)sender {
//    double tipPercentages[] = {0.15, 0.2, 0.25};
//    double tipPercentage = tipPercentages[self.defaultSelection.selectedSegmentIndex];
    
//    NSLog(@"%f", tipPercentage);
    
    NSNumber *defaultPercentageIndex = [NSNumber numberWithInt:self.defaultSelection.selectedSegmentIndex];
    [[NSUserDefaults standardUserDefaults] setObject: defaultPercentageIndex forKey:@"selectedPercentageIndex"];
    
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
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
