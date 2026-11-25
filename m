Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615316;
	b=KofnmBo0HE4EzI79Y/hC1eHCQYwuTaVTyrKvOwOrz+jdcFoE0P8XRDhv86txjyGaF4u0
	 CUSHdwG7t59bmAwvjuOOP5JB+FWRBmx/SunxwZgveuhDThR8bb6m369oAiVQZY7tKzcPW
	 LCjCRMdlHNrrUK0ED0EM7CitHyJsSYi3gmTcwpwBaQlHZVT7nDryl8f1oIfBUJDH7ug2u
	 fNhGE4yfoP+AfzThKJHKquk+zSgtKKfOLdx1oKoXwKFEFv0j4s0uQ+d65/jAxP4c1eRIL
	 WgnQWcqGMlzMFBDGhKpjh1d7pXjhvEW4r/mR3pu2hCPdnlw0t4MoX1bY/BINzGFC60A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615316;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=88dfLPSuqC/WsUy9bGhst7PnDqfekXLs//REVIy7QUc=;
	b=hUBOgj8OvZWfI3z+93m4JfS98asqNlsaGhCc+ArlMRNx6tKVyI7lWJJuMWyVFTwLag7M
	 sBHfb37TM4BtmHbkbik/BmSP61uJfsusvA+pSkV3eOUeowHYHjC+m2BDiAd9yg3mQeeNB
	 UAKQs+ASOTVuhgbScQTvJAqGdhkNl/V93F0u/BWZxunR29Ev9CzX1Glfxg/9LXLNASttk
	 rVaDy3rFfEJR2dzbUlQ2iV8k3y1NMqQ/lgd+M6PDWko92qrxKkHT3fsaCS1JxeugLoo/6
	 ITATlNw6IM4dtpEoVfQ95EsrpJ6Ustv113rvqfLAJSAlHqEHFDw7GqBE0ZgG13DcY8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FORzT8ku;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E391606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E391606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FORzT8ku
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DA1194E4177F;
	Wed, 25 Nov 2026 14:01:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE26260480;
	Wed, 25 Nov 2026 14:01:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB0A411E68778;
	Wed, 25 Nov 2026 15:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795615313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=88dfLPSuqC/WsUy9bGhst7PnDqfekXLs//REVIy7QUc=;
	b=FORzT8kuGqGxG/WEA8xwp7xVrO5KIcgbOPGH+33F8ILUNOA2k9tWklEtNeaSTAvSypFD0X
	nI58b5X3BOISNIzBCTZrhLLrZl3uj4CPI8Jfp/EbWgDQibMPPddjTyV5lcaIiuqVN7/4jY
	AND8bpZv9k0jhFD0SbGR89YnIsxhS5kvsgc4HIMHuGBY0g8zoVYP2uLY5g4gWE3eIJVD9y
	G925qNEQhpgml8pgbaHVsxd96aMNmVPctj7JY0JfKid/pFtv7EThNwLLca56OZFGg5JWGO
	8I8Stx0LqHGNPK5AoXosIgsgeh634FQVcKcOmZLyeReQHkOAFaDtxi95XsQijQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 25 Nov 2026 15:01:10 +0100
Subject: [PATCH v2 06/10] drm/dp: Make the DPRX link rates helpers static
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
Message-Id: <20261125-feat_move_i915_helper-v2-6-aa04d39bc415@bootlin.com>
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

The DPRX link rates helpers are now only used by the DP sink link
rates reading function, so make them static and remove their
declarations from the public header.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 18 +++++++-----------
 include/drm/display/drm_dp_helper.h     | 11 -----------
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e06264c52bf5e..30935d3ae0055 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4916,18 +4916,17 @@ int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes)
 }
 EXPORT_SYMBOL(drm_dp_max_dprx_data_rate);
 
-int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
-		      const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+static int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
+			     const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	if (tunnel && drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
 		return drm_dp_tunnel_max_dprx_rate(tunnel);
 	else
 		return drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
 }
-EXPORT_SYMBOL_GPL(drm_dprx_max_rate);
 
-u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
-				u8 uhbr_rates)
+static u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
+				       u8 uhbr_rates)
 {
 	if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
 		return uhbr_rates;
@@ -4938,17 +4937,15 @@ u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
 
 	return drm_dp_tunnel_128b132b_dprx_rates(tunnel);
 }
-EXPORT_SYMBOL_GPL(drm_dprx_128b132b_link_rates);
 
-bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
-				const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+static bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
+				       const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	if (tunnel && drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
 		return drm_dp_tunnel_128b132b_supported(tunnel);
 	else
 		return drm_dp_128b132b_supported(dpcd);
 }
-EXPORT_SYMBOL_GPL(drm_dprx_supports_128b132b);
 
 /**
  * drm_dp_get_128b132b_link_rates() - get the supported 128b/132b link rates
@@ -4965,7 +4962,7 @@ EXPORT_SYMBOL_GPL(drm_dprx_supports_128b132b);
  *
  * Returns: The number of link rates stored in @link_rates.
  */
-int
+static int
 drm_dp_get_128b132b_link_rates(const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
 			       const struct drm_dp_tunnel *tunnel,
 			       u8 uhbr_rates,
@@ -5000,7 +4997,6 @@ drm_dp_get_128b132b_link_rates(const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SI
 
 	return i;
 }
-EXPORT_SYMBOL_GPL(drm_dp_get_128b132b_link_rates);
 
 /**
  * drm_dp_read_dpcd_sink_rates() - read the sink rates from the DPCD
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5c4cb57f0fc5e..dd4c4a6ff17d1 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -703,17 +703,6 @@ static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
 int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
-int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
-		      const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
-u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
-				u8 uhbr_rates);
-bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
-				const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
-int drm_dp_get_128b132b_link_rates(const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
-				   const struct drm_dp_tunnel *tunnel,
-				   u8 uhbr_rates,
-				   int link_rates[DP_MAX_128B132B_SUPPORTED_RATES]);
-
 int drm_dp_read_dpcd_sink_rates(struct drm_dp_aux *aux,
 				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],

-- 
2.43.0

