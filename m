Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998229;
	b=tK6T45Mq2G2S/iMof0LAvkHXZo97UYnT1oKo7mrchERRre0E4LTB78x+9f5FH0isWhNd
	 +m12Ba5y+c8FojKbCJBDIAahYEP/Ll1AsrYDZxO6hiDJQrikbwV8JYs9DnipDJ7q6BFmd
	 VmC887+3YAp9orWW1GxWQYc9HQLIwep92BlaUm2ENq8HcM/3QAejzM8I31GUbtMmcZVjv
	 vdOtjLwWt4Xb2+i3wuwkBbAbs5184r/BAj/jPS8pYM9JEQCShB1KcrprTY57/BFJuZgFd
	 606B+UNVxZMbK7ypPK2QAKBhkMIfo8cti90jRNy7y+xI4SMHD32hpQP8IxKGxUgz6uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998229;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=88dfLPSuqC/WsUy9bGhst7PnDqfekXLs//REVIy7QUc=;
	b=0ozPvEpXR/uaLUL5DFj1U3rHKKcghbkyav7OaF6/RjNOGZQaAvJBPlIamlzQPXdhMs7J
	 ivLR6GW/loQLuI28zZpFTbq8rFhuoA2ygLhD+kEJfu/FgxlRD/NyexXGKCSBuA2yzFyF+
	 d+QZRYpjvExA94yHHjJeDOt/ry7x7lfQpHI+j89HVARQqWgKUFBN9Ck2ALFdA56AWzjbQ
	 kZP6WPiEN9MBPwAl8kQ50+1tIJoGWgs4a7TAYoPV3wzNhfmlnfLFnYFnHd4i0AMtMTpWg
	 hnQ0Tiz0a12IpJBRqexJjS0jgOgPEoRhJ5w6ni4Gy1gJWVgE0IYyqcfyEc9yjlhyMWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mrvd22L3;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC14606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC14606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mrvd22L3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2C1C41A16D0;
	Wed, 18 Nov 2026 10:37:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 004B05FE9B;
	Wed, 18 Nov 2026 10:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9088E11BC10FE;
	Wed, 18 Nov 2026 11:37:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794998225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=88dfLPSuqC/WsUy9bGhst7PnDqfekXLs//REVIy7QUc=;
	b=mrvd22L35WcxXFYLw8j/sHPkIKfrkgxwCeaJwP7Rl26bLWnJCUqbs1Nghu+ETfZC7j7/ZA
	OWj1oTOzNEgyLM8vMvJqQ9hLToDM64F12xqreuzny4n9EbCAK1IF89GXoYYaRU70yKm0d3
	29ttn6TpdEAg20XkMmH1irXtm7Y6BJUDyNH35rMpzKHJ7F/krwwFtiFsO/Lg4ik7o080tp
	pCpAdPmOdhZ8SprkT0l3V56vCQ/lzEhIyfgBPpnw4Uz3FmxW2hgav+8sLCFNBUhtWklJnv
	nAWkAHRfDKbdt1lrPqRTNn/+5Q7ix6AJDe0qHnKgco4BhVOOjP2yYNsQUpcAog==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 18 Nov 2026 11:36:33 +0100
Subject: [PATCH 6/8] drm/dp: Make the DPRX link rates helpers static
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
Message-Id: <20261118-feat_move_i915_helper-v1-6-652177f3107a@bootlin.com>
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

