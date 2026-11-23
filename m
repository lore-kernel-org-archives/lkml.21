Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466056;
	b=lv5qJSW1f+ar4F2JkE2p4sZvzl7d9wl6zJ7ofx2w30BRzYjGJvl1CFHpzDEJhE4X9BbA
	 rrB9Iqf853kex6x8OOB8vk0kKVwzSYpstlI3jnw3kFVzBDBRX8msT6U87X5kkVqXM/sQ5
	 ZHtIGb5i8V8ZlZev8tqMHGeHIeTEH4mjL9B+7wsksnx3vp1q/swtPleCf9lhxT37ZAABV
	 CudBG6n1Y5OHL5LOvQ6N+KKXnFuuUSGOuPUJHaT/ZM8G0i6TdQrugFb+f37zNkXyYuZOJ
	 kD8IrxXgJYjmdsP+BX9yrDWnnmm23Fh65gAzbsCssLsoJ+bK+GLBnalrTqVyIiHwieQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
	b=5tDrsKIdlhHOrl6HE0bx8MVR+oiIecngjxdjIe6MO2Iy5gSbIIrJAs57MDIt1p9r/6qH
	 KasLr8LO74mBHWXtuY1bhOM/R7/D+Lq8zFttwrUJ8eNPKRZBHB+TLuAF9yg7R1GqToxlH
	 +IdasUG+K2EHdmLiK1IbAw0yc5GGpwn1c9Sx8FETLdSDZA/1W6wxnXO1TB7gCVuzolmiA
	 pyOcg+YvG5dIRMycMCOwX7DEDsplbG8ywRvCBHQdTv1J/LOyJ3FWRFXqpB+CuIk5+qzxf
	 zvHPcUXXsrQ1+tGGrT4rsBeRX00L00eJQj/+o8Nmg3P8Eeex0Msyb5TEPgfcinNpirw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqHfWJa9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3148606A6B5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3148606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqHfWJa9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so47668955e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466054; x=1796070854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
        b=eqHfWJa9Wea/Fb3/RD4KYoNZlniZ37XLDzgSuVOIwm9447N4+odJLiA9+zkUe8O7X8
         pK0pzNZwfoFcU2dNJid5h6+dBt/TBAwVz5J5T6E+Boe72nNC8S/RYIm3Egeli4/IEMgA
         kMjdkocnsr/jvd8VxembzJJFNYf+KCwWAEdQP5wt6SiDf20JnQi1dTcd+XnXb/P19sdj
         mlD2MvXC8CBGvpHU3jm2kIMGANo69DZbATy6WMiPUyFHx4o6VMlPn0bU5asxKS4JoHHh
         SRDGprAGom/o6GTtJv7uVF3N3HmCr5Me8w2SGAictAeM4pxXxdh5NZwEa1Iqxd1MlJ5A
         eZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466054; x=1796070854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
        b=VEk09YUmf9W3cACSq8O8QBtmuvGJHiKusb5dCKLZ6Rbl72TyUdB1ZzfJu1BJdnWNUs
         nWM1dV9UiNFhUZ8LJGoXyupWjXNP8dG4LyxfZCrlQSOLOFa0L2JhFfC7i79aE9aFP6ue
         66BPdSn3t2waB+4YuP/qEYBE8QurObvyfbwD7G/YCgGPHl/IlS1dWNkRan4h0JpLUi5u
         8zOhGVTeLwkbQAkmWSGxfl+p02COGgNbnH/hvEgJndbk/MKv3LlIU30xquoKVA5RDuH6
         RnfR2tgg8baeIu3M0bI++/8NpYjA0FO8jOFf1tF3p7RaeBXwWqC9P7hGrUvnnbUS7vxQ
         nelQ==
X-Forwarded-Encrypted: i=1; AL+hErGywHmxvHSdnVtUrUrmM2HdPjgFB8XvaUhaa5ecfo4t2Yw9T1Wkkyp2sOVK6VpDrhZrP0jDjOIbzXkwZPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gP9t+MetK1PItp6EiX8/QSyMGr96EoIU9l6nEbdIuOZ6FCv0/
	D7DrpkImdk5fjiljd5L8WeG/Ug6lGcK60JCi6Ye1LiOwdAW/KKboCJpm
