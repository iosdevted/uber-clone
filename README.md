# Uber Clone 🚕
iOS Uber Clone with Swift &amp; Firebase

<p>
 This project is a clone of Uber which is a transportation network application. It allows riders to submit trip request which is then routed to Uber drivers who use their own cars.
</p>

<center>
  <img src="https://user-images.githubusercontent.com/50784573/105034607-11cdd700-5a9d-11eb-9193-716f06837119.jpg"/>
</center>

## User Types

- Rider: You can request a ride while looking at your location (which is updated very frequently) on a map. Once you click the 'Request Ride' button, your request is stored on the online database.
- Driver: You can view available requests from other riders. Once you click on a request, you see the rider's postition relative to yours on a map. Accepting the request brings up a navigation dialog to the rider's position.

## How to run a demo app

1. Download the source code by cloning this repository
2. Download the GoogleService-Info.plist file from your <a href="https://console.firebase.google.com">Firebase Console</a> and replace the existing file in the folder. This will connect the app to your own Firebase instance.
3. Install the pods by running

```
pod install
```

4. Open the xcworkspace file with the latest version of Xcode
