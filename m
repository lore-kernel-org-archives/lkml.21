Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998213;
	b=VU7CK44aNji0t3zpaLMIYf6QA3QCx4ykUk3Xw4Z2hjGmSUSgCG58ZjcefXIYjjJAcqGd
	 GnInZXQrYUCATt/U6uM8hO69BJ+oF/ecB7aQkzHSV01QOcmSaIp3O0kMjeodWkDzaAPJS
	 3InzU8SAwYvZ01neLYj4nkzXLVjF3+DJS6hyqZZoGRftMsEOVz1zKgtVhEnnrED7/HvyO
	 gJQGXnEKnLOkRSE++HKTdY0woTd01zWDGSGRfKUUysSvRukWRgYxdeGLfyrdSIt9PfTsG
	 5W5jSJCnf3DoQImdhdwOmY7IoNv8W0yXSMmzuNe3XoOmhNrAVf0Ef4TGOoG6CqsI8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998213;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+3kyzjg3dtcYpCdDljWXckSn2UKrKCqRAGKJNdgkqoM=;
	b=qN3kQdGbPgBZ9si5FN7r5ualWUujn1eZrUODQ88YYBJFDr+UZvw3o50VpqDXzTZsCGDc
	 +rEwImj7Lb1EJ6RpT7ste7SGGhlR+Ze0rm4/5bUUXbjA5J6xIqWn4UXPrjxfaeXs2zgjW
	 R9lh2JsyZF6XmRp0faHgx0U1bfaTphqxEwXC2BynZMNDlmf+BKlUYojB+MDZX4YZ27NbD
	 Jw7SWtJKv8ktc1oCLPgqHVJS4PLKBEousOQgME9KBbDq8I9E+A36IGvdyTiPc9wSWa7lw
	 xdSFtvqJbJohv8vNZm1V3/c2Dp/b0L6mg83YBN/GvNNijrUBp4/3y8uZV0RrT0uu7vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C5CPUmss;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C91606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C91606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C5CPUmss
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6E40C4E41638;
	Wed, 18 Nov 2026 10:36:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41D235FE9B;
	Wed, 18 Nov 2026 10:36:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8764211BC106E;
	Wed, 18 Nov 2026 11:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+3kyzjg3dtcYpCdDljWXckSn2UKrKCqRAGKJNdgkqoM=;
	b=C5CPUmsstGoDbtYuaYFDxgrJrTaQqtB6k3DI5LuQlItKm9YgAXWhv8bkpxmfxDo7sAql+1
	LXPOJptscYYFhRx3kdwsEE3bzO4fDYQfaJwALQN8LTy1G5zEZdMZEmYZWLHZYKo3QXVmYR
	QL94fa7s3f+U6c+OtvQqcYMFffUHjcwJ74Vf8E66npIbuRkeoYmT2fP87TpCO4WPujbRFa
	rBG/B4S4kj8pcgFrojQRImDhP5MZtSxa1c9v9EP0OFHTdGJFQrMifPw1cfB8h411/9acfp
	kAOl2YC12Z8glwCN5/Nv0YkTszLUKm8rULP40foP7HT3WRTkbogb/KBWAZ3G6A==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 18 Nov 2026 11:36:28 +0100
Subject: [PATCH 1/8] drm/dp: Move max DPRX link rate helper out of i915
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
Message-Id: <20261118-feat_move_i915_helper-v1-1-652177f3107a@bootlin.com>
References: <20261118-feat_move_i915_helper-v1-0-652177f3107a@bootlin.com>
In-Reply-To: <20261118-feat_move_i915_helper-v1-0-652177f3107a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

Move the drm_dprx_max_rate() helper from the i915 driver into the
generic DRM helpers. It returns the maximum DPRX link rate, either from
the DP tunnel capabilities when bandwidth allocation is enabled or from
the DPCD DP_MAX_LINK_RATE register.

Keep the Intel eDP HBR2 limitation quirk handling in the driver.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 35 +++++++++++----------------------
 include/drm/display/drm_dp_helper.h     |  4 ++++
 3 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 2b6ce05556b0d..e58dabdad1f39 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -37,6 +37,7 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <drm/display/drm_dp_tunnel.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
@@ -4914,3 +4915,13 @@ int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes)
 				  1000000 * 8);
 }
 EXPORT_SYMBOL(drm_dp_max_dprx_data_rate);
+
+int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
+		      const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	if (tunnel && drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
+		return drm_dp_tunnel_max_dprx_rate(tunnel);
+	else
+		return drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
+}
+EXPORT_SYMBOL_GPL(drm_dprx_max_rate);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a7976187..96379c18b8cd4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -159,28 +159,6 @@ int intel_dp_link_symbol_clock(int rate)
 	return DIV_ROUND_CLOSEST(rate * 10, intel_dp_link_symbol_size(rate));
 }
 
-static int max_dprx_rate(struct intel_dp *intel_dp)
-{
-	struct intel_display *display = to_intel_display(intel_dp);
-	int max_rate;
-
-	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
-		max_rate = drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
-	else
-		max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
-
-	/*
-	 * Some platforms + eDP panels may not reliably support HBR3
-	 * due to signal integrity limitations, despite advertising it.
-	 * Cap the link rate to HBR2 to avoid unstable configurations for the
-	 * known machines.
-	 */
-	if (intel_dp_is_edp(intel_dp) && intel_has_quirk(display, QUIRK_EDP_LIMIT_RATE_HBR2))
-		max_rate = min(max_rate, 540000);
-
-	return max_rate;
-}
-
 static int max_dprx_lane_count(struct intel_dp *intel_dp)
 {
 	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
@@ -221,6 +199,7 @@ static u8 dprx_128b132b_link_rates(struct intel_dp *intel_dp, u8 no_bwa_rates)
 /* update sink rates from dpcd */
 static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
 	static const int dp_rates[] = {
 		162000, 270000, 540000, 810000
 	};
@@ -241,7 +220,17 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 	/*
 	 * Sink rates for 8b/10b.
 	 */
-	max_rate = max_dprx_rate(intel_dp);
+	max_rate = drm_dprx_max_rate(intel_dp->tunnel, intel_dp->dpcd);
+
+	/*
+	 * Some platforms + eDP panels may not reliably support HBR3
+	 * due to signal integrity limitations, despite advertising it.
+	 * Cap the link rate to HBR2 to avoid unstable configurations for the
+	 * known machines.
+	 */
+	if (intel_dp_is_edp(intel_dp) && intel_has_quirk(display, QUIRK_EDP_LIMIT_RATE_HBR2))
+		max_rate = min(max_rate, 540000);
+
 	max_lttpr_rate = drm_dp_lttpr_max_link_rate(intel_dp->lttpr_common_caps);
 	if (max_lttpr_rate)
 		max_rate = min(max_rate, max_lttpr_rate);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index f497c9f3a5504..fe08a66f2bb1e 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -33,6 +33,7 @@ struct drm_device;
 struct drm_dp_aux;
 struct drm_panel;
 struct drm_printer;
+struct drm_dp_tunnel;
 
 bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
@@ -701,6 +702,9 @@ static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
 int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
+int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
+		      const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);
 

-- 
2.43.0

