Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029749;
	b=KvUGV+l5x7ODdsw+qzu26ROZqBNIGirvnIRAw+M9uLO9/+Dz+uVMlc2JbFj6Mdy5dmeg
	 2itY4ox+bElz0CznfzjpRwJrF2BH8GjmoRkfGjUNJL3HqzouoVU5SFkmvOFukENEnfIQQ
	 Z+8Exyu2qVmXkb/F12FSNtuPFjHZ0TPEr2H8d0lSxehO3LH/fG/8QfWVDmTHcdkmSsELN
	 lBisR0Ql0mnShG2GnStYTZ5RMMzNFKyUOqiWgwHXniRxMfqBGL+DRIXYSOyOPwgrUVzbt
	 AWbeqjDBuUBv0FVWyufp37sWl2IUIOCKmbHCyq4oQWlTbbFCo4IL/RL4jaXuYeQkmRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
	b=vCkoLQ4jMU863eN8HIcolAvmaeMuq2Rped3Q0bRLqSinxPfR1kujnIxI4p62twftJqFL
	 TJzQU3JNrDC/6GG0ytIzd2LsRQq8v5OZiHiHlBFvABKE6gDb2GbtuDtSGiLXdvctj6sWx
	 bly/vPjnrOvqu/UsGBNPVOG5A1ErBChywPPsydrW5dIoyno3Ba9iblXb/xBmfHUZqqZpI
	 tgPnrhRCPqs7DIvp9nN8LeeB5P9Wy9vm7YX7con0W3RlTCnCuTeldDtVprjCpDGRxBdy2
	 p4yUJDdWh+eTaa3bWAfmVsHiYaaTQWFDw5IQMybAC+5KmhgWWPrndxu0XTqpjzxwO1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiMT7BC2;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiMT7BC2
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ab5e64742so867565eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029747; x=1795634547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
        b=XiMT7BC2fEWCvyJmCFnTdRQy68dLZ+hIb+yQdsmPfCWVGAh36riCoLsLH6s/6BwBU4
         I6FW2Fi55gvaG0juJvVx1Tuq7StryhXCu3qRa0kQAxPHHL+IvwI4ZM5aQPqm+q8AExOd
         Tmmx4rALYarW6lS9W6DV1wapGWSGblPQ0gXKRmOqTYfcFhJppi0laSb2WLh4jTxIHzNA
         1Va9LoZzjBbGNGEKo2+cOtK7w4N8z6mXM1kJiCEhzDOyVwGPRHfYz4yg4wloUXSBmN8W
         x74hi6hwnEgyWHj8n3dzEdLA5CZaeP5S2JACGb6JMAlp3uQ6MWPqiZkDPjkDp5HHygUU
         U6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029747; x=1795634547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
        b=n519CjlbQ60xlnmbqM7N/JLhyZoN8gq3xzrXUFwMg8AbmJwAlwpxgtn/8OEpncXzeE
         BVmIbUSKzJSM2Sap3lhOk7rxbr9ZHmbsz2WhZOXmBnRrnAxZLSjTuuuDsH/yLcjI+fKT
         uX7jUcwnfhEZd87WCYpq9tD9AFwtXQgkpzDHoNqqsnyAm81v2k/zesjK5sS6DmjrfEQu
         0qJRGVWlXFtiA9WmHeN6TpwxHjS/FX4IOeelKuzDquDfbekuuVVepUBr5Z2JfBksuJ0C
         6yV6NB72Dp/uPcbltDiF3emapmUpbsy4PvccTS2gOzupmqG0EYNWl5flVg3wh975099Y
         Bqwg==
X-Gm-Message-State: APuU4Z87iSaYAPoG4iHRoxgkRUV1RL9Xb33SCoyAm/oS2ZUhlxvO9nbq
	c6v7jaSnv17XAYiLRsew0B/Gk/C79NKFFireDJXJLPYq5OcuzwVjFYABJp4vTRGwpQ==
