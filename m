Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281038;
	b=tSc1yaWWAxTa5n+PTYGo9GYNyNmrXbgvTSuESRSuY2UsnfBGM/RLCi7Yj5uztxf4+Rbx
	 G4Fmbl+3WjbAUS73XqtHGLPFCWkHb+Z1IWADhivGTe1oxkzFWVfHvXdjogat0wjhQ2ssZ
	 UVFDCmcVvxtqtctPpIpeFL5G5ei3LEogmrY7yWAHGVTGJCVK72MIcd+LhA8qqq5wj5eaJ
	 iThcwsn0jo7kaAkIVxRZ7bxSeLvpUi+poJJp8LSE99AF5Dqu6IG04A4ZmBUnodx6LZXGw
	 wCzRG0V4g0GdQy64/JwwzMrRSVcUHgzVYAuhGdkAkbMD5+vONqF7pwH7bzIVMAnMB1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281038;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LrUW/HVyUin0TofWGwTk9dRHQBiji2IVRbA5AhcMZX8=;
	b=yGsL2WcJsaLsm6cXBxINxzrjb/FYHqY1xSqK4wYljcQVEhhrSygleyG7sUrFAPV90HsW
	 UjIs5HH25aQYrVe78rT8EqOzUjxg5b+tTMHVwf0h2qXNHpLGtqqLEvv/M2iazVOj/dDwW
	 qxf2/IFAXwEPgiVgiwdZ+1P6i+BF2LAMvHriBDjh6hrn+F5E7cgyujg3grKw2cf0HvYGF
	 ngfr5ohekYAkiRHjpdDpH/Mh+F5VUUuTTXjhGevm8SEpW8272LoXsTNw0FvcNtCo5Hz/V
	 Os6Oo8FpOpv4e5W+8q7m/YnhLXQFFkdW37qySb6ylew8zx+GwoV4V1Ph7U874sxj7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=x5BRC18z;
	arc=none smtp.remote-ip=203.205.221.209
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D1606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=x5BRC18z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795281027; bh=LrUW/HVyUin0TofWGwTk9dRHQBiji2IVRbA5AhcMZX8=;
	h=From:To:Cc:Subject:Date;
	b=x5BRC18z9pl/WBB4DWairDyF55ypRyVNU8x7r6E3W2Ueh7iGwvgYRgHVqboa4fjGp
	 EWjP8WoV/EqklY9NUcqWyOC/FQrvpFNV3KQzokJKtCYtf7xK5Jc4ftNc9KRP8lwPoM
	 YPn6QsW9SgbFSzaZc23SsOvvYDbEo75GElzGwBLI=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 29831E76; Sun, 22 Nov 2026 01:10:24 +0800
X-QQ-mid: xmsmtpt1795281024tfj1gwz0l
Message-ID: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJcREJkrvuUFBXNINloNXIHma/buZUhOS7t6fyIaZeXo2vAaT2c2
	 4UFFx4v9cpXIbPv3LG8FQctTkaEh2zJb3NVFAQvxlROJTJ9fnnrO3h+7K6zsPMvr6wu2NoO+i6vr
	 o4p/gsxdPEljwd/ZgKEWP2o6ARkNs6+6vVZbfsc7XWXFVczHug7C1fG5udlAEFp/KBowvqwx+9+3
	 yOKlisvYiQCKlaCROqK2e4lw4YVWy5eWLgSPr4Eahc/f4A9rejAhuHMHUV6DrCgDczx9fiIi98jg
	 eFS7Ae1SNvG79e/u4Iwpyrm8l3D8ShSLwuNGh2nDUcfnc8krCE62EzsqzfGegH7fnIbXWSKVS2vC
	 zH/cJBZMqtss2TL4Sa0THtdRgo4lFRJy93MKoOQuck1dE8DRhrpJvpjZ0aMAYPa2CYBSsN2RhFYV
	 NP6mxDVQRftjDd1FFKGJElG2vM7BY3rDm9FuNWcs3Wp/nXXCQbOAFOz5FIAntzDdrFOYc+YXpY6h
	 R+B5/dppM0BEy2zWYq6BcGipSLhJcOn0fwSszDi/7CRLuWGVuWfqYEL0Bt2gSk0On14wyPQB/VND
	 HFsfS5R1noNgAZFC/p3ovTorF/9F6l3e6Ifgm5udgtOmKYbX9orSf+CGNgCFDsqiUiQ0EqqGloSr
	 ci2Id63POkG6UUYqXFThgbuaeHwKPbJ0AH0B9qm9m2/ZlKFts6Ii3i1bSgPP86U9oY4wHE7Dj4iY
	 HUI09chVrU3jHOPfzd0FOjRG0G71sEkmER5WH2BBTVf4u7RRzxAuoXkHW2YbFxnUT3iT6LClagR2
	 e+wyYS908X07mKddcSLN8jdQqPejuSK3QdFtuT+36PGDlY1ws1toAmfQmL3+A8X/sz1OWewc6l6I
	 5j45/XxMhhlScaXQsftXbe3xtUg1xgw2XQIi646leL7DeAuKuwuO80GvIIlsiVNMAs5yu9sqMuPS
	 SplL0KCsoJVT4aMqyLXYKjVnJoDHGiEjMRe1w0D8k2rNmz+RQBfETi2G0+7QNr5weRpQB8z51bDc
	 9vGBkjqmXmeE88G/5xdqKgY2/KhCUfeAC7BCXll9ajhV/JA2ScoH6ou7V9Y9P00AzcbSrMF2cs/r
	 +A1b6QZK+ff0J5hs0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: ZhuXiangyu <1194781887@qq.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH v2] drm/rockchip: dsi: enable RK3506 PHY data lanes in GRF
Date: Sun, 22 Nov 2026 01:10:22 +0800
X-OQ-MSGID: <20261121171022.1702714-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
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

rk3506_chip_data currently only clears the turnaround, force-rx, and
force-tx-stop fields in RK3506_SYS_GRF_SOC_CON6. As a result, the DSI
PHY data lanes remain disabled unless the bootloader happens to enable
them.

Set RK3506_DSI_PHY_ENABLE_LANE0 and RK3506_DSI_PHY_ENABLE_LANE1 in
lanecfg1 so the data lanes are reliably enabled by the driver.

Tested on an RK3506B board: the panel receives the low-power init
sequence and the framebuffer console displays properly.

Fixes: cabeacc7eadc ("drm/rockchip: dsi: Add support for rk3506")
Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
Changes in v2:
- Split out from the combined drm/phy patch into a standalone drm
  subsystem patch per Heiko's review.
- Limit recipients to drm and Rockchip maintainers/lists.
- Fix Signed-off-by author name formatting.

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 30d6f83c..116cc140 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -199,6 +199,8 @@
 
 #define RK3506_SYS_GRF_SOC_CON6		0x0018
 #define RK3506_DSI_FORCETXSTOPMODE	(0xf << 4)
+#define RK3506_DSI_PHY_ENABLE_LANE1	BIT(9)
+#define RK3506_DSI_PHY_ENABLE_LANE0	BIT(8)
 #define RK3506_DSI_TURNDISABLE		BIT(2)
 #define RK3506_DSI_FORCERXMODE		BIT(0)
 
@@ -1727,7 +1729,9 @@ static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
 		.lanecfg1_grf_reg = RK3506_SYS_GRF_SOC_CON6,
 		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3506_DSI_TURNDISABLE, 0) |
 			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
-			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE0, 1) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE1, 1)),
 		.max_data_lanes = 2,
 		.max_bit_rate_per_lane = 1500000000UL,
 		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,
-- 
2.47.3

