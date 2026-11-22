Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335527;
	b=mO+rxzz0XeQz4hMGATbgLtn6D17YV6hAOj1BtQvcCBkkjTN+4LUW+SWW85DmD81OZQ4w
	 hl6o3CRHnxoNbML9wo6apYxyo74KVTQ9af9QjsW+iRdurrTa8T2DAIgb0L8OCZG03ebUy
	 Fu4PYwdGQTQ+rH52NsP9pVkA7i89mJgn810VgL6861Z16q6evF3gHKwzNH0ZekvKp//aY
	 WbDwghFA1t297d6TyyicQIEPwyuGMnCbIcBYOhZnMV/8jvXt/0WV601Lsedc2sZoOqzOT
	 HEElYg8DzY/zB2LQa5bEAVoJBBXgDgnBNhdDiZwJbxpMDEkiaTkAA4gWhkAHafX7CXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JbXjqMfnvt4YseLHRKZimZ/QrsGIK2yqJbgIKnZOfks=;
	b=KjUjX+cAAeMiHztVnRsc+sRBf4w2XoF7+kv2Fs/vP9DvAOh5PTtzM/6eNY3MDxDwkb2e
	 Ob/roJpW+6o/myk90tdf3kkA3Qe0TA0DfKrEA0yZeAoL3K56llFZWZb/qpO/egcU/p9H5
	 QjnAqm/4HjAxbciLFs7suhsFucnNwWA2XHtr7mHLCZOJjkahNcWfqwcZ90GAX726zay3m
	 s7Gcn5QeyZ6YR0wSEaMhcyQ/SRnPmfW+Jo5p9cm6yslTfe+iiT3IufZ9TzoQ80eNDPQCw
	 m1/aJvHAEgLx4Qz1iyuqJ2R36SPGB9l0Gg925F62z6AEzyAaabU/Uw9Ay7LIt2oX9oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCwcJTrv;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D36606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D36606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCwcJTrv
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso2647790a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335526; x=1795940326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbXjqMfnvt4YseLHRKZimZ/QrsGIK2yqJbgIKnZOfks=;
        b=TCwcJTrvH8ER+Hj9H6iA4IasGf/NpB/Q5n7Dzzv0fA+hi2E0zTz/9yvZ7Pl6vScSjq
         akgBguBRJ/ziNXNkHMZWeTUppoxwX15C6E2NLBKfC+lu9sSsv8pVhTzIzc2xUN5PsXi0
         Bvid60IATLP5cyNb8A0fXc2n2lUYcvo+kj8+toPKaRuu1b/KyDG4+NDJHPhAUissZZVF
         gJuvf8hmY8UdEBdh84LO4is1NzQjsldbivjP4tWuSMmq9S9wvaMpxCIWmniroggzOIis
         /C4/FSpl9/llRAdjVsdZ3oJ817EcCCTRiOkDfONM2Xu60cN+j+s7cddzG4z3yyC02Z/w
         gDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335526; x=1795940326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbXjqMfnvt4YseLHRKZimZ/QrsGIK2yqJbgIKnZOfks=;
        b=r+Dyp6G+kNa2zaizg6W+kkmQNi7tVe0njMB6raQbeviEa43/e+0NmEdQzblRfjGvHx
         JeYNG5sfObzOcHUdLwqsIvSoQmgSrUEMkONH/vUnLEuyPnKNj+LhJb/ERMVWLOEOaE2m
         DJEok59srE6G77bJZNMUS0rb6vtLgkxCchn4cRl/b6vNodQ7Xx7WFtpzPsto2cW/71Q1
         HqQ+AdorzBCIwc85lmsdfesNKWGFuAJ/VvSMFnedK5/YhqUoO7IOPY1YXWuRAFJM0bjf
         75s4zYmKWim8woRiYLb+/XiAmRj9JvKGkrkCLIAKWDSusU4jTprG4BM/jcuXnLuD2kZ9
         q/LQ==
X-Forwarded-Encrypted: i=1; AL+hErHn/6uoeu+29JdZJJVjIAIVm1phlcaCpWNS46eVHNid9hSWAxZpDtiUWx6K4bsMtyTQFcPGK9sEJl5QoiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4ZbK2F/lNfCrGzZ0ldvVLz2DRgti6jwXS+HN1ncSHu/wyrXHr
	AVQvR/yxj9msOYY+54jgHq2xsERPb4LgkLFCO7unH9F2LCuCwaS0+Arp
