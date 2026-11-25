Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636266;
	b=Bka7KpNObKmNOMme+/Ab+N7neqvZZUDDJspUg1DeE/z0AUsyIvSMvokdrMh8RJUs29P7
	 Yq6yskW197RUyK+83dlbagOYV6cF2Prg11j0SsGvFfccyacxeVauyMPNvVA4JRJ0KnzkA
	 KRgU5LekuSJXxiBVqkxaE27YnCkkl8b8QVcdwszIOVIJJlCpCpGaPEDLa9eRQUtAAZ6Ri
	 kHsSnRfvaKuysqE1t1ffc1K0/Cd/mvNfY/6IQhxtQrCPREdNqaYFFx6J0HKtTynAdODwe
	 wsiw1efOUYDpR6AsFIo+EM09Zexwf5VrM0iGcn07tCqWxn0u5qiEuOolbYe14nlexfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
	b=hV9VubuDAjEZ4i2wmKafm19tDxMnjsV+BatmYIm3x7/m1p3pa+/mN9AjZMq5I87k4gGz
	 VKME/yMJcLEVcb3K2iJqn/aL4DzQIrKVV8WlYrRjYh3HDxxdvjhD/8vJevrqgfOVhLZjg
	 q4KiLNj8eI3uS3DQ0uGSZx6vmkBfapnGiLbbQePmet/h63WH1tITWNGuie1ProxSlguh+
	 BQQrS4y76wEyvk824YI02hda8LFhtQsaNsgdQbcT93uilAmfuOEHRBoQho5HJkDIpDZ12
	 pzR3ggskcjduBiZJ0wropuZcTfynmz/GnoTvy8ywhRsdhiwPtA8zY+vtpl9hLwgMbhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VQz1E2xf;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4B606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE4B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VQz1E2xf
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48e94879f02so2027392fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636265; x=1796241065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
        b=VQz1E2xftr3x1fRtI8k/6Ydgmh9W3QdW7EMtM6tywkLbZVUrR+jsD0A/pvv+qIy37r
         5iiZ2CZUDqvpJsD4w2ljLRT38umS2V1EpZguz5wkxwOC8+Gbr1LutR+M3AeJ/9Pg6j0u
         OpsPqkH3YbQiWn0WkqWp2o0SHQATnz9UrVTegDLmgbEWQh+p7a0KpL6S65C6kPIRligy
         /yNNdZ5xOHGY6NmePCllPkXsDgq+vhaDRurnMUD7Y79+tD7KlrSxjnMhpzXiBINkeb/T
         q1Tm8EeWIKovKRPcipz71bK/gscDRHyukzJ+Lkn5fXf3uikhR8oMKUn2+E25zqCfjCJn
         vvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636265; x=1796241065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
        b=rioOXL9Flw8Poyv4L4EvvTqH8C6ZolV1f9bA2foAZ8WlggUaogay/PeCxEox1NM7QT
         RWKo9IR5lv9GPKmPszQgMsOnfoSJVI2UcypOBQUpujEYgTjJ0J+VuoDrxps+YV95h9Yt
         BPhNWoSlmx59RpKf5+muNyx2/yDtMheftlFNjnYo8RE20Qf+iwEQ6lW19TK68e51a1s0
         rWMPdvqdP/EOqCVWieQq3bfdOl+X8nUdABAKt7hlMzhiu5YoiT78HcAATwWNeXmr7RCc
         l1lm2bN4SSFQ4YYRVkIu9w6sjb9TwtR8hOo0ei1gKZiSTaggfMX5vt9GuwDXwFLCfFBq
         YMRA==
X-Gm-Message-State: APuU4Z+PxoUWv9aOLN0peFC9gNgB+dOYqWQlAR+bRbAugCLD1spwn8jm
	/07MwY+89kgPxzPO8D+8lqn3H6qf5Kp2A8NxKuVXWX3r4No9tkcPj2GP5L8C0uDU/A==
