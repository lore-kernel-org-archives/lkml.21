Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267983;
	b=xm1Ve944EQEZvDxM8QCvstp7OvlmTjZjlyRTOqXfu7Dy2rctVyJCDQHX+OezLgYVKhNC
	 MC1ULA6Lcp08PbL+QyQhYKqly/XpAzQu8dl5sE184ONLXhrpPluRQB3io+nBmTkE424Kd
	 uHfbpeEZDIMT4GaxeR74K7LdDR/Q5KXHhkxRWvOu/2rCeRUbnm1TLcJ6IIxS31fkwVbo9
	 35LqR0fGUa+r5W9yXNFslqiBPAsrjXBlPWnOuvJdP+U/4NMKVbSmfVAQo7DX184wm4t+F
	 eR4V6aSV7zjTTi0TOYLlrJkqsVTqvv6QgZIVonjMezy6PiajhpxBhUbDRE0jCQ97zjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
	b=x5EAtq8b+FPxA2Z2ffHwDkYObQyeeo7IWhCZoRMVM70XXwltEiWPkZZ9+2/BaB2PWZDQ
	 VrA+Kc2XuAKOALV0xxzTLstMtsQuX2k/nk7SOXtzkZHYGQX3sW5YJlvpQi0eiZg/xx2Vk
	 7oCrnO37oOFLJprVpzp2yRnybq9YxFGYvj651S39iPI0I7cNy/Mp4LG1kYoecYre7ENLT
	 kGaNYOPS43TJD59t7O1NmI+OYeYB/SDxZK4f3Iwt1wkmawPGUWjNEbZULocJp9wQzEc5p
	 slGp9TOGD6tG6dxViKcE1VCn3pGM7CWhh02h67KDICgGdYyBsbgjT/BGrZZVeNafARA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LWl//dU0";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DEB606A6BA
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DEB606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LWl//dU0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so19541045e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267981; x=1795872781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
        b=LWl//dU03z1C+qSwkZvXEy4JwPY9iXsSDmJSk/UxOd9UpUr6ZVgbwex+7kp6CfTrUR
         cLyg6AEM2ToTPGVdg/ZrKf3tWhYGyDyEoIM3TBOdyPoMokOw39wAm9gXLyqij7SgQA+y
         Hb+ED4JRi2pI5rHWTRUO0ycFCDMm6hXjx80E6BDFG+4zoyzGEnJnSAxRZAuVnXlqrREN
         jPOVIk1BqhojkuTmi2aS8OiqXYkLNCaijrvyuMHMCPjkwiCDzyXesriLF9Onae4ra7ND
         Qpk/rgWs0o5oc1d7PgRMKTd49g0dT/HUsY/C4Yj/w8gV3cpjnJG+8V/6NFFvJsn15ydE
         YXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267981; x=1795872781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
        b=2nzkSeajHoCey4e2S01fEVd1VphEjqS5l3B4FEpbBcAH2IgzCqAEYX81H/yHNL8Bf0
         PYJyLQpXEEMRqCdLueM4nqwXwjbMANanzMvhK8T0U1kucdeSutMDZD4nnzPukUg962WR
         Ii9ankc66I22DdOvpyz2zVLEHF+X/vfrZMFX5138Q/kB5i1H5KAOA+1niXEmGUT8AFKS
         TmlrUFvGJJpv30Bomhmpg74rZoEUdOW0JLecXuG3JhtrEuUM221n6RQXf6peWGOOTJE8
         93OwgaPN8ykpdjHOtQsRsw5fJuf6oYaQn4H1v0tKMgvk/T1kOA4Em1YqnDEZs9geElfr
         ihxQ==
X-Forwarded-Encrypted: i=1; AL+hErFoQWtZsRDxelle+YeSBSI7kaqq7jWzo1BLKPd2X/s4ebyuP7ho3af5VsAaZAX3eIO1Q2psCL4/tGFU4F0=@vger.kernel.org
X-Gm-Message-State: APuU4Z85TgYSflUVVnRSwIBt0Smv9Tkx8erCm5ZnlB2KFlMYVkyIJT0t
	eiVKbz5jE8NANbVzyCFlYDyejy/ndCVCXz3TobEjjI1x5vh95Y26vLX3
