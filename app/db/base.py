# Import all the models, so that Base has them before being
# imported by Alembic
from app.db.base_class import Base  # noqa
from app.models.user import User  # noqa
from app.models.token import Token  # noqa
from app.models.creature import Creature
from app.models.creature_type import CreatureType
from app.models.event import Event
from app.models.hemisphere import Hemisphere
from app.models.location import Location
from app.models.user_caught_creatures import UserCaughtCreature