Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361446;
	b=xWR5ZxpuoS3G9XqseEQCfFScy+HruNMTVezlbEAW7lYnK7hQ872YewfjrsWDXZUnq4cT
	 CSOPE0/RUUWqlSFcRryoR7YYtoRoC7mMEnvmP25kDpYnXfDlk4N8rL37z+6rRorC4EZy1
	 jzc78FIRpgJL8/E0V2iaORkrqu2sfNLeOakqHpgfHmqz/JOvEkM+rCSGk08UI0W9pUtdw
	 /XDXD3qLmCaHeE3X4UzYANtb+DSBj/oleidCFMNq0Fda/yllBiLbnz2vbaE3OPsXPHT4e
	 Sdmzb4VbLzuKihwFXXtYkVoSw1DLIlyAa/SEpFRmvipTW8wRnOv0yXJhxktdifwEXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
	b=d6pQdHJbESgtJe90gtH1nbPAuYcsb+P85Q62J0SEEM7pVKpVV2S3X+87YJrEo3fO1dRO
	 lexsNSiRM31FJuKwpMz5cbjdJKJJ6otGxU1mLRBzs0Vs2KnS+u1NNnXKZXkcpnj7HXGbG
	 CCUpJOV357P4T9GFf8tVyTrIvAZ2jOi+RuUDej3nFwBi29nXG/SdZz75ZxQIcGWR3D4d9
	 n7Tn0eFGoRiKLAY3ysk1aecxiy1vS9V/eT1gwyon7af80cZ3pJzUx0XgUL695SVX5F9bP
	 wev+GROQaAhn66DdzjmY0KV7KEJpH8k/EqLweSB44Xc6BmAihxPmAS8iRDlgztapZag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=W8ysNtmP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB947606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB947606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=W8ysNtmP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13136255e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361444; x=1795966244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
        b=W8ysNtmPBnMVYoXKNqmtqKZiRFQwRqMRKVP+OoSqog3bLmPQAcRVikDZkq2lOLhE7U
         0ZAShVm37S5JEfKWtZ/DtvdyQrokmXjZVvkmcYpTaGbkV0wxHLmMdYXghHZkCoZbh+Xd
         3ypKbU4nvlPGP9Noy5c9nCL2jslb8PgOaA3NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361444; x=1795966244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
        b=OC3KTetEGLEjOj31s34tjlpRjLfnP1F5698voiCziUaL+GU9hoV1OCBgHv8qMrTKPk
         CaLQRuG7mPkv8nGeoqgnhmcDoPIc1wiwyIyBMWAbKkqnBSLfT79b9/fJc5SbnkxH02PF
         ZLESug/gOmI8LSxGpdowpBLl0hEsPrpgl9HEOXCW1idOgoOQ3ULpOeVA/ekUk+D0HhZS
         2KpZwetyI66R+Bn69y7t5FERdfQLBsUHwDHrCfQ0maJFN6esL0TORtKhMdWGOh90JesV
         I17pyPWYFw4Us3WvMEDhmqnxQ1qKb/nfsQANgh0hH6cIUtQBAq1RFZ0TRwIZPl92T0wV
         cASA==
X-Forwarded-Encrypted: i=1; AL+hErFYG6gdKLJoAvG3x2b2XY+PZwP4jqZ+vqr+HLa5JIq+9Hf3tMt0ZtZiMg2QfWINbkqnOmHOHgwbKZffarY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zZlcFXrwIpg69Ek4rPxrFpIbLSun57dfwObLRJP36pjKHc0ee
	FH25+9ZdB8smysEsjl07z/99ozZH7tbaTFnVdTAPxJbmzQ7LcWpcmqs5UeNw/Tnkmew=
X-Gm-Gg: AZFdTZcfGqATEPeJWzGw2/T5ibvQq1ILRYp1kzmmphs03Z7OqE+Me7WZ93jTcN6+IHC
	s2tkFBgajJ0podIcXCaDQXaW1YCFSqdBDxUB/ret1sSQHe3IqCGMwAtRmCFTHHSmQd6KuwZXRUB
	ZQM8aADsmI6d35kyYJsfV/eaoObO6BhG6n6dfp66No8SdzQP0YgyhsWFWnS62qqMpKFH394dSKU
	EAm+dQ/4YUh6VZVE+ZzJqu2Cvn4j9MjYA0i8FwY8UdNDa4L2KOJcv0nZEyh/XsuhtP4aHVcZT/a
	Onc9bLx6otXM9qUIwVH6F9qUe8H5XfU058sDS0eDGfEEJsxp+JTP7D6bFwz666bE5RdvKcjPP+i
	GfJ7JlXKqQNHhKJtiSTVhPgwGiCc08agQKnTRrtCDghux0IgQuuYhPP3HsmP6FOk58gyj67nSIl
	zlNCL1aegMlnyNY2Wpb++G3gfIg0CZSXC+CXmIez9CsrXU0DQ3meEy32S+IOdGqbcVC+Z2ltuyL
	nlrXRPqIy1jDH9k2xs8LfvJ21ZxIEawxLnGfAMe1VE4EKyhefp85JQhbTdvVeM5pbG+16WHg68v
	YuD8wRFeUUNtrswogYn6LbaPGFeOyiGLU2FBnAMeWf8Dba48vY7X2Flcj3p8tsIlfsaoZG1NJQt
	c++ays/f1OOg281Dub/8jzYB0zgvC+PqJPKtR0OY397wPPXzRr9HjsHN7xuZhluP7gvqw7gDkkB
	I1xOXM2V0tFdEzxoHjEI+WyPkqIBSNOTtaR46Kl8GLh6H/4sE=
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr182002275e9.35.1795361444382;
        Sun, 22 Nov 2026 07:30:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Vasut <marex@denx.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/8] drm: State readout for the i.MX8MN display pipeline
Date: Sun, 22 Nov 2026 16:30:00 +0100
Message-ID: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements the hardware state readout [1] for the display
pipeline of the i.MX8MN (LCDIF, Samsung DSIM, Synaptics R63353 panel),
so that the splash screen shown by the bootloader stays on, without a
modeset, until a client draws.

The first two patches add the hooks a bridge and a panel need to
acquire their resources (runtime PM, regulators) when they are found
enabled. They are a proposal, since the drivers converted so far
didn't need them.

The series is based on [1] and needs [2] to keep the power domains of
the display on.

Tested on i.MX8MN (BSH SMM S2 PRO).

[1] https://lore.kernel.org/r/20261106-drm-state-readout-v8-0-cbe78624e1bc@kernel.org
[2] https://lore.kernel.org/r/20261122095927.2631909-1-dario.binacchi@amarulasolutions.com


Dario Binacchi (8):
  drm/bridge: Add atomic_sro_install_state hook
  drm/panel: Add sro_install hook
  drm/mxsfb: Use the bridge connector
  drm/mxsfb: Switch to drm_mode_config_create_initial_state()
  drm/mxsfb: Stop the controller in hw_reset
  drm/mxsfb: Implement hw state readout
  drm/bridge: samsung-dsim: Implement hw state readout
  drm/panel: synaptics-r63353: Support hw state readout

 drivers/gpu/drm/bridge/samsung-dsim.c         | 125 +++++-
 drivers/gpu/drm/drm_bridge.c                  |  41 ++
 drivers/gpu/drm/drm_panel.c                   |  16 +
 drivers/gpu/drm/mxsfb/Kconfig                 |   2 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  31 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 394 +++++++++++++++++-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h            |   3 +
 .../gpu/drm/panel/panel-synaptics-r63353.c    |  33 +-
 include/drm/drm_bridge.h                      |  20 +
 include/drm/drm_panel.h                       |  10 +
 10 files changed, 642 insertions(+), 33 deletions(-)

---
base-commit: fe97bd8df0365f5aa27ea88b621e3f475bdd544d
branch: drm-sro-rfc

-- 
2.43.0