X-Gm-Gg: AZFdTZeoVcu+pxvh5w+S6uJzxh9Ds9yxzC5IX2RgnsLfELWimMS01kp+ZRdxPETo+/e
	ztlNYTNwgWtzYJXu2Ml9P25JpgP/rdne1UdkXq17kfpBx2Vp2N1p+2S7F7WHDs8pRofif6kfv/5
	gtgJhE3w4ehsEQFGZP2Od5C0FJuIQ3ttg2ut8R7G393ACoXGhxKpZ8BfDKfmxwG/eJPpmUM4CsX
	MFEbzWCI3nWUO1OXltxBEjfgClLLFrSQ8rm/nWtBA9fJo2iKpiOp+aX0ZL3soafqaX6hr+blJb4
	PII/OZLen/HMfbmJ0jedbaQvXZ3KhmElvvVX3p8qoIbkg8mukhVTRWmZNCi51LCyJkxfHrZfAYZ
	JgUoJlcbwz+Igp1wcDSjbJwd9r/Ph/1+DdzrjlYuwm/ctbUOAM0tCQrlxteUSdCdaC1jfCrcTxR
	jAW2Nta/Ym7GTPuS+D2tgXj4zpGi2VqrZ4SklMZH+pZjLCVqOO5dOAh7+eHmmM7Xrr1MbHjPlSw
	YbmMPjCdjVPExvRvxy6HsM5eCVGLz9rbr30aT0MhKL0u2K7Fewrrx3v5sp6vwVHCMHt+YZBxs0y
	ggZOnNlF3XTw3AHnGcKPG2saISgtAe5tMyrQq3CxFMo9XDo8Me/exf8ICN+Lrgj4/vdpsXvWXIW
	ct4eBvguysg==
X-Received: by 2002:aa7:d842:0:b0:6b6:e808:9703 with SMTP id 4fb4d7f45d1cf-6ba37c774camr4105257a12.4.1795335525661;
        Sun, 22 Nov 2026 00:18:45 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert to mipi_dbi_write_seq_multi()
Date: Sun, 22 Nov 2026 10:18:11 +0200
Message-ID: <20261122081820.53199-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Switch from the internal panel command-sending macro to a generic one
to improve code reuse.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 213 +++++++++---------
 1 file changed, 101 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 318ece68b7806..c5b59a7341d8e 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -37,19 +37,6 @@ static inline struct hitachi_tx10d07vm0baa *to_hitachi_tx10d07vm0baa(struct drm_
 	return container_of(panel, struct hitachi_tx10d07vm0baa, panel);
 }
 
-#define panel_dbi_command(priv, cmd, seq...) \
-({ \
-	const u8 d[] = { seq }; \
-	struct drm_panel *panel = &(priv)->panel; \
-	struct mipi_dbi_device *dbidev = (priv)->dbidev; \
-	struct device *dev = panel->dev; \
-	int ret; \
-	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
-	if (ret) \
-		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
-	ret; \
-})
-
 static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
