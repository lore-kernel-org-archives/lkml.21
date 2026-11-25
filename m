Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615311;
	b=uXHXrbGFFl9aEV2bls2IDRl9xaKnXDS2h8CAE2vEWxTMziPIl/Ijm9oFR0qLaGc02LkZ
	 Bhnly2LkolpbhZoSOIvU4gd8JqneULkcT/bp6vjugzeHovRT6RuaxaJHUcGwkDL9hCVhH
	 XzhssTfHtr7kx1vUcXrghl5Cw9uEZ1sSfF2LG2k5w3Qkd6idDdS3ctAnVnXHN68ru0DC4
	 6aGKjLOPpMpVqwOhcyl87k/ZIr0fkMmNVOybXmBUuEHRrCVDLv7vkGc2YdChg12T5V9Oj
	 zcb7wUGz4xn4LfPnX3yMRhQc8hghYdU4t4AIZ42KWiU8rH0FyklXdG41u/ASxRN1Yqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615311;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=U1Tc1UKtkaTUQl+4EDhKyJMEd+b8A2Ti9UjTn/WcWYk=;
	b=iQwBaPZndZc9StJUidEFRsbiv36cuVvlAENOMH9/MltvwuMeEcHBqpTa7+PSEd5+2nBA
	 qlkiVTuZukmxu7fw88PWypszdzixxOIBnrPbi3pijAolhkc7Qh/UDHZ7L0a0w3sgXGZe0
	 Gi2QG+fu72P+MktHKEauM5wrqnOXJIS9wtAU9L2a5+t0c6ehIPjAtv+2s1SU4JR+kCWDR
	 GG/3YGbjrtPcqVvyVu9WyAc/1AMrqtBmq+O2lsk2vpKj8bVcFIAvqBKpOksrHx334PCdQ
	 w8tKY8G99JYlP1IB4as9TJi1uP+t3JcyWVOnn7JkyW27t5TqOXjTfuDBIOgC1yKeF+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nAxtwMn2;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AD1606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2AD1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nAxtwMn2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6E25F4E4177E;
	Wed, 25 Nov 2026 14:01:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41C7960480;
	Wed, 25 Nov 2026 14:01:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A60D11E694CE;
	Wed, 25 Nov 2026 15:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795615307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U1Tc1UKtkaTUQl+4EDhKyJMEd+b8A2Ti9UjTn/WcWYk=;
	b=nAxtwMn2na5LCqZSajpiFV0nXVhn+mpfRlz8O0ynBK1zIPsl04KaNxCoRZdOyEOAzENFZm
	MaW9+ZPy2tsovDEjTyRALn2W7c7KhOKsGRyU430+8PTrDWt2f9sDPCI10jhJg6mgN59fSL
	Me0VWH9J1aD7ByJgzXfFbR0zJKPQjvsLMysfFdnUwhDLaNXy+TgPFe72hpnSGamg5LOWP+
	8loaX4j008s3gc15i6GKDf8S3LB9Z83iGhWqwIoXh4K8Wy7cLGzjw9ErdmWEW7W/7lOcRc
	nQahfC+ygfDgWCC+3KE0zLv7+EGAaYCZ1IrEtrDOqU6660wegHZIkLRGPLz6/Q==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 25 Nov 2026 15:01:08 +0100
Subject: [PATCH v2 04/10] drm/dp: Move supported 128b/132b link rates
 helper out of i915
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
Message-Id: <20261125-feat_move_i915_helper-v2-4-aa04d39bc415@bootlin.com>
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

Move the drm_dp_get_128b132b_link_rates() helper from the i915 driver
into the generic DRM helpers. It limits the UHBR rate mask by the
capabilities of the DP tunnel and of the LTTPRs, if any is present,
then expands the remaining rates in ascending order.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 52 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 25 +++-------------
 include/drm/display/drm_dp.h            |  2 ++
 include/drm/display/drm_dp_helper.h     |  4 +++
 4 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index c92d89ecf96e4..a0afb5eff5bb4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4949,3 +4949,55 @@ bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
 		return drm_dp_128b132b_supported(dpcd);
 }
 EXPORT_SYMBOL_GPL(drm_dprx_supports_128b132b);
