Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774473;
	b=i8cKNDgJfxZHGrQu0Krr2p802E4/+U4jwh5m59gYG81/rTEUrqKElRWzGJvcmEGNguI5
	 XHxCl7YOy79Ku7gwCszaI69hibAqzjcxGsiQaF1PNovCrGWPwvMkDxzMPVrndDG0xMEVh
	 TVVIlybutvfFrUwHgrFR5e0OIb3ZKiMDEtUsq4PvKGMT0uM1bExEq38DkUeS1HfOFITwk
	 FLZ3cKv2d+Vit0dX1kPrxDzlmUHybYbVsjAh4lbYBa24TWn+HsEEzNuIoEQjic9U4JKO0
	 kVRweiuiAJ9WW5vJpWaEug32qBv/z1XJTsw15rcy7f3tB//KniLZ4P+Xuir/yLMjxXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8+PAwb+mXQI4gAhMwD/y+lNTC9Q12C33hVekcKZeeF4=;
	b=5SAtYuPRc+O+tPqI+akH/WUR62g8FPrybSRfPw3yEwgjFQ0dRsJflVi3pMh8bA6/4IhJ
	 Gn3LT1ROa5aDqSs0rtF9qg9u8Vix9v114DBf09PcY521KVjFATCwT3JUQFSoCyYLKzxEV
	 Ak9zR2KRjq0CPvLAolu1SHVnGr6qjTZYgt75HdklQ9LaLvZk9shX/z48H2lCLDdYlu4vR
	 +R72xPkB+VGoJdNg7koI4BoDdI5+ZWQflSksIZmonuU8HDFpmbA0Eq77QZlxfpenXL5ii
	 7glzcjrA8z3YUvIlZQccL5Zg9+A3mw2hC1+EoQImKCkCqxJaB0p7VTrB8hnfx5qsXxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lj94B0mJ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F2D60A5BC2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F2D60A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lj94B0mJ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso79767715e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774471; x=1796379271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+PAwb+mXQI4gAhMwD/y+lNTC9Q12C33hVekcKZeeF4=;
        b=lj94B0mJW3uGWk4YTAZKlDRir57NkoHeMIRSrR7jmWlJl5FVp0OUUP9rYsLO2pRF2c
         Mq6jZM1xwbWMFrqHR8WkVkAU6bf3vMKvSBzb7Uot/LD1bG/j6ngD9gnfdah0jaaZxPr4
         9xbXdumpY+F1MKQDatbIdnkE1VCdR08g5xzczkDSTr0hw5Uf9r65v35VAce5HQoZROao
         sS9TFoynYY0LmcgPulrGf6/9y8KhxiCU7ekKJ8CwTwgehCWwzxYG0Gc62iORUVakYuhg
         BHPQyUsmKkxBXG4CpKlaePj0X+QqkU2RM+n17ZgP2NuTwXGocgvbUN7qev/ta5ArcEEc
         tR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774471; x=1796379271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+PAwb+mXQI4gAhMwD/y+lNTC9Q12C33hVekcKZeeF4=;
        b=Y6D6+s+/IxJ0JCWHvA8fdiyu8HqiR/IQ3SglPBvOdjBIuRjZEt/P1otvVCz2dGVU5G
         U+MNaS0S0CAUHtKpYG4NOVqBCB7otpY18H5vDmm1zbJGmAODki7eUsm7AgSFhuOudnyO
         bBEI6jOF84PZSwPmS2Yklp8D+m6Ox+dCYVaHtbvRFqrdh0XWQEcYhf5sPyZj6A7Ukdh9
         qsUt2FKr6ntD4NuGNGlkKOhNNBE6oS4AhOV5Njg5Fc1bN5GtL7tCKNl0qhf3tM5vqcGK
         gap+LMC7JO+h1Nfi7oqOGByWU6kqBz6cOErEboI9Qmqcuj47/ALXtZ5Uzm+tOdS0BFtC
         g+AQ==
X-Forwarded-Encrypted: i=1; AL+hErH+k2siJH4iuNuOOLaj1yJWPVosI5ouDSPwpSeq4uynHkmHW6Hv4kAJTyuo9pBEQODuRQIbkdddrkuwFik=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lPXAmvgMkIWbQFHXQbwxh/B7Q88V1AxPGmLKWyOrO6iR5tQNo
	1JrxlLG9RNTC0u0CW4pVUak3yh1Asv2DRhfRqexFXbio3O3eeeFXVfU=
X-Gm-Gg: AZFdTZctMpy9zR9mIqBga9d8VLrj64B7w5X5OUNKDhBNdGz4yklJot709Livz5iFesl
	0+IfnhubhPWCgYCqrs90oW3MskymJE6HfKdlB7ozqwExlYPVl8YUdg8IL062JUYWVwOTFYXTdXB
	qnXPU3qBhlWJbd+xLCJAbhHSVBrN5/4IppenKeIR4so6fZ13SGV4h4I9QKUpcYD+Me4Gfmzteqm
	nZEu5KjOXCbaagF0dobmD+doXIShaox6SZTUCMgDhGslfbnUC8FZ6CeZEQlUaBfeV1v1lj585uK
	AX1wtyQACdRj73Oc6RyHL00pbz4aUFUzgg9tKuueL4CT+HJq+jpPAJY9/YEL7xpi2Ibiepj4uZP
	r9+ox9V8rDq2uorqfCdnxGhr9QL4U2Lz8EAWKa/Pc4Vsf/jOIp8tHWK2oOMx7WDyePm7B18Mam7
	tpUmkeejGa/j/Cj2VLvYtAqM5A128KmIPITe1b/fT4FsBMPMinTxPwIrMJxzIvAkCL+DuktIpMb
	chvvNiyBFfCVMKF0H7PiuQfxznDAJsNiT3AGddQOjzEgdpYWML9NC54nJqIh6CqIpcr4FS0X8u8
	KHDP+lYpzfQELwtEd/Rx8Tlbwzvve/mcZPEhY1SBlkeIQdDl3lEMvNOdSirqSWdbnfA/5X58mt7
	QXim4c+aa0hABSc8aoBJtKMDySpkJTj62sO17H4cB7HJvaPgvL93IMNmR9Etg
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr574459845e9.9.1795774470905;
        Fri, 27 Nov 2026 02:14:30 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:30 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 06/10] drm/msm/dp: track DP_SINK_COUNT capability and sync prev_sink_count
