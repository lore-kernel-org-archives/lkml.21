Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020726;
	b=PLzksQEHICG8wUeBD+Mu5vIWjnVBHLIldM4IZ7FGqxHJPHkBqqnnffk+uBZfuCZ8/mUA
	 +TAyctVAzWpDuaGeFX0XmiEVpt8EvWtpnWIYk3pmqNhrpvoT6U5e7QdtENpisvcwxhu5d
	 wspqeRKE982sBt4UlrvdzLrcCBNjeqlp9I8ZW9bcRZPLEFSXhdkx1QTx4DiNvDNlU5PD6
	 JKA2RrbQgx/RkjpyRvngSwxmOovUv8s8NeqJv0nRyewGvAj8LuJ54uQ/xsRZQnvRbLVFT
	 ps5D9mtt45MgoChHSRzXvka8NgZT/SW4GrEGagTsxIxFu1kuqRAzzfHes6nBnoWY2fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020726;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=PawFOJzGO+j7Rk1FiSoFYRQzAZVs1Yl5DoDfqYSRNT4=;
	b=TJyti4yYYFnzjnoLvkylI+XE2JIX54ks0GmuDWSB+vTCdHRQz3wfYCir2kVBlQI3IsHy
	 cnRhXhc6/2ntmhsa3Z7PQxM4Xr7F21FtaTxIL4PvvVAcDVWqSqE5gpeW2iq7iCCLw7SNU
	 nRN4GI2Lo9WH3De5974Om6mRZBCIN57YIyjr2lS9HFE5+8ctXCNNs62RTDBJdDZ5CvXsy
	 t7A4IgPM7n4QpDSUhaP6f1+DfwZk6pfAKyl9sdZ1rLElKWEz5Xp/WrM8InaXy/ZyR9tDs
	 ufxGwMPMPwpmltN7BJ5DXdpxWj7yb26wq5BzoYFEfO0uKckTLVdjleBIXS/EUKr1TJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xB+1Urz7;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256B760A383B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 256B760A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xB+1Urz7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 01AB54E41635;
	Wed, 18 Nov 2026 16:52:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAF155FE9B;
	Wed, 18 Nov 2026 16:52:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8987511BC27F3;
	Wed, 18 Nov 2026 17:51:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PawFOJzGO+j7Rk1FiSoFYRQzAZVs1Yl5DoDfqYSRNT4=;
	b=xB+1Urz72QZ3bKmVFogNO/YK6rZUtdkdPXSmy/r5gjqtP7ckfdkJObtVqSZfEd8kONlLqD
	BVjWS5C8IKHSjg2wVNjZT9lnqWRCaZOWl9Bxq+/uMBb72Ve1FL+KtONzoOGEplGzc8R3rl
	aPzT0OPXQ/BBZELKURsK11UBdR6Nrotxs0Di1RBzyD/lg5ZIrLF1Cg632+ZrFq8YhU+zV9
	bmpNFnBcm0lafIHLTY+o1gXOwis+r84Y9HTxpYb+on0wfHVpxX/uOlfvpX6LxFTHlymKLN
	1M1owoM608rZPxzOaI24GXcH4SybwatpZquBqNfm/OoCfv5bTtlSeerfwq2gYQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:01 +0100
Subject: [PATCH RFC v3 18/31] drm/mipi-dsi: notify about DSI attach
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
Message-Id: <20261118-drm-bridge-hotplug-v3-18-44bb3b4a828f@bootlin.com>
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

In preparation to support DRM bridge hotplug, let the drm_mipi_dsi code
emit an event when a DSI device is attached to the corresponding DSI host,
so that this event can trigger the actions needed to configure the pipeline
and register the connector as appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- use new v3 notifier API name
- fix commit message
---
 drivers/gpu/drm/Kconfig        | 1 +
 drivers/gpu/drm/drm_mipi_dsi.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 105dd46a0a45..3ebd9388bdda 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -45,6 +45,7 @@ config DRM_MIPI_DBI
 config DRM_MIPI_DSI
 	bool
 	depends on DRM
+	select DRM_HOTPLUG_EVENT_NOTIFIER
 
 config DRM_KMS_HELPER
 	tristate
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3ac1dd5ad640..ae49f3aa1b2b 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/drm_hotplug_event_notifier.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 
@@ -386,6 +387,8 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 
 	dsi->attached = true;
 
+	drm_hotplug_event_notifier_notify(DRM_MIPI_DSI_ATTACHED, dsi);
+
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_attach);

-- 
2.56.1

