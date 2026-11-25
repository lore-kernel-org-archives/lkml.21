Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615308;
	b=qfYtgSPq0w4ELtLOCAo1DdxrsShChGb1FOrSPcWotgxzBrQmXkmlGZgD3LF2ar2nNwZi
	 0VKrPkhwLU6kTa+DQakb43wLzr9s1NqEKFTsLa+qTke3FspPf3dKfHjtdbbv6w3LUEFTZ
	 ZnCY5u3HJRw3qj0D4aeJdSRrssBtUnMTUvGsqqZWEvvzNAyx2+UuSCwAJ6BACyCezLY9V
	 F+EuqEs//+Xh9sncdjXnI4jFvh3yvMYd9v7PtaMJ/EoEQ5l4wWT7nnu4zB8nQBqjmzHt0
	 TX1kmYEeYVp4GRLHsA6kq4DFktuZy6+uAVJ15W09WArlu8NTlCku6en12Gt+s3qaOMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615308;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=653wFHNe58RDGPkNgZywAB9EUf/nkwl86zOUosYCpho=;
	b=CCjFEIf8qgvBBNIO3kULIIJNq5jhzJhnwyOA6A1Hj0yaB+t9kYt3x2cdprp1D5xgtKM1
	 dFSnUliVXOLo3U1ljjsvdQSKdqUzYNODz7P+px38WysUMMKkNzkNEkIsiEt3sio1AOQL/
	 Ez3BTRhATYHAUVmgEHjFLamGrk8HBHwveX3ZZJboECeBifMUnFk9iJy11srPpAd8JS39a
	 1DhzSRuxKsXQlEqW8PESJlrEEnIYq098r1AIJePjQjFSRQuMPo11tx0v2FCRVSzuSjrz8
	 sPNoUuDjb+ffCPLxPe0lycMpEU9Dj/Hq+mu3XOwyHztNEDNSTDXoXHNkHSeDKjpfGug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ljw2LehK;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E45606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E45606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ljw2LehK
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0AA06C2BB3E;
	Wed, 25 Nov 2026 14:01:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2768B60480;
	Wed, 25 Nov 2026 14:01:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1073511E694D7;
	Wed, 25 Nov 2026 15:01:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795615301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=653wFHNe58RDGPkNgZywAB9EUf/nkwl86zOUosYCpho=;
	b=Ljw2LehKro4jJuBWC0CszkFuO2BZz2WGmxGVA+GOo1as7gErE2FCA7X/eT65FwkOIo/QOV
	0kSWcEo8+uX0TCPBn7dlBjijktndFYwKH0UOfhUyUTBEInMCljOEex71yFreTBCkP8kP92
	HUMZWKyxv/sZq/fi7S+nRciw3Zaf3Y8SE8gPDPngTocCIakYRXsE3oPh7PD473/l7dptkU
	/9veQtaATbvJSRmeizd4GVX2Mih2hL+zjqjN0CICGyu49JDuqf0Pf2Pqw18O0WaVukIkBj
	5Yn+2SmungBTFPBpbrghZtI72yIh0+V/vsIoyNWHIOw1kh+9zu8xBzB6rQSjaQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 25 Nov 2026 15:01:07 +0100
Subject: [PATCH v2 03/10] drm/dp: Move DPRX 128b/132b support helper out of
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
Message-Id: <20261125-feat_move_i915_helper-v2-3-aa04d39bc415@bootlin.com>
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

Move the drm_dprx_supports_128b132b() helper from the i915 driver into
the generic DRM helpers. It reports whether the DPRX supports 128b/132b
channel coding, either from the DP tunnel capabilities when bandwidth
allocation is enabled or from the DPCD receiver capabilities.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 10 +---------
 include/drm/display/drm_dp_helper.h     |  2 ++
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 86260ffd57cdc..c92d89ecf96e4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4939,3 +4939,13 @@ u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
 	return drm_dp_tunnel_128b132b_dprx_rates(tunnel);
 }
 EXPORT_SYMBOL_GPL(drm_dprx_128b132b_link_rates);
+
+bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	if (tunnel && drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
+		return drm_dp_tunnel_128b132b_supported(tunnel);
+	else
+		return drm_dp_128b132b_supported(dpcd);
+}
+EXPORT_SYMBOL_GPL(drm_dprx_supports_128b132b);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e124e7dced178..2ba89fee097d6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -173,14 +173,6 @@ static void intel_dp_set_default_sink_rates(struct intel_dp *intel_dp)
 	intel_dp->num_sink_rates = 1;
 }
 
-static bool dprx_supports_128b132b(struct intel_dp *intel_dp)
-{
-	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
-		return drm_dp_tunnel_128b132b_supported(intel_dp->tunnel);
-	else
-		return drm_dp_128b132b_supported(intel_dp->dpcd);
-}
-
 /* update sink rates from dpcd */
 static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 {
@@ -236,7 +228,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 	 * Sink rates for 128b/132b. If set, sink should support all 8b/10b
 	 * rates and 10 Gbps.
 	 */
-	if (dprx_supports_128b132b(intel_dp)) {
+	if (drm_dprx_supports_128b132b(intel_dp->tunnel, intel_dp->dpcd)) {
 		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZE(dp_rates) + 3);
 
 		uhbr_rates = drm_dprx_128b132b_link_rates(intel_dp->tunnel, uhbr_rates);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 7985bb269fdf2..b67bb06f6e07e 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -706,6 +706,8 @@ int drm_dprx_max_rate(const struct drm_dp_tunnel *tunnel,
 		      const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
 				u8 uhbr_rates);
+bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);

-- 
2.43.0

