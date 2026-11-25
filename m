Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605995;
	b=bg5EgSHU4201QoivM8JJCpq6sOsMsE+lMB2MXuK67xVTH8et/MjD5XfgLv0Kvb2w51y6
	 lD0VUjs0VFrEPjhFmlrs0A5UwJu2eChdtlIvKWczMCduGOmmbq2hHYi/leasq2cz+JAAZ
	 J1Bq7GwxVb6v1qBJzXHISmzosiTRZFsAroq28Q2tK0n3WwTBqPWc6Z4M47cBkBT/Thk67
	 wPTrIz4rTBTLWRqiJ7Ptj7HzHUaON0Tvr1mK1V7mAJt8ZbQAX02vLFu9dc7E8VZkNzFMa
	 XQ9rpPDGPD/Sf/lJor030Vr5pkznJEP41SsDztrgEp9X+DAZKIVxmieOoSxUwM+ziDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DajO//3VjDJDVFEXWo0EyF15if7O9RtU+D4ToQxNblo=;
	b=LonseWvB7BaGPaB/Z54y4rphIFmJb0+SUesMHve/2c9XG28HJH8Oy0bATGKOYDxdIJHr
	 vDmp9r4xGA53+KXfjwVpSN5uQh63VDQV+Ah0fy/IIH8uRcCVzylZHc22xXtbl7L1Isu6U
	 dniMfrAplp9Mc54N+3+YuM/1kKPfIUj9DbtckSv+nnndRAD4smKoR2yutPIhs7H8DjJUx
	 fW9biYedH0sj6hL3Ruek8i2yAtOzHo0Ej5NApwI+0tsRx7OUV4UKvzOBKQLOeUTmF1uE1
	 og32jzdmBuv5afvIuKUCBZQKpL2pWReDtIMCF4Y/CmGwlMP7ZQpHi3GrKyxWeOx+myQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpfPdxUn;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD94E60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD94E60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpfPdxUn
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso7290629a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605993; x=1796210793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DajO//3VjDJDVFEXWo0EyF15if7O9RtU+D4ToQxNblo=;
        b=FpfPdxUndp6LYzBUAXhChQ3fu84rzC06Phfrk4M/kvD75Bw0tRi4YCpquSrcBlx07V
         sH1P+a+oNyQb2WvPAgh23BSY3urYpz27sY4qn1qSG/PrPbWJ0gyQ4g5JOfjw0B9CSJXl
         /Ctu+ievZ3Voei7ktqLGs0sDlskrjWiUHUILJ3oON4XDMxt0mhtmP9bVOEB0y3ozHaMV
         L7YBT3UeZyinIYCox7P2JXbEFAf0DHAGk2sT7GH9WDiJAAn40T2XpaOMwnGPhLAp+fGm
         EX2+G92RGeQEeZ5TZvNrtRpRHF8DQjYeDYZZA6hw+icH9Wu4ii/mWP/86w3YhbOBPtfs
         2ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605993; x=1796210793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DajO//3VjDJDVFEXWo0EyF15if7O9RtU+D4ToQxNblo=;
        b=yDHckYiUIag+TNUctiVYCYYacXa5UGAZkKmATpBvUGijKCzrWtT2MatdG39devmAu+
         RuQ0KWghu/Sr1g1/LG9CPD+Hn26QFOOGSSC03JCWhnRXQRX30lSwWq5EBoiEuD+0a16Z
         v1PMDFlB519ae5DkdIWoMfT6N2QTPWFSuGu6A3Fr9fQJjlNuG/FHPUvLp7ZFc4xoeTj8
         BL15gs2B9p7axdg4PEekaS82N2rp+Bn/B0XMdoJD5W8YmQ/IbCxSAB+6Jw/bM/5eeMav
         a0dLvq7eEM01xsJyHJ9BClVCdaMBuFw/RGl+LHgMc/SzT70qSlrztKZorcbwgCtQAHgR
         ZaxQ==
X-Forwarded-Encrypted: i=1; AL+hErGUNQT/jkWtvwy72tCpe1Jx8wIifCWGCp8JzXT4qhQziomeB8W3B8Lyy0Cz7nPTtbZFd+3iIURxO/Xoj3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cWXDyoHP0EsoF+Aqd4DPJ7dJvERytDYFr4GCrQtUnW6JeIXGA
	K/EAzgwnI+eYIdoDWobYWXbBQ8OIFMGC8U72zaeGlnP1dMQnzcdGjaay
