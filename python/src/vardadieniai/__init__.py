"""Lietuvos vardadienių kalendorius (Lithuanian name days). Kodas – MIT, duomenys – CC BY-SA 4.0."""
from .core import HOMEPAGE, days_for, month, names_on, today, tomorrow

__version__ = "1.0.0"
__all__ = ["today", "tomorrow", "names_on", "days_for", "month", "HOMEPAGE", "__version__"]
