Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267974;
	b=h5Q65CXNMAqMaJKDHEhUQl9NY25EgEqMeRg+1S0AA4vq7IwNGDon7N6keEma7W5g7V9W
	 becCUOJ7FlW9dkGCJhVCkqKGHuWifdIBN6Hew9ryPWd4x3Jk75p43KV1qjXaEuxYXByzR
	 sxl07cpQt84OZlvwMhaBxFM8xmy78WvGJZh4RYsNdA4ay7lwkneCldP0G8hfid+n4fthp
	 +eOUtq3g8f6leG6OLmoKN2McnrzJ7msW2z4ryiBoIUJ5sq3shIjg3fS7zyK8XZrG7k2xJ
	 g2TiIjNPIKAPjcF0u5su4wyfRZPy5it2/zSPFqzxO12if1hDIAoJYnrWVHUdZ6JMLow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WiGu/qDPB54411+roh5knyJoZXFOYTm3muN6Yhprboc=;
	b=hwvYHZ2LHqcctTbkpW8Bh1gqQq78GCYz7culq5HFl2J1tuymkQLkjkge1WrPyRvsBAZq
	 KhVuAM9Ks99WB3eBlCxAXqdPnXITNFQ1c6idn3H2RsTh8RMve7dp+gVYG4XDYhPyDO5B5
	 1z6VZjnSUMJwSsStnrmTM4s9JpHa1zcMUeYCeQnGqbe2L0w5+u+yqRsmUaGmIp3vuhK7H
	 XOCsF7Ov3zaq7KH+BynV0+i87oOWoEitlqfImMfLYmSLrLI0yDzqXKybmk/SY4VBFzmv+
	 TeeAo1st3aSJiIZWcBzjhjKxLPm3dOcn9HcavaZEoflq7bbMPaqYPWPA1vUeiJ2rlBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eKro8ql6;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA4606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AA4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eKro8ql6
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso987784f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267973; x=1795872773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiGu/qDPB54411+roh5knyJoZXFOYTm3muN6Yhprboc=;
        b=eKro8ql6Dfap4NRzO8yk8IIvogU+bV02kApegI2+QeQ0vzkaqxT8nhmlQPWUjOtcsp
         7yTrsa4RNzMBt0ELgcstOzfYCQQokc7AX4js3WUzQS8DH+UaJbHXrM281mFVLbrSoI7S
         lkf7VPBrsO9mFqmCedtWLPwOcMmZjLaMvATi9NIk67pKlT2XSrrcENBe2hX91uYSGC0s
         HoLV5aj023ojzSEi8b/inyYRP4JHNp8rMsj/qXi1l8O/f6xIygTM4HiFFPU+B9E6K8gV
         sL13RJRYwDvlDSvLiZ8yWUvDgdawwdaNDX6YpYyAI2RUsvEYbyGyOLmMnjtqpO7mxN+Q
         bobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267973; x=1795872773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WiGu/qDPB54411+roh5knyJoZXFOYTm3muN6Yhprboc=;
        b=dLY7ADCEgVtrDIcleREenPawtnT06zKlpl6Pm6dIW9ZvoUVd60yN60z4Qg3pE1w7mk
         6wQChUyE8nhfV9ubS6h3Q9s5S0JG3/GvMrZk4HGyzyOqBHKcm360Zh3HZorAZKR2+mn1
         v7/+Q4AMjBKb2aQTQTlWG5XzLkAOqRP3RcFh/+vBJyPFBHxgFIh+S93k4KA5V7vlUgal
         VCOIPWOpjOpTyN/J5hsTC/6xy6DdBDX5R7KAut/Vg8kxiIGcFYZY0bKFIN85gRvnE3mX
         bo4KyXxrqge6oIkouZEwBB6lV67yVUyOynsbfyYK38kOxnwNIGp+UkoEVkGJL0a1q6j9
         2NwA==
X-Forwarded-Encrypted: i=1; AL+hErECkKASjhIVQFnyPHwdKAKpTLEkkEEMq9ZbjZ90/DuB0aIT3XRoq2Zyrkmm0f/r2c9SHAG1iQz6krBKk1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ydLN+yxvGNFvTzLNBatTYenYiHWqb4aFkiM9jd2bGBDzlIsBV
	MseO//bKHZHJVYBTVCqrADZgf8n6ihygFDZH8I3XqEyCHW4SLhV6kKP7