X-Gm-Gg: AZFdTZeGpfkO8YX2Ur0Ef303/rEOyKpobFFJOzeLtsB5RWX5IaNhWB+bEaSeRCDc9xY
	iaVCwFwHPnYhwZZws+ZVDmrW/ZmvQtJhjPFB7xIGvxnMnKbx1B8PzL4H5rWH8PIX+5Hrw+Ba9B6
	WTYxRMZyD+z38GNvNaAOdeCmBV01NExgQb2bbdRrPUtVPr4QzjvXHrdfycjDGYJb4ZzLYR7pn30
	gZHXnRPLNVqdvOm1n8qdc1ZfsXW9gQYk+KhOiKk1YWrMdBYe7ZNyMGEs+VZhHpx5mO+413IPz3g
	2ynbrdk7+YdCwwWnrSFGnE0vGlapEj3jEAGeihh7yJkMwANB15jQktTgmskX6efnDRBSakhAsTr
	92Q+FXXyUHdcH5Lf9abBQRJCQfDVRSX3eUVlgZnRsuKyOf3U8Z+kKvbb5nhDXoV1Eyat6yeX6FO
	UvlaQGrfRKt95htDzXEAJeawgCIDtwKzQ3H/izxqsfVcRnciXLgYJ2YYkLLRnK24kMDb0bzEY4q
	uvxjeknDYtnRgCWGjCRgg6Yuvf3zGOHxESj37RDB43nljkjCDyD7ArcHiVI+w+iokuEPeFqzbLV
	VnnRJeIvQfxhc3huMiyLgFEbu7MSINVNYUOTsUxQZk/b0zRe0suvhEAMrer1H11Taha9pTnct++
	KYiqq2V90yA==
X-Received: by 2002:a05:6402:5516:b0:6ba:85f6:9b4b with SMTP id 4fb4d7f45d1cf-6ba85f69da8mr8715017a12.41.1795605993067;
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 3/7] media: tegra-video: Move Tegra210-specific functions from common CSI
Date: Wed, 25 Nov 2026 13:26:09 +0200
Message-ID: <20261125112613.237333-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Move and staticize the tegra_csi_error_recover() and
tegra_csi_calc_settle_time() helpers from the common CSI file into the
Tegra210-specific code, since they are used exclusively by the HW rev. 3
Video Input found in Tegra210.

The tegra_csi_calc_settle_time() helper uses a custom MHZ definition
which corresponds to the standard HZ_PER_MHZ. The custom MHZ macro is
replaced by HZ_PER_MHZ, with this change folded into this commit.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 72 -------------------
 .../media/platform/nvidia/tegra-video/csi.h   |  5 --
 .../platform/nvidia/tegra-video/tegra210.c    | 70 ++++++++++++++++++
 3 files changed, 70 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index aaab884d99f54..fb4b4c0c7cfcd 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -19,8 +19,6 @@
 #include "csi.h"
 #include "video.h"
 
-#define MHZ			1000000
-
 /*
  * Test pattern generator configuration
  */
@@ -263,65 +261,6 @@ static int tegra_csi_tpg_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
-{
-	struct v4l2_subdev *subdev = &csi_chan->subdev;
-	struct v4l2_subdev *src_subdev;
-	struct v4l2_ctrl *ctrl;
-	struct media_pad *pad;
-
-	pad = media_entity_remote_source_pad_unique(&subdev->entity);
-	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-		dev_err_probe(csi_chan->csi->dev, -ENODEV,
-			      "failed to get source entity\n");
-
-	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
-	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (ctrl)
-		return v4l2_ctrl_g_ctrl_int64(ctrl);
-
-	return 0;
-}
-
-void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
-				u8 csi_port_num,
-				u8 *clk_settle_time,
-				u8 *ths_settle_time)
-{
-	struct tegra_csi *csi = csi_chan->csi;
-	unsigned int cil_clk_mhz;
-	unsigned int pix_clk_mhz;
-	int clk_idx = (csi_port_num >> 1) + 1;
-
-	cil_clk_mhz = clk_get_rate(csi->clks[clk_idx].clk) / MHZ;
-	pix_clk_mhz = csi_get_pixel_rate(csi_chan) / MHZ;
-
-	/*
-	 * CLK Settle time is the interval during which HS receiver should
-	 * ignore any clock lane HS transitions, starting from the beginning
-	 * of T-CLK-PREPARE.
-	 * Per DPHY specification, T-CLK-SETTLE should be between 95ns ~ 300ns
-	 *
-	 * 95ns < (clk-settle-programmed + 7) * lp clk period < 300ns
-	 * midpoint = 197.5 ns
-	 */
-	*clk_settle_time = ((95 + 300) * cil_clk_mhz - 14000) / 2000;
-
-	/*
-	 * THS Settle time is the interval during which HS receiver should
-	 * ignore any data lane HS transitions, starting from the beginning
-	 * of THS-PREPARE.
-	 *
-	 * Per DPHY specification, T-HS-SETTLE should be between 85ns + 6UI
-	 * and 145ns+10UI.
-	 * 85ns + 6UI < (Ths-settle-prog + 5) * lp_clk_period < 145ns + 10UI
-	 * midpoint = 115ns + 8UI
-	 */
-	if (pix_clk_mhz)
-		*ths_settle_time = (115 * cil_clk_mhz + 8000 * cil_clk_mhz
-				   / (2 * pix_clk_mhz) - 5000) / 1000;
-}
-
 /*
  * Proper CSI configuration
  */
