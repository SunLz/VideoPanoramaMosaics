//
// main.m
// OpenCVTest
//
// Created by __MyName__ on 16/09/11.
// Copyright 2011 __MyCompanyName__. All rights reserved.
//

//#import "opencv2/opencv.hpp"

using namespace cv;



int main (int argc, const char * argv[])
{
    Mat frameOne,              // first frame captured from webcam
    frameTwo,                  // second frame captured from webcam
    merged_frame,              // big frame for combining two frames
    roi;                       // Region Of Interest for merged_frame
    
    merged_frame = Mat(cv::Size(640, 480), CV_8UC3);
    
    VideoCapture firstCap(0);
    if (!firstCap.isOpened()) {
        return 1;
    }
    
    VideoCapture secondCap(1);
    if (!secondCap.isOpened()) {
        return 1;
    }
    
    firstCap.set(CV_CAP_PROP_FRAME_WIDTH, 320);
    firstCap.set(CV_CAP_PROP_FRAME_HEIGHT, 480);
    
    secondCap.set(CV_CAP_PROP_FRAME_WIDTH, 320);
    secondCap.set(CV_CAP_PROP_FRAME_HEIGHT, 480);
    
    Mat firstFrame;  //frame from first webcam
    Mat secondFrame;  //frame from second webcam
    
    cvNamedWindow("Video Panorama mosaics");
    
    while (true) {
        if (!firstCap.read(firstFrame) || !secondCap.read(secondFrame)) {
            break;
        }
        
        
        
        merged_frame = Mat(cv::Size(640, 480), CV_8UC3);
        roi = Mat(merged_frame, cv::Rect(0, 0, 320, 480));
        
        firstFrame.copyTo(roi);
        roi = Mat(merged_frame, cv::Rect(320, 0, 320, 480));
        secondFrame.copyTo(roi);
        
        
        imshow("Video Panorama mosaics", merged_frame);
    }
    
    
    //    resize(frame, working_frame, cv::Size(), 0.5, 0.5);
    //    flip(working_frame, working_frame, 1);
    //
    
    
    
    
    
    return 0;
}