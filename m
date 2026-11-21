Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233370;
	b=D+tL4QH3pJWArn1C/4JaoGmKqv+wVbNzKS1F8ZFVY+KT0eBQtWeTUKiJr8uofcOb8rqJ
	 j9d69EclEmXBEpsC1BG9UwGooZomM4AYwLLhBYZ3J/q7vqCyIiII1Zyx29SzGtSuWQvQp
	 2WhBgygp+xUP46JtKujTt6fwtZl4LVic5Ca91ji46W1GKWYc4UF0xnH0p50ecpaQ5D1at
	 MEWLc3hMZA5zX0GyIiQIZ3qq0eL+9G+IDLRrfgNLdTwCg+ngKUGHtsWsWRZTHzpCP6cqc
	 XnHscWmLG5Dk3WOGFRbVs0LIFXSvH2R3x4kWISfcpvVkuP72QKGxb9sCiIgKCixs3Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JKQ9f3vNFqQ/p2IKdmnFvGUTbkyzoerNwSUU9f9lkho=;
	b=KCIPGE0WBUMt/OtTdbJ2TrFy2G4SLQK6XtpJB5x0ga+H7eRIlzfEOhIeYIo3aUfxncOh
	 ru00E7JGr5K0K+15Aj3PNNDudSLkGyq2wWLAi6yx1Fr2d8w8bD+DuOlCU9UHw1yHTVB/x
	 jrHObWXGrfNpfCgCzeIQHw0U1zfKO/NFB3popiGtlBJtQLW56lGkamK0df+YT+js9/2T1
	 O4SkEHOkAQZYd4BI1mzS3EduqXWsQLAVhDWzRnNggPMqLx5Cpvm5S/5T5tFQHQ3DoC8Im
	 8ObBGOUdwYlnOnuu5XAd8DE8BJkciYNj2SrJwoUJ3faq9QKaNNWlu8ifiq7gYVgXulg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzIBXYVK;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74C606A6AB
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B74C606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzIBXYVK
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df7f544919so964985eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233364; x=1795838164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKQ9f3vNFqQ/p2IKdmnFvGUTbkyzoerNwSUU9f9lkho=;
        b=rzIBXYVKzyx2bT/g7H6yV/0k17GfSmi3xJEEbzpShS8bvLiYExXd5tkSJvZnyfdRUT
         EDiXeYUF5FPpgYI1MZRTra+l4I9+xYd7aWd4n++ncb7UnJQjb4ZVvIY+brhpR4khkAeY
         2pyH84RZtvYagmhXHht68aQcu4WTI8/uictiO7Yk09MO+Wuf+HJKg2doiw6Z0cDeXJY3
         sqSkuzrwdpF4ViMAIVvOJ+re0EHIRS9dsTUO1GBAahznq9dQAqHbmjkndMm+dyJdMPgw
         7z/jMWGLZrx/4IQQMLBpN+rKTvHyhFq93kW4OG3J6MSO5ltwOlurHas+3cDzdalMQS80
         KHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233364; x=1795838164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKQ9f3vNFqQ/p2IKdmnFvGUTbkyzoerNwSUU9f9lkho=;
        b=G+q3f6QLWWv51zeBMaI2Au/3+dHdwwEbn5V447htx5pNfQoag+kGuFLlTOBCzdP+WN
         J5sWxoOKgJKrshYrCwre32W1QN0rFH5bGhtRIg5rPRMCpummEvV6xnxJ1zePjqFwU7Ez
         HdouGa9/W4P6TOxtbpChRDQUMJX8y6Cd8g+Wk7GQdLXqKmGodmhUYhOqCHSDptloU4au
         HMqbiln/YT3zs63aJK0RMsQ/jOK+KjhhuY/1PgCaxhPc6VyP10VKmd9N8CWH+bAha4Q7
         z76s5DOK2ULnbl8aKmByhh3KLfCU9b+8yn27lW8MYAueDbCccYcudKP7hFP648h1D1s2
         CLIA==
X-Gm-Message-State: APuU4Z83J4qHZzUzoUzZRp/1i7D0eMW3RWaH64GD5oZgYK2+TgzgE7kP
	EI8HJE/uZXll7dJokc/nN+esT1B7Cjo38s/ShyRvo9VzwMQqM3zAqUDzF1XRaOgu6g==
