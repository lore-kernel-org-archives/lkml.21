Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821108;
	b=2H40bYTnIZ7oeXSslOSB2xuzIrNW+408RnC7h5DlsuOMnQTUl1ox/hNFIbU/fzoFcKCL
	 yTflCAo5pKJvU8eGJgIQyZ74fTyj6X2SW6UTN+Pll44ifxONvJg7ov4MCFZWlxhBEo4up
	 icPkrq1TrqADMyn7UXCNVC3TZB60Xp+wu4dQiCQnGSg8JkRK2vvxq4Jai6de+Rk+FxPUT
	 96Dk85OxZoDJJDatt/d4Cd8UPfP7/Xdy2nX5wkd0gEP9rEImR6vT8Ytjh+RUBVDSQfV2G
	 Ji+028fbw10CEBVfCnKRffVpBFu/DzrIjdPO0k2jYXcR390rlqQD2EAFwIHWu1Jnz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LUWmniYlZDaP94X7INk1CV8JRgN4A8pJTXvzIqburrA=;
	b=FLU7HmkIk9PXdR7BAck72RAqk52BtnHo6w6TuIaMXHj+3liG/39MWPwWssAQn3aVXk1U
	 CIazeQgJ3xyp4oclE4O8CeM0eoc2QnqRDQnxYAAOq0zuFB61GYqpHCS/ytWLYLYj7njEY
	 H/PnpuAnqKX260iY8EfET/GWm+S9wknggfHt0L3wlps9z3ER5ry4h+D9nZP9VUKXv5CxB
	 rsj1BN4cF3M/tiyenV0wFCWY3NYWo4AZoI8pKeY0ZLLSGN7IKAfdbiYZ6yi6oLCw/U+m3
	 1BcWYphB+z2J4uJ8ZsqNbRugz5fgXqlj+wpzDLE+fzOvUqYYH5c02nGFTxLQVpGfHew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrNCeTDL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F82606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F82606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrNCeTDL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so75172495e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821107; x=1796425907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUWmniYlZDaP94X7INk1CV8JRgN4A8pJTXvzIqburrA=;
        b=hrNCeTDLno4XAB1aTm4lSDv+1R4XyF9RlnderEX1Tagu3t4hokYLROZewUxBPvC+Dt
         /gbzc+dF8Za36a/AogoVP7/aPmTNngNFH+oDlBRJRTA+z2FRNKdhNP0mUX++5VNgv02f
         xf2K2Rx2rq9m2TJURe/LkDz4Kj1vPGblXPm1CnOhbUogM1dIAKPuUj4zkwNObQqMyHmR
         5+fIz4kX55ZaYynppeq3Oi8Moh1uoFbwgE/2yaiuJ4l/Gc+1fF5vCssv3SPaKAm1rVbl
         0GOBigv6QvYfsqW7fLa/o0szut9tIO6vz3Cds5j35+l0wlYYZ6Vcpf728CPn2JLD+gPY
         te1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821107; x=1796425907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUWmniYlZDaP94X7INk1CV8JRgN4A8pJTXvzIqburrA=;
        b=v+ddN9LZxIjfqI6BZZVZV+jjGrEVlB08bpmmQUJU/ly96+zUqOtl9Hew6IzCY31qRV
         jyvEv2MqCjYVBFyn5iIyTb7QE3rOKyrp+/UA9DRXIwhEA6yf5EG6QipDWkfiW0TrTWol
         VszLieBaeZuDCD0eaa8pBtUdfUQZut/6UfdyOt70qywWUeV2gppEh0lMHske1JjL245g
         4Y9Hw8fQuWUECgvZDJlDwEOn83jPVnRlknGbI4bn49zuX1CRuWi9sTLI5o2iuZ9xCDMn
         YY/yzxrjZO50MYtWVbstXGHtrNk4S3kJru/Fw/npBVlB2Ghk6sIQY7F7BOE099/MqHGA
         bIMA==
X-Forwarded-Encrypted: i=1; AL+hErFXIdGr4JsJuIjj4dhVb4fD0WX/WYVsPLM6kSumm0WLkmMcc1SIjRferZ1Njpr0aAsoYAmID1dQh745Q9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q6AE+o4R+mPuGDaUKlOXU5NxO2Yk3T9Ybr7SSXjiQArSLlyAj
	kDXD1Z+d/NCiMfZ6y9V7c/X42mBVs4Dm96KI076Ku+6SDUXQRbwoSQIBdPFWyJx7
X-Gm-Gg: AZFdTZdopRcS1qjr8xw85In5G3RvFb7YNo/34e5jxy+K2kZITPKfKVCiv8ooEFH7RB5
	5Z7B+KWXql/sn4XL5DTjK0jJ+1hWxnJsOo8ntAc3T0WyVSiXhxy9RT3DfFUlImFmNB30HNHilqI
	KfAXPdOXFNUKNbZqksFUWZEI/SqA+nhHuIlnLpImT6pwh2+SmxV3rO9aeF33MxsEQEAW6nkcyZa
	dGM5sasW8th4RQWckVkUKn5/qBs1O/8P8QL5ROI09qN+3i7XZqKTBwZjjiZgFlukTeDHncSXkEq
	joleFoGLUospwUsqLzhH6IRv+3li19a/cYTTOFFEbCN6TdszQpItfDlyPFBoxjwL7infBHSF6Qc
	Rwea38JvLL1I4klL64MgjlTK1qM/nv8ughMilUDc8lAVSvIxzBRsstxPNVpQWiQn2V/iOwl49XO
	R2qMD/pCanlNn04qgnICQZhNboWPSlv1YqdFWMVW8zv94pKdp4AEKOXeoqGQL913v3hn2wK9ohf
	wRZX9MV2mR9hBBWosVlgQOJq4BlZqfyMLlR3ta6eYYd2n6Vd/y83jpIJSVjEJcBN4DS6T5ioKpw
	Q/D2QvjKPngsc6Scq4VN736bhMIaRAQpKykCANX9U4XyyhMILv62+ymq2vS7vVP0rQJ5oQQMLAe
	xkeEYUpdQOhgFg6UEa+Zew4Ejv8F9dAv5MjbBB7ooAWaDRo3RIgdcYC9xLIFhs0iXbg==