X-Gm-Gg: AZFdTZe+oEunu9UrRHiJKx+r2z3AjFv+pBZ+3KvFV0/fz7291/BvCb2xvzYvFD4PDvf
	/6++fP+Va5ar490NjEgUEiMwpWUrk1/L+9QkuAK1b6JPOrKamVCiWyPS8gxfKRu1ESaIN73jvxq
	t7yKS5P+aMFPyTisx+VeJIBiAG91OFQ3KbnttaKyLE0z2gM7oyHvM2Cya7FQuE42MSDMjhTu2cC
	ke50/SSSXzxtGvRbaqbNorntwPrqvL9IWUf9ik+P0LAwsPsjfZEhGDSrYbtA+rqKHZfX38g/jiM
	Xusxgv0HUjCRXD1KjtKs6Flzciq4fgeQ1jg1QRremiNrkSWDNXePmHE25XlNhalZv2Z6/IJwmIe
	nsokXuo6Abgy3bJp7w0A7VeCDGsLPOv2BZOYdNYk5s2QcL4e5W0hGKAiY1mIex7DOrkySbPCcq/
	qHdEjsLFh3DBxWiNqgtF9VDw53VSd67fXVq+5L41H3cJVxz2OeHg6yhCfqfgDK8UN+42sHA/m9v
	Gx+Y8ziO0eWwq/P36MktABdRVQucm4Vgf/fyULQikqjiFkZN+rTSvj4jebpCWR82o6Z76Vixbln
	SdETtIIuQiCYggV9VIRsU46BO/CrUp5+RDBGsEz7ZKCjgUHcyhBdRCOm
X-Received: by 2002:a05:6808:50ab:b0:4f0:1f76:8ca0 with SMTP id 5614622812f47-57a0be9d917mr21371774b6e.56.1795636265224;
        Wed, 25 Nov 2026 11:51:05 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:51:04 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 09/12] media: tw9900: allow board-specific register tables via platform data
Date: Wed, 25 Nov 2026 13:49:48 -0600
Message-ID: <20261125194951.19072-10-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

Allow bridge drivers to supply initial configuration data for the tw9900.
Behavior for the original configuration supported by the driver is
unchanged. Fall back to the existing initialization data if none is
supplied by the bridge device.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 MAINTAINERS                |  1 +
 drivers/media/i2c/tw9900.c | 49 ++++++++++++++++++++++++++------------
 include/media/i2c/tw9900.h | 34 ++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 15 deletions(-)
 create mode 100644 include/media/i2c/tw9900.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c08aade46f61..102362c386fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27505,6 +27505,7 @@ M:	Mehdi Djait <mehdi.djait@bootlin.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/tw9900.c
+F:	include/media/i2c/tw9900.h
 
 TECHWELL TW9910 VIDEO DECODER
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index b2c30e84acb8..f4f07f060083 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <media/i2c/tw9900.h>
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
@@ -70,16 +71,11 @@
 #define TW9900_VIDEO_POLL_TRIES			20
 #define TW9900_AUTOSUSPEND_DELAY_MS		1000
 
-struct regval {
-	u8 addr;
-	u8 val;
-};
-
 struct tw9900_mode {
 	u32 width;
 	u32 height;
 	u32 std;
-	const struct regval *reg_list;
+	const struct tw9900_regval *reg_list;
 	int n_regs;
 };
 
@@ -97,11 +93,12 @@ struct tw9900 {
 
 	bool streaming;
 	const struct tw9900_mode *cur_mode;
+	const struct tw9900_platform_data *pdata;
 };
 
 #define to_tw9900(sd) container_of(sd, struct tw9900, subdev)
 
