Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233366;
	b=gbNXaPxava9EeI+A4BsKsbZ8uk6tjHqlDjU0f5+m/7Bjs7fgO1Ut2HHmmPGMfZDIhCNc
	 INPY4Ih7WU4M82D//0OYvkqrMKzdVtfOZgfN5/vc5OlAy7zTYsVcZOrg2WsQ+teq8sbc7
	 fprieshMn5ZXgSVs6WHkp+PgYlJ4YPwNZJ5x5rVgqZ6v5MfNyrCnr2FZVF4x2PIE5YuY7
	 /KdygN7pyu+N+7TZRTrgSX5TsQSXfkPBGZI4xEr/RJ4pczYzOvNS62eLoAZSBdQ/kMxZ6
	 JwAdTlix+4AQYuv6DgpJosCDETr7azLZzElvlAVRgETzpZGysLtlKkQ5PAX1gtLWeFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
	b=hbywRgipTmAUwUv488tSGyqQiLurZP6ANfgLq8RR84huKM2/kbrYY7lm9snS2iTM0+gS
	 8cV1aKaCVKIEAL/jVhbWB+TdmLvUcKMB9raGVya7MDjiNrcinCmTiyPGryF1bHffHW/8U
	 dXcceql1xW50yvARrv4TCbOb4hZq7ufGOrAN/XrjPO8pDxu5ygE5nAAsKEJvxL01ANOEY
	 c1ip9aIaSYN0L+j8M4bMyDyDbCIQwOOeIrDeS3t5s2eWT6d9VXmLD6OY1vC8ejlF04oBP
	 l707usLHbLj0uUagF/pe9SJK+FbvUBVdtJS7g2dCzJsN5A7ml6vDgVrS8gD18L8FUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ep5cz+92;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FC560A262F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FC560A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ep5cz+92
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716d052dc23so738556eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233361; x=1795838161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
        b=Ep5cz+92TdvwmctIREgWYKEz8+yzbaqBf1DfJGNDp73GdETVeVHZ4rbpGQog4JA881
         O2ODU/H0exd3q7n+sk4IUWIIVs+fecLqN5aM3d3Ynoahgn3ooaQqvqHguBAH6UM+LvLk
         qwIHDwTjPh40P0iZ0dQeUM02tyC4LhCwO4hok4bpX824sqeG7gjKb1Tbl2lcw1OBvSeX
         Cp2Hlp75pTdvKtFggMWIdod9wA9adp50vX1C4M1CzLeu2Ayqwj2tHNrqa4JEs1TJKtwg
         yhS8dYfdA6hgCBysudNQt0MJx/eWTTsfbo9NBJ7EHpk+J40fF00fVAgwDNaJjguaxRld
         G3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233361; x=1795838161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eqTUenxtATZH3mauJ4DkkeHABSU5674/8EXtC84wS8=;
        b=I9Fdt8KCQKWjy0zxlLpA1T1i0GJ8qXyrMmiAixiNSjOqkPF5UEOAUmkeHze1DtlSne
         TaQbnmv9RrXpFa6FCEMhQ1FqOCdpiXLsSdAjWq1/+iO6sWECRe+qPYhdaThqjHlP2qx4
         CaaxucVyblqRmEeFDbtnieL5MhcgUWmw+f2xUTBaOr4Fqco0REmfJ0+n+KprK9ZuDY8+
         rz/uoLIrb64v88USoij/xqfLAgzanAwwxSI9E2JW3id9mD3Zkv+efrgXA9CBuUkGW8Y9
         auP/irLw/o4hFl3hKZve8SZLIw421muUgG4AuN1EG6LWn8nZx4+vh9jji1pupbJv8iPL
         TVYQ==
X-Gm-Message-State: APuU4Z+7mAzJbs7XPS7VRFXM9ZfaYsnLKF2vIeGhKrzLzvnubEaPoQ+A
	TjAKZoB8vS9QVl/fJ+6oIIMP3vvxdvmq1aCFLc4LucLiveiPtuSluaI=
X-Gm-Gg: AYBFou1ucHLJr6rGMyCf8rkRnV5FdMZhqacTNfFD6xbsZ59H0FhRuy+6h2SyXSEnvKi
	FgPdq5Upz4ofA0su0NTOwNOVI3cUjwFk8srgI22eqaXS7XK8FtSMHkcUxqQ0IpTxog5FVgasqj7
	QK5/gf8vlgGMJUgwj1cqcscoAEIUU4oG/0mPf9P1t0+ddOfmL1wWOtu0XlyGUNv0dU4a1zoDgL5
	FeuthzCZvsGEn6pErWKIWMGxCryobQrzNC1Vp4NpMxIsG60w6FZeZyLIxq9kvlixRJt5sT2iilD
	3pMIcSQQ4PeJwuutZ7G/8gfHup2/NybOj65fz7G6/dSeYPhpC6/tkKQWNCY6zuKtAPHH69nxopU
	YtbZpuMRhhCho2yacRfTyu5VUhf2HvBTMj47HlxYtFmRrp7oQg1PE3OrOMRBvWiAx/rahpj+wWA
	tAapvPha8DLs6uukhz7rfb75K+CEMitIhwz9tVEugzAuWnVwfV8IGDRK0P9NT7BQRu1fXHgk5PR
	EyT/Iiddil8cIsH6a+/5Mpv0Zes6fAjvtk8RtioTTwODuO6W1es1F4X3RgvMRd2Hy/ZU5mnoTcL
	TgJARjKAudum/Ijae2DRNqrSIHgnJ9DUvP437aHgPkvZJkltyWnXxnD9
X-Received: by 2002:a05:6820:c44a:20b0:71a:e5de:2f06 with SMTP id 006d021491bc7-71b395bb2f7mr2870074eaf.89.1795233361439;
        Fri, 20 Nov 2026 19:56:01 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:56:00 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 09/12] media: tw9900: allow board-specific register tables via platform data
Date: Fri, 20 Nov 2026 21:55:20 -0600
Message-ID: <20261121035523.26764-10-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

