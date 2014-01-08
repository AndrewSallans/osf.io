from .model.settings import AddonWikiNodeSettings
from .routes import settings_routes, widget_routes

SETTINGS_MODEL = AddonWikiNodeSettings

ROUTES = [settings_routes, widget_routes]

SHORT_NAME = 'wiki'
FULL_NAME = 'Wiki'

ADDED_BY_DEFAULT = True

CATEGORIES = ['documentation']

INCLUDE_JS = {
    'widget': [],
    'page': [],
}

INCLUDE_CSS = {
    'widget': [],
    'page': [],
}

HAS_PAGE = True
