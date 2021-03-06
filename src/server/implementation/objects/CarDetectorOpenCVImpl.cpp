/* Autogenerated with kurento-module-creator */

#include "CarDetectorOpenCVImpl.hpp"
#include <KurentoException.hpp>

namespace kurento
{
namespace module
{
namespace cardetector
{

CarDetectorOpenCVImpl::CarDetectorOpenCVImpl (const std::string &path, const std::string &idCam, double scaleFactor, int minNeighbors, int width, int height) :
path(path), idCam(idCam), scaleFactor(scaleFactor), minNeighbors(minNeighbors), width(width), height(height)
{
  carClassifier.load(path);
}

/*
 * This function will be called with each new frame. mat variable
 * contains the current frame. You should insert your image processing code
 * here. Any changes in mat, will be sent through the Media Pipeline.
 */
void CarDetectorOpenCVImpl::process (cv::Mat &mat)
{
  std::vector< cv::Rect > rects;
  carClassifier.detectMultiScale(mat, rects, this->scaleFactor, this->minNeighbors, 0, cv::Size(this->width, this->height));

  if (carsDetectedLastFrame != rects.size()) {
    carsDetectedLastFrame = rects.size();
    CarsDetected event(OpenCVProcess::getSharedPtr(), CarsDetected::getName(), carsDetectedLastFrame, this->idCam);
    signalCarsDetected(event);
  }

  for (auto rect : rects) {
    cv::rectangle(mat, rect, cv::Scalar(255, 255, 255), 1, 1, 0);
  }
}


std::string CarDetectorOpenCVImpl::getPath ()
{
  return this->path;
}

void CarDetectorOpenCVImpl::setPath (const std::string &path)
{
  this->path = path;
}

std::string CarDetectorOpenCVImpl::getIdCam ()
{
  return this->idCam;
}

void CarDetectorOpenCVImpl::setIdCam (const std::string &idCam)
{
  this->idCam = idCam;
}

double CarDetectorOpenCVImpl::getScaleFactor ()
{
  return this->scaleFactor;
}

void CarDetectorOpenCVImpl::setScaleFactor (double scaleFactor)
{
  this->scaleFactor = scaleFactor;
}

int CarDetectorOpenCVImpl::getMinNeighbors ()
{
  return this->minNeighbors;
}

void CarDetectorOpenCVImpl::setMinNeighbors (int minNeighbors)
{
  this->minNeighbors = minNeighbors;
}

int CarDetectorOpenCVImpl::getWidth ()
{
  return this->width;
}

void CarDetectorOpenCVImpl::setWidth (int width)
{
  this->width = width;
}

int CarDetectorOpenCVImpl::getHeight ()
{
  return this->height;
}

void CarDetectorOpenCVImpl::setHeight (int height)
{
  this->height = height;
}


} /* cardetector */
} /* module */
} /* kurento */
