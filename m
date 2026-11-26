Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661597;
	b=T3NtCV7AvUTosU7KydQ2y/YOp7ViMe5AnQO5Q3f/c1V21HYXuFLd6rmZ1NzkOLs7nE3/
	 J5IE+8uxJMWlktiUhWWWgs/PZZiAcjAO5aulovlwVcvWUeBIU9bsbbjdzdM499L4SRKRA
	 2Xeutt1jwr851THGguIXQIXDkE3grjaxU7HmgrFg95Mi1mk/Za1x6ENGulJO7DoBiF2Ps
	 LtX1p60FS9/TrZ0OXg+dCfy27pshuKzOF3C0AnmwsFLz9/cLPLYqqBM8oK9LL4eVfRZPL
	 an5NksdXL864e/EahYp/fh6JEgfIJ2Vd/KuI7L3q7PLEqT7Ijqc7V/x9hhPIRTF099Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HTpYziNr2PAVPjcMV9h6mD6LtVNtvdaTWVXPJB6QgmI=;
	b=aAEvwxsDhU5iO+G6LxhSCZbH2JVK+vfEFdF+MDzypoz0LASWUB7qTpWHNZdDuR3A/Uoa
	 udPIJ1rexf8fjNLgEucImH8gClzNlG/2ewt57iN2PYT5kYQ1cnoWDQvtJLiovwR9xElEa
	 iTb8eNS4t8DikQ2zQxg/O17qHtn3fjv0hlzuk3bXtRpzHTKpcXM/6Lx/r33dpxjwNRN2a
	 YVRhrmdwC5Nd6VtRjUOmXYxS5kO4GZlhuGKwne8YjmK3tsGeMJlJ0I9HdZOfv9g667TKV
	 7oYi9sZFbUkYZV40MI88k8xnJZ3aahusXS4Gi/Z+MytzbyuH61WYVB62dVOwNw/Mvcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbiDmxpa;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C00606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbiDmxpa
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b402824d07so4397983a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795661597; x=1796266397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTpYziNr2PAVPjcMV9h6mD6LtVNtvdaTWVXPJB6QgmI=;
        b=YbiDmxpa7NiLG14QBxFuhSQtaoNXg1QjOZB+xBwCIjiGeB7HUSQP0aaMIu6cu+dphm
         vn7ZFAlRyjtsiTpKLrThelRunLT3RVJwFXX1b2DDdr/ZiCjnbq3gYElNx8BmdoP0tmDR
         OYfv2d7fhuFUjzDoIRH/yy+SbJBFN6OvQU/AfgmW9xdgf7jrDmlDcx/ZCq5CW5eY9lWD
         GZjN+UpntG2sVcd9ocxuByVL3ITfRGgGaBaT0YOWE7CBeqbMUNegixmI6NVBkNacvtI+
         SuRPtJMBs0OwUNGmHPA+xIi7wH2VxVtPXvrz9E/CuXe2vqEqsYlQNjGwZcTw57TyMtwX
         lrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661597; x=1796266397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTpYziNr2PAVPjcMV9h6mD6LtVNtvdaTWVXPJB6QgmI=;
        b=m1MRcZs37BvZZHZbYTtxRWeAdRmousMoqNutkDdfpaOjekCendw8pUpzpJ/YQOmntz
         FFIWVbYkqTnGSCLhwqsYXgaIRCT6irs6ubqeCUQcOSUcBqy7P7G4FMVYNL/6MXZ94ojM
         CWpYNhY0T1q7sCehLI3sfcm12clKLgJdHj6coOQxDKOhliYljlL6W0Mtep6cLnopJ/QF
         ZarKV+75r+hUMlQneEtsGAzEODxtwwx3fAj7+xiS2O0jCBi2rCXagL5MGZFWuF05Q1GC
         lAV0sUKM0ZDaIjqQpRasGdKxhT+06f4acaZNUxQ86XsazEvcPNP32rgD2RNORtPNGG06
         WTEw==
X-Forwarded-Encrypted: i=1; AL+hErFthLnaLD6phNtpLIx7za89ZTn7KkMhpm0A/C2xMxUWZEF6l5qeG7Kv5Cn75pgzNF1fus8+/gkgyAAK8+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zmeYfzj88a5ZrGySUMwpPwGSJhVSg9QgBMgFhHu04HpZsBPyi
	MD3MgZqCqpf4uj24FV042+qAzg9iXU4Aa1/4+hujxDgaMPi8efvAiS/g
