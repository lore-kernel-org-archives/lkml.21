Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034603;
	b=ZUK6dMx0TmTrzLJ9kOB/lArCeE6jVBPsBZ3gI340v+bmFdSTXkxOtUNMdBVPoqpL0TcU
	 y7hDGAosBTTcTidbEmh+2xAEYgSJVOI7N8KJRjNgGoLW3QGSLDhr1LStpjgLNikSVcIf3
	 wM1HjSCqIP11kvGEyDj2SAhYsjLL2V6QvYsiicAFdic4Amt6nKnaE52B8WXeYkY4fdLaL
	 dFUEhik3stElzluqQ15r4j7ksVYXXa9l6cA+JA1s1bUMCa9QxbGjGZlIcV6rmuAowE1ps
	 zOSCVju9dI/uzbgIj/aj6jh5t7I6M5DReDWZjNDJ2gB/Ub+EFqt9B8Oivfq1rPBCcJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n0YXGGo330R1yn4K8suGNVhNQKravXREW1JGSVmLJ9o=;
	b=CckklE0izxGeqS+VXXJBM/ZwntNCiruxYELiVKTOAtNPYWPGbnHYt5Ze2pLXBg+XQYRE
	 hTeESVe8y6WqxYxCRS34JIq92mWXDiQ2SbEYIzRWXZmipAnpS7dMqYg0I9FXrgvKxDnl6
	 fS+WRSTJkZ7OLwC13XGmfzrHxGhQhAU2pNO/OsDuJMEHMa/zn5fc7lvTXNbmiSnxq8q3i
	 228GA2BeK0+Q/KBRgYfY7FvM/9YrWx70BuecgaUFAQTrPSgLL2cAosjZ1cG0m7t/xLE8t
	 tXRcOdjYeBHVtFzUZxcWahG0yOxc/t/KP4WNwn//7QKOiMZoZgPmeyI292dsvXYFkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Oga/cnF0";
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1060A3815
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C1060A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oga/cnF0
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8451a619da7so829084a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034602; x=1795639402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0YXGGo330R1yn4K8suGNVhNQKravXREW1JGSVmLJ9o=;
        b=Oga/cnF0JZjjstv4HXFAE/t2U+Lsg2Ul1E5xZ7sKs8cLT5aAtZQPs5EYJ9Ofi9gwOC
         n03Kfuwo6wR4FwI/wxczr7oZDO6Owke0Tr8haXAIe17i94eYUUDRFeiCDeqnWkr1HaCK
         GvzpvZsZXdrnjHjSCROsuXHhEdLo2fbTZFfCkO1NE9N5U8kqXtB3dEkFzKZNP1YoXfnU
         i4GJcuiKPx1YE708JLBwDJuds3Gg/AaFcSZlkmODexyTCvmoecDatPhkcYMxB8q9U2Us
         i3e9WVXaBE5OltaROgs/Hxk7DHbCEBH8Xo4LnkMFfGmE5WsaV8f2jFLW/MH5ZPURpi+b
         oT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034602; x=1795639402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0YXGGo330R1yn4K8suGNVhNQKravXREW1JGSVmLJ9o=;
        b=deI8K/3X4cFcfSy9+cKK/XJzqvnFHth6bGy9h+7KkrDHFqve4nMph98udBpxN04Q86
         GRXkad4Zz2c4Qa/LF4Do92gMQK+bxdTvRFtAb0gkNGuNvATWuEMnUN/UNj0IvZvBbhP5
         bGEGz+yNbHM6vkr3jE5CyvhPINjIkqEQCUYHtAVp2JTVAX1/NwTvYkU6zVeRLRcJEafu
         HPjkvGRJhipXJJ40Iv1E5P8QZiYPXoAL1enn1xmFgjJM+UzliuOGlXP1iwk/WoR7Bs0e
         VCEDMa33PzxamsUcpP+7JSob3gqBajAELa1bNa5pr2VPt/neo8fJUw3/bPeLy4znQB7p
         UI6Q==
