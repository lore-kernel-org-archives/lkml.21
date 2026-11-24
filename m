Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514926;
	b=20zKe4RnP74xjtyvl5EWIWjkDOlkEOyIRCgwGGT+gSw969YH3pMsDKrDDb6w46EpCJFS
	 8ZY1QvtGEB2SS6yvq8eUEuFSTAEaI1VXt7kWQFL3X60OOqma6S5LQlsdwt1GE6zaRNuc+
	 Ll5GvEHubxixYiRMsMnOR79MaawQ2yFXuL7xYDhFAOJqW6+8jW1ZE+H12PEi9mLsv2oJk
	 M+i4NWrcDf2qEahDPTmU75s9K6XQyzQpX9wkeCF4JsJKcfmfZegWZtYSJOds3R4OtcxiA
	 WYJ6JNdpH9U2K1xtbkO2CHM77MKOY1beUAUfocgj8WSF0pzYKPJTfyr57AnACmKY+7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514926;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=thQdVKzaxX4PYzqBNr0h9ZnsaGdfeH93i7X65D0Bz3w=;
	b=huyzWY2ud+LKmp7PkNl0Hfu/IMGudPPfh3hzmxUYwxmzMEEmLjXOOmkSgJMDRFPAgmqT
	 ube/F8cEKLJ1TGhgVj7hTx0vQUC4lTTSoHyazTRgP9Z/fIK/j+c7imcG/vMZMSQuVEC0h
	 akkAdJ6fpoB7RRHfQXVg1Yef0tVQIHMDcIbSzo0BAheTbndNmGI6/Y8GxHJd3PdeAcKnO
	 gZeKcLnzz9aOctsrZNtqSVdTj0zk5OAqVoyha+yeyMTmxxZi72CXNK9I+rhEHRXzdmWo/
	 34iyddiiJ75AWz0e+xP32xNqld9Vqm97XRKI9gpZmOmhhRueMRX1DnmWSe77EpA1olA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="aC/8KE/+";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3760A262B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD3760A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=aC/8KE/+
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A70DA1F0C;
	Tue, 24 Nov 2026 11:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514768;
	bh=w46RB8VuBrpb/Z6cJ9wUQW2xUFcQqJBPHBgKlUDoB6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aC/8KE/+lTHv3OuYglbtyZ0Tn8DBpL6BBS4kzDnlTSaeMK+5OPJ9rMjZ9PsedfPQv
	 2aHPeAFmQ9EUyaD5CvJj9xPXdWwUXuIYjo+C0XJtqgc4Tdg1UF4d+BIJR6RTmPsDPP
	 WYmtYvVIHn9AuBGY+t3vMXwrz0jbG1FpcNKoHB5g=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:08:03 +0200
Subject: [PATCH v6 12/13] drm/bridge: tc358762: Set DE_POL and DCLK_POL
 properly
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
Message-Id: <20261124-tc358762-fixes-v6-12-bd38fed6460f@ideasonboard.com>
References: <20261124-tc358762-fixes-v6-0-bd38fed6460f@ideasonboard.com>
In-Reply-To: <20261124-tc358762-fixes-v6-0-bd38fed6460f@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=w46RB8VuBrpb/Z6cJ9wUQW2xUFcQqJBPHBgKlUDoB6k=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIa7FtHDm0h2ceUnVtbG+N2SMAbv2kCCMPdF
 7jWwm70EEyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViGgAKCRD6PaqMvJYe
 9XiZD/9v4gHrZGl8bA9S3ohEqOD1b0iMczRCKTdDjRTjLqSE7x086LWKN7wPnDMjdngG5eFY8cl
 ZLCKrvWEWqAJfVioBaXAeatrLonojyvbSRqmpXo7cj+xLHzK2rnIFHyFpQd+gYQSiNMXf3fwRRd
 ZKGJ99JJSlop3QWOmeUT87+Y6QpdVNVw1DYe3AOtn0GtAXwvk1RCxpo79o9UnLvQgnM9+5qXJfT
 T3fx/17SqSTW79QEtFoJBmS9oAnbb7MkhDNnDyKNbOkYntQi9IDWnD6UJyyMy5EnMxlE7bt3ewf
 F+Vbx9mAu3khItT9dslZzvRBCc6KaiGDYR+tH79CDBKp8nv+I/ClkO3TpaDzH/rmziPQ+EmICol
 kL7AtPrllJ70/yiC5F0hyxaERAt3NJnqCVBYM1z+88CMsPtjOjN70m0Y2YENcdyIMP1o/Dr9gDB
 mg41xX3rv+1lL/bYXtM9boaBoUXwo7JyvQq0ZxSQPzf9bOmmICPs+VvlNv55TYGtX6drET0ft8z
 7CxRC+5PkU/g1j6enWxYmeJwDk39XW7OR9/9XIyqC84OUge3M8zoV87ZBHD3KaQZVGONtA3SR3o
 oU4xicQTMviYmLQwsJdxcNtzR/kjEIT7noUYsZ1uhLaJwWj+fVbm7SbYKa/4/ugm/uZ2SsIb7+5
 RGBXpjPPfrd+unw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver hardcodes LCDCTRL_DCLK_POL and ~DE_POL, ignoring what the
panel actuall wants. Fix this by looking at the
bridge_state->output_bus_cfg.flags, and set the polarities correctly.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index d9ae9f492020..4e9da4bf41d2 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -190,12 +190,15 @@ static void tc358762_enable(struct drm_bridge *bridge,
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_display_mode *mode;
 	u32 lcdctrl;
 	int ret;
 
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
@@ -247,7 +250,9 @@ static void tc358762_enable(struct drm_bridge *bridge,
 	if (ctx->use_vtg)
 		lcdctrl |= LCDCTRL_VTGEN;
 
-	lcdctrl |= LCDCTRL_DCLK_POL;
+	/* Note: DCLK_POL affects pixdata, de and syncs */
+	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
+		lcdctrl |= LCDCTRL_DCLK_POL;
 
 	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		lcdctrl |= LCDCTRL_HSYNC_POL;
@@ -255,6 +260,9 @@ static void tc358762_enable(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		lcdctrl |= LCDCTRL_VSYNC_POL;
 
+	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
+		lcdctrl |= LCDCTRL_DE_POL;
+
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
 
 	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);

-- 
2.43.0