X-Gm-Gg: AZFdTZeYO/5afQvpZKIC/YoQpE+Iuuk36L7U0FWHKPWh7PHsIOWI3MtcABboC4I7ARn
	XKBSD47+SuJHaLNDVyWtHWlqIrI16bSHAko9LxTPBZn2XBD8dELDsax4LEgcxRcF00GxJeLC9hX
	MCmXXAS85Y1hU6id3GO8lXyryL/KSqEQTCeVCRaFQt/IOZWwkfrJ5M4RxYh6D7pgJJBnDVgtTcD
	vw/rIuHt1uJSgjkjd3H8NvONgLYShI4/NSzifRHvnpV281X4kQ5aVFZ3YjWMmwxPo1Cl/4Ho0d3
	A+h5/tMbNPzZtFIZc93xdF6/KPIx/vfRwp9J64bCseF2zf2teBxxQ4VbEsAtyHHLZKtqrDUuP3L
	VeUBf5FKXvbSDWlCa4TtalR3B0vt7bNVwmkEriIHD4Lr9nQK9Xlny6QXU5JbwmafxkMw1wuiwKh
	F7KTg9GVOgAs/syF0o9gZx0dZiLyxqqpw7bUacr0A/9hFzfEkc4LQgRC1sC0CI1qr/PNvPjvSiw
	Zxp5jELIvnh8r09JEiVzt8BvRCg2q9h1BxxSMOKbRtV9Z3z19ZMOKHQUWfyHBIHB3K6O8DTpCo9
	wftEOSUEgj3eNgBUVLlN3+qS9g6uLTecqCM0OQcSaiT8Z/X1LC1Tgqv18LANGvGR6FIvtDa/qBQ
	UPUghGWZcHdqizbLDUPYNeCcqzyCUgFI=
X-Received: by 2002:a17:90b:2e49:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3b41c58ae4dmr18404220a91.0.1795661596519;
        Wed, 25 Nov 2026 18:53:16 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net. [36.226.201.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b50234fb25sm1768700a91.2.2026.11.25.18.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:53:16 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel --confirm=neverMaintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>
Subject: [PATCH] drm/vc4: hdmi: Reject modes that don't fit the BCM2711 timing registers
Date: Thu, 26 Nov 2026 10:53:11 +0800
Message-ID: <20261126025311.640543-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vc5_hdmi_set_timings() packs the mode timings into register fields that
are much narrower than the values a mode can carry (for example 11 bits
for the horizontal back porch and 9 bits for the vertical back porch),
but nothing checks that a mode fits before it gets there. Such a mode
passes the atomic check, VC4_SET_FIELD() warns once for every field
that overflows, and the truncated timings are written to the hardware.

The igt test kms_invalid_mode, subtest overflow-vrefresh, hits this on a
Raspberry Pi 5: it sets a mode with htotal = vtotal = 32768, the commit
succeeds and four warnings are printed:

  WARNING: CPU: 0 PID: 64500 at vc4_hdmi.c:1282 vc5_hdmi_set_timings+0x970/0xed8 [vc4]
  WARNING: CPU: 0 PID: 64500 at vc4_hdmi.c:1284 vc5_hdmi_set_timings+0x980/0xed8 [vc4]
  WARNING: CPU: 0 PID: 64500 at vc4_hdmi.c:1288 vc5_hdmi_set_timings+0x994/0xed8 [vc4]
  WARNING: CPU: 0 PID: 64500 at vc4_hdmi.c:1311 vc5_hdmi_set_timings+0xbb4/0xed8 [vc4]

Add a timings_valid() variant hook, implemented for the BCM2711 and
BCM2712 controllers, that computes the same values as
vc5_hdmi_set_timings() and checks each one against its field, and call
it from the encoder's mode_valid(). Modes that don't fit are now
rejected at atomic check time, and dropped from the probed mode list.

The BCM2835 controller (vc4_hdmi_set_timings()) has the same kind of
narrow fields but is left alone here, as I have no hardware to test it.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39, with this
change applied to its vc4 driver):
- kms_invalid_mode: 12 pass / 1 fail, 4 warnings -> 13 pass / 0 fail,
  no warnings
- all 12 modes from the monitor's EDID (including 1920x1080i and
  720x480) are still listed, and none is reported as rejected

The failure was found with igt-gpu-tools. The fix and this changelog
were written with the help of an AI coding assistant (Claude); the
testing above was done on real hardware.

Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: Roy <rongh7426@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 50 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 ++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f3ec65d..4e10cde 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1254,6 +1254,44 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	drm_dev_exit(idx);
 }
 