@@ -867,17 +806,6 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	return 0;
 }
 
-void tegra_csi_error_recover(struct v4l2_subdev *sd)
-{
-	struct tegra_csi_channel *csi_chan = to_csi_chan(sd);
-	struct tegra_csi *csi = csi_chan->csi;
-
-	/* stop streaming during error recovery */
-	csi->ops->csi_stop_streaming(csi_chan);
-	csi->ops->csi_err_recover(csi_chan);
-	csi->ops->csi_start_streaming(csi_chan);
-}
-
 static int tegra_csi_channels_init(struct tegra_csi *csi)
 {
 	struct tegra_csi_channel *chan;
diff --git a/drivers/media/platform/nvidia/tegra-video/csi.h b/drivers/media/platform/nvidia/tegra-video/csi.h
index 25aff2581f069..addd1b82685e9 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.h
+++ b/drivers/media/platform/nvidia/tegra-video/csi.h
@@ -175,9 +175,4 @@ static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct tegra_csi_channel, subdev);
 }
 
-void tegra_csi_error_recover(struct v4l2_subdev *subdev);
-void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
-				u8 csi_port_num,
-				u8 *clk_settle_time,
-				u8 *ths_settle_time);
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
index 90d984790696f..474f906e8bcc6 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra210.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra210.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/kthread.h>
+#include <linux/units.h>
 
 #include "csi.h"
 #include "vi.h"
@@ -334,6 +335,17 @@ static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan,
 	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
 }
 
+static void tegra_csi_error_recover(struct v4l2_subdev *sd)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(sd);
+	struct tegra_csi *csi = csi_chan->csi;
+
+	/* stop streaming during error recovery */
+	csi->ops->csi_stop_streaming(csi_chan);
+	csi->ops->csi_err_recover(csi_chan);
+	csi->ops->csi_start_streaming(csi_chan);
+}
+
 static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan,
 						u8 portno)
 {
@@ -979,6 +991,64 @@ static void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
 		tegra210_csi_port_recover(csi_chan, portnos[i]);
 }
 
+static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
+{
+	struct v4l2_subdev *subdev = &csi_chan->subdev;
+	struct v4l2_subdev *src_subdev;
+	struct v4l2_ctrl *ctrl;
+	struct media_pad *pad;
+
+	pad = media_entity_remote_source_pad_unique(&subdev->entity);
+	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+		dev_err_probe(csi_chan->csi->dev, -ENODEV,
+			      "failed to get source entity\n");
+
+	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
+	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (ctrl)
+		return v4l2_ctrl_g_ctrl_int64(ctrl);
+
+	return 0;
+}
+
+static void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
+				       u8 csi_port_num, u8 *clk_settle_time,
+				       u8 *ths_settle_time)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int cil_clk_mhz;
+	unsigned int pix_clk_mhz;
+	int clk_idx = (csi_port_num >> 1) + 1;
+
+	cil_clk_mhz = clk_get_rate(csi->clks[clk_idx].clk) / HZ_PER_MHZ;
+	pix_clk_mhz = csi_get_pixel_rate(csi_chan) / HZ_PER_MHZ;
+
+	/*
+	 * CLK Settle time is the interval during which HS receiver should
+	 * ignore any clock lane HS transitions, starting from the beginning
+	 * of T-CLK-PREPARE.
+	 * Per DPHY specification, T-CLK-SETTLE should be between 95ns ~ 300ns
+	 *
+	 * 95ns < (clk-settle-programmed + 7) * lp clk period < 300ns
+	 * midpoint = 197.5 ns
+	 */
+	*clk_settle_time = ((95 + 300) * cil_clk_mhz - 14000) / 2000;
+
+	/*
+	 * THS Settle time is the interval during which HS receiver should
+	 * ignore any data lane HS transitions, starting from the beginning
+	 * of THS-PREPARE.
+	 *
+	 * Per DPHY specification, T-HS-SETTLE should be between 85ns + 6UI
+	 * and 145ns+10UI.
+	 * 85ns + 6UI < (Ths-settle-prog + 5) * lp_clk_period < 145ns + 10UI
+	 * midpoint = 115ns + 8UI
+	 */
+	if (pix_clk_mhz)
+		*ths_settle_time = (115 * cil_clk_mhz + 8000 * cil_clk_mhz
+				   / (2 * pix_clk_mhz) - 5000) / 1000;
+}
+
 static int
 tegra210_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
 				  u8 portno)
-- 
2.53.0

