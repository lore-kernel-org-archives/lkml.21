Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281084;
	b=N8hMTH/+Pl0pq4mHoK0rz2k6rZvRGO5vVE+fOolbP/uZtAglbN/F6CE7sPfvFkcblVm1
	 AdTxmVnNrpAXnlVJDGypafKZi/KinzhWpzrlLWI9ttv+kxhrFr78H4DpI46dKL61MixzF
	 36Zn7wqCy8jimChm4LV8FndFmiRDeg9oKhnP/TvBNkTuZ8aHffuuPmQb+gq3wZz25nwK6
	 p0Coyo9b2CVmroPZ+bQCsfskpSoXzHu5xKZTgN5olLSMojldrhtY98YQ9CliVmHnJ/Zbd
	 LGD6yaQiFr9I2GEw9nHQvDB1Z+aoFlO2po7CgapZtuSZ9itZI9RjsAiJosFKXKND1UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281084;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zeAGBzUvkXeOm8/CB9GEDh0u7+FI30sxlipMlqhTmnI=;
	b=nXhbFMmWtLDM7atVc6042PvlIcyxYSLBvVgUDpoG3xcqKun7gBFIhz1x6vRkbeUqz5vV
	 xFOVA5mH3cxQi8d5JTXS4Mgq1m0Ep6fTIffY+coqTsGFgVG9IRoiuCTGwFjDe3ijoY8A+
	 AYFqNGDRrX5SWWG3drm8nzrtDX57tY8AFtxSPZbWewNTcvI+t4Y21Yd7+CUdx6iufnlXn
	 Ia2kKUGH9/7I6wcaE4tGhxQlaKI/apeE/rL+gzX5Q4ColIwP0fviojX6KYsalKT2KBGKh
	 DqL4KoF3QCUstwGtkQJWUHKH0dw8ydjzpvtn6g8dBDEBAZBmd4Q4R/zargBthNI5zaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gtQC1xM8;
	arc=none smtp.remote-ip=203.205.221.153
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6CF606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6CF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gtQC1xM8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795281081; bh=zeAGBzUvkXeOm8/CB9GEDh0u7+FI30sxlipMlqhTmnI=;
	h=From:To:Cc:Subject:Date;
	b=gtQC1xM8obtKfjt5gvs/0bzkII2b22Kj4/W3pUrdxDIEaOIB/fgsoUHqYuSI6PYOs
	 t3WCrr6ZaNHALXLFP9+h8BQ5ozoOK8xR9MZJ82/ruE2kOCNHxsZYAzmUyL101ekLvZ
	 6HD32fvmsc+ECIdxg2bOARFup+xIB0xCNsgKxiio=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 2D22F85E; Sun, 22 Nov 2026 01:11:18 +0800
X-QQ-mid: xmsmtpt1795281078tmvupf2jg
Message-ID: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuvjAbzxDC/d292Dzu8u6ODXknC8jRsMFWVDLcsIjgINkf7SjZxi
	 5CoJ4Zk8Pmsg+MVa1E2WfndJK9wHKEnMX70Me40klfXK7EoPkJQUGZodA/sqAK65tNrhy7T5MWMh
	 Atu3+QVqJVQ4OCG/wQRYvCWuiYWF7IWSNDp1tNZ1HGnhhJKUG5jqO3hxWzhh8nxCqU+JIrnaNF9V
	 zA3Y1u3YztGF+EB1KZIUQq19e6UyjdQtwqUPOlLM5bWRuBBHNFlNwXoqRqQOYNJQumriyvLyPwVF
	 b/Kz5Kqz+yhqG19TLUuZerB0cd5soTFNH6+9rs4K3P2ozrPX/TkxEWMY6teGbc+8MIBMj7NqDAjS
	 2MQ01R/U234CtXliA6FEYRAWxmGfKtg/kApkfqG+sNYDBq2XOacLLGCLigtIz7v0HtjSSRQHujz8
	 3WO+frUiywH9KyF1aZB0zy43b0J5BxWUYCOcA2V1HyAbzHAVqOT/LFa+PoUHPe9ykaZsqYZqTkGC
	 Oxns19w/zWhfCv1c3owh2r6G7qUqNP9jDdNH500Ip3dkoD/MYLyRHtlwfnCx03zFt6GfR/LucrJP
	 YlHBHUFli87+/EMOzU7NH1udYTdYsSoi2R/ujPDD5JKTTm1DRYKep1BUcrU+fY8z//w45QcYDlFR
	 JMJH/bY08mh8pXEd/k6LO9Di2aqEBE2jV+vYATizT+45NyX/Xw/1b/ZQw3GeBv02bGz+b7nJbkd+
	 QzgCOgdzNYSrrB3+4nHsljt5aUvsCXgjfioc389ZB6dL0pxkiVXJxCGOeb/Phh2E7+BFjp/psLeL
	 H0KJIydCaOSuDCfPFW82s8PV6WH+wmQsaqxFCrwqfB99Q0w/2F+yTcgngYVH7ehj8+q4UrnfqRbz
	 2j7UrOqd/WdgzM+Lwxmz6+5SbuBpUn4559sZuxrVj53hlj2BT270JLXE4KTzTrF4LEQdqkavyALp
	 lOOXwj63ko6VbrJPHi2B7TmH8y0/z91KypoAmv7vi12C/l9hLXA5hKEZNcjztTZoFsGIYxUNsCdM
	 6AvlSVPrFwuUyihkXlrpUOB7vNHXN9bDUdgqqsWafoTPkDKlIrIiNKivBXn6xqJ9UnsYwa0AmIrF
	 gfA0VDTNDFKCdySZrp7o8bjcZuqegT8TK+Ywdr
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: ZhuXiangyu <1194781887@qq.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH v2] phy: rockchip: inno-dsidphy: fix 1.5 GHz rate units
Date: Sun, 22 Nov 2026 01:11:16 +0800
X-OQ-MSGID: <20261121171116.1703397-1-1194781887@qq.com>
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

