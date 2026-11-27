Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796349;
	b=34kUw6hxWuiZcMMyyr5NXK3h57B0a/n+VeoDsVl6xUW8yxC5S076nB+8tkyN8FMaBbez
	 V7ISExixUiACgXKz7z4OE/xkN5Mijh9+8gSIIXo9rPKMw+KpahqVB+HZx6L3dXoLABQNM
	 +BiyUEy4KQwoNnpqc4DcIwedPEm6OHE1imDgTjDqdqdlzkyTpssEhJzzrMd9pHI9cSrN3
	 oBNDkdtZS3uAMtgQWw6ipY00LA5xKf/Rd4WXnHDwJmxcYCfoXqRU9pRC2gwsDltg7nHQx
	 lt38Sc0CsvrVZaUSh9Bn4oSxg9oASMvCrz4Jm5BiPpUcz0tQOi1tgd7vmkTjY2cR1pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796349;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=2OkpDkbCyoJLFOdO1lzyvVFusub3trHvPVp03It2fqI=;
	b=kTUqO5TyCbUUPoqthdeLqo5h3y0iCpd8aV4nIEK6f7/EB+CMOuz3fWMsYyzDDpO5Supj
	 Jsz1FDA7toWXnQo8Z2aaAM9A0Xl6tlX8K5pJ3aMjV7RINmvFboxtj16OW3h/V1WW0FhzI
	 yBHI286LkCxi6HoPJBXWGj9Mi87Q+WyAwpKPuIW6Xh9OQb4VRVWpi7zY74SEOUmeuz7Z6
	 3sJZYesZ104WwbhoG6tB5OFfLlBt7uEOSlTwXOMkA8p31hG1Tp1GvAHS5VvncomLgi7Nc
	 xIHHeFgtMnbWUjwK+yLUXnDVZel+7QuytRdmKvUnVdtG2exxwjaN5tFvZJl9nqYAZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="T6srVvW/";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334C606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E334C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=T6srVvW/
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127161906euoutp026d7a6ddd668d6b670ba81e83ed48c1c0~r80NCCVrg1147811478euoutp022
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:19:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127161906euoutp026d7a6ddd668d6b670ba81e83ed48c1c0~r80NCCVrg1147811478euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795796346;
	bh=2OkpDkbCyoJLFOdO1lzyvVFusub3trHvPVp03It2fqI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=T6srVvW/342bRiJ+FwBSXVFm+sfF5Qa6TqQ1+eTiT9DO7Mgc9OHNQZ1P9kbauzQ7B
	 Kiuj5/bHVYOlDuna3tiPvpLpD1MJWJcacVzuVs4xRB0+DArXp50mAe/fNe4M8JUPvK
	 CdbD2ga4i2g6abDHROG98JaV+oPa1CCoRA/rHH98=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267~r80MgJ9mv2630926309eucas1p1l;
	Fri, 27 Nov 2026 16:19:06 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161905eusmtip2a3cc83f060c560cb84668452b3da5cf4~r80LjIpgr2967129671eusmtip2z;
	Fri, 27 Nov 2026 16:19:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 27 Nov 2026 17:18:59 +0100
Subject: [PATCH 1/3] drm/bridge: inno-hdmi: fix swapped HSYNC and VSYNC
 polarity
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-inno-hdmi-ddc-of-node-v1-1-465622e1b7ad@samsung.com>
In-Reply-To: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
To: Andy Yan <andyshrk@163.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jernej Skrabec
	<jernej.skrabec@gmail.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Byron Stanoszek <gandalf@winds.org>, Dominique
	Belhachemi <db@domibel.de>,  Owen O'Hehir <oo.hehir@gmail.com>,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=xVFAkBd12BJey0Nt5oHwW5AmpKXWLEYRNqtQ/ReT9fM=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWRzri2XMyptPHtq3rnnmgwnXS/8OnM5tiv7jWrG7KMbg
	zh6/DZEdZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJsKQyMtyftNxsxjR9V+O5
	i2039X74Ya7yy5BPU6L4wtSpfz7x3YpnZHhz54C8reRJ3vBDH37xm16dG+Jn92LLnJ43h++uZ7w
	wr5wPAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267
X-EPHeader: CA
X-CMS-RootMailID: 20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267
References: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
	<CGME20261127161906eucas1p10d26e6dbbfd4a93fe8976cedfc8c1267@eucas1p1.samsung.com>

v_HSYNC_POLARITY() and v_VSYNC_POLARITY() write the wrong bits: the
hardware puts HSYNC in bit 2 and VSYNC in bit 3, the macros do the
opposite. Most CEA modes drive both syncs with the same polarity so it
goes unnoticed; it only shows up on modes where the two differ.

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Reported-by: Maud Spierings <maud_spierings@murena.io>
Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
Reported-by: Byron Stanoszek <gandalf@winds.org>
Closes: https://lore.kernel.org/all/b8b046ee-c574-3e16-6079-2fc415633dae@winds.org/
Suggested-by: Dominique Belhachemi <db@domibel.de>
Tested-by: Maud Spierings <maud_spierings@murena.io>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 4d9d06d0419646f00142f984b797e810df37779a..3bdcacf3cbc8427c8420eac9a37e3ecb79682414 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -122,8 +122,8 @@ enum {
 #define v_VIDEO_MUTE(n)			((n) << 0)
 
 #define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		((n) << 3)
-#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_VSYNC_POLARITY(n)		((n) << 3)
+#define v_HSYNC_POLARITY(n)		((n) << 2)
 #define v_INETLACE(n)			((n) << 1)
 #define v_EXTERANL_VIDEO(n)		((n) << 0)
 

-- 
2.34.1

