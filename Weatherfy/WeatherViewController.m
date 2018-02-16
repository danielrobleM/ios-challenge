//
//  WeatherViewController.m
//  Weatherfy
//
//  Created by Eduardo Toledo on 12/13/17.
//  Copyright © 2017 SoSafe. All rights reserved.
//

#import "WeatherViewController.h"
#import "Weatherfy-Swift.h"
@import MapKit;

@interface WeatherViewController () {
	WeatherViewModel *viewModel;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet UILabel *varianceLabel;
@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	viewModel = [[WeatherViewModel alloc]init];
}

- (IBAction)onActionButtonPressed:(UIButton *)sender {
    [self.textField resignFirstResponder];
    [self updateLabels];
	[viewModel findWithCity:self.textField.text completion:^(CLLocation * location) {
		[self moveMapToCoordinates:location.coordinate];
	}];
}

- (void)updateLabels {
    self.averageLabel.text = @"-1";
    self.varianceLabel.text = @"-1";

}

- (void)moveMapToCoordinates:(CLLocationCoordinate2D)coordinates {
    [self.mapView setCenterCoordinate:coordinates animated:YES];
}

@end