The 1.5 GHz Innosilicon DSI PHY timing table stores its rates in Mbps,
whereas the other timing tables and the lookup loop use Hz. When
enabling a mode, the driver compares inno->pll.rate in Hz (e.g.
372000000) against timings[].rate in Mbps (e.g. 400), so no entry
matches. The loop falls through to the last, fastest entry and programs
an excessively large TLPX/LPX counter, preventing panels from decoding
low-power DCS initialization commands.

Convert the 1.5 GHz timing table rate values to Hz so the lookup
selects the matching entry.

Tested on an RK3506B board: the panel receives the low-power init
sequence and the framebuffer console displays properly.

Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506")
Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
Changes in v2:
- Split out from the combined drm/phy patch into a standalone phy
  subsystem patch per Heiko's review.
- Limit recipients to phy and Rockchip maintainers/lists.
- Fix Signed-off-by author name formatting.

 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 6ad04b0c..fcf7aa17 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -282,20 +282,20 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
 
 static const
 struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1_5ghz[] = {
-	{ 110, 0x02, 0x7f, 0x16, 0x02, 0x02},
-	{ 150, 0x02, 0x7f, 0x16, 0x03, 0x02},
-	{ 200, 0x02, 0x7f, 0x17, 0x04, 0x02},
-	{ 250, 0x02, 0x7f, 0x17, 0x05, 0x04},
-	{ 300, 0x02, 0x7f, 0x18, 0x06, 0x04},
-	{ 400, 0x03, 0x7e, 0x19, 0x07, 0x04},
-	{ 500, 0x03, 0x7c, 0x1b, 0x07, 0x08},
-	{ 600, 0x03, 0x70, 0x1d, 0x08, 0x10},
-	{ 700, 0x05, 0x40, 0x1e, 0x08, 0x30},
-	{ 800, 0x05, 0x02, 0x1f, 0x09, 0x30},
-	{1000, 0x05, 0x08, 0x20, 0x09, 0x30},
-	{1200, 0x06, 0x03, 0x32, 0x14, 0x0f},
-	{1400, 0x09, 0x03, 0x32, 0x14, 0x0f},
-	{1500, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
+	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
+	{ 150000000, 0x02, 0x7f, 0x16, 0x03, 0x02},
+	{ 200000000, 0x02, 0x7f, 0x17, 0x04, 0x02},
+	{ 250000000, 0x02, 0x7f, 0x17, 0x05, 0x04},
+	{ 300000000, 0x02, 0x7f, 0x18, 0x06, 0x04},
+	{ 400000000, 0x03, 0x7e, 0x19, 0x07, 0x04},
+	{ 500000000, 0x03, 0x7c, 0x1b, 0x07, 0x08},
+	{ 600000000, 0x03, 0x70, 0x1d, 0x08, 0x10},
+	{ 700000000, 0x05, 0x40, 0x1e, 0x08, 0x30},
+	{ 800000000, 0x05, 0x02, 0x1f, 0x09, 0x30},
+	{1000000000, 0x05, 0x08, 0x20, 0x09, 0x30},
+	{1200000000, 0x06, 0x03, 0x32, 0x14, 0x0f},
+	{1400000000, 0x09, 0x03, 0x32, 0x14, 0x0f},
+	{1500000000, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
 };
 
 static const
-- 
2.47.3

