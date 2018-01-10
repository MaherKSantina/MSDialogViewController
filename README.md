# MSDialogViewController
A subclass of UIViewController that will be presented in a popover dialog 

![Demo](https://user-images.githubusercontent.com/24646608/34752853-df2dd792-f608-11e7-8a3c-2623bd9d2435.gif)

# Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Deployment](#deployment)
4. [Authors](#authors)
4. [License](#license)

## Prerequisites

- XCode 9

## Usage

1. Add two view controllers

2. Add a button to the first view controller

3. Set the class of the second view controller to **DialogViewController**

    ![Image](https://user-images.githubusercontent.com/24646608/34750182-d31ff0c0-f5f9-11e7-83d1-621744a73f9d.png)

4. Add a Modal Presentation segue from the button in the first view controller to the dialog view controller 

5. Disable the Animates checkbox

    ![Image](https://user-images.githubusercontent.com/24646608/34750368-d259f572-f5fa-11e7-95bf-e38d51660bd4.png)
    
6. Click on the main view of the dialog view controller

    ![Image](https://user-images.githubusercontent.com/24646608/34750428-24510884-f5fb-11e7-8bf9-8ff5c5fb30a5.png)

7. Change the background color to Clear Color

    ![Image](https://user-images.githubusercontent.com/24646608/34750478-5e327204-f5fb-11e7-9738-486e3410bd8a.png)
    
8. Click on the dialog view controller
    
    ![Image](https://user-images.githubusercontent.com/24646608/34750562-c330b594-f5fb-11e7-8cc5-8f38eb725cfd.png)
    
9. Change presentation to Over Current Context

    ![Image](https://user-images.githubusercontent.com/24646608/34750635-2f9fa898-f5fc-11e7-8748-17564c451639.png)
    
10. Add the dialog view you want to show in the dialog view controller and position it wherever you want

    ![Image](https://user-images.githubusercontent.com/24646608/34750797-2e8a0b46-f5fd-11e7-9c27-d3c5a9d966bb.png)
    
11. Connect the **mainView** Outlet of the dialog view controller to the view added

    ![Image](https://user-images.githubusercontent.com/24646608/34750926-cdce2d90-f5fd-11e7-9abd-46f7176cdf55.png)
    
12. Run the application and click on the button. It should open the dialog view

## Deployment

If you want to use the dialog view controller in your own project just copy the DialogView Folder.

## Authors

* **Maher Santina** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
