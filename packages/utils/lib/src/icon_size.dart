enum IconSize { low, medium, high }

double getIconSize(IconSize size) {
  switch (size) {
    case IconSize.low:
      return 32;
    case IconSize.medium:
      return 48;
    case IconSize.high:
      return 64;
    default:
      return 48;
  }
}