X-Gm-Gg: AYBFou1cgeJ3Sh0hPOj1KfXo2wPfo1F+X8cFWOY4C4SB6oyxShTli69Ck3fsvym/HbU
	U4RIs6hNadMfYI4r/ATuK6F+0Z0BlaE5lHc03D5xTQkTu+vIU4LPVarEE01rTk2VDqYs/a9c8kh
	3m4x8djjp6oAbSi5w0Sh6/jQBqU7Yo9jO00RfOEFz0XtfoWguxEHjolRrvbU+H33NBPg/+WtIml
	z8oZRuLQRojUWTgI12pQXETQxpecLqBlhjNlDqTNIrOOvBYaE8tHprp4GAuKahb0vLAj/1DacV/
	HfGqUS1QbywAy6njWPL7scVN4VEVf/fOQ1sqdwhR9lfar561+kneShPfIjyJMBAUIQz97x1rEJO
	ex3p3TZgrjJ+o4wD5/Dq5285hANDN7aDKJ5Ng2Tkzj0x6vimDRO2r5sXs87spvUMjBO3/yj7qil
	yniupS+53kEIcTboroquUjSlavmx1qWFlBjX1uhcp8ixwrBp9jt3/82A2/CT8xyIDm8wGPeh6gm
	riuh4hkdlJ46jNV/4kD8G6zypD+DRBnu5XWFVnbjzUJCy0mCb7RazVtJ/M2mZ4F1Ws9bMy98rH5
	hxNIMlbS4XorZpR07tkF70mDsxHue5k1KU5xyEvbRKj5TPlbAl2+hJzixOuKp6/UWJb3jhl/XJD
	llg==
X-Received: by 2002:a05:6820:c5cf:10b0:71a:f794:49ac with SMTP id 006d021491bc7-71b395bd407mr3249629eaf.89.1795233364075;
        Fri, 20 Nov 2026 19:56:04 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:56:02 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 10/12] media: tw9900: add S-Video input and progressive source detection
Date: Fri, 20 Nov 2026 21:55:21 -0600
Message-ID: <20261121035523.26764-11-matthew.laux@gmail.com>
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

Add support for the S-Video Y/C input of the tw9900. Also, use the NINTL
bit of the Chip Status II register to correctly report when a source is
240p/288p instead of 480i/576i.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 117 +++++++++++++++++++++++++++++++++++--
 include/media/i2c/tw9900.h |   4 ++
 2 files changed, 116 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index f4f07f060083..be939ce92c0d 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -29,12 +29,19 @@
 #define TW9900_REG_CHIP_STATUS			0x01
 #define TW9900_REG_CHIP_STATUS_VDLOSS		BIT(7)
 #define TW9900_REG_CHIP_STATUS_HLOCK		BIT(6)
+#define TW9900_REG_CHIP_STATUS_VLOCK		BIT(3)
+#define TW9900_REG_INFORM			0x02
+#define TW9900_REG_INFORM_IFSEL_MASK		GENMASK(5, 4)
+#define TW9900_REG_INFORM_IFSEL_SVIDEO		BIT(4)
+#define TW9900_REG_INFORM_YSEL_MASK		GENMASK(3, 2)
+#define TW9900_REG_INFORM_YSEL_MUX1		BIT(2)
 #define TW9900_REG_OUT_FMT_CTL			0x03
 #define TW9900_REG_OUT_FMT_CTL_STANDBY		0xA7
 #define TW9900_REG_OUT_FMT_CTL_STREAMING	0xA0
 #define TW9900_REG_CKHY_HSDLY			0x04
 #define TW9900_REG_OUT_CTRL_I			0x05
 #define TW9900_REG_ANALOG_CTL			0x06
+#define TW9900_REG_ANALOG_CTL_SRESET		BIT(7)
 #define TW9900_REG_ANALOG_CTL_CLK_PDN		BIT(3)
 #define TW9900_REG_ANALOG_CTL_Y_PDN		BIT(2)
 #define TW9900_REG_ANALOG_CTL_C_PDN		BIT(1)
@@ -60,6 +67,8 @@
 #define TW9900_REG_STDR				0x1D
 #define TW9900_REG_MISSCNT			0x26
 #define TW9900_REG_MISC_CTL_II			0x2F
+#define TW9900_REG_CHIP_STATUS_II		0x31
+#define TW9900_REG_CHIP_STATUS_II_NINTL		BIT(3)
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
@@ -94,6 +103,12 @@ struct tw9900 {
 	bool streaming;
 	const struct tw9900_mode *cur_mode;
 	const struct tw9900_platform_data *pdata;
+
+	u32 input;
+	/* Set once s_routing has been called. */
+	bool routed;
+	/* The source was 240p/288p as of the latest querystd. */
+	bool progressive;
 };
 
 #define to_tw9900(sd) container_of(sd, struct tw9900, subdev)
@@ -186,6 +201,39 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
 	return ret;
 }
 
+static int tw9900_apply_input(struct tw9900 *tw9900)
+{
+	int ret;
+	u8 val;
+
+	lockdep_assert_held(&tw9900->mutex);
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_INFORM);
+	if (ret < 0)
+		return ret;
+
+	val = ret & ~(TW9900_REG_INFORM_IFSEL_MASK |
+		      TW9900_REG_INFORM_YSEL_MASK);
+	if (tw9900->input == TW9900_INPUT_SVIDEO)
+		val |= TW9900_REG_INFORM_IFSEL_SVIDEO |
+		       TW9900_REG_INFORM_YSEL_MUX1;
+
+	ret = tw9900_write_reg(tw9900->client, TW9900_REG_INFORM, val);
+	if (ret)
+		return ret;
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_ANALOG_CTL);
+	if (ret < 0)
+		return ret;
+
+	val = ret & ~(TW9900_REG_ANALOG_CTL_SRESET |
+		      TW9900_REG_ANALOG_CTL_C_PDN);
+	if (tw9900->input == TW9900_INPUT_COMPOSITE)
+		val |= TW9900_REG_ANALOG_CTL_C_PDN;
+
+	return tw9900_write_reg(tw9900->client, TW9900_REG_ANALOG_CTL, val);
+}
+
 static int tw9900_write_mode(struct tw9900 *tw9900)
 {
 	const struct tw9900_platform_data *pdata = tw9900->pdata;
@@ -203,12 +251,14 @@ static int tw9900_write_mode(struct tw9900 *tw9900)
 				  pdata->n_pal_regs);
 }
 
