Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629088;
	b=BG4VwnOxPnFY8KN0Y9j/psTMFR8DFEjkpGM5aRA75MgrCl/kssUT/tt0Fd9jC8D6ERgS
	 snxPJ2pwBc6rw4J4kABlmIxzSiqOER6gsJOHG/YzI9gE38hbBrIOPMxB1mJ/3+UKwje0L
	 lYyDo1/J9A3n5/pUMiFn4wlESnAvqt3KIIh8VgqBf3ztJXfyDZf1fTZAmG1KbUWlzfVwK
	 4dMPzxq0MCpu90rFTgmLjw+bh0CeHAwcZCd37gf62aF28g3M1+4x83L5Gw7waAhy7JteE
	 B2PJkwAjmpAutk8vyui3L2uSq5e0PA3i/iuseGDItRI4+MpxH42CAJTD+wn0nhopkJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629088;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Vk9yBaH3e/MJLcjCUCx2pq93/hLPombdz1+fJV5hHq0=;
	b=pRF37IR7Y4LjdHSr7m+pwl340MeCh0XJ5COO+laM4WVRcNJ3IzfYqwCXg6CEpPkYQWOl
	 ESP0Uc64gwH1Icli94tMgOp9fW8EoYbdIlRqMUkPYzrF5rWnsLUnwtza9g2/K/VS04KAQ
	 jUdpZTzNE9IYTO7MAFEbTbTXKmW1NpwbQgjSDF97JFvpm68mfieVYTQ9d0QzfuCfiyz7v
	 HBvXNwetiiJ6wke0jwtuyZSL+9lFymZKOE5o9BF3+Q2TnFwVrXfcANczfq2StGDINuZm7
	 0MSDym2K1rEWUEhFRvnL65lTICJZUQg2WK7kMWqDOJRxKqbrJnAS9hPG5XCHM7+SVlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=m7mnpNIg;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8EA606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=m7mnpNIg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64A8F1A17F9;
	Wed, 25 Nov 2026 17:51:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3903560480;
	Wed, 25 Nov 2026 17:51:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 197B211E6B0CB;
	Wed, 25 Nov 2026 18:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vk9yBaH3e/MJLcjCUCx2pq93/hLPombdz1+fJV5hHq0=;
	b=m7mnpNIgdzOoELi5NZ3m2K5N3t6N3pcO1EA+tHszf+1Qk8AXZ8ibI1mYxgDLSqAHI+6cpz
	tZcyqcgIDFVimFu5sq0aAD0sZuIuOh2Qy0Bslr2C7ClDuPdMFvnF0uXPBbX3aBQYvmdMvh
	Dm7Q62sjDrgergUSGGAV9UaQeMjnx2vzXlnUnu85+9koN0u5mkZw/fIEbVenGEOKGGaCCT
	jxaSMOxNmugKCbmloTkSdVT5xPq5IHqwFLJMxxvsfF9dj7nEC0zaIADMOeBr4dHiMtwjVM
	ZOjbcdytNFkYREebuUxjBcZRG7mr90lJJkD7zr3ugjgvFfR2v0ztxEryf8uuxQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:19 +0100
Subject: [PATCH v4 06/32] drm/connector: add
 drm_connector_hdmi_dynamic_init()
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
Message-Id: <20261125-drm-bridge-hotplug-v4-6-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

In preparation for adding hotpluggable bridges into the
drm_bridge_connector, we need connectors to be created dynamically, both
regular connectors and HDMI ones. drm_connector_init() already has a
dynamic variant, add one for HDMI connectors too.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- fix error management dead code
- fix kerneldoc

Changes in v2:
- rebased on current drm-misc-next: now drm_connector_hdmi_init() can fail,
  so call drm_connector_cleanup(connector) if that happens
---
 drivers/gpu/drm/drm_connector.c | 43 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 20120b6a05d5..021f2e120fdc 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -704,6 +704,49 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
+/**
+ * drm_connector_hdmi_dynamic_init - Init a preallocated dynamic HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated dynamic HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * See drm_connector_dynamic_init(), the same constraints apply here. This
+ * is just the HDMI version.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
+				    struct drm_connector *connector,
+				    const struct drm_connector_funcs *funcs,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    int connector_type,
+				    struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(dev, connector, hdmi_funcs, connector_type);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_dynamic_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
+	if (ret)
+		drm_connector_cleanup(connector);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_dynamic_init);
+
 /**
  * drmm_connector_hdmi_ini2 - Init a preallocated HDMI connector
  * @dev: DRM device
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 07218ab26c9e..47de3b6d7218 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2743,6 +2743,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc);
+int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
+				    struct drm_connector *connector,
+				    const struct drm_connector_funcs *funcs,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    int connector_type,
+				    struct i2c_adapter *ddc);
 int drmm_connector_hdmi_ini2(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const char *vendor, const char *product,

-- 
2.56.1

