Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082825;
	b=nwiqBMtTlO8iLfVh/bFjI9ZDm04OMHNOQ3eXXxvlBwuBsLDTsbACd0iLfeAarPCBBHLQ
	 t5wXghCYf2BolIB7gKW+AWedPC5mSTEcgS9phgF9axHrq5tmUVphWEeBezwXFJwXvlVmo
	 dCgf8yE2K9pOQTLF04UOjnXqDr1IZkygGkqMuVXpE9iQ/aWiT3dmQ/x5Kc7ZB1/Kt8tMt
	 NRpgi3TgqkUFTUDUWoZy3jz0WftLVHJrn/tU02BdfCsf7KCQ8QEAtS954zspzG8K3nX4o
	 7dUBPqJ+FnhwSKGejKyiW1cB+7n5kSJ9vHNbwyFCcFnxVqGRXiDqCuXV7ExYa3gtopQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082825;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1oKOiRCTh1TsF/AMF/cw3jxDUNQB0kFtfdY4lghCc2c=;
	b=VD2ZRWa16Zyye7fHRPBxPAIb8fWHJle6ByY3xnhH3QZTGhhVWldOgKoaY5eagQqpryea
	 lTp4fF8pGVWjswN6/g5R/rFo1IoJrliU3hBkeFfUEo1rpaTP3OVZzd5MZtj3nYW54fGQ7
	 7dVWQpIly3xov+axOpjtB3kHoh4sZSzcPEZzCBBuXGpHXkHMmsD2X8ug4mO17t5pvobrp
	 m+LuAmpDKw4CQaE1RmcqzzeCog3CuoErDRBWHejMmAHKD+fGD+0KWNjH8BZfB6ZN6CMVI
	 22opHBjp+RiJaMk4y9SoS1rvRVQ4D8ZNYqQJnsqu0SgVcMaqbfE/HFJTTiOPo49FAUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMMjkcuT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E20606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMMjkcuT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795082824;
	b=AF6m1GpeU3iAb6TtSnuFFpW+qJ3/nW9Qan01muwihq7y/xzwS4dBSat1Umm8ynO/Mfz9
	 C39f8AZLtyN8++fx0dn4MG07V6SpzvK1E7JRHH1HFIV2x0LeNTv42yx3JgY0yg/Gf9Xx0
	 IELcbcX3M4yaY97AdA10+thbn9zJ/fqIth9W+Lps+UtMSHYyM6xGAAzchYwDdPfewWUek
	 ylFezReETCMRe8k2fFKLLr8HWTKaiMJ2Y7f7quzJNV0q1tnjD4w6K0dt8RG5IMdbT7Lx4
	 5ZfAKgKisKxBR4Q9Ye4+HlMt3eUI1YrkHsR9HNK3TMQm26H4aN+7iUp7N2S5DDzp/ow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082824;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1oKOiRCTh1TsF/AMF/cw3jxDUNQB0kFtfdY4lghCc2c=;
	b=k00Qzfv9/1uPYQX2nlBUVlRIev4nrcj8tdNImDktlgK+n2PaPVAuRTMHcs9jNBXWC/TL
	 RcQLelGsWZEMj47KRIxwctOglCojp8ME2auOiADiWrCwnVXZBkgRKgSRnvmbm81zd2p2v
	 GNJkt7AXbV4KFCi4x+AxwYOUBU5ECrBvMyX+o9EDPW1ckwwyDU6UxUXkMfLkYnxi6obRd
	 k190mKVwRwbm10s/IrY192GiGf+6m3hz4AZKdzm6rbZVh5cPMHSOSnsF08agoOVXNWJQ2
	 f9xAlHIXBY8+VO3fxsnvhU023+EA35DnrMbKizup96a151zE65R9VeBRyW74tQ5Preg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 557C81F000C4;
	Thu, 19 Nov 2026 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082824;
	bh=1oKOiRCTh1TsF/AMF/cw3jxDUNQB0kFtfdY4lghCc2c=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=dMMjkcuTL/aKAGzvd1gNZo5o2YPB2i4bnre2g/VP57UF5BLXu9tNUezqgJNKeIvTQ
	 D/820eFu1raJxkZeArDNx2RLtSV3Zxr2HRpn+ekD4beuT82oOKpyKr0EZ7HAlwClLu
	 37G/hoqtVaH2vi85uS1IWx7DKDQBwHEx5qGvWc26usCZGK80mtfU3XdCHlNue7o9Ke
	 aNpZ7GRV7w2wF9lU0WBdxLpPeraHAxib/EDHEyp3rOMXl4yWRyOYp4nOL19WF0/dxT
	 mSQredjIjWVNRwdYGSj4t4hYYKyA3tV1y7dmq/2IXvqIuDTJzqG3dpKTYzEtW+o9Og
	 izyu/liW+yBJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB1134B1FE;
	Thu, 19 Nov 2026 10:07:03 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 10:07:04 +0000