X-Gm-Gg: AZFdTZfLTW15Veq8NPmc4CVr26j0OiXGK8hprJdA/UVYYk1w+bath4wSU0uFOjY5pYT
	26tbmK6tF4gUgGJI8ATIsaBOEIKmYTwWV11NArfznm+HN21CDwz9OOkI23rFeYqOnDLWlAZ6rr2
	7CE0K3suAZFJ5MFhpLqlh1CuArnIBs4LsRRCEk1Oa8gGwOIQ2qnyNcopUobRmJ/6L4775mzkoUl
	+1L5kPgGcp3GZ3NC1WlhAn87R0s7lP/TwxLjk7VGmQIh+O2VllqSZdcU1hG/M6OdvPj/Bsk7AvD
	Z/4rYnJIeMx17Lhib0G5hJ5bHfSVZsP1Ls5n53qCWvYqZP5gFt540qZQKdFzqN2E++MAT3jqX0E
	x+tRQeupsXXpMOQIci4y+1bG9ju3fMK5tz3WbX2mavzatJTZ9dTBlNe4jKV9cn7uQ4uXgrML6/a
	5mkqBsU5TkeS8nEE+8+tbQFAemRACXlm5hBap0xf+ijkvokV5cMNZhPlL3iQHOJ+Bu9T2+3zDlp
	F9eGtDwrx+CCKK0hmjHy2XH3DUXs3bxvIspJciz9tCr6JHWx88lkm5UaEMPRlwRKOiQ+goDnN+f
	LMyj5QWfvP0EsbxszlMo+Sih6rCXS0akKRoEv7t1uRfbVTCNfXPihXPh0SAb0JRirr/Ki8MJfeg
	qf+F1j+/Jdnfm
X-Received: by 2002:a05:600c:1d0a:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb8880ef6amr146339235e9.14.1795267972758;
        Sat, 21 Nov 2026 05:32:52 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:52 -0800 (PST)
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
Subject: [PATCH v11 03/14] media: ov8858: Support a 19.2 MHz input clock on four-lane R2A
Date: Sat, 21 Nov 2026 14:31:33 +0100
Message-ID: <77cdd6c3197d9d0a2faedb4412ec04f1dff6b41b.1795267528.git.mauriziocasciano7@gmail.com>
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

The Yoga Book rear sensor uses a 19.2 MHz input clock with a 360 MHz
CSI-2 link frequency. Restrict the new clock table to four-lane R2A,
the configuration tested on the Yoga Book X91L. Retain the 24 MHz
tables for each existing variant and lane count. Base the power-on
delay on the selected input frequency.

Eighteen entries in the 19.2 MHz table match Intel's GPLv2 OV8858
initialization table from the Yoga Book vendor kernel. Retain its
2014 Intel copyright notice. The existing driver already uses
0x3f08 = 0x08. The four adjusted PLL entries at 0x0300, 0x0302,
0x030b and 0x030d are retained from the first public Yoga Book
patch. The source of those adjustments before that posting is
unverified.

Codex split the original patch, added the revision and lane-count
check and compared the register sources.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/ov8858.h
Link: https://lkml.iu.edu/2608.3/05469.html
Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/PWB2NAGYQ7EZVEDZNXK3R3UKZ7GGYAQY/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 142 ++++++++++++++++++++++++++++---------
 1 file changed, 107 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 295c34817..7b337dc93 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -3,10 +3,9 @@
  * Copyright (C) 2023 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  * Copyright (C) 2022 Nicholas Roth <nicholas@rothemail.net>
  * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
  */
 
-#include <linux/unaligned.h>
-
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -19,6 +18,8 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
@@ -29,8 +30,9 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
-#define OV8858_LINK_FREQ		360000000U
-#define OV8858_XVCLK_FREQ		24000000
+#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
+#define OV8858_XVCLK_FREQ_24MHZ		(24000 * HZ_PER_KHZ)
+#define OV8858_XVCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
 
 #define OV8858_REG_SIZE_SHIFT		16
 #define OV8858_REG_ADDR_MASK		0xffff
