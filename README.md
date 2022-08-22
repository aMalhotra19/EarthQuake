# Dear Reviewer, Thank you for taking time to review my code.

Listing out the details of the code as below:

Design Pattern: MVVM

Deployment target: 13.0

Details:

* App will fetch data of earthquake for past 30 days as per api documentation
* Based on api response, a failure or successfull data representation after the api call is completed
* App will monitor network, which if incase is not available, display error on UI, And update the Ui once connectivity is back.
* Network layer is kept as a separate Module and is platform agnostic. 

Implementation Details:

* Service Manager: A class to manage service call with internet connectivity and return earthquake model.
* Data Manager: Data manager for the app.
* Date Utility: Utility to convert date in required format
* UIActivityIndicatorView+Helper: Activity indicator helper extension
* EarthquakeCellViewModel: Cell view model for Earthquake Cell
* EarthquakeViewModel: ViewModel for EarthquakeViewController
* EarthquakeViewController: Displays data for earthquake and navigates the user to USGS website for relevant earyhquake data
* NetworkServices: Makes api call and returns data/error
* NetworkMonitor: Monitors the connectivity of device and returns true/false accordingly