Subject: [PATCH] drm/edid: Add the modes of CTA Type VII video timing data
 blocks
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
Message-Id: <20261119-edid-t7vtdb-v1-1-d6b8229d2041@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXRCm1dRSxoB2OBtCUS6d0Vy
 7f4/waPjtBDk93g8CRP25rA8wzM3K8TMrLJIApRc841Q0uWBXkGO7BKKCVNqVUhBaRidzjS9d3
 a7rc/hgVNeBcQ4wNN8JaHbwAAAA==
X-Change-ID: 20261119-edid-t7vtdb-52887c398072
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082823; l=3314;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ScVtHOJIDgPl4/O/zIOpx/r4EUsECXNNFCTxoFJH0aM=;
 b=0P6zzqbJo5NuJRTPk89GnQsec3NRNlPrNNgLUOrRKeu3N5oa3HbD4o3/o7LvNytREOD5g8bf6
 v3gigHSBGaWCrzJ5OmZya3++7pxgbh/Jgh+m4jAvYXwpf69Fratuv3z
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

CTA-861-H lets a CTA extension carry DisplayID Type VII timings (T7VTDB,
extended tag 0x22). HDMI 2.1 TVs list modes such as 3840x2160@144Hz
there, but only Type VII timings in DisplayID extensions are parsed, so
these modes are missing. Add them. In a T7VTDB bit 7 of the timing
flags means YCbCr 4:2:0 support instead of preferred timing, so these
modes are never marked preferred. The 4:2:0 flag is not used, as 4:2:0
capable modes are tracked by VIC.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi 5 (RK3588S, 7.3-based kernel): the three T7VTDB
timings of an HDMI 2.1 TV are listed. With an EDID override adding a
T7VTDB timing with bit 7 set, the mode is listed and not preferred.

Developed with Claude (Anthropic), which wrote the code and the commit
message. I reviewed every change.
---
 drivers/gpu/drm/drm_edid.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b8f882a17c8f..ff47b34d4efb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4215,6 +4215,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 #define CTA_EXT_DB_HDR_STATIC_METADATA	6
 #define CTA_EXT_DB_420_VIDEO_DATA	14
 #define CTA_EXT_DB_420_VIDEO_CAP_MAP	15
+#define CTA_EXT_DB_T7VTDB		0x22
 #define CTA_EXT_DB_HF_EEODB		0x78
 #define CTA_EXT_DB_HF_SCDB		0x79
 
@@ -7206,6 +7207,38 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	return num_modes;
 }
 
+/* CTA-861-H T7VTDB: a revision byte, then one DisplayID Type VII timing */
+static int add_cta_t7vtdb_modes(struct drm_connector *connector,
+				const struct drm_edid *drm_edid)
+{
+	const struct displayid_detailed_timings_1 *timings;
+	struct drm_display_mode *newmode;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
+	int num_modes = 0;
+
+	cea_db_iter_edid_begin(drm_edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (!cea_db_is_extended_tag(db, CTA_EXT_DB_T7VTDB) ||
+		    cea_db_payload_len(db) < 2 + sizeof(*timings))
+			continue;
+
+		timings = (const void *)(cea_db_data(db) + 2);
+		newmode = drm_mode_displayid_detailed(connector->dev, timings, true);
+		if (!newmode)
+			continue;
+
+		/* Bit 7 of the flags is YCbCr 4:2:0 support here, not preferred */
+		newmode->type &= ~DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, newmode);
+		num_modes++;
+	}
+	cea_db_iter_end(&iter);
+
+	return num_modes;
+}
+
 static int _drm_edid_connector_add_modes(struct drm_connector *connector,
 					 const struct drm_edid *drm_edid)
 {
@@ -7235,6 +7268,7 @@ static int _drm_edid_connector_add_modes(struct drm_connector *connector,
 	num_modes += add_cea_modes(connector, drm_edid);
 	num_modes += add_alternate_cea_modes(connector, drm_edid);
 	num_modes += add_displayid_detailed_modes(connector, drm_edid);
+	num_modes += add_cta_t7vtdb_modes(connector, drm_edid);
 	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
 		num_modes += add_inferred_modes(connector, drm_edid);
 

---
base-commit: fac7a5f16230779cfb0d50ca49e9467cc94a2ea9
change-id: 20261119-edid-t7vtdb-52887c398072

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


