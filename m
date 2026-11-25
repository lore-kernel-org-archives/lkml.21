Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615333;
	b=sqf/OH0Pq5DzIAZXYU6pjLQuK9OS4KhlgQfAyzrKWqYuilHUdFPFFKpNo0E1PNJr6aAm
	 fOJTysSVH6q3E8FCpNTxvw2s49SpFzVNVlz/iM08B9ulmnZUNcYW5WColsVTG2tEOnKxz
	 YT6pdTYmxjXzfa8VAA6r6FnYmdozGxLA/d5CB6rcenMKcdsrgllPXO3GHN3zXCxHcsCq/
	 SKcGJRpFIko4JY2BX30triCWt1YRLDqgzjCAG//i5rkArN6SBhs8/KFAVSseaaAuI/2GT
	 VbO/iIHwEV3+xEybVT/0ouomSd7FsbFeIB/ygzbtFMeUtttJlZAN7Cc0SEQo39p8hJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615333;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=5cWG+sn7xvymJfT2+aJBpSqu/Q4MQkyV5NyLotQtEGI=;
	b=0d/nzpEPmGNmVLTlHMIYLuqClipmhNpx4lJnAR5aqCOFZTUVTSWC+eqZP2lB1XPZeBuG
	 XGGHh0+RlwMWwYesN2EuXSXE0ChlJAGa9pNfpyXHoXoX54UM7JwPv82oGxzGei+KcmJV3
	 HMIk0Nb7G0KJLSirhcwv4an1yZMxC6t7NaQML58HHBt/bNe1zVd+5IRaqX5t3jwRKzWI7
	 DwS+ATq8+wcutQXNR3M/cKKHMxGsOqWfeDUd5xdLK2zTsoq9jXuHQgp9e2CFN9N/cxjEa
	 Pd3MXgnES+uZa5Bxf6obQ+vlyLuD9tC75I0TvPLaFQX5u2Jv72mQilnuZM6Mz9wBCBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=el7WSr4+;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79BD9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=el7WSr4+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EBE20C2B9C0;
	Wed, 25 Nov 2026 14:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13E8660480;
	Wed, 25 Nov 2026 14:02:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45BEA11E68C9C;
	Wed, 25 Nov 2026 15:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795615325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5cWG+sn7xvymJfT2+aJBpSqu/Q4MQkyV5NyLotQtEGI=;
	b=el7WSr4+EvQnuue42TlMESmjLqvMnOeV+7iWy+42UQKZ2gTGMYSFShK3XlX5N/ELDq7fa7
	A7tnwxWs22ZmKjcyaWquuJjJq2+Xzdp6boiccCVsVj5+r5OVzz1kuGfNV2R8jfJsM9mGy3
	YX4VM2skR1KiXc5knsdD7/k5fEVRovzL6h2amAvJ3lzE/he+UCozBp90rt+gHTlQBunExz
	mtqqGBW+o55uhiU8XeZP3JSuD1mmdV12JskSUjhAiDpV7JLdByOmT36oB10Nvuw23OnP7b
	QRkTGU/ayaRBIb+R9iItflhqzALlueP0O0tv1m9xjDyYJaYtlPnPsq/cof4elQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 25 Nov 2026 15:01:13 +0100
Subject: [PATCH v2 09/10] drm/dp: Make the eDP supported link rates helper
 static
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
Message-Id: <20261125-feat_move_i915_helper-v2-9-aa04d39bc415@bootlin.com>
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

The supported link rates helper is now only used by the eDP sink link
rates reading function, so make it static and remove its declarations from
the public header.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v2:
- New patch extracted from the split of the 7
---
 drivers/gpu/drm/display/drm_dp_helper.c | 5 ++---
 include/drm/display/drm_dp_helper.h     | 3 ---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index d26088a1ab232..9938f3be8836a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4925,8 +4925,8 @@ EXPORT_SYMBOL(drm_dp_max_dprx_data_rate);
  *
  * Returns: The number of supported link rates, negative error code otherwise.
  */
-int drm_dp_read_dpcd_supported_link_rates(struct drm_dp_aux *aux,
-					  int link_rates[DP_MAX_SUPPORTED_RATES])
+static int drm_dp_read_dpcd_supported_link_rates(struct drm_dp_aux *aux,
+						 int link_rates[DP_MAX_SUPPORTED_RATES])
 {
 	__le16 dpcd_link_rates[DP_MAX_SUPPORTED_RATES] = {0};
 	int ret, i;
@@ -4941,7 +4941,6 @@ int drm_dp_read_dpcd_supported_link_rates(struct drm_dp_aux *aux,
 
 	return i;
 }
-EXPORT_SYMBOL_GPL(drm_dp_read_dpcd_supported_link_rates);
 
 static int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
 			     const u8 dpcd[DP_RECEIVER_CAP_SIZE])
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index c3677683c5f80..81fe87ad47050 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -703,9 +703,6 @@ static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
 int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
-int drm_dp_read_dpcd_supported_link_rates(struct drm_dp_aux *aux,
-					  int link_rates[DP_MAX_SUPPORTED_RATES]);
-
 int drm_dp_read_dpcd_sink_rates(struct drm_dp_aux *aux,
 				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],

-- 
2.43.0

