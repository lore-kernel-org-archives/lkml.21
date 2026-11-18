Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034604;
	b=0+O2jESBMq/yoyzawKMns8cg/bZ+m56Q1SuD/rpRnb+Oq+HF3FGIOFYaxZVIUqa5epwJ
	 Q4kWYFlxSyTMpoLHF5IVHKjCmB8psAcSpgB/s26FQmSxAHv6Y4tbqAHj9mmBvNchyWtb7
	 oZJqUHA764qsC3YOsISdYE+RxsFZeasaERquavt4QNMtOaGWq69UJw0136jhF18yyDJao
	 kHVZUbYVHLVCBB1i118qHTeZLKNObJz0IMrK3G21bG+p3iBEtz4hoDtJ0qBTQ0ga8q+hF
	 d1SV4tfXGT6LL7VvZeFwxn3FcwdkAD9es5bQBj6qDh+EbCyMwy8qaxnVs53JDy5MeZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
	b=ZKhGM94DVyE7r8l2loyUboI6NYgxUxvC4CCCcIlfuyJ8UkG47rDXMCiitF+JH8q24XYO
	 UM7a8TDYxXJGov46RB4mFccw32JqYEYmvfLzy2qa05MR76kp3XAqOBi8lAV+Vcaks3H+p
	 IY4av6IglCUM/1nrYt+WPiUsGpwIdPjrNnW0vpmK1SiTnYx8rVz60LY/P5C2JlaT+bcMS
	 Zj3LTrBmdNGTTqLwcpyj9Zz+RwOeR82TBH/0z+UINQacWuLi1NNwVO/h1vWYKYUDZhYrT
	 NLxtiSlBLiuVwavp0PYJHNmfxdLW56F86ua+528KpfxbIVW7Rg8WOzBXHdn53DKSnNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yqp1rLyG;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8EE60A3834
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8EE60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yqp1rLyG
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716b58a4365so868486eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034603; x=1795639403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
        b=Yqp1rLyGCqvC3NCV8iydxMOjVsSVSBsMu+0C8wW0x68M7YSfdr9G8xXDQ62vBWoewx
         F5JNo4T1CJixeLjlblnPhOPXZyE7DGCVK4VV6KWuRYfMYbPx1kCzvTy9vTU88NE5NgCp
         PhlLKqXLHFQo7FzOVnFSRR1ELCx0ryEisgEzhBJ2iT5veuglv8FbBn263PPHZCRcAdde
         dXX0gW7FgDJBgvpoDfw+8ekbjrG2LMoZtZvkjZs+mcNfNhNcMqVpgmN3JKwYFNar+eeD
         a1oWG5epqBYfGXtNErvrZH8kVmqSxZf858K0aB2hSjb2vKvuBrOilDwAMBWtESykGtYR
         3YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034603; x=1795639403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjQKOjoi0YbVdKDaXTUg0ORZjwXbMMCDyN0aPYFrKQk=;
        b=2rU89Yg+4MkqflBurJoZHOIIv9z54eqWrMZrK56llvOdmOZzwAhWSglezM1V1/X/0R
         DOcysY1PtGfPVohEKrL8VtUKrvEHl7SkA5niOJqO9/pKsk3wzZ8lJkTbDAbvDt1btJMi
         vBvItxnVFSLQS/nIdN3cnVrzLeRpZcrrljUcFSY61CdiXVYGqcPvort6EbZCyrTMwx82
         i18w3uwJhYbIpPB3quH0rlh9K9lDo9BeysFqgVUmkLSoqaNwaHMLwt5IUBPgh1lTl//B
         6JPYzmJzh/Cat5aInn0XyZgvWFEknnX1atwK/NRwPdzFyFhpndRyXVtEeUXZh2x2rY+c
         2yrA==
X-Gm-Message-State: APuU4Z9iGhXPYPdbuLv2pEQI1lvYj1eZijr1rqhmk0PFEX2XW7Miqy5y
	akDJIcomBx7z+wmcaGtTTN68vmasbbLOTe+6Ss8I+bM/rEkr0JEPu4g=
X-Gm-Gg: AYBFou1lcXhnJDvdQB6EnUOpJCFol5LW84YgrpxwtXG2kAX5nnlGdl7MZPDYig6MI9t
	ZEy5mUq98L3HGQzudEkK3SJ/i+E3qWNAs3rMU5gGQUO0y4nOaWGoYW3uIwumgHz7et650RKtEgy
	gLvV3pH6rpvmBGO3xbDgj3r9K6rz9Pwdoz3QZROg2WZ5vWnONt9UeTrC5OWaUK3/+POqwgQkGY7
	YD2MztckYtsVWJBd8zZyhCAHY9zXPs/X59B8TaR8ZFLqpsNzqC2ghLQH5JYZzIGDM0ESHLQMfDF
	3VTgmumv8plkgqH1q8sjxQobFbzAXfx4fXwlJFMsyp6tLbPVqUl+pYpMCykZoC4F2KGjXvQsz6y
	Fkgy6SbvXkNKx70FZUbx6cqH0e4m5RE8wu8TmPICjkmPlDak09lS6dOX5v6xwlaW+21W3MXFpaa
	e2bk4/paSGncRToRp/jXydWtXCoAorQOeQVQRo0hqHuDhc6ztUasAq+oV5r0NDuXWseDhSIKws8
	zHetCPFdFM+NOq9BX+gpOAase8JKL0WrQsHjufcoLbL2vsnxtWl1USZX2Dsp3YbEqUuaxTLGRF7
	p2DhQ6aXTmX7P1woEPRBzMA6YBzAvfqooyZFRYSfqUU4k8BQYn4YNSWsbQ==
X-Received: by 2002:a05:6820:f02c:b0:71a:dd18:a860 with SMTP id 006d021491bc7-71b18276ac3mr3086639eaf.8.1795034603226;
        Wed, 18 Nov 2026 12:43:23 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:22 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 6/8] media: tw9900: add S-Video input and progressive source detection
Date: Wed, 18 Nov 2026 14:43:03 -0600
Message-ID: <20261118204305.28268-7-matthew.laux@gmail.com>
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

