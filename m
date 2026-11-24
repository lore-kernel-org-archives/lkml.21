Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514926;
	b=ktVbEe1C77iJv6wBZ6QKl5JGSkejO/JfGe9+YUKANt4QG2NbQE3rb6h2jG3YsdtuaB2r
	 EXgol6kBb8rL/eJpv6oTb26vn+eVLjUAgnmwDC77upY7Yh6ECYXEyPqYlIh1qv1PxjME2
	 +W6RQce4+5QuDrhYYNE5Q8x9MOfW73HxZk31ajb21KS+wkPkG6PxpY81lT70a+hKFX3so
	 BUZRkKtUhMPwSXuNzxYX+GeGHE0VDxd2QdAY7MsJM9TbOgoX04xHNiwYYHBsS0tGcJYIu
	 rnVOC7/layIMaGEhTN1rSVkdvJid+nAiJEuMIIWLxHYL63FKBw03LJHiDGXtzkqSnCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514926;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/LSyLw5U49Q+arMR0vTCUY5DZRNug2+6F2A7YSOHUK0=;
	b=KQ8VHTLfZJTQTtDF5O4ETIO0ffIpPt0B09i72ASLA14syIVHt2ZJsCtjIqKT8yt353Ll
	 Wvy2Bnm/UMOIJBJM53mxlEUjabhN1yqyOXqy5Rm4xxx/lZFbZSd/Lf2jb9R26yNLQ8Tv2
	 ZPd3Ts8mWKNuFaL/IKQH5e+2fUh9iPHGtHJNbGE6wNysv7Xj/whSElAVklhUIonw5nA7+
	 YGih9Nhj/WzXJs0z51OySMn6Vjdg9EWgkF07lxSDVRI4lUxYeNc2zI/eVN4CiJ7g7S35j
	 ZT2nRJ6yUrBMHNS1JcDohFDndsR/OMJ5PSkOyjyElyJln/APt8xl5slD0+IWJMcTKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rwOsP3wz;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9358860A2629
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9358860A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rwOsP3wz
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98DB1232C;
	Tue, 24 Nov 2026 11:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514767;
	bh=bvYex0hRUxSGhdyAudODjaziXUnvs7v/18N4Ju1CGjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rwOsP3wzZBArOVrEC7c75QoNQjhwTshWY+wOgLisJYYHb746Ny3Ry3lqGdCGwbopy
	 n7yY/ks0y4ow2FZrLNhYTqGg/UNqOeKYTyxrTfqk9wLpKOFFeum5PrFOoLymLuqMQF
	 Ye57GZRXdXjGr5IEDf5l6YhwRB3IYmwha1KQSxtw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:08:02 +0200
Subject: [PATCH v6 11/13] drm/bridge: tc358762: Drop
 drm_bridge_funcs.mode_set
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
Message-Id: <20261124-tc358762-fixes-v6-11-bd38fed6460f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3152;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bvYex0hRUxSGhdyAudODjaziXUnvs7v/18N4Ju1CGjc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIaaxcaji/Kn0EpHoSlQrjU29Aq/kEsRsz3i
 ylrHDIktA+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViGgAKCRD6PaqMvJYe
 9ZCBD/9Wm5SIX52nAavtn2CAba7R+OJQXZcOHz7RaPNx8C2eWpGavVkmAdvXP2ks9lwdxDjBnId
 hkQnCUSd0z2iujklhmMBsjiDWeo4m02USOwJUtYANZbsdjPeDuSLQhKmWAkohiTEcvdw567w9cJ
 CyHlCipMUwxL8N84BtVb+TydOnijnOL/3HM20uZJeFRXPcHvPzRpM2mHAsErVWzVfcsBWKDT1cu
 VsDTIhXTd35D0buyLeP5XsgOELNwOfOezS+dr2GJjhvgCIjc6XcQvgWaykA9tPnxtt6/aMSFEOV
 P3oulqTQdRh/5lVOeBG8I0NmNu3qWbHYG+nwEpJOOKhdkjyAfn2OQoWIjgCtk6ko5jVr1Nq0uA6
 rFNi9eftzSTRht54Wy8e8cekEjtMsoW+5BO8vhkNBuj+d/69sCc5P9HlDUieRMK9PrnLd+cSV3M
 iyRbC/u8imwgsXdwuU+6mZ7utKHtuwzR7MAJbFPqCahiQzohprAE9BfxFffFnPK8t5zj4OdmlHG
 Yrss5pA/LUcwSMkbVKG0sC5HeFx8to+L64cUyCaoo54vetR7F9qfJLOwwtX2yHWwb1UcCw6pfeV
 WBQ99yZtomCCR762FTvU94/kIKgFRZroB9I87dSUG0MbiD3v7evFmqtvVDYggbzkqPt2TpzraRQ
 ENiZiisN7LzNxrw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

drm_bridge_funcs.mode_set is deprecated. Drop it and get the
drm_display_mode from the atomic state.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 85a0314f16c2..d9ae9f492020 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -98,7 +98,6 @@ struct tc358762 {
 	struct regulator *regulator;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *reset_gpio;
-	struct drm_display_mode mode;
 	bool pre_enabled;
 	int error;
 	bool use_vtg;
@@ -190,9 +189,18 @@ static void tc358762_enable(struct drm_bridge *bridge,
 			    struct drm_atomic_commit *state)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+	struct drm_display_mode *mode;
 	u32 lcdctrl;
 	int ret;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->mode;
+
 	/*
 	 * DPIENABLE has reset default of 1. Make sure we don't output on
 	 * DPI until we have finished the coniguration.
@@ -217,7 +225,7 @@ static void tc358762_enable(struct drm_bridge *bridge,
 	if (ctx->use_vtg) {
 		struct videomode vm = { 0 };
 
-		drm_display_mode_to_videomode(&ctx->mode, &vm);
+		drm_display_mode_to_videomode(mode, &vm);
 
 		tc358762_write(ctx, LCDC_HSR_HBPR,
 			       vm.hsync_len | (vm.hback_porch << 16));
@@ -241,10 +249,10 @@ static void tc358762_enable(struct drm_bridge *bridge,
 
 	lcdctrl |= LCDCTRL_DCLK_POL;
 
-	if (ctx->mode.flags & DRM_MODE_FLAG_PHSYNC)
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		lcdctrl |= LCDCTRL_HSYNC_POL;
 
-	if (ctx->mode.flags & DRM_MODE_FLAG_PVSYNC)
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		lcdctrl |= LCDCTRL_VSYNC_POL;
 
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
@@ -269,15 +277,6 @@ static int tc358762_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void tc358762_bridge_mode_set(struct drm_bridge *bridge,
-				     const struct drm_display_mode *mode,
-				     const struct drm_display_mode *adj)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-
-	drm_mode_copy(&ctx->mode, mode);
-}
-
 static const struct drm_bridge_funcs tc358762_bridge_funcs = {
 	.atomic_post_disable = tc358762_post_disable,
 	.atomic_pre_enable = tc358762_pre_enable,
@@ -286,7 +285,6 @@ static const struct drm_bridge_funcs tc358762_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.attach = tc358762_attach,
-	.mode_set = tc358762_bridge_mode_set,
 };
 
 static int tc358762_parse_dt(struct tc358762 *ctx)

-- 
2.43.0

