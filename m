Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020613;
	b=zeCBJh90BFLuRt4VPIM4Q9U0ZERyVeX9Hg5D83vSBukuuwqzWrcPyMyotWYZOv9AN4lz
	 Xnm8mEVpZYlhve/HKLsFmxL6hOW8zFblxkZqezqGT1ZJ0hp/igMBiDguc0NHEJk9gX0hK
	 CDAkseti0ZmanuApQVLdTrH9MfLwKLIUBzrvdmFzZmP/lr0MbQ6Fe9fj4SNDmV6T/fBUE
	 mJWxe/sQUnBTZSlc/UnfSnJyNhJtkEF15laEddHxoFfSinP3warDkCmoiGweJJPIfXjjk
	 TumoYVEn++hAZ656DC/AeIuRed3bT6si6XH2upviYVX7/To4UE+uRJ5omLGubDVmUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020613;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=;
	b=VcdU9XjzDagzKSMsIATV1FtL3dRcc+OoFU/xaQHVp7IY6LJs2QlZOCQO48JJzi6AB2nA
	 GARPd0yhYjCekjI+LCMriaKI/pBswQZYZFytJjtN38xOGpwVlYQ74g9vIz3wdsE4pVO64
	 dCG1ziczU+Cpr7XscirV9RAjGj/w4JIO5P8lqMcXCwlRicj5pv6oZ9vU4ruatwc4pATW6
	 tNme1CmLvbMC6ajarrIyuYAqvzYU9UP8xsVocZRJZFzOoFSfU0/viGDDb9OlkX0Gbsjz9
	 hPVvfAoFSaSmH/YFKByrwMDfaFqgRPH/M5xmUo8DjHjwBpJkky3zEgKvIWyjfif62vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YsaPuTLN;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98660606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98660606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YsaPuTLN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D1C77C4F77B;
	Wed, 18 Nov 2026 16:50:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBDFF5FE9B;
	Wed, 18 Nov 2026 16:50:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7104611BC1EE9;
	Wed, 18 Nov 2026 17:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BrrcnjzQvcqJiMXT1xilqkGsVrudJdiOVPDn3lvn36s=;
	b=YsaPuTLN6GqYfw+QoliiMeM+fBr9BgkHTAfj3YU/D2nxmZBuZ2HXtP9sv0oJZxWEngZTMM
	oB7nxHoiWSQHudGMnoCCOOG/njlttH5ghu7wPzOAfE7TEGWiPCUf4s32sV9tVvj2tQPS85
	eXbawEi7sAM9HIb1P42weIlCX+zo+8gnch+dslInQUPBP9+crMojO3HwPCdhZJKvDAoGJh
	iVgyGndktmVtpQzIYuFsBtpxkRsgvUvwl/AdZB7dD8Zp5MitYmPDbdat929gIw4zkgoo6Q
	s1Im/f/XapI1QamK7dVqRflt52K4+GsGU/jDBuV4n/b6MezQeVfnlTmTH8urtw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:44 +0100
Subject: [PATCH RFC v3 01/31] drm/display: hdmi-cec-helper: use drmm_
 prefix for drmm action
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
Message-Id: <20261118-drm-bridge-hotplug-v3-1-44bb3b4a828f@bootlin.com>
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

For bridge hotplug drmm allocations are not suitable because a connector
may have to be added and removed multiple times in the lifetime of a card.

In preparation to support hotpluggable HDMI bridges (and the
drm_bridge_connector) we need a non-drmm variant of the CEC adapter
(de)registration API, with an explicit unregister API.

To differentiate the new explicit unregister API from the existing drmm
cleanup action, use the drmm_ prefix for the latter.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3.
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index ef6dbaa59dee..b79c41703d53 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -64,7 +64,7 @@ static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *c
 	cec_s_phys_addr(data->adapter, addr, false);
 }
 
-static void drm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
+static void drmm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
 {
 	struct drm_connector *connector = res;
 	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
@@ -145,7 +145,7 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 	mutex_unlock(&connector->cec.mutex);
 
 	return drmm_add_action_or_reset(connector->dev,
-					drm_connector_hdmi_cec_adapter_unregister,
+					drmm_connector_hdmi_cec_adapter_unregister,
 					connector);
 
 err_delete_adapter:

-- 
2.56.1

