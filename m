Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636268;
	b=w8/jUYUrSvwgEIEvua33jU+sCb5mMztIHlHAUOs5OOr3os4ctbLxZY8BtcoPuyw0hKKc
	 i2gxQSyqk8aiHTReF4FD/QS/ilyx4z6XBWGQKRFk1+2+nu0SXxIuSah9tc8hfOl8eEeqD
	 s1C+pu5LQYn1SFM0PHOq6taSGAYxJsQvNguK4jKbUPK9u8mzPMtCbLP++5aKDdYORWKjn
	 grscYClYn+ruquxg/v0y+mUeKWYOYa4YJAmHYCXVKL/c0sdfs3BnZa20ej0/MrvYiXd6k
	 Ubt4L35Ckdvsrgb4KfVpb68fGTOJET43EqkrHMfOEcoSxsVA9g8nZZTzvAryWJHwMFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psqHHNogAijzU4ovxDdhAiBJy4EcIWwdu5O96XVgXRg=;
	b=Gofvt2AD+N46rpwrcLweB5ybJkg0khPwfUkqxJu3J/3yCQ0fCrB67zTg/msys+IkcfAS
	 08r3DhOjahJ5WN6ncxDzdg3DvuJn3vsx5eIv/clS+g43+q1rF+ChPTyVxmyPEedyAnSpv
	 hZDFmt2mswguaI16ch0UXKMLEkvTBbvNeHrzC7wS+rmfBg+y8Q9+Kf97xrQamAu515QrS
	 OOHLMNnPgZaEVwKDbZjxmBe1H8lPb7a3xDDvtmfWMCxgeOTkvrSLxj3D2Y73Bn47tKbJo
	 hx46ikhBDQ9NTFcVAeN9ERDwDF/3PYmlaSmQoa8RsKpmuAlw0KdqEFM14XnqYKbQf9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgNwNrrp;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F728606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F728606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgNwNrrp
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-847ac7ccd85so3564820a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636267; x=1796241067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psqHHNogAijzU4ovxDdhAiBJy4EcIWwdu5O96XVgXRg=;
        b=RgNwNrrphB89S+Jif55BBZ2AcpLPz7JS/m1jb7tf0HJTg1r5FFYyPZIOpDbc3XJin9
         7sEaD4ngZ1+f/NEIiZ0vmNai8QRveJ15ilFYR2+XLzJxauGjIVVgwfk6Ad7m4u2UxxMI
         xgrfoyRazc42x03+EXZCH4PlksnXWtR/CGc9foM8rvnCvhRRrqyHU5I9ieNV8eNQ3f02
         Qd2gvqNw0A6H8c66LuOb7Dtoyn4lA1eh0zMRvDOZhrHoXFN54WMmO7wbAlJ/gOXVetfX
         cteM6DhZu5tPH4TKsIsbRvsnb2yu80e41H3M3aXFUkUbfOSjHaMKUtq1TX7Et6WSaXk7
         a/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636267; x=1796241067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psqHHNogAijzU4ovxDdhAiBJy4EcIWwdu5O96XVgXRg=;
        b=DjWAWrnjjJPEVUcE64APSrFbc9GmrkTX/YauxOpT5genqtxvcoxOcAQXkv1hTXaSWn
         DPY117PNez4i4AbTywV6O0Dks1gw+VTWJDwzJ1GCPqaQvj7VjCB7yYe7gOHTHOcjrS+m
         Ys8MsAZMCkYnBHdSST0UKKZu9V4ckf/V8aiCsI6cPS+DJW9mvJPeQ+U3SSX9qvS4gDoa
         5ez1qEy08V5sjqOZVksR258chlTd8XXbWxQSEGT/BAQVhQZW6nyAosDDcKVs1v06JFi2
         HgsVeTDT7h2DFqA7KQwCTiaW3DPFrMPlLI+NmGaOJit85t8wmY9UGiZRPfUhM8DB9Xmo
         XhZw==
