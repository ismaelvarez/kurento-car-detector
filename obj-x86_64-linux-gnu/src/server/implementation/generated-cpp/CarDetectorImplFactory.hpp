/* Autogenerated with kurento-module-creator */

#ifndef __CAR_DETECTOR_IMPL_FACTORY_HPP__
#define __CAR_DETECTOR_IMPL_FACTORY_HPP__

#include "CarDetectorImpl.hpp"
#include "OpenCVFilterImplFactory.hpp"
#include <Factory.hpp>
#include <MediaObjectImpl.hpp>
#include <boost/property_tree/ptree.hpp>

namespace kurento
{
namespace module
{
namespace cardetector
{

class CarDetectorImplFactory : public virtual OpenCVFilterImplFactory
{
public:
  CarDetectorImplFactory() = default;

  std::string getName() const override {
    return "CarDetector";
  };

private:

  MediaObjectImpl *createObjectPointer (
      const boost::property_tree::ptree &conf,
      const Json::Value &params) const override;

  MediaObjectImpl *createObject (const boost::property_tree::ptree &conf, std::shared_ptr<MediaPipeline> mediaPipeline, const std::string &path, const std::string &idCam, double scaleFactor, int minNeighbors, int width, int height) const;
};

} /* cardetector */
} /* module */
} /* kurento */

#endif /*  __CAR_DETECTOR_IMPL_FACTORY_HPP__ */