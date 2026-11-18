Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020715;
	b=rPfujkQ+H6WZ3qDGCheJcAcyDR1MO6yw89f1E4r/TeSaa0zhxNcCnmEOs1kDPJ8avIBI
	 TK4hQrDQOW6AqE5LbtzhSLiI9UcGnyio4XaOpEds/MyGezuHbDZ+m3LYR7nUx4pev10wY
	 5xgWj5KTnbPXaVLq1oc5tmN6SMkXcZh2T8a8CUrM3KMp8XL84XBON5yCeOO5Ajnc/m0MH
	 p00oxcrJeNL13LZvxEEABALyHxxFqELCh6MjrGv6EI9JgGIuzhoYoS2K+zbVrSgI5mS2z
	 1WgYpRht6NV8T6ajkZgrMCRs4lvITUepX+B185BY397esXLI5B3ZH8iuwpjdj82KOBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020715;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=uSF6Lm8D9ry+Y4D3XvKzoxiIo/io7aCbvge+8z/Jst0=;
	b=f3UvbWv+IM8lTIsudMoHmuUjzpIFh4g6+pAeHgaS8q3Cvd9yjiO/FakBH19uyfKGdGaz
	 qPt3LPI+bLn9XauXWAWVwGdak7VZx94rV3HpscCw0eWkDdGXbcKOR9OoqC+i93eBlJQUg
	 SYHpUSdZl3Gau4GmsahIy+O9kMrAOkm2lvObzqqTQ6v0u2b6oK8B/Cc9APFiWKorMOn53
	 foLP9MOrg62OJw4k4Li+ZBMwzQW7ROQ2ADIplgjRvTUQmdB3VbVbEChg5uf0oqgjH+zgj
	 JVTTL2UlKEPPPO2f2nD2o8tXP7RKboZQdu7/10QThvXsv/pRxpEjd4tURJzG7zX8IwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PogcMlwB;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB760A2613
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FB760A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PogcMlwB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A502FC4F77B;
	Wed, 18 Nov 2026 16:51:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFC015FE9B;
	Wed, 18 Nov 2026 16:51:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9782911BC28D5;
	Wed, 18 Nov 2026 17:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020707; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uSF6Lm8D9ry+Y4D3XvKzoxiIo/io7aCbvge+8z/Jst0=;
	b=PogcMlwBR63e9momGn9yjG4jUwb6nd2qRa7NNgPHc43TLqn91hUljIQrJSJWfM8AyZ+9Q7
	CstFhlZ3Gt5JuM+JsircvYwm/qipxMd77w0ET/+GbelZA8DMIKgT5OzSvq4Hzv1yDvigm/
	N3yEVF8VYu9B8tbuPjfSeDluw208JkeHFIPLspSl1TaavtzMceifzEdiOe4WexlyvghBul
	K3GA2n5TY9Mky9UbYWPqDaVMTbYBBPfauFfhE/mNGXt/nYBG6oGI/Z5QlChVB6iqelWIhy
	NQS2NjUVOQYUXYJALwwOk6uS7o3tZictG+ILfoobCfSRWcmrBFrvjUywYRyuww==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:59 +0100
Subject: [PATCH RFC v3 16/31] drm: event-notifier: add mechanism to notify
 about hotplug events
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-16-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

In preparation for supporting DRM bridge hotplug, add an event notifier to
allow interested parties to be notified about events they need to react to.

For the initial implementation of bridge hotplug, a few events are needed:

 * A bridge was added (happening in drm_bridge.c)
 * A bridge was detached (happening in drm_bridge.c)
 * A MIPI device was attached to a MIPI host (happening in drm_mipi_dsi.c)

Being originated from different modules, implement the event notifier
mechanism in a new module with minimal dependencies that event producers
can easily use to send events.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Renamed to clarify the scope is only about hotplug
- Extend enum drm_event_notifier_event documentation
- Add DRM_BRIDGE_ADDED event to support non-DSI (and some DSI too) bridges
- Reword event description in a more concise way
- Make DRM_HOTPLUG_EVENT_NOTIFIER a bool, not a tristate: DRM_MIPI_DSI
  cannot be made a tristate with current code, and it depends on
  DRM_HOTPLUG_EVENT_NOTIFIER
- Use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL to avoid GPL-bypass of the
  notifier API

Changes in v2:
- added missing include
---
 MAINTAINERS                                  |  8 ++++
 drivers/gpu/drm/Kconfig                      |  3 ++
 drivers/gpu/drm/Makefile                     |  2 +
 drivers/gpu/drm/drm_hotplug_event_notifier.c | 62 ++++++++++++++++++++++++++++
 include/drm/drm_hotplug_event_notifier.h     | 52 +++++++++++++++++++++++
 5 files changed, 127 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ebc0f35ae59..fc404918c938 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9319,6 +9319,14 @@ F:	include/drm/drm_gpusvm.h
 F:	include/drm/drm_pagemap.h
 F:	include/drm/drm_pagemap_util.h
 
+DRM HOTPLUG EVENT NOTIFIER
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_hotplug_event_notifier.c
+F:	include/drm/drm_hotplug_event_notifier.h
+
 DRM LOG
 M:	Jocelyn Falempe <jfalempe@redhat.com>
 M:	Javier Martinez Canillas <javierm@redhat.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b1c6..5268bf47b2e3 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -33,6 +33,9 @@ endmenu
 
 if DRM
 
+config DRM_HOTPLUG_EVENT_NOTIFIER
+	bool
+
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923..e4268c5b771a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -95,6 +95,8 @@ drm-$(CONFIG_DRM_DRAW) += drm_draw.o
 drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
 obj-$(CONFIG_DRM)	+= drm.o
 
+obj-$(CONFIG_DRM_HOTPLUG_EVENT_NOTIFIER) += drm_hotplug_event_notifier.o
+
 obj-$(CONFIG_DRM_PANEL) += drm_panel.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
diff --git a/drivers/gpu/drm/drm_hotplug_event_notifier.c b/drivers/gpu/drm/drm_hotplug_event_notifier.c
new file mode 100644
index 000000000000..9cc252d10c73
--- /dev/null
+++ b/drivers/gpu/drm/drm_hotplug_event_notifier.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal event notifier of events about DRM bridge hotplug
+ *
+ * Copyright (C) 2026 GE HealthCare
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#include <linux/module.h>
+#include <linux/notifier.h>
+
+#include <drm/drm_hotplug_event_notifier.h>
+
+static BLOCKING_NOTIFIER_HEAD(drm_hotplug_event_notifier);
+
+/**
+ * drm_hotplug_event_notifier_register - Register to be notified of DRM
+ *                                       hotplug events
+ * @nb: the notifier block to be registered
+ *
+ * @nb will be notified of events defined in
+ * &drm_hotplug_event_notifier_event
+ *
+ * Returns 0 on success, %-EEXIST on error.
+ */
+int drm_hotplug_event_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&drm_hotplug_event_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(drm_hotplug_event_notifier_register);
+
+/**
+ * drm_hotplug_event_notifier_unregister - Unregister from being notified
+ *                                         of DRM hotplug events
+ * @nb: the notifier block to be unregistered
+ *
+ * @nb will stop being notified of events defined in
+ * &drm_hotplug_event_notifier_event
+ *
+ * Returns zero on success or %-ENOENT on failure.
+ */
+int drm_hotplug_event_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&drm_hotplug_event_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(drm_hotplug_event_notifier_unregister);
+
+/**
+ * drm_hotplug_event_notifier_notify - Emit an event to be notified to
+ *                                     registered entities
+ * @event: event ID as defined in &drm_hotplug_event_notifier_event
+ * @data: metadata associated to the event
+ */
+void drm_hotplug_event_notifier_notify(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&drm_hotplug_event_notifier, event, data);
+}
+EXPORT_SYMBOL_GPL(drm_hotplug_event_notifier_notify);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_DESCRIPTION("Notifier for DRM components addition/removal and attach/detach");
diff --git a/include/drm/drm_hotplug_event_notifier.h b/include/drm/drm_hotplug_event_notifier.h
new file mode 100644
index 000000000000..008e041444be
--- /dev/null
+++ b/include/drm/drm_hotplug_event_notifier.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Internal event notifier of events about DRM bridge hotplug
+ *
+ * Copyright (C) 2026 GE HealthCare
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#ifndef _DRM_HOTPLUG_EVENT_NOTIFIER_H_
+#define _DRM_HOTPLUG_EVENT_NOTIFIER_H_
+
+#include <linux/notifier.h>
+
+/**
+ * enum drm_hotplug_event_notifier_event - DRM bridge hotplug and
+ *                                         hotunplug events
+ *
+ * Describe any event about DRM bridge appearing, disappearing, or getting
+ * connected at runtime (hotplug). Any of these events may need to trigger
+ * a response in order to start or stop the video pipeline, including
+ * creating or destroying a drm_connector.
+ *
+ * Each of these events is accompanied by a void* argument, whose meaning
+ * is event-specific and defined per each event.
+ */
+enum drm_hotplug_event_notifier_event {
+	/**
+	 * @DRM_MIPI_DSI_ATTACHED: A MIPI DSI device has just been attached
+	 * to its MIPI DSI host. @data is a pointer to the attached &struct
+	 * mipi_dsi_device.
+	 */
+	DRM_MIPI_DSI_ATTACHED,
+	/**
+	 * @DRM_BRIDGE_ADDED: A bridge has just been added by calling
+	 * drm_bridge_add(). As such, it is not yet attached to an encoder
+	 * and is not part of any encoder bridge chain. @data is a pointer
+	 * to the added &struct drm_bridge.
+	 */
+	DRM_BRIDGE_ADDED,
+	/**
+	 * @DRM_BRIDGE_DETACHED: A bridge has just been detached and
+	 * removed from the encoder bridge chain. @data is a pointer to the
+	 * detached &struct drm_bridge.
+	 */
+	DRM_BRIDGE_DETACHED,
+};
+
+int drm_hotplug_event_notifier_register(struct notifier_block *nb);
+int drm_hotplug_event_notifier_unregister(struct notifier_block *nb);
+void drm_hotplug_event_notifier_notify(unsigned long event, void *data);
+
+#endif /* _DRM_HOTPLUG_EVENT_NOTIFIER_H_ */

-- 
2.56.1

