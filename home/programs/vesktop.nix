{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.nixcord];
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    config = {
      useQuickCss = true;
      themeLinks = [
        "https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-catppuccin-mocha.theme.css"
      ];
      frameless = true;
      plugins = {
        alwaysExpandRoles.enable = true;
        alwaysTrust.enable = true;
        betterSessions.enable = true;
        callTimer.enable = true;
        copyFileContents.enable = true;
        copyUserURLs.enable = true;
        decor.enable = true;
        disableCallIdle.enable = true;
        emoteCloner.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        greetStickerPicker.enable = true;
        implicitRelationships.enable = true;
        loadingQuotes.enable = true;
        memberCount.enable = true;
        messageLatency.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        noReplyMention.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        platformIndicators.enable = true;
        previewMessage.enable = true;
        relationshipNotifier.enable = true;
        sendTimestamps.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        silentTyping = {
          enable = true;
          showIcon = true;
        };
        spotifyControls.enable = true;
        typingIndicator.enable = true;
        unindent.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewIcons.enable = true;
        voiceChatDoubleClick.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
      };
    };
  };
}
