from django.core.management import BaseCommand, CommandError

from channels import DEFAULT_CHANNEL_LAYER
from channels.layers import get_channel_layer
from channels.log import setup_logger
from channels.routing import get_default_application

from apps.ChannelsMqtt.mqtt_worker import Server
from apps.ChannelsMqtt import settings


class Command(BaseCommand):

    leave_locale_alone = True
    worker_class = Server

    def add_arguments(self, parser):
        super(Command, self).add_arguments(parser)
        parser.add_argument(
            "--layer", action="store", dest="layer", default=DEFAULT_CHANNEL_LAYER,
            help="Channel layer alias to use, if not the default.",
        )

    def handle(self, *args, **options):
        # Get the backend to use
        self.verbosity = options.get("verbosity", 1)
        # Get the channel layer they asked for (or see if one isn't configured)
        if "layer" in options:
            self.channel_layer = get_channel_layer(options["layer"])
        else:
            self.channel_layer = get_channel_layer()
        if self.channel_layer is None:
            raise CommandError("You do not have any CHANNEL_LAYERS configured.")
        # Run the worker
        self.logger = setup_logger("django.channels", self.verbosity)
        # self.logger.info("Running worker for channels %s", options["channels"])
        worker = self.worker_class(
            get_default_application(),
            self.channel_layer,
        )
        worker.run()