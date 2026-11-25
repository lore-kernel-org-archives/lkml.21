Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615302;
	b=NaYCRm84bCTtVlw73UuErXrAqMRMt4CZoo7TPUFETHOB3kxCZB+LIxrlq0zwKF9i4hxS
	 yFweyQK0iaKsq0/AG2FZaratJoX44yd7o1rbGJgECxGOgwtEyWqTKkxZB9v7amqnE4HaU
	 Q5dXkxdkKzD+dm4w2H5VF41tOOErZbBL71zoDtdiXxI6d7JBXsQYcnYl3491dXvNi7CxD
	 EODXJnJMkSRU+Rh66P9ib2qIblk7t+qpbh3JUs7jsAwRQaQ1V7POmexleS/ttwZHTThBx
	 U0yTZhyyTqiZ61MUf9pkSlKXKnCuV9MTjfh4iJHhklNDTIq44MA8V7/WqpGtzHv3rTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615302;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=05Ho8/errHzZmgbANHpoqmN2h9/8KsF2xlUzSjWS4Fw=;
	b=QkJGC8Mn6PvUWwRS0T8esn3hA2797e4O4O8EYp1vo3VHwlhDEPpUu7+U0laJoiowtNG9
	 xBBd2oQ+wtgU0yr0vNKQd5t0nEP4RJxWiZQ3rYYPi8mVXZI5tPc1MSG1glDnYekoXK5l/
	 0HJDsGxSqNNi5ZIbUMvN8UmzONwo0BVYBPfvhgW8vz0ixpabKFKVFjFggIBK7un8VkPzG
	 hHwduiBw0vHh7mw7O0tlh67BjDgXAEEyHIbZxPt3lgdWzQdspMScq4Lg0Jpm2d8K0SNkM
	 xZzl/CHxQ0UJsMbvauczi7j0HcO05WPkz1vk5QUvxEs3UH9cVnzy5kZP1TcLChjJqkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CkzROMnW;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A726B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CkzROMnW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 51D2C4E41779;
	Wed, 25 Nov 2026 14:01:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2785F60480;
	Wed, 25 Nov 2026 14:01:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0452111E68F4F;
	Wed, 25 Nov 2026 15:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795615294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=05Ho8/errHzZmgbANHpoqmN2h9/8KsF2xlUzSjWS4Fw=;
	b=CkzROMnWu/RbMwCT4mrBoZ9R/cb7a+ECX5Z+NLIsOtMhkosAkTyVyQx19kwAWOXz73ZY9s
	juKhnOuX/thCZfhxIoLJgmt3+jvn7GYzNyUJQCEx+PEUhQysslu1XL28ympqoMtNBD0M0f
	c7tQzI7Bnsok4B0BWctl39k9J8mpHVdbv0K4UtnWeGEuEBnIr3nXg35Xcff43H0K/6NCme
	TApRj+gv4pUiGDHBMag/inyZ1KmcIyCx4gu6R4qGLNn/rC87WbH+DiJr0lO0N9fr8lXTzr
	ez8SkhVeQPMa9oEt0DRP/zY8/PCXJvJqrXxCkVwyz7vOq/LfAY69f682+LGQpA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 25 Nov 2026 15:01:06 +0100
Subject: [PATCH v2 02/10] drm/dp: Move DPRX 128b/132b link rates helper out
 of i915
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
Message-Id: <20261125-feat_move_i915_helper-v2-2-aa04d39bc415@bootlin.com>
References: <20261125-feat_move_i915_helper-v2-0-aa04d39bc415@bootlin.com>
In-Reply-To: <20261125-feat_move_i915_helper-v2-0-aa04d39bc415@bootlin.com>
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

Move the drm_dprx_128b132b_link_rates() helper from the i915 driver
into the generic DRM helpers. It returns the DPRX supported 128b/132b
UHBR rate mask, either from the DP tunnel capabilities when bandwidth
allocation is enabled or from the mask passed by the caller.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 17 +----------------
 include/drm/display/drm_dp_helper.h     |  2 ++
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e58dabdad1f39..86260ffd57cdc 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4925,3 +4925,17 @@ int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
 		return drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
 }
 EXPORT_SYMBOL_GPL(drm_dprx_max_rate);
+
+u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
+				u8 uhbr_rates)
+{
+	if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
+		return uhbr_rates;
+
+	static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT == DP_UHBR10 &&
+		      DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT == DP_UHBR13_5 &&
+		      DP_TUNNELING_20GBPS_PER_LANE_SUPPORT == DP_UHBR20);
+
+	return drm_dp_tunnel_128b132b_dprx_rates(tunnel);
+}
+EXPORT_SYMBOL_GPL(drm_dprx_128b132b_link_rates);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 96379c18b8cd4..e124e7dced178 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -181,21 +181,6 @@ static bool dprx_supports_128b132b(struct intel_dp *intel_dp)
 		return drm_dp_128b132b_supported(intel_dp->dpcd);
 }
 
-static u8 dprx_128b132b_link_rates(struct intel_dp *intel_dp, u8 no_bwa_rates)
-{
-	u8 ret;
-
-	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
-		return no_bwa_rates;
-
-	ret = drm_dp_tunnel_128b132b_dprx_rates(intel_dp->tunnel);
-	static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT == DP_UHBR10 &&
-		      DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT == DP_UHBR13_5 &&
-		      DP_TUNNELING_20GBPS_PER_LANE_SUPPORT == DP_UHBR20);
-
-	return ret;
-}
-
 /* update sink rates from dpcd */
 static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 {
@@ -254,7 +239,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 	if (dprx_supports_128b132b(intel_dp)) {
 		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZE(dp_rates) + 3);
 
-		uhbr_rates = dprx_128b132b_link_rates(intel_dp, uhbr_rates);
+		uhbr_rates = drm_dprx_128b132b_link_rates(intel_dp->tunnel, uhbr_rates);
 
 		if (drm_dp_lttpr_count(intel_dp->lttpr_common_caps)) {
 			/* We have a repeater */
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index fe08a66f2bb1e..7985bb269fdf2 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -704,6 +704,8 @@ int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 
 int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
 		      const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
+				u8 uhbr_rates);
 
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);

-- 
2.43.0

