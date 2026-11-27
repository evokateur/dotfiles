from IPython import get_ipython
from IPython.display import Markdown

get_ipython().display_formatter.formatters["text/plain"].for_type(
    Markdown, lambda value, printer, cycle: printer.text(value.data)
)
