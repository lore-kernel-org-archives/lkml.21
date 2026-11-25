Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615326;
	b=EFj3NkpO4q/GNg2CnCTa8z6TGU9Eg04Lo/VYcCeDA4bkgd4gEtBXbFPVzFP/mS6IbrDE
	 5fgJqyYrgCcL8MoqQnMDKv00lciwfTwLsmr9y3qvLDD1H3p/1+cToLt61ywK4gOja5nOV
	 zm3U471k94/yU5h9Q7kC3PBrCtNTT210NuwT37LOnNrABM+r3lvqUfuA1cd9Vrj6LRqiD
	 xNS0x8X7VyT4IeRIDA42TN800i8Yn03jLONAEha0hcA6vfXdHWKIEIk6kulm2//xL+0Gm
	 P/MxvqLyhwYSj0rQK15QzliaCzkmUsnZVrPjTuHSsBJxsZsHOFpqVE2JXNsk4I7d2GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615326;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ZEAH5btCz/Jr+8dA4TqNmQCszfWR/ZaZT/crCwz8BIs=;
	b=s7wbCa+tFwlVydR+22oZbJzxq9wHRWj03ud02dYEmgruPazCn06Z50zGVzqatPjpb3S9
	 5V7PJa5DtKwPSszvW039/rp+8MIyPALXw2MswCAt4L0zkba+kKHUFIHfKOoMpLU1how86
	 YNTdGyCZbipwvdo7qzSYP54bv+klwFt87XWbTN5opz0zKy4SenKL5tvJEfn/QfdbWPA+n
	 a9fl9CRSN7sQIE04NJLAWEb3TSouTrGvML6rveTUQwH4yOS2vYlL4t71oDn0IMQMC+nJc
	 pkvIc5TZNP73bxIEhv6Cur3Dy/NTQ2kReTS0HR2Shy027rLUwTb9gD5V3k+ml+tZCzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ep40XzS5;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C7606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ep40XzS5
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8165F4E41779;
	Wed, 25 Nov 2026 14:02:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 573C660480;
	Wed, 25 Nov 2026 14:02:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29EF711E694D7;
	Wed, 25 Nov 2026 15:01:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795615318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZEAH5btCz/Jr+8dA4TqNmQCszfWR/ZaZT/crCwz8BIs=;
	b=ep40XzS52idrMTMI4kGVnq2fc+nWXs/qXIbd3dpvYCQ7Bqmp4WSqLH1gzDaJLweaWT50Bg
	w/PTMsWjABJqNxD+KOyjRyCyjTPpYTGp/J1qWvVQZbGiqEeHUyXXQ/IvxYj6gQOI7CEtP3
	nSebyYpJ8qZU0SYp40gmCB5S+Wv3nNEqTWwIs6/lDk0YsTBcM3YUvSmkuU0KpVkHbO17EQ
	oXD6FRA8PHdbWABNRI5/qEzNQkeDSdtzqjiNapzhM069p5YNJy8/8GSNzcP0RyzlfFjFqv
	p39nQ98BZSDZ3JLR4q2NoX9PRCAyBYx0YSkFGOqBGKRUo7yo3bqTKtVrIzmhTg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 25 Nov 2026 15:01:12 +0100
Subject: [PATCH v2 08/10] drm/dp: Move eDP sink link rates reading helper
 out of i915
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
Message-Id: <20261125-feat_move_i915_helper-v2-8-aa04d39bc415@bootlin.com>
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

Move the eDP sink link rates reading function out of the i915 driver
into the generic DRM helpers. The helper reads the rates from the DPCD
DP_SUPPORTED_LINK_RATES registers, available on eDP 1.4 and later
sinks.

No functional change intended.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v2:
- New patch extracted from the split of the 7
---
 drivers/gpu/drm/display/drm_dp_helper.c | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++----------------
 include/drm/display/drm_dp_helper.h     |  2 ++
 3 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6d684b6b94d0a..d26088a1ab232 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -5113,3 +5113,35 @@ int drm_dp_read_dpcd_sink_rates(struct drm_dp_aux *aux,
 	return i;
 }
 EXPORT_SYMBOL_GPL(drm_dp_read_dpcd_sink_rates);
+
+/**
+ * drm_dp_read_edp_sink_rates() - read the sink rates from the eDP DPCD
+ * @aux: DisplayPort AUX channel
+ * @edp_dpcd_rev: eDP DPCD revision of the sink
+ * @sink_rates: Array of DP_MAX_SUPPORTED_RATES entries to store the sink rates
+ *
+ * Read the link rates supported by an eDP sink from the DPCD
+ * DP_SUPPORTED_LINK_RATES registers, available on eDP 1.4 and later sinks.
+ *
+ * Returns: The number of supported sink rates, 0 if the sink does not support
+ * the DP_SUPPORTED_LINK_RATES register.
+ */
+int drm_dp_read_edp_sink_rates(struct drm_dp_aux *aux, u8 edp_dpcd_rev,
+			       int sink_rates[DP_MAX_SUPPORTED_RATES])
+{
+	int num_sink_rates;
+
+	if (edp_dpcd_rev < DP_EDP_14)
+		return 0;
+
+	num_sink_rates = drm_dp_read_dpcd_supported_link_rates(aux, sink_rates);
+	if (num_sink_rates < 0) {
+		drm_dbg_kms(aux->drm_dev,
+			    "%s: Unable to read eDP supported link rates (%d)\n",
+			    aux->name, num_sink_rates);
+		return 0;
+	}
+
+	return num_sink_rates;
+}
+EXPORT_SYMBOL_GPL(drm_dp_read_edp_sink_rates);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 798274a7b70ea..db72e7d152689 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4832,24 +4832,15 @@ static void intel_edp_limit_sink_rates_hbr2(struct intel_dp *intel_dp)
 static void
 intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 {
-	struct intel_display *display = to_intel_display(intel_dp);
-
-	intel_dp->num_sink_rates = 0;
-
-	if (intel_dp->edp_dpcd[0] >= DP_EDP_14) {
-		int ret;
-
-		ret = drm_dp_read_dpcd_supported_link_rates(&intel_dp->aux,
-							    intel_dp->sink_rates);
-		if (ret < 0) {
-			drm_dbg_kms(display->drm,
-				    "Unable to read eDP supported link rates, using default rates\n");
-			ret = 0;
-		}
+	int num_sink_rates;
 
-		intel_dp->num_sink_rates = ret;
-	}
+	num_sink_rates = drm_dp_read_edp_sink_rates(&intel_dp->aux,
+						    intel_dp->edp_dpcd[0],
+						    intel_dp->sink_rates);
+	if (num_sink_rates < 0)
+		num_sink_rates = 0;
 
+	intel_dp->num_sink_rates = num_sink_rates;
 	intel_edp_limit_sink_rates_hbr2(intel_dp);
 
 	/*
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 2e018f1e59363..c3677683c5f80 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -712,6 +712,8 @@ int drm_dp_read_dpcd_sink_rates(struct drm_dp_aux *aux,
 				const struct drm_dp_desc *desc,
 				const struct drm_dp_tunnel *tunnel,
 				int sink_rates[DP_MAX_SUPPORTED_RATES]);
+int drm_dp_read_edp_sink_rates(struct drm_dp_aux *aux, u8 edp_dpcd_rev,
+			       int sink_rates[DP_MAX_SUPPORTED_RATES]);
 
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);

-- 
2.43.0

