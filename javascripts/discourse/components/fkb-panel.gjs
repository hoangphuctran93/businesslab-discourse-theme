import Component from "@glimmer/component";
import { service } from "@ember/service";
import i18n from "discourse-common/helpers/i18n";
import replaceEmoji from "discourse/helpers/replace-emoji";
import DButton from "discourse/components/d-button";
import formatDate from "discourse/helpers/format-date";
import avatar from "discourse/helpers/avatar";
import FkbPanelToggleButton from "../components/fkb-panel-toggle-button";
import FkbPanelItems from "../components/fkb-panel-items";
import RightSidebarBlocksBelow from "../components/right-sidebar-blocks-below";
import ConditionalLoadingSpinner from "discourse/components/conditional-loading-spinner";

export default class FKBPanel extends Component {
  @service currentUser;
  @service site;

  <template>
    {{#unless this.site.mobileView}}
      <div class="fkb-panel-phantom"></div>
      <div class="fkb-panel">
        <div class="fkb-panel-contents">
          {{#if this.currentUser}}
            <div class="user-info">
              <a href={{this.currentUser.userPath}} data-user-card={{this.currentUser.username}}>{{avatar this.currentUser imageSize="large"}}</a>
              <div class="user-detail">
                <a href={{this.currentUser.userPath}} class="username">{{this.currentUser.username}}</a>
                <div class="name" title={{this.currentUser.name}}>{{this.currentUser.name}}</div>
                <div class="last-seen">
                  {{i18n (themePrefix "last_seen")}}
                  {{formatDate this.currentUser.last_seen_at format="medium-with-ago"}}
                </div>
              </div>
            </div>
      
            <ConditionalLoadingSpinner @condition={{this.loading}}>
              <div class="fkb-panel-items">
                <FkbPanelItems />
              </div>
            </ConditionalLoadingSpinner>
          {{/if}}
      
          {{#unless this.currentUser}}
            <div class="visitor">
              <h2>{{i18n (themePrefix "sidebar.welcome")}}</h2>
              {{#if settings.custom_sidebar_enabled}}
                {{#if settings.custom_sidebar_image}}
                  <img src="{{settings.custom_sidebar_image}}"/>
                {{/if}}
                <p>{{{settings.custom_sidebar_description}}}</p>
                {{else}}
                {{replaceEmoji (i18n "signup_cta.value_prop")}}
              {{/if}}
              <DButton @class="btn-primary sign-up-button" @action={{routeAction "showCreateAccount"}} @label="sign_up" />
            </div>
          {{/unless}}
        </div>
  
        <RightSidebarBlocksBelow />
      </div>
  
      <div class="fkb-panel-toggle-button">
        <FkbPanelToggleButton />
      </div>
    {{/unless}}
  </template>
}
