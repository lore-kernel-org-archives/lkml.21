Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998216;
	b=GcXitTvinF6kvvoFXV5NDIRg7/zmhViptC/Wkh8zwLXujnJo9db8vqs47PUFrn2edEqO
	 KagzvzKjTs3OT8E0LIREJoyJSABMpAQR9AiTEbFDG0N+Ok03yCnIMwv1ocyHACUmXsdKS
	 mz/yaposrB6goGxbLUzMLdT3dBDnaDKwCkfeBY/9/KYAS6PLCIZCvwjs3CUF0NjeASTXY
	 uOKDGvJJrZFBHqawdfYZLMNFjeKC5C+T0iCACUesxuZhCasKDCNuGjiWnVa6UImndQ7hD
	 U/b+UVML9X+qTDDj1clV/xxa0IFPxxBf8w/XpXgYIPBoaSu9lvIMuDNf+/ycswGmrOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998216;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=05Ho8/errHzZmgbANHpoqmN2h9/8KsF2xlUzSjWS4Fw=;
	b=iaTwlhj0iBeUYqG/kEX1k4S8Dz8wCRlgz35n8I2ENyMqyJC/3yY0qViCoYxJ1yNbAe7+
	 i+NS5hkOyKquUP5izBVGZ5af8ecnk/c11ByWbPVDDuYhaHIegVDi221vk9T1VPUjfYoOO
	 uRBt2LJVmEkQxqC4xcENzBHYvRDzqSeel2eqoDfSJSPSY6rtmjeFjF6pd2hpsFfQcqeBp
	 d6pJufz90BG6V8WIYA2ImzLMh3+EWI952e1p89XooiV7T80glH64QME/gILwUdiQRapMH
	 q+gMpMel/6bzbs2fMQp35VyggUS6re+MVF+osQsk67zyk2kRXfsS4mBJN31VYEW/T6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yD+eDj3t;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97FD606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97FD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yD+eDj3t
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DBB04E4163F;
	Wed, 18 Nov 2026 10:36:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 343035FE9B;
	Wed, 18 Nov 2026 10:36:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF95611BC10FF;
	Wed, 18 Nov 2026 11:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=05Ho8/errHzZmgbANHpoqmN2h9/8KsF2xlUzSjWS4Fw=;
	b=yD+eDj3tzNCp8uQg5BET4XxGtCtPj3embr7SPwvP7hM0pHL2bCom7ERlou7tPadFpLPreD
	HyZhBcddj0TYOx00fq7SoYoWotliTu7D7mm2LQ+BBt6e4RwJg5TJaqZ+xJ1shYyVySD5xC
	pUPa11D2K70i1HwwxMe04hqh5fTUGxaBqGX2rS8OuJ7PvszjaxE/Wujasuf3SlltXsXvn/
	gzJgbS1vNHShORwHvWKROg8feq5Um8g4B/z8hjAkkpDdj8P65hMLDVZcibBya/GBxDum9g
	478uMdmTq18GLk5eEk3nCbvnZ9obRY4eqjaBa5b/PyrtMm0pc70zXhcEsn4GaA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 18 Nov 2026 11:36:29 +0100
Subject: [PATCH 2/8] drm/dp: Move DPRX 128b/132b link rates helper out of
 i915
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
Message-Id: <20261118-feat_move_i915_helper-v1-2-652177f3107a@bootlin.com>
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

