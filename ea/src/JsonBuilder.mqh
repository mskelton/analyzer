/**
 * Helper class for building up JSON objects and arrays.
 */
class JsonBuilder {
 private:
  string json;

  template <typename T>
  void set(string key, T value) {
    append("\"" + key + "\":" + value);
  }

 public:
  void clear() {
    json = "";
  }

  bool empty() {
    return !StringLen(json);
  }

  void append(string value) {
    json += (StringLen(json) ? "," : "") + value;
  }

  void setString(string key, string value) {
    if (StringLen(value))
      set(key, "\"" + value + "\"");
  }

  void setInt(string key, ulong value) {
    if (value)
      set(key, string(value));
  }

  void setDouble(string key, double value) {
    if (value)
      set(key, string(value));
  }

  string toArray() { return "[" + json + "]"; }

  string toObject() { return "{" + json + "}"; }
};