X-Gm-Gg: AYBFou3xVi5CN1vHXmxEPFQ0QUBei8ErnMHV9+GTKQ4udYUOVKVOgttsrK68ktjwVqq
	bmhdcfY99Gv0cSAJw1CJiLR5l/Yo/pEHNQtEtoHKpLtV0zFWNWADKgneeMd9myApbepSaZnWxyP
	ttZgTfyxC85QtZd34q/xhZ8zn3m2BubAkLH+BqgniyglzChd/+fr/H3nv8CXaIlhmOxj1Iyesfu
	LcAeOoKmWiLRPe6GDhGmV37/Mr3SCrnxs148Kma5oznyByPTt5gfKMEUcERXA+49mi0LIupDe9O
	NwkFGZGlFZzBZzq3viR+EhoRqgSpQZjc3r/MnopslE0+3sK0gom4KVIrJ1D4eX9dXEtsXlDjX8W
	7gm74fCcM2BAYv4xWmktfx9ro+7VpkloTDVr1hmfxh1HmhndL14pjzYzl5d+DEupspOOe3OZ4dr
	5e/qgxLp0p4SpqQINGgswVQxRf/vejKlcKp7FsFxZhPmv28KJ10ZlRR0cBRzXswSrwfmEe77c8t
	XRIQV6JZ3jEdle8aRgfuSgZ726/5nGZAOg9kwBV6uatJMABdMt+VqIGFYS9Q6daC9Pcl6IWLzNH
	j5UraN61NbCA6IOSm53ly5lHAkgi4sNPBUX9j79QBxJcwwkJcylj/+ib
X-Received: by 2002:a05:6820:338c:20b0:6d8:bba5:6589 with SMTP id 006d021491bc7-71b184bf355mr1839817eaf.48.1795029747180;
        Wed, 18 Nov 2026 11:22:27 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:26 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 6/8] media: tw9900: add S-Video input and progressive source detection
Date: Wed, 18 Nov 2026 13:21:22 -0600
Message-ID: <20261118192124.23330-7-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118192124.23330-1-matthew.laux@gmail.com>
References: <20261118192124.23330-1-matthew.laux@gmail.com>
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
 drivers/media/i2c/tw9900.c | 112 +++++++++++++++++++++++++++++++++++--
 include/media/i2c/tw9900.h |   4 ++
 2 files changed, 111 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 95e8e306469f..88dba608fa5a 100644
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
@@ -180,6 +195,39 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
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
@@ -197,12 +245,14 @@ static int tw9900_write_mode(struct tw9900 *tw9900)
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
@@ -218,7 +268,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 
 	mutex_lock(&tw9900->mutex);
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 	mutex_unlock(&tw9900->mutex);
 
 	return 0;
@@ -239,7 +289,7 @@ static int tw9900_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 	}
 
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 
 	mutex_unlock(&tw9900->mutex);
 
@@ -381,6 +431,40 @@ static int tw9900_subscribe_event(struct v4l2_subdev *sd,
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
@@ -536,6 +620,15 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 	}
 
 	ret = tw9900_get_stream_std(tw9900, std);
+	if (ret)
+		goto out_unlock;
+
+	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS_II);
+	if (ret < 0)
+		goto out_unlock;
+
+	tw9900->progressive = ret & TW9900_REG_CHIP_STATUS_II_NINTL;
+	ret = 0;
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
@@ -580,7 +673,12 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
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
@@ -591,6 +689,7 @@ static const struct v4l2_subdev_core_ops tw9900_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops tw9900_video_ops = {
+	.s_routing	= tw9900_s_routing,
 	.s_std		= tw9900_s_std,
 	.g_std		= tw9900_g_std,
 	.querystd	= tw9900_querystd,
@@ -682,6 +781,9 @@ static int tw9900_runtime_resume(struct device *dev)
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

