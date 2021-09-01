/* Autogenerated with kurento-module-creator */

#ifndef __CAR_DETECTOR_IMPL_HPP__
#define __CAR_DETECTOR_IMPL_HPP__

#include "OpenCVFilterImpl.hpp"
#include "CarDetector.hpp"
#include <EventHandler.hpp>
#include <boost/property_tree/ptree.hpp>
#include "CarDetectorOpenCVImpl.hpp"

namespace kurento
{
namespace module
{
namespace cardetector
{
class CarDetectorImpl;
} /* cardetector */
} /* module */
} /* kurento */

namespace kurento
{
void Serialize (std::shared_ptr<kurento::module::cardetector::CarDetectorImpl> &object, JsonSerializer &serializer);
} /* kurento */

namespace kurento
{
class MediaPipelineImpl;
} /* kurento */

namespace kurento
{
namespace module
{
namespace cardetector
{

class CarDetectorImpl : public OpenCVFilterImpl, public virtual CarDetector, public virtual CarDetectorOpenCVImpl
{

public:

  CarDetectorImpl (const boost::property_tree::ptree &config, std::shared_ptr<MediaPipeline> mediaPipeline, const std::string &path, const std::string &idCam, double scaleFactor, int minNeighbors, int width, int height);

  virtual ~CarDetectorImpl() = default;

  virtual std::string getPath ();
  virtual void setPath (const std::string &path);

  virtual std::string getIdCam ();
  virtual void setIdCam (const std::string &idCam);

  virtual double getScaleFactor ();
  virtual void setScaleFactor (double scaleFactor);

  virtual int getMinNeighbors ();
  virtual void setMinNeighbors (int minNeighbors);

  virtual int getWidth ();
  virtual void setWidth (int width);

  virtual int getHeight ();
  virtual void setHeight (int height);

  /* Next methods are automatically implemented by code generator */
  virtual bool connect (const std::string &eventType, std::shared_ptr<EventHandler> handler);
  virtual void invoke (std::shared_ptr<MediaObjectImpl> obj,
                       const std::string &methodName, const Json::Value &params,
                       Json::Value &response);

  virtual void Serialize (JsonSerializer &serializer);

private:

  class StaticConstructor
  {
  public:
    StaticConstructor();
  };

  static StaticConstructor staticConstructor;

};

} /* cardetector */
} /* module */
} /* kurento */

#endif /*  __CAR_DETECTOR_IMPL_HPP__ */