+/*
+ * Check that every value vc5_hdmi_set_timings() writes fits in its
+ * register field. Such a mode would otherwise be programmed with
+ * truncated timings, and VC4_SET_FIELD() would warn about it on every
+ * modeset.
+ */
+static enum drm_mode_status
+vc5_hdmi_timings_valid(const struct drm_display_mode *mode)
+{
+	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	u32 pixel_rep = (mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1;
+	struct drm_display_mode m;
+
+	drm_mode_init(&m, mode);
+	drm_mode_set_crtcinfo(&m, CRTC_INTERLACE_HALVE_V);
+
+	if (!FIELD_FIT(VC5_HDMI_HORZA_HAP_MASK, m.hdisplay * pixel_rep) ||
+	    !FIELD_FIT(VC5_HDMI_HORZA_HFP_MASK,
+		       (m.hsync_start - m.hdisplay) * pixel_rep) ||
+	    !FIELD_FIT(VC5_HDMI_HORZB_HBP_MASK,
+		       (m.htotal - m.hsync_end) * pixel_rep) ||
+	    !FIELD_FIT(VC5_HDMI_HORZB_HSP_MASK,
+		       (m.hsync_end - m.hsync_start) * pixel_rep) ||
+	    !FIELD_FIT(VC5_HDMI_VERTB_VSPO_MASK, m.htotal >> (2 - pixel_rep)))
+		return MODE_H_ILLEGAL;
+
+	if (!FIELD_FIT(VC5_HDMI_VERTA_VSP_MASK,
+		       m.crtc_vsync_end - m.crtc_vsync_start) ||
+	    !FIELD_FIT(VC5_HDMI_VERTA_VFP_MASK,
+		       m.crtc_vsync_start - m.crtc_vdisplay) ||
+	    !FIELD_FIT(VC5_HDMI_VERTA_VAL_MASK, m.crtc_vdisplay) ||
+	    !FIELD_FIT(VC4_HDMI_VERTB_VBP_MASK,
+		       m.crtc_vtotal - m.crtc_vsync_end + interlaced))
+		return MODE_V_ILLEGAL;
+
+	return MODE_OK;
+}
+
 static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_device *drm = vc4_hdmi->connector.dev;
@@ -1656,6 +1694,14 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
+	if (vc4_hdmi->variant->timings_valid) {
+		enum drm_mode_status status;
+
+		status = vc4_hdmi->variant->timings_valid(mode);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
@@ -3233,6 +3279,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.csc_setup		= vc5_hdmi_csc_setup,
 	.reset			= vc5_hdmi_reset,
 	.set_timings		= vc5_hdmi_set_timings,
+	.timings_valid		= vc5_hdmi_timings_valid,
 	.phy_init		= vc5_hdmi_phy_init,
 	.phy_disable		= vc5_hdmi_phy_disable,
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
@@ -3261,6 +3308,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.csc_setup		= vc5_hdmi_csc_setup,
 	.reset			= vc5_hdmi_reset,
 	.set_timings		= vc5_hdmi_set_timings,
+	.timings_valid		= vc5_hdmi_timings_valid,
 	.phy_init		= vc5_hdmi_phy_init,
 	.phy_disable		= vc5_hdmi_phy_disable,
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
@@ -3289,6 +3337,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.csc_setup		= vc5_hdmi_csc_setup,
 	.reset			= vc5_hdmi_reset,
 	.set_timings		= vc5_hdmi_set_timings,
+	.timings_valid		= vc5_hdmi_timings_valid,
 	.phy_init		= vc6_hdmi_phy_init,
 	.phy_disable		= vc6_hdmi_phy_disable,
 	.channel_map		= vc5_hdmi_channel_map,
@@ -3315,6 +3364,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.csc_setup		= vc5_hdmi_csc_setup,
 	.reset			= vc5_hdmi_reset,
 	.set_timings		= vc5_hdmi_set_timings,
+	.timings_valid		= vc5_hdmi_timings_valid,
 	.phy_init		= vc6_hdmi_phy_init,
 	.phy_disable		= vc6_hdmi_phy_disable,
 	.channel_map		= vc5_hdmi_channel_map,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b1f41d5..397ebaf 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -71,6 +71,12 @@ struct vc4_hdmi_variant {
 			    struct drm_connector_state *state,
 			    const struct drm_display_mode *mode);
 
+	/*
+	 * Callback to check that the video timings of a mode fit in the
+	 * timing registers of the HDMI block. Optional.
+	 */
+	enum drm_mode_status (*timings_valid)(const struct drm_display_mode *mode);
+
 	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
 			 struct drm_connector_state *conn_state);
-- 
2.51.1.windows.1