X-Gm-Message-State: APuU4Z9F3jj8jh2BPNwh6grFs3DW008GRvyAyFbMYpQ0rYh53tmQdMpv
	0IowRiPdO83B4qA/i3v/T+F+iZp3ZjHsrLOv2cEGWbF2LzRVmw/fnxE=
X-Gm-Gg: AYBFou0gHlHThskTrmPvN2w+/MsLnMEdH4zLiXg5hFwiiwqQSSUs+08bFoXEf8yyrRU
	zWolsNpfgPEGgoviTD7XNrIvM4ZakffNilXxBa9rw8XOrPhMd97iVUgrWoWgxds72BQ7ABBrQmj
	sU3zlQ7XM8YBL7aH9nDUN7giaRQy7a6/cBZvShzhfF/7+FYAmrEMrxvsl5XsFvfKja6nOlRNTvX
	KCk05TK0AnAPB03UtlJLbigAxSd5W2ZEJHfBmK3oYfJOgYvSJDLMpzHhOtD74GJk1Gd4Bc7jTcy
	sC4UXKFqeJFiMz9Q8dEPC4V4gXdR4PFKfu3ws2brZOAz2mKNcNCP0JZB9/UoCoRcp/Fz9Lbfp7d
	e+zQgkDydqrlu7hUQwWWKHJl4XJhx6rdkK5pezEaSxUnFe8hIpbVJZC54w5HRK+HUF/aCTF6/ul
	mKyfxhTlOpgrdSx4o9gn2ln5vuu6iMQ7MiYb8yW1AEp/KPUbe+lATuezW6+y7Ck+H3d/K52bd8y
	M925LoL3ZIHbssIoQYFHafX77wnvvl5cP9F5nREOw4e4PFn+NquxFD/3oOO1jQNfvd9Tjb7tAt5
	zzdlJ5JJDOaSzou5fUTcpFmZS3O3X3Zfpw9TVZnrZUb5ntHBh8iY4jdM
X-Received: by 2002:a05:6830:25c2:b0:862:a391:3257 with SMTP id 46e09a7af769-862f09af09cmr3668656a34.28.1795034602111;
        Wed, 18 Nov 2026 12:43:22 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:21 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 5/8] media: tw9900: allow board-specific register tables via platform data
Date: Wed, 18 Nov 2026 14:43:02 -0600
Message-ID: <20261118204305.28268-6-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118204305.28268-1-matthew.laux@gmail.com>
References: <20261118204305.28268-1-matthew.laux@gmail.com>
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
index 4d0d437d02f3..95e8e306469f 100644
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
@@ -116,11 +113,11 @@ static const struct regval tw9900_init_regs[] = {
 	{ TW9900_REG_OUT_CTRL_I,	0x98 },
 };
 
-static const struct regval tw9900_pal_regs[] = {
+static const struct tw9900_regval tw9900_pal_regs[] = {
 	{ TW9900_REG_STD,		0x01 },
 };
 
-static const struct regval tw9900_ntsc_regs[] = {
+static const struct tw9900_regval tw9900_ntsc_regs[] = {
 	{ TW9900_REG_OUT_FMT_CTL,	0xA4 },
 	{ TW9900_REG_VDELAY_LO,		0x12 },
 	{ TW9900_REG_VACTIVE_LO,	0xF0 },
@@ -159,7 +156,7 @@ static int tw9900_write_reg(struct i2c_client *client, u8 reg, u8 val)
 }
 
 static int tw9900_write_array(struct i2c_client *client,
-			      const struct regval *regs, int n_regs)
+			      const struct tw9900_regval *regs, int n_regs)
 {
 	int i, ret = 0;
 
@@ -183,6 +180,23 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
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
@@ -316,9 +330,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 		if (ret)
 			goto err_unlock;
 
-		ret = tw9900_write_array(tw9900->client,
-					 tw9900->cur_mode->reg_list,
-					 tw9900->cur_mode->n_regs);
+		ret = tw9900_write_mode(tw9900);
 		if (ret)
 			goto err_unlock;
 
@@ -662,8 +674,14 @@ static int tw9900_runtime_resume(struct device *dev)
 
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
@@ -727,6 +745,7 @@ static int tw9900_probe(struct i2c_client *client)
 
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

