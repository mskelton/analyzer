#include "JsonBuilder.mqh"

/**
 * The data builder is responsible for building the JSON data sent to Analyzer
 * for each batch of deals.
 */
class DataBuilder : public JsonBuilder {
 public:
  string toString() {
    return "{\"deals\": " + toArray() + "}";
  }
};