X-Received: by 2002:a05:600c:a086:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb88817ef1mr545964755e9.24.1795821106791;
        Fri, 27 Nov 2026 15:11:46 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:46 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Date: Sat, 28 Nov 2026 00:11:34 +0100
Subject: [PATCH v3 2/4] media: i2c: ov5693: Write format and crop changes
 to a powered sensor
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ov5693-fixes-v3-2-bcdd169958b6@gmail.com>
References: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
In-Reply-To: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=4352;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=GQzxuTlGBx39QbJpsp8CzmHudg6Se0jD65Ot2ih8Aw0=;
 b=svXNGhHnU4I2+UFuJHyFvpGDw50K8qVZ15pHuca6IIwjyb+IT9FpTakQGQkGSsNior39BKSSm
 ryHeazNDyHUDOHc20gbfrdk2a2v01mGkFl9nUIGDYEMLfnr8ho4G2vS
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

ov5693_mode_configure() is only called on power-on, from
ov5693_sensor_init(). If the sensor stays powered between two streams
with different formats, for instance during the runtime PM autosuspend
delay or with runtime PM disabled, the registers for the second format
are never written and the sensor keeps streaming the first one.

Keep writing the mode registers on power-on, and also write them from
set_fmt() and set_selection() on the active state when the sensor is
powered. pm_runtime_get_if_active() is used rather than
pm_runtime_get_if_in_use() so that a change made during the autosuspend
delay is written too.

Writing them while streaming would change the readout under the
receiver, so refuse format and crop changes on the active state with
-EBUSY while the sensor streams. set_fmt() and set_selection() now take
the driver lock for the whole operation.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Link: https://github.com/linux-surface/kernel/pull/181
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 46 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d221f7951..3cab73b89 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -168,6 +168,9 @@ struct ov5693_device {
 		unsigned int vts;
 	} mode;
 
+	/* Protected by lock */
+	bool streaming;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -832,6 +835,27 @@ static int ov5693_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+/*
+ * Program a new format or crop rectangle on a powered sensor. A sensor that is
+ * powered off gets it at the next power-on, from ov5693_sensor_init().
+ */
+static int ov5693_mode_update(struct ov5693_device *ov5693)
+{
+	int pm, ret;
+
+	pm = pm_runtime_get_if_active(ov5693->dev);
+	if (!pm)
+		return 0;
+
+	ret = ov5693_mode_configure(ov5693);
+
+	/* A negative value means runtime PM is disabled, with the sensor on */
+	if (pm > 0)
+		pm_runtime_put(ov5693->dev);
+
+	return ret;
+}
+
 static int ov5693_set_fmt(struct v4l2_subdev *sd,
 			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
@@ -845,6 +869,11 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 	unsigned int hblank;
 	int exposure_max;
 
+	guard(mutex)(&ov5693->lock);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && ov5693->streaming)
+		return -EBUSY;
+
 	crop = __ov5693_get_pad_crop(ov5693, state, format->pad, format->which);
 
 	/*
@@ -877,8 +906,6 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-	mutex_lock(&ov5693->lock);
-
 	ov5693->mode.binning_x = hratio > 1;
 	ov5693->mode.inc_x_odd = hratio > 1 ? 3 : 1;
 	ov5693->mode.binning_y = vratio > 1;
@@ -904,8 +931,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 				 min(ov5693->ctrls.exposure->val,
 				     exposure_max));
 
-	mutex_unlock(&ov5693->lock);
-	return 0;
+	return ov5693_mode_update(ov5693);
 }
 
 static int ov5693_get_selection(struct v4l2_subdev *sd,
@@ -955,6 +981,11 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
+	guard(mutex)(&ov5693->lock);
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE && ov5693->streaming)
+		return -EBUSY;
+
 	/*
 	 * Clamp the boundaries of the crop rectangle to the size of the sensor
 	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
@@ -991,7 +1022,10 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
 	*__crop = rect;
 	sel->r = rect;
 
-	return 0;
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	return ov5693_mode_update(ov5693);
 }
 
 static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
@@ -1012,10 +1046,12 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		}
 
 		ret = ov5693_enable_streaming(ov5693, true);
+		ov5693->streaming = !ret;
 		mutex_unlock(&ov5693->lock);
 	} else {
 		mutex_lock(&ov5693->lock);
 		ret = ov5693_enable_streaming(ov5693, false);
+		ov5693->streaming = false;
 		mutex_unlock(&ov5693->lock);
 	}
 	if (ret)

-- 
2.56.1

