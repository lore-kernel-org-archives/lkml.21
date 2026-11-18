Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020648;
	b=0kHc3Gq1WhIeHlF3kdXsAE/KtM/x1IY2KOWoxn53o7fxOMteWLYSJ/Knr4+2EXP9+/eH
	 BiqcUOLIYyk3lYidTCgeFERlKQi58B3F5gv2UKNZakpTGBKMPJ9Wm745lxOFruHDWAmJd
	 sgDIw6lUjoHUv0A5xeJkJx/NVy4cssjIgTbUgpTbhMMF5ucCRhYRop6K1bs+xy5I6TEA9
	 PbvmG0rRfSYfObO3js6oMnQoE048t3OAGUDzcLJ2O7rErkJyi3U9uefBTZ4PpBgW0GP5I
	 0mcOjM1UxkVhVc6aZxxbQe5VZf9lsVrGBgfzwhr1KfR4G57K5xg+yYKYPML2S0qOQpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020648;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=xUapXh3LAgb7b70G8vyUmRNtjSNpiBwfvZc2/AN9HVM=;
	b=2aRCLzc6M6oXI+9e/jCmM3FjQ7JIoAdb+zD98LDIlLTcXhZ6Z9TPDQaS/RW7GsPsrijV
	 6pyKU9yVVur7UEThkqEZ+3bOt8u+ekueNO+0e86jxzClca6aovNBB8VlswFs483yi9eda
	 wiKUnlhKml5Ul5hKLosH57QQit1ES1KklxSJcrsxlqT/IQzZKaAG2tra/ih/G1FcazdSg
	 /VwwxZ63hDN2VTWHq3LJZ53jOY3yY37dDiVaXbYE9Bbfi0kO9DflSLqEdtBrheHzhiSSO
	 /+2dwMrzhEcn+SbPLlsMuvnqIgEoimeukgyAdgI99tuIANovtPd30j93vm4/YvJ9EzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AqkcoMpB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF43F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AqkcoMpB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F9F01A16CA;
	Wed, 18 Nov 2026 16:50:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64E785FE9B;
	Wed, 18 Nov 2026 16:50:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D06BC11BC27C2;
	Wed, 18 Nov 2026 17:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020644; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xUapXh3LAgb7b70G8vyUmRNtjSNpiBwfvZc2/AN9HVM=;
	b=AqkcoMpBiz3XS00Cy58lcSFWUufRCXidqGvtyszIqVzlzetrLf0+ci2ep2icS4eHtvQ54N
	urai6hCpRpE/8zQ41/7c3CUWidc9HRteu7u0vRf9de7DtMXZ//3TkmCaFsdGjCvVLQ73Pp
	2FZ1NC0jLvYw+UuAgUQBwHgb4gj5ZfFI6M5neW2s6+KLfQ9nEapxwmEVZav82PTiZvN/P0
	CQ2nx1mmQoPdIIBEYBx8H0RuV3gPf3Ky8LNQFNnFkE3mo8x4WMP6mEhmJ+9LEeSWblWibs
	8RAHw3ogDmsBMqKalZ+CpT2VFbpy/0GKDlePV+Ag+k5cv9/Bcx/VhIBlGnuyCA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:49 +0100
Subject: [PATCH RFC v3 06/31] drm/connector: add
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
Message-Id: <20261118-drm-bridge-hotplug-v3-6-44bb3b4a828f@bootlin.com>
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
index 877c12b75090..3f548a97bf94 100644
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
index f656ed8324d3..6490dc0a3fe1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2731,6 +2731,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
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