X-Gm-Gg: AZFdTZf8ri9o+jusLb7n7+MNapcFt+ci7EogfddXE+CqBdFPRv2n+1n5xH9SsULJ4IV
	V2Op5WUi4hfmwFgMNYBh3lneJWNqQKdTjcuZuNje0f+vLetjC0PwM89j1WxJcvDhijvtwwNO1Vo
	u35IiJ/0MUjSSlBB441Y6FSe4AqOkmKsu0P65IUa3hUd2XFlJncGCh5QE2U2RpAa784g5Cv07sp
	T0Ops9jMkVkqiO1NX3uJNe4c022ws+o7ooBPiFwaKsAGQKZxx9NkEHKLiuZQMLCRRYHNEy8N4Js
	/ycptPzYUEGwhK8Z9Wr+bloxOW5FMA+OmarI2ZlRQ+dscvzbcLM29VnZwc4y5fSYfuBel5UmYBy
	nghNVRcVZ4+yBDZRChPdglGMiiQ42yyznHtmeOeoGbOGdcSMb53HA4pMBSGaOY5UtN/LYWZZEko
	Gw1ou785PYA+jYi+JyQqmUwyZZ/jgdbHDkFDllcNp+8gsVRWnofkMgFmbbgRMY+Z6ds5PkQqKv6
	sVQ9Od8ywmIiMUDBi5+Lt8YaeYrAYAEgL3BTRKXNYiRSlDzbUuE5tt3bdAmX8jen4n89ldegU7M
	iXPdUIA21u24M0NUwzya9y4DyhxUWWl/XSoNZjRiNGPER0sSmI8cYS/FAEOmoPpHFn6iHFz7M9e
	js8sM0PzVajpr
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr144837645e9.30.1795267981193;
        Sat, 21 Nov 2026 05:33:01 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:00 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 07/14] media: ov2740: support 288 MHz link frequency
Date: Sat, 21 Nov 2026 14:31:37 +0100
Message-ID: <3885fc22c2a195125139d5d748a65e739acf0871.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
288 MHz link frequency. Add the matching PLL configuration and mode
timing.

Reuse the existing 1932x1092 crop and mode register list so the Bayer
order remains SGRBG across link frequencies. Cropping the CSI-2
receiver output to a smaller processed frame is a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 7d786d09f..30eb58eed 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,12 +12,14 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
-#define OV2740_LINK_FREQ_360MHZ		360000000ULL
-#define OV2740_LINK_FREQ_180MHZ		180000000ULL
+#define OV2740_LINK_FREQ_360MHZ		(360 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_288MHZ		(288 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_180MHZ		(180 * HZ_PER_MHZ)
 #define OV2740_SCLK			72000000LL
 #define OV2740_MCLK			19200000
 #define OV2740_DATA_LANES		2
@@ -91,6 +93,7 @@ struct nvm_data {
 
 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_288MHZ_INDEX,
 	OV2740_LINK_FREQ_180MHZ_INDEX,
 };
 
@@ -142,6 +145,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };
 
+static const struct ov2740_reg mipi_data_rate_576mbps[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+};
+
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
@@ -468,6 +479,7 @@ static const char * const ov2740_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_288MHZ,
 	OV2740_LINK_FREQ_180MHZ,
 };
 
@@ -478,6 +490,12 @@ static const struct ov2740_link_freq_config link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
+			.regs = mipi_data_rate_576mbps,
+		}
+	},
 	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
@@ -502,6 +520,22 @@ static const struct ov2740_mode supported_modes_360mhz[] = {
 	},
 };
 
+static const struct ov2740_mode supported_modes_288mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1776,
+		.vts_def = 1776,
+		.vts_max = 32767,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
+	},
+};
+
 static const struct ov2740_mode supported_modes_180mhz[] = {
 	{
 		.width = 1932,
@@ -1179,6 +1213,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 			ov2740->supported_modes_count =
 				ARRAY_SIZE(supported_modes_360mhz);
 			break;
+		case OV2740_LINK_FREQ_288MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_288mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_288mhz);
+			break;
 		case OV2740_LINK_FREQ_180MHZ_INDEX:
 			ov2740->supported_modes = supported_modes_180mhz;
 			ov2740->supported_modes_count =
-- 
2.53.0