@@ -105,6 +107,7 @@ struct ov8858_mode {
 
 struct ov8858 {
 	struct clk		*xvclk;
+	unsigned long		xvclk_rate;
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*pwdn_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];
@@ -118,10 +121,82 @@ struct ov8858 {
 	struct v4l2_ctrl	*vblank;
 
 	const struct regval	*global_regs;
+	const struct regval	*xvclk_regs;
 
 	unsigned int		num_lanes;
 };
 
+/* Keep input-clock programming separate from the common sensor setup. */
+static const struct regval ov8858_24mhz_360mhz_r1a_2lane[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030e, 0x00},
+	{0x030f, 0x09},
+	{0x0312, 0x01},
+	{0x031e, 0x0c},
+	{0x4837, 0x16},
+	{REG_NULL, 0x00}
+};
+
+static const struct regval ov8858_24mhz_360mhz_r2a_2lane[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030e, 0x02},
+	{0x030f, 0x04},
+	{0x0312, 0x03},
+	{0x031e, 0x0c},
+	{0x4837, 0x16},
+	{REG_NULL, 0x00}
+};
+
+static const struct regval ov8858_24mhz_360mhz_r2a_4lane[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030e, 0x00},
+	{0x030f, 0x04},
+	{0x0312, 0x01},
+	{0x031e, 0x0c},
+	{0x4837, 0x16},
+	{REG_NULL, 0x00}
+};
+
+/*
+ * Register settings for a 19.2 MHz input and 360 MHz CSI-2 link.
+ *
+ * Besides the corrected sensor/MIPI PLL divisors, keep the final common
+ * black-level settings here. The per-mode tables retain their resolution
+ * dependent black-column anchors and window sizes.
+ */
+static const struct regval ov8858_19_2mhz_360mhz[] = {
+	{0x0300, 0x00},
+	{0x0302, 0x27},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030b, 0x00},
+	{0x030d, 0x27},
+	{0x030e, 0x00},
+	{0x030f, 0x04},
+	{0x0312, 0x01},
+	{0x031e, 0x0c},
+	{0x3f08, 0x08},
+	{0x400a, 0x01},
+	{0x400d, 0x10},
+	{0x4011, 0x20},
+	{0x403e, 0x08},
+	{0x4040, 0x07},
+	{0x4041, 0xc6},
+	{0x4202, 0x00},
+	{0x4500, 0x58},
+	{0x470b, 0x28},
+	{0x4837, 0x15},
+	{0x58f4, 0x32},
+	{0x58f8, 0x3d},
+	{REG_NULL, 0x00}
+};
+
 static inline struct ov8858 *sd_to_ov8858(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct ov8858, subdev);