+
+/**
+ * drm_dp_get_128b132b_link_rates() - get the supported 128b/132b link rates
+ * @lttpr_common_caps: LTTPR common capabilities
+ * @tunnel: DP tunnel object (NULL if not supported)
+ * @uhbr_rates: UHBR rate mask read from the DPCD
+ *		DP_128B132B_SUPPORTED_LINK_RATES register
+ * @link_rates: Buffer of DP_MAX_128B132B_SUPPORTED_RATES entries to store the
+ *		resulting link rates
+ *
+ * Limit the UHBR rate mask @uhbr_rates by the capabilities of the DP tunnel
+ * and of the LTTPRs, if any is present, then expand the remaining rates into
+ * @link_rates in ascending order.
+ *
+ * Returns: The number of link rates stored in @link_rates.
+ */
+int
+drm_dp_get_128b132b_link_rates(const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
+			       const struct drm_dp_tunnel *tunnel,
+			       u8 uhbr_rates,
+			       int link_rates[DP_MAX_128B132B_SUPPORTED_RATES])
+{
+	int i = 0;
+
+	if (tunnel)
+		uhbr_rates = drm_dprx_128b132b_link_rates(tunnel, uhbr_rates);
+
+	if (lttpr_common_caps && drm_dp_lttpr_count(lttpr_common_caps) > 0) {
+		/* We have a repeater */
+		if (lttpr_common_caps[0] >= DP_LTTPR_REV_SUP_128B132B &&
+		    dp_lttpr_common_cap(lttpr_common_caps,
+					DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER) &
+		    DP_PHY_REPEATER_128B132B_SUPPORTED) {
+			/* Repeater supports 128b/132b, valid UHBR rates */
+			uhbr_rates &= dp_lttpr_common_cap(lttpr_common_caps,
+							  DP_PHY_REPEATER_128B132B_RATES);
+		} else {
+			/* Does not support 128b/132b */
+			uhbr_rates = 0;
+		}
+	}
+
+	if (uhbr_rates & DP_UHBR10)
+		link_rates[i++] = 1000000;
+	if (uhbr_rates & DP_UHBR13_5)
+		link_rates[i++] = 1350000;
+	if (uhbr_rates & DP_UHBR20)
+		link_rates[i++] = 2000000;
+
+	return i;
+}
+EXPORT_SYMBOL_GPL(drm_dp_get_128b132b_link_rates);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2ba89fee097d6..7ef06e68878d4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -233,27 +233,10 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 
 		uhbr_rates = drm_dprx_128b132b_link_rates(intel_dp->tunnel, uhbr_rates);
 
-		if (drm_dp_lttpr_count(intel_dp->lttpr_common_caps)) {
-			/* We have a repeater */
-			if (intel_dp->lttpr_common_caps[0] >= 0x20 &&
-			    intel_dp->lttpr_common_caps[DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER -
-							DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] &
-			    DP_PHY_REPEATER_128B132B_SUPPORTED) {
-				/* Repeater supports 128b/132b, valid UHBR rates */
-				uhbr_rates &= intel_dp->lttpr_common_caps[DP_PHY_REPEATER_128B132B_RATES -
-									  DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
-			} else {
-				/* Does not support 128b/132b */
-				uhbr_rates = 0;
-			}
-		}
-
-		if (uhbr_rates & DP_UHBR10)
-			intel_dp->sink_rates[i++] = 1000000;
-		if (uhbr_rates & DP_UHBR13_5)
-			intel_dp->sink_rates[i++] = 1350000;
-		if (uhbr_rates & DP_UHBR20)
-			intel_dp->sink_rates[i++] = 2000000;
+		i += drm_dp_get_128b132b_link_rates(intel_dp->lttpr_common_caps,
+						    intel_dp->tunnel,
+						    uhbr_rates,
+						    &intel_dp->sink_rates[i]);
 	}
 
 	intel_dp->num_sink_rates = i;
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index a2a7338552e13..6efacff09567c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1228,6 +1228,7 @@
 # define DP_UHBR10                             (1 << 0)
 # define DP_UHBR20                             (1 << 1)
 # define DP_UHBR13_5                           (1 << 2)
+# define DP_MAX_128B132B_SUPPORTED_RATES	3
 
 #define DP_128B132B_TRAINING_AUX_RD_INTERVAL                    0x2216 /* 2.0 */
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_1MS_UNIT          (1 << 7)
@@ -1528,6 +1529,7 @@
 
 /* LTTPR: Link Training (LT)-tunable PHY Repeaters */
 #define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000 /* 1.3 */
+#define  DP_LTTPR_REV_SUP_128B132B			    0x20
 #define DP_MAX_LINK_RATE_PHY_REPEATER			    0xf0001 /* 1.4a */
 #define DP_PHY_REPEATER_CNT				    0xf0002 /* 1.3 */
 #define DP_PHY_REPEATER_MODE				    0xf0003 /* 1.3 */
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index b67bb06f6e07e..a8c382a2c916f 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -708,6 +708,10 @@ u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
 				u8 uhbr_rates);
 bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
 				const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+int drm_dp_get_128b132b_link_rates(const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
+				   const struct drm_dp_tunnel *tunnel,
+				   u8 uhbr_rates,
+				   int link_rates[DP_MAX_128B132B_SUPPORTED_RATES]);
 
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);

-- 
2.43.0