X-Gm-Message-State: APuU4Z+pZg/4ze9hu4LADUsbo2e/KBshOmPmVSllKllJHBpwNicsOEi/
	C0KYkeJfL4qX9UCBWvFnJ7jSqxDxPczwlBXwRMTmcElrZGPUDe4Z44oir5R3NrvqzA==
X-Gm-Gg: AZFdTZehgECfEbIxBofyjztmOC5oXkgbukQLf5zODKX/12a352bd9kGiVFbQpZyFPQK
	0MTgH93vZrAyUSM05R3xmolHcZSnMVQqOu/hXKW1mTvaNfO3kQVWax/Ayb9uvz2m/gNv+r93OFc
	tyMlhpFNznh+9Bl3y+pBSgcUTOHIC1nC14JBo/fJkozMvD4gxMOPjA83TMr6TmeGMJoZQ532WrO
	KV2W9NWwUDuN6+t/tFSkjn3nuiuqcbtA45wYY+qsj5yaISR+0nrlnXUAJw37dwuN9FsLjXDfE1F
	3XB7gXM6DxPUi9xw9DzIDQlBhjqd1+t5NqhfwBnh2rliakzKrh5ry8dhcGvSjMKK9RbtMcTnZ9T
	pI7wNSzGmdcj+/LGQDeVPKTp+zv6MFhrFY3ATAC0HRSu3TL34BIoE8Q1NnCUPrGH4q+03+fSxWg
	rBwCr7e9ZlsjkEcLVWKIHNSoCjMb/0KaqwIKAR4Ugo+wNwia5oitYolOgQkkcKw/kPWx1fT412x
	pfNJ3n2guXiCkzcOXhAhgGkLmA2qHGbZFKlkREuT1edn2H4icfO4RwDARgD69iPwiMjh/4dTUWD
	6BMU4jZR7ZFkqwJPb2W5F07iwUHBMkHnGAZXk7MMNdG7aueWq8MgaTR0DcwinPA7Hg5FhIQojHz
	9SA==
X-Received: by 2002:a05:6808:1908:b0:572:8f69:6b0b with SMTP id 5614622812f47-57a0a927ff3mr21319492b6e.25.1795636266863;
        Wed, 25 Nov 2026 11:51:06 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:51:06 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 10/12] media: tw9900: add S-Video input and progressive source detection
Date: Wed, 25 Nov 2026 13:49:49 -0600
Message-ID: <20261125194951.19072-11-matthew.laux@gmail.com>
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

Add support for the S-Video Y/C input of the tw9900. Also, use the NINTL
bit of the Chip Status II register to correctly report when a source is
240p/288p instead of 480i/576i.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 117 +++++++++++++++++++++++++++++++++++--
 include/media/i2c/tw9900.h |   4 ++
 2 files changed, 116 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index f4f07f060083..64acfc4d0499 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -29,12 +30,19 @@
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
@@ -60,6 +68,8 @@
 #define TW9900_REG_STDR				0x1D
 #define TW9900_REG_MISSCNT			0x26
 #define TW9900_REG_MISC_CTL_II			0x2F
+#define TW9900_REG_CHIP_STATUS_II		0x31
+#define TW9900_REG_CHIP_STATUS_II_NINTL		BIT(3)
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
@@ -94,6 +104,12 @@ struct tw9900 {
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
@@ -186,6 +202,39 @@ static int tw9900_read_reg(struct i2c_client *client, u8 reg)
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
@@ -203,12 +252,14 @@ static int tw9900_write_mode(struct tw9900 *tw9900)
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
@@ -224,7 +275,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 
 	mutex_lock(&tw9900->mutex);
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 	mutex_unlock(&tw9900->mutex);
 
 	return 0;
@@ -245,7 +296,7 @@ static int tw9900_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 	}
 
-	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+	tw9900_fill_fmt(tw9900, mbus_fmt);
 
 	mutex_unlock(&tw9900->mutex);
 
@@ -387,6 +438,41 @@ static int tw9900_subscribe_event(struct v4l2_subdev *sd,
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
+	scoped_guard(mutex, &tw9900->mutex) {
+		ret = tw9900_apply_input(tw9900);
+	}
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