-static void tw9900_fill_fmt(const struct tw9900_mode *mode,
+static void tw9900_fill_fmt(struct tw9900 *tw9900,
 			    struct v4l2_mbus_framefmt *fmt)
 {
+	const struct tw9900_mode *mode = tw9900->cur_mode;
+
 	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
 	fmt->width = mode->width;
-	fmt->height = mode->height;
+	fmt->height = tw9900->progressive ? mode->height / 2 : mode->height;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
@@ -224,7 +274,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 
 	mutex_lock(&tw9900->mutex);
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 	mutex_unlock(&tw9900->mutex);
 
 	return 0;
@@ -245,7 +295,7 @@ static int tw9900_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 	}
 
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 
 	mutex_unlock(&tw9900->mutex);
 
@@ -387,6 +437,42 @@ static int tw9900_subscribe_event(struct v4l2_subdev *sd,
 	}
 }
 
+static int tw9900_s_routing(struct v4l2_subdev *sd, u32 input, u32 output,
+			    u32 config)
+{
+	struct tw9900 *tw9900 = to_tw9900(sd);
+	int ret;
+
+	if (input != TW9900_INPUT_COMPOSITE && input != TW9900_INPUT_SVIDEO)
+		return -EINVAL;
+
+	mutex_lock(&tw9900->mutex);
+
+	if (tw9900->streaming) {
+		mutex_unlock(&tw9900->mutex);
+		return -EBUSY;
+	}
+
+	tw9900->input = input;
+	tw9900->routed = true;
+	/* A new input needs a new querystd to detect progressive sources. */
+	tw9900->progressive = false;
+
+	mutex_unlock(&tw9900->mutex);
+
+	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&tw9900->mutex);
+	ret = tw9900_apply_input(tw9900);
+	mutex_unlock(&tw9900->mutex);
+
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
+
+	return ret;
+}
+
 static int tw9900_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
 {
 	struct tw9900 *tw9900 = to_tw9900(sd);
@@ -513,6 +599,9 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 		return -EBUSY;
 	}
 
+	/* Drop the previous result; it is only set again on success. */
+	tw9900->progressive = false;
+
 	mutex_unlock(&tw9900->mutex);
 
 	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
@@ -542,6 +631,15 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 	}
 
 	ret = tw9900_get_stream_std(tw9900, std);
+	if (ret || *std == V4L2_STD_UNKNOWN)
+		goto out_unlock;
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS_II);
+	if (ret < 0)
+		goto out_unlock;
+
+	tw9900->progressive = !!(ret & TW9900_REG_CHIP_STATUS_II_NINTL);
+	ret = 0;
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
@@ -586,7 +684,12 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	if (ret < 0)
 		return ret;
 
-	*status = ret & TW9900_REG_CHIP_STATUS_HLOCK ? 0 : V4L2_IN_ST_NO_SIGNAL;
+	if (!(ret & TW9900_REG_CHIP_STATUS_HLOCK))
+		*status = V4L2_IN_ST_NO_SIGNAL;
+	else if (!(ret & TW9900_REG_CHIP_STATUS_VLOCK))
+		*status = V4L2_IN_ST_NO_V_LOCK;
+	else
+		*status = 0;
 
 	return 0;
 }
@@ -597,6 +700,7 @@ static const struct v4l2_subdev_core_ops tw9900_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops tw9900_video_ops = {
+	.s_routing	= tw9900_s_routing,
 	.s_std		= tw9900_s_std,
 	.g_std		= tw9900_g_std,
 	.querystd	= tw9900_querystd,
@@ -688,6 +792,9 @@ static int tw9900_runtime_resume(struct device *dev)
 		ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
 					 ARRAY_SIZE(tw9900_init_regs));
 
+	if (!ret && tw9900->routed)
+		ret = tw9900_apply_input(tw9900);
+
 	if (ret) {
 		if (tw9900->reset_gpio)
 			gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
diff --git a/include/media/i2c/tw9900.h b/include/media/i2c/tw9900.h
index 11e3bfe38e2b..4de03873aeb4 100644
--- a/include/media/i2c/tw9900.h
+++ b/include/media/i2c/tw9900.h
@@ -8,6 +8,10 @@
 
 #include <linux/types.h>
 
+/* Inputs for the s_routing video op */
+#define TW9900_INPUT_COMPOSITE	0 /* composite on Mux0 */
+#define TW9900_INPUT_SVIDEO	1 /* Y on Mux1, C on the chroma input */
+
 struct tw9900_regval {
 	u8 addr;
 	u8 val;
-- 
2.47.3