Date: Fri, 27 Nov 2026 11:14:13 +0100
Message-Id: <20261127101417.24303-7-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
References: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
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

msm_dp_panel_read_link_caps() only checked DP_SINK_COUNT on branch
devices (without checking count < 0 for AUX errors or updating
panel->link->sink_count when non-zero), while
msm_dp_link_parse_sink_status_field() unconditionally read DP_SINK_COUNT
on every sink.

On non-branch SST sinks that do not implement DP_SINK_COUNT and return 0
at DPCD 0x200, sink_count stayed 0 or flipped between 1 and 0 on
subsequent IRQ_HPD requests, causing msm_dp_display_prepare_link() to
bail out with -ENOTCONN or msm_dp_link_process_ds_port_status_change()
to misclassify link maintenance pulses as DS_PORT_STATUS_CHANGED.

Query drm_dp_read_sink_count_cap() in msm_dp_panel_read_link_caps() and
record it in link->has_sink_count, default sinks without DP_SINK_COUNT
support to sink_count = 1, keep sink_count and prev_sink_count
synchronized via msm_dp_link_set_sink_count(), and clear both on unplug.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Fixes: b7ba5db9c863 ("drm/msm/dp: Use drm_dp_read_sink_count() helper")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
 drivers/gpu/drm/msm/dp/dp_link.c    | 26 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_link.h    |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 19 +++++++++++++++----
 4 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3c15f984b29e..7831dd13b067 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -477,6 +477,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
 
+	dp->link->has_sink_count = false;
+	msm_dp_link_set_sink_count(dp->link, 0);
+
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 34a91e194a12..b619707b8e3b 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -720,12 +720,16 @@ static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
 	int ret;
 
 	link->prev_sink_count = link->msm_dp_link.sink_count;
-	ret = drm_dp_read_sink_count(link->aux);
-	if (ret < 0) {
-		DRM_ERROR("DP parse sink count failed\n");
-		return ret;
+	if (link->msm_dp_link.has_sink_count) {
+		ret = drm_dp_read_sink_count(link->aux);
+		if (ret < 0) {
+			DRM_ERROR("DP parse sink count failed\n");
+			return ret;
+		}
+		link->msm_dp_link.sink_count = ret;
+	} else {
+		link->msm_dp_link.sink_count = 1;
 	}
-	link->msm_dp_link.sink_count = ret;
 
 	ret = drm_dp_dpcd_read_link_status(link->aux,
 					   link->link_status);
@@ -1348,3 +1352,15 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 
 	return msm_dp_link;
 }
+
+void msm_dp_link_set_sink_count(struct msm_dp_link *msm_dp_link, u8 sink_count)
+{
+	struct msm_dp_link_private *link;
+
+	if (!msm_dp_link)
+		return;
+
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
+	msm_dp_link->sink_count = sink_count;
+	link->prev_sink_count = sink_count;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 76125e9c07e9..11be55ade0a8 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -72,6 +72,7 @@ struct msm_dp_link {
 	u32 test_response;
 
 	u8 sink_count;
+	bool has_sink_count;
 	struct msm_dp_link_test_video test_video;
 	struct msm_dp_link_test_audio test_audio;
 	struct msm_dp_link_phy_params phy_params;
@@ -112,6 +113,7 @@ static inline u32 msm_dp_link_bit_depth_to_bpp(u32 tbd)
 }
 
 void msm_dp_link_reset_phy_params_vx_px(struct msm_dp_link *msm_dp_link);
+void msm_dp_link_set_sink_count(struct msm_dp_link *msm_dp_link, u8 sink_count);
 u32 msm_dp_link_get_test_bits_depth(struct msm_dp_link *msm_dp_link, u32 bpp);
 int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link);
 int msm_dp_link_get_colorimetry_config(struct msm_dp_link *msm_dp_link);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index e633afdf2b47..0f81aaa7e6db 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -332,6 +332,7 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 {
 	int rc, bw_code;
 	int count;
+	struct drm_dp_desc desc;
 	struct msm_dp_panel_private *panel;
 
 	if (!msm_dp_panel || !connector) {
@@ -356,12 +357,22 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 		return -EINVAL;
 	}
 
-	if (drm_dp_is_branch(msm_dp_panel->dpcd)) {
+	rc = drm_dp_read_desc(panel->aux, &desc, drm_dp_is_branch(msm_dp_panel->dpcd));
+	if (rc)
+		return rc;
+
+	panel->link->has_sink_count =
+		drm_dp_read_sink_count_cap(connector, msm_dp_panel->dpcd, &desc);
+
+	if (panel->link->has_sink_count) {
 		count = drm_dp_read_sink_count(panel->aux);
-		if (!count) {
-			panel->link->sink_count = 0;
-			return -ENOTCONN;
+		if (count <= 0) {
+			msm_dp_link_set_sink_count(panel->link, 0);
+			return count < 0 ? count : -ENOTCONN;
 		}
+		msm_dp_link_set_sink_count(panel->link, count);
+	} else {
+		msm_dp_link_set_sink_count(panel->link, 1);
 	}
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
-- 
2.25.1