@@ -132,13 +207,6 @@ static const struct regval ov8858_global_regs_r1a[] = {
 	{0x0100, 0x00},
 	{0x0100, 0x00},
 	{0x0100, 0x00},
-	{0x0302, 0x1e},
-	{0x0303, 0x00},
-	{0x0304, 0x03},
-	{0x030e, 0x00},
-	{0x030f, 0x09},
-	{0x0312, 0x01},
-	{0x031e, 0x0c},
 	{0x3600, 0x00},
 	{0x3601, 0x00},
 	{0x3602, 0x00},
@@ -371,7 +439,6 @@ static const struct regval ov8858_global_regs_r1a[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32},
-	{0x4837, 0x16},
 	{0x4850, 0x10},
 	{0x4851, 0x32},
 	{0x4b00, 0x2a},
@@ -406,13 +473,6 @@ static const struct regval ov8858_global_regs_r2a_2lane[] = {
 	 */
 	{0x0103, 0x01}, /* software reset */
 	{0x0100, 0x00}, /* software standby */
-	{0x0302, 0x1e}, /* pll1_multi */
-	{0x0303, 0x00}, /* pll1_divm */
-	{0x0304, 0x03}, /* pll1_div_mipi */
-	{0x030e, 0x02}, /* pll2_rdiv */
-	{0x030f, 0x04}, /* pll2_divsp */
-	{0x0312, 0x03}, /* pll2_pre_div0, pll2_r_divdac */
-	{0x031e, 0x0c}, /* pll1_no_lat */
 	{0x3600, 0x00},
 	{0x3601, 0x00},
 	{0x3602, 0x00},
@@ -649,7 +709,6 @@ static const struct regval ov8858_global_regs_r2a_2lane[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32}, /* clk prepare min */
-	{0x4837, 0x16}, /* global timing */
 	{0x4850, 0x10}, /* lane 1 = 1, lane 0 = 0 */
 	{0x4851, 0x32}, /* lane 3 = 3, lane 2 = 2 */
 	{0x4b00, 0x2a},
@@ -811,13 +870,6 @@ static const struct regval ov8858_global_regs_r2a_4lane[] = {
 	{0x0103, 0x01}, /* software reset for OVTATool only */
 	{0x0103, 0x01}, /* software reset */
 	{0x0100, 0x00}, /* software standby */
-	{0x0302, 0x1e}, /* pll1_multi */
-	{0x0303, 0x00}, /* pll1_divm */
-	{0x0304, 0x03}, /* pll1_div_mipi */
-	{0x030e, 0x00}, /* pll2_rdiv */
-	{0x030f, 0x04}, /* pll2_divsp */
-	{0x0312, 0x01}, /* pll2_pre_div0, pll2_r_divdac */
-	{0x031e, 0x0c}, /* pll1_no_lat */
 	{0x3600, 0x00},
 	{0x3601, 0x00},
 	{0x3602, 0x00},
@@ -1054,7 +1106,6 @@ static const struct regval ov8858_global_regs_r2a_4lane[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32}, /* clk prepare min */
-	{0x4837, 0x16}, /* global timing */
 	{0x4850, 0x10}, /* lane 1 = 1, lane 0 = 0 */
 	{0x4851, 0x32}, /* lane 3 = 3, lane 2 = 2 */
 	{0x4b00, 0x2a},
@@ -1346,6 +1397,10 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
 	if (ret)
 		return ret;
 
+	ret = ov8858_write_array(ov8858, ov8858->xvclk_regs);
+	if (ret)
+		return ret;
+
 	/* 200 usec max to let PLL stabilize. */
 	fsleep(200);
 
@@ -1624,9 +1679,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	unsigned long delay_us;
 	int ret;
 
-	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
-		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
-
 	ret = clk_prepare_enable(ov8858->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable xvclk\n");
@@ -1645,7 +1697,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	 * transaction, but a double sleep between the release of gpios
 	 * helps with sporadic failures observed at probe time.
 	 */
-	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
+	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);
 
 	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
 	fsleep(delay_us);
@@ -1806,15 +1858,20 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
 
 	if (id == OV8858_R2A) {
 		/* R2A supports 2 and 4 lanes modes. */
-		ov8858->global_regs = ov8858->num_lanes == 4
-				    ? ov8858_global_regs_r2a_4lane
-				    : ov8858_global_regs_r2a_2lane;
+		if (ov8858->num_lanes == 4) {
+			ov8858->global_regs = ov8858_global_regs_r2a_4lane;
+			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_4lane;
+		} else {
+			ov8858->global_regs = ov8858_global_regs_r2a_2lane;
+			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_2lane;
+		}
 	} else if (ov8858->num_lanes == 2) {
 		/*
 		 * R1A only supports 2 lanes mode and it's only partially
 		 * supported.
 		 */
 		ov8858->global_regs = ov8858_global_regs_r1a;
+		ov8858->xvclk_regs = ov8858_24mhz_360mhz_r1a_2lane;
 		dev_warn(&client->dev, "R1A may not work well!\n");
 	} else {
 		dev_err(&client->dev,
@@ -1822,6 +1879,14 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
 		return -EINVAL;
 	}
 
+	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
+		if (id != OV8858_R2A || ov8858->num_lanes != 4)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "19.2 MHz requires four lanes and R2A\n");
+
+		ov8858->xvclk_regs = ov8858_19_2mhz_360mhz;
+	}
+
 	return 0;
 }
 
@@ -1889,6 +1954,13 @@ static int ov8858_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
 				     "Failed to get xvclk\n");
 
+	ov8858->xvclk_rate = clk_get_rate(ov8858->xvclk);
+	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ &&
+	    ov8858->xvclk_rate != OV8858_XVCLK_FREQ_24MHZ)
+		return dev_err_probe(dev, -EINVAL,
+				     "Unsupported xvclk rate %lu Hz\n",
+				     ov8858->xvclk_rate);
+
 	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov8858->reset_gpio))
-- 
2.53.0