@@ -76,118 +63,120 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
-	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
-			  0x00, 0x00);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
-	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
-	panel_dbi_command(priv, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
-
-	panel_dbi_command(priv, 0x71, 0x00);		/* Ex_Vsync_en */
-
-	panel_dbi_command(priv, 0xb2, 0x00);		/* VCSEL */
-	panel_dbi_command(priv, 0xb4, 0xaa);		/* setvgmpm */
-	panel_dbi_command(priv, 0xb5, 0x33);		/* rbias1 */
-	panel_dbi_command(priv, 0xb6, 0x03);		/* rbias2 */
-
-	panel_dbi_command(priv, 0xb7, 0x1a, 0x33, 0x03, 0x03,
-			  0x03, 0x00, 0x00, 0x01, 0x02, 0x00,
-			  0x00, 0x04, 0x00, 0x01, 0x01, 0x01);	/* set_ddvdhp */
-	panel_dbi_command(priv, 0xb8, 0x1c, 0x53, 0x03, 0x03,
-			  0x00, 0x01, 0x02, 0x00, 0x00, 0x04,
-			  0x00, 0x01, 0x01);			/* set_ddvdhm */
-
-	panel_dbi_command(priv, 0xb9, 0x0a, 0x01, 0x01, 0x00,
-			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgh */
-	panel_dbi_command(priv, 0xba, 0x0f, 0x01, 0x01, 0x00,
-			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgl */
-	panel_dbi_command(priv, 0xbb, 0x00, 0x00, 0x00, 0x00,
-			  0x01, 0x02, 0x01);			/* set_vcl */
-
-	panel_dbi_command(priv, 0xc1, 0x01);		/* number of lines */
-	panel_dbi_command(priv, 0xc2, 0x08);		/* number of fp lines */
-	panel_dbi_command(priv, 0xc3, 0x04);		/* gateset(1) */
-	panel_dbi_command(priv, 0xc4, 0x4c);		/* 1h period */
-	panel_dbi_command(priv, 0xc5, 0x03);		/* source precharge */
-	panel_dbi_command(priv, 0xc6, 0xc4, 0x04);	/* source precharge timing */
-	panel_dbi_command(priv, 0xc7, 0x00);		/* source level */
-	panel_dbi_command(priv, 0xc8, 0x02);		/* number of bp lines */
-	panel_dbi_command(priv, 0xc9, 0x10);		/* gateset(2) */
-	panel_dbi_command(priv, 0xca, 0x04, 0x04);	/* gateset(3) */
-	panel_dbi_command(priv, 0xcb, 0x03);		/* gateset(4) */
-	panel_dbi_command(priv, 0xcc, 0x12);		/* gateset(5) */
-	panel_dbi_command(priv, 0xcd, 0x12);		/* gateset(6) */
-	panel_dbi_command(priv, 0xce, 0x30);		/* gateset(7) */
-	panel_dbi_command(priv, 0xcf, 0x30);		/* gateset(8) */
-	panel_dbi_command(priv, 0xd0, 0x40);		/* gateset(9) */
-	panel_dbi_command(priv, 0xd1, 0x22);		/* flhw */
-	panel_dbi_command(priv, 0xd2, 0x22);		/* vckhw */
-	panel_dbi_command(priv, 0xd3, 0x04);		/* flt */
-	panel_dbi_command(priv, 0xd4, 0x14);		/* tctrl */
-	panel_dbi_command(priv, 0xd6, 0x02);		/* dotinv */
-	panel_dbi_command(priv, 0xd7, 0x00);		/* on/off sequence period */
-
-	panel_dbi_command(priv, 0xd8, 0x01, 0x05, 0x06, 0x0d,
-			  0x18, 0x09, 0x22, 0x23, 0x00);		/* ponseqa */
-	panel_dbi_command(priv, 0xd9, 0x24, 0x01);			/* ponseqb */
-	panel_dbi_command(priv, 0xde, 0x09, 0x0f, 0x21, 0x12,
-			  0x04);					/* ponseqc */
-
-	panel_dbi_command(priv, 0xdf, 0x02, 0x06, 0x06, 0x06,
-			  0x06, 0x00);					/* pofseqa */
-	panel_dbi_command(priv, 0xe0, 0x01);				/* pofseqb */
-
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
-	panel_dbi_command(priv, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
-
-	panel_dbi_command(priv, 0xe2, 0x00, 0x00);		/* cabc pwm */
-	panel_dbi_command(priv, 0xe3, 0x03);			/* cabc */
-	panel_dbi_command(priv, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
-			  0xbb, 0xc7, 0xe1, 0xe5);		/* cabc brightness */
-	panel_dbi_command(priv, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
-			  0xd1, 0xe1, 0xf1, 0xfe);		/* cabc brightness */
-	panel_dbi_command(priv, 0xe7, 0x2a);			/* cabc */
-	panel_dbi_command(priv, 0xe8, 0x00);			/* brt_rev */
-	panel_dbi_command(priv, 0xe9, 0x00);			/* tefreq */
-
-	panel_dbi_command(priv, 0xea, 0x01);			/* high speed ram */
-
-	panel_dbi_command(priv, 0xeb, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r pos */
-	panel_dbi_command(priv, 0xec, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r neg */
-	panel_dbi_command(priv, 0xed, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g pos */
-	panel_dbi_command(priv, 0xee, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g neg */
-	panel_dbi_command(priv, 0xef, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b pos */
-	panel_dbi_command(priv, 0xf0, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b neg */
-
-	panel_dbi_command(priv, MIPI_DCS_EXIT_SLEEP_MODE);
+	struct mipi_dbi_multi_context ctx = { .dbidev = priv->dbidev };
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
+				 0x00, 0x00);
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
+
+	mipi_dbi_write_seq_multi(&ctx, 0x71, 0x00);		/* Ex_Vsync_en */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xb2, 0x00);		/* VCSEL */
+	mipi_dbi_write_seq_multi(&ctx, 0xb4, 0xaa);		/* setvgmpm */
+	mipi_dbi_write_seq_multi(&ctx, 0xb5, 0x33);		/* rbias1 */
+	mipi_dbi_write_seq_multi(&ctx, 0xb6, 0x03);		/* rbias2 */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xb7, 0x1a, 0x33, 0x03, 0x03,
+				 0x03, 0x00, 0x00, 0x01, 0x02, 0x00,
+				 0x00, 0x04, 0x00, 0x01, 0x01, 0x01);	/* set_ddvdhp */
+	mipi_dbi_write_seq_multi(&ctx, 0xb8, 0x1c, 0x53, 0x03, 0x03,
+				 0x00, 0x01, 0x02, 0x00, 0x00, 0x04,
+				 0x00, 0x01, 0x01);			/* set_ddvdhm */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xb9, 0x0a, 0x01, 0x01, 0x00,
+				 0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgh */
+	mipi_dbi_write_seq_multi(&ctx, 0xba, 0x0f, 0x01, 0x01, 0x00,
+				 0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgl */
+	mipi_dbi_write_seq_multi(&ctx, 0xbb, 0x00, 0x00, 0x00, 0x00,
+				 0x01, 0x02, 0x01);			/* set_vcl */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xc1, 0x01);		/* number of lines */
+	mipi_dbi_write_seq_multi(&ctx, 0xc2, 0x08);		/* number of fp lines */
+	mipi_dbi_write_seq_multi(&ctx, 0xc3, 0x04);		/* gateset(1) */
+	mipi_dbi_write_seq_multi(&ctx, 0xc4, 0x4c);		/* 1h period */
+	mipi_dbi_write_seq_multi(&ctx, 0xc5, 0x03);		/* source precharge */
+	mipi_dbi_write_seq_multi(&ctx, 0xc6, 0xc4, 0x04);	/* source precharge timing */
+	mipi_dbi_write_seq_multi(&ctx, 0xc7, 0x00);		/* source level */
+	mipi_dbi_write_seq_multi(&ctx, 0xc8, 0x02);		/* number of bp lines */
+	mipi_dbi_write_seq_multi(&ctx, 0xc9, 0x10);		/* gateset(2) */
+	mipi_dbi_write_seq_multi(&ctx, 0xca, 0x04, 0x04);	/* gateset(3) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcb, 0x03);		/* gateset(4) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcc, 0x12);		/* gateset(5) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcd, 0x12);		/* gateset(6) */
+	mipi_dbi_write_seq_multi(&ctx, 0xce, 0x30);		/* gateset(7) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcf, 0x30);		/* gateset(8) */
+	mipi_dbi_write_seq_multi(&ctx, 0xd0, 0x40);		/* gateset(9) */
+	mipi_dbi_write_seq_multi(&ctx, 0xd1, 0x22);		/* flhw */
+	mipi_dbi_write_seq_multi(&ctx, 0xd2, 0x22);		/* vckhw */
+	mipi_dbi_write_seq_multi(&ctx, 0xd3, 0x04);		/* flt */
+	mipi_dbi_write_seq_multi(&ctx, 0xd4, 0x14);		/* tctrl */
+	mipi_dbi_write_seq_multi(&ctx, 0xd6, 0x02);		/* dotinv */
+	mipi_dbi_write_seq_multi(&ctx, 0xd7, 0x00);		/* on/off sequence period */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xd8, 0x01, 0x05, 0x06, 0x0d,
+				 0x18, 0x09, 0x22, 0x23, 0x00);		/* ponseqa */
+	mipi_dbi_write_seq_multi(&ctx, 0xd9, 0x24, 0x01);		/* ponseqb */
+	mipi_dbi_write_seq_multi(&ctx, 0xde, 0x09, 0x0f, 0x21, 0x12,
+				 0x04);					/* ponseqc */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xdf, 0x02, 0x06, 0x06, 0x06,
+				 0x06, 0x00);					/* pofseqa */
+	mipi_dbi_write_seq_multi(&ctx, 0xe0, 0x01);				/* pofseqb */
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
+
+	mipi_dbi_write_seq_multi(&ctx, 0xe2, 0x00, 0x00);		/* cabc pwm */
+	mipi_dbi_write_seq_multi(&ctx, 0xe3, 0x03);			/* cabc */
+	mipi_dbi_write_seq_multi(&ctx, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
+				 0xbb, 0xc7, 0xe1, 0xe5);		/* cabc brightness */
+	mipi_dbi_write_seq_multi(&ctx, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
+				 0xd1, 0xe1, 0xf1, 0xfe);		/* cabc brightness */
+	mipi_dbi_write_seq_multi(&ctx, 0xe7, 0x2a);			/* cabc */
+	mipi_dbi_write_seq_multi(&ctx, 0xe8, 0x00);			/* brt_rev */
+	mipi_dbi_write_seq_multi(&ctx, 0xe9, 0x00);			/* tefreq */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xea, 0x01);			/* high speed ram */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xeb, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r pos */
+	mipi_dbi_write_seq_multi(&ctx, 0xec, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r neg */
+	mipi_dbi_write_seq_multi(&ctx, 0xed, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g pos */
+	mipi_dbi_write_seq_multi(&ctx, 0xee, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g neg */
+	mipi_dbi_write_seq_multi(&ctx, 0xef, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b pos */
+	mipi_dbi_write_seq_multi(&ctx, 0xf0, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b neg */
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(110);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_ON);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_ON);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
+	struct mipi_dbi_multi_context ctx = { .dbidev = priv->dbidev };
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_OFF);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_OFF);
 	msleep(35);
 
-	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(50);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
-- 
2.53.0

