import { withPluginApi } from "discourse/lib/plugin-api";

export default {
    name: "custom-icons",
    initialize() {
        withPluginApi("0.8", (api) => {
            api.replaceIcon('comment', 'icon-messages');
            api.replaceIcon('search', 'icon-search');
            api.replaceIcon('bars', 'icon-menu');
            api.replaceIcon('home', 'icon-home');
            api.replaceIcon('user', 'icon-personal');
            api.replaceIcon('envelope', 'icon-inbox');
            api.replaceIcon('bookmark', 'icon-saved');
            api.replaceIcon('cog', 'icon-setting');
            api.replaceIcon('d-regular', 'icon-plus');
        });
    }
};