X-Gm-Gg: AZFdTZeqt34Z2b35D8duMmTtcPla5D0t6R5Jtez0ENpyI0wgYM53dasI7xVtNHRMs3E
	jKCGF1PgbprH47DPezSAw1U9WJaFa4SR3/qMcyj0lNld8SHfRAbAayEfKI7h6ev7ZMcp/fbilYF
	i2e62hVKwueciS01rhlXGTvqDHRKr+9nwgxQnhfubEizYf3U8NMJBQdaq0ywZv2I0f0PTQMyEQI
	aeq3MGEXj4JMpeZIiIiZWprns4pZakc0KQ4ij/33XEuzWqHQ2TpyvgSNPfIhGynrUJYNUev+963
	4me516u6VrYeY7zYirkbMEN4vI+YpsqJ9eK/C3iRw56vS/78sAy5AEy+IrXzVt4SaYyWmkUKeNT
	oIzigLjVym2FsJyK97vaCMNaBnh4q2mRZp6+kTBixefzhQTuV5s8kE1bvryEJpaQ04svGDIV1GB
	BGu0JAvYTMPcCu0eJFVI3QJF2rvj+ec/v0dQi4RlyXm2r1KtdiDOT+exZ9j1/ioIN8lq+R76nd5
	s/yWpcmL7RNOUAVT78svOR/AybHulFmvXocia3oNZHTGn/+MkzJaN/NWT4X3yXaydegr0BmgyMR
	QUB64NFiA0AC/0Hlk0G5c6qVTAsTDX4=
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr256814445e9.1.1795466054054;
        Mon, 23 Nov 2026 12:34:14 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:13 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:56 +0100
Subject: [PATCH 4/5] media: ccs: Make the source pad format follow the crop
 rectangle
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
Message-Id: <20261123-b4-ccs-imx376-v1-4-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3197;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=AfhBJJT/dYmW+sBV6vyFvVaWagbgV6JhE5LC9kE6/9w=;
 b=nA+mPZum9SfgJ6ZaFHnBsjvxZSARCOiB7wSvuXdYHv0c3WlskBv1F9e4K0z64Lp5zVi/LfWCS
 bsfvfP9bsrpApXIBaGZJ8QAEOn0BW8kIsqyx1hwoN5rRmPBZz/5icF1
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The size of the format on the source pad of the pixel array, and on the
source pad of the sub-device that is the source of the CSI-2 bus, is that
of the crop rectangle on the same pad: the analogue crop of the pixel
array and the digital crop at the end of the pipeline, respectively. The
format was only initialised from the pixel array size or the compose
rectangle and never updated when the crop was set, so after setting such a
crop the format did not match what the sensor outputs.

As the format of a source pad can not be set from user space, and the
format of the sink pad it is linked to has to match it, link validation
fails with -EPIPE for any crop other than the full area.

Update the size of the format when the crop is set. As the size of the
pixel array format is then no longer its native size, use the native size
as the bounds for its crop.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a4af27de5453..acea07d906f3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2541,6 +2541,14 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 	}
 }
 
+static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
+{
+	r->top = 0;
+	r->left = 0;
+	r->width = CCS_LIM(ssd->sensor, X_ADDR_MAX) + 1;
+	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
+}
+
 static int ccs_set_crop(struct v4l2_subdev *subdev,
 			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
@@ -2556,7 +2564,9 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
 					     CCS_STREAM_PIXEL);
 
-	if (sel->pad == ssd->sink_pad) {
+	if (ssd == sensor->pixel_array) {
+		ccs_get_native_size(ssd, &src_size);
+	} else if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
 			v4l2_subdev_state_get_format(sd_state, sel->pad);
 
@@ -2579,20 +2589,21 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	*crop = sel->r;
 
-	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
+	if (sel->pad == ssd->source_pad) {
+		struct v4l2_mbus_framefmt *fmt =
+			v4l2_subdev_state_get_format(sd_state, sel->pad,
+						     CCS_STREAM_PIXEL);
+
+		/* The size of the source pad format is that of the crop. */
+		fmt->width = crop->width;
+		fmt->height = crop->height;
+	} else {
 		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
+	}
 
 	return 0;
 }
 
-static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
-{
-	r->top = 0;
-	r->left = 0;
-	r->width = CCS_LIM(ssd->sensor, X_ADDR_MAX) + 1;
-	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
-}
-
 static int ccs_get_selection(struct v4l2_subdev *subdev,
 			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,

-- 
2.56.1