-static const struct regval tw9900_init_regs[] = {
+static const struct tw9900_regval tw9900_init_regs[] = {
 	{ TW9900_REG_MISC_CTL_II,	0xE6 },
 	{ TW9900_REG_MISSCNT,		0x24 },
 	{ TW9900_REG_OUT_FMT_CTL,	0xA7 },
@@ -116,7 +113,7 @@ static const struct regval tw9900_init_regs[] = {
 	{ TW9900_REG_OUT_CTRL_I,	0x98 },
 };
 
-static const struct regval tw9900_pal_regs[] = {
+static const struct tw9900_regval tw9900_pal_regs[] = {
 	{ TW9900_REG_OUT_FMT_CTL,	0xA7 },
 	{ TW9900_REG_VDELAY_LO,		0x19 },
 	{ TW9900_REG_VACTIVE_LO,	0xF0 },
@@ -126,7 +123,7 @@ static const struct regval tw9900_pal_regs[] = {
 	{ TW9900_REG_STD,		0x01 },
 };
 
-static const struct regval tw9900_ntsc_regs[] = {
+static const struct tw9900_regval tw9900_ntsc_regs[] = {
 	{ TW9900_REG_OUT_FMT_CTL,	0xA4 },
 	{ TW9900_REG_VDELAY_LO,		0x12 },
 	{ TW9900_REG_VACTIVE_LO,	0xF0 },
@@ -165,7 +162,7 @@ static int tw9900_write_reg(struct i2c_client *client, u8 reg, u8 val)
 }
 
 static int tw9900_write_array(struct i2c_client *client,
-			      const struct regval *regs, int n_regs)
+			      const struct tw9900_regval *regs, int n_regs)
 {
 	int i, ret = 0;
 
@@ -189,6 +186,23 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
 	return ret;
 }
 
+static int tw9900_write_mode(struct tw9900 *tw9900)
+{
+	const struct tw9900_platform_data *pdata = tw9900->pdata;
+	const struct tw9900_mode *mode = tw9900->cur_mode;
+
+	if (!pdata)
+		return tw9900_write_array(tw9900->client, mode->reg_list,
+					  mode->n_regs);
+
+	if (mode->std & V4L2_STD_NTSC)
+		return tw9900_write_array(tw9900->client, pdata->ntsc_regs,
+					  pdata->n_ntsc_regs);
+
+	return tw9900_write_array(tw9900->client, pdata->pal_regs,
+				  pdata->n_pal_regs);
+}
+
 static void tw9900_fill_fmt(const struct tw9900_mode *mode,
 			    struct v4l2_mbus_framefmt *fmt)
 {
@@ -322,9 +336,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 		if (ret)
 			goto err_unlock;
 
-		ret = tw9900_write_array(tw9900->client,
-					 tw9900->cur_mode->reg_list,
-					 tw9900->cur_mode->n_regs);
+		ret = tw9900_write_mode(tw9900);
 		if (ret)
 			goto err_unlock;
 
@@ -668,8 +680,14 @@ static int tw9900_runtime_resume(struct device *dev)
 
 	usleep_range(1000, 2000);
 
-	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
-				 ARRAY_SIZE(tw9900_init_regs));
+	if (tw9900->pdata)
+		ret = tw9900_write_array(tw9900->client,
+					 tw9900->pdata->init_regs,
+					 tw9900->pdata->n_init_regs);
+	else
+		ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
+					 ARRAY_SIZE(tw9900_init_regs));
+
 	if (ret) {
 		if (tw9900->reset_gpio)
 			gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
@@ -733,6 +751,7 @@ static int tw9900_probe(struct i2c_client *client)
 
 	tw9900->client = client;
 	tw9900->cur_mode = &supported_modes[0];
+	tw9900->pdata = dev_get_platdata(dev);
 
 	tw9900->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_LOW);
diff --git a/include/media/i2c/tw9900.h b/include/media/i2c/tw9900.h
new file mode 100644
index 000000000000..11e3bfe38e2b
--- /dev/null
+++ b/include/media/i2c/tw9900.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Techwell TW9900 multi-standard video decoder
+ */
+
+#ifndef _MEDIA_I2C_TW9900_H_
+#define _MEDIA_I2C_TW9900_H_
+
+#include <linux/types.h>
+
+struct tw9900_regval {
+	u8 addr;
+	u8 val;
+};
+
+/**
+ * struct tw9900_platform_data - board-specific register setup
+ * @init_regs: written each time the decoder is powered up
+ * @n_init_regs: number of entries in @init_regs
+ * @ntsc_regs: written when streaming starts with a 525-line standard
+ * @n_ntsc_regs: number of entries in @ntsc_regs
+ * @pal_regs: written when streaming starts with a 625-line standard
+ * @n_pal_regs: number of entries in @pal_regs
+ */
+struct tw9900_platform_data {
+	const struct tw9900_regval *init_regs;
+	unsigned int n_init_regs;
+	const struct tw9900_regval *ntsc_regs;
+	unsigned int n_ntsc_regs;
+	const struct tw9900_regval *pal_regs;
+	unsigned int n_pal_regs;
+};
+
+#endif
-- 
2.47.3

