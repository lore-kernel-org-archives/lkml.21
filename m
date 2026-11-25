Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604915;
	b=aI6Wz72uRkKwwh5qcwbakaRLcYEv41ji9o9FZgi7OjeR579QT+fwej6kLg3hzrvBVSwM
	 Swo4pA8cgBPpXf2mKLJALJY8e7gVzl++rut2kTcIc/oox2cKCFHkGg1OcmEja+MNZkUWY
	 P7YB/zauVeEkLylJreVs6gNcOX+cbkJlCurbt03+bGa9hEBGcxTYEt6uqQOD80AiI2lia
	 6TcabMaVJuJbgn6gysOBj3/9CmmyiH2SgE65IBUkqMHBGLCfnHUpp5+c1o/CiRSezVQ88
	 lT3EK11w77kMIBHksUjn0WatY4+uTjoqj7Y0AIAESV3T6Iwg8Jr+LmJ+CHTNlTP4eCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
	b=PBub7XfygdX+qfjUf+clPeCboIuCCR+N2G8fAheBRaL5P9dIz32k7QnQHd1KRkuPnAdS
	 SLEV70cC/7P/DjRC7GeeRSdshwVt0PR7ZkgtAJVxmIkT/RsZrJmjWXlN73lFjJASiVtlc
	 FLtsWoTOazxXbm4QkhUPxJGyTxWfG3JfLHF3ChH0LxAzzJQ1h7lSTJGvOwJm7iKD/6efc
	 vA1k9FFkdX9L9a1KCTMXVitxjVAZ0FrdywRqmvgV5rkqjtg1zY11PxYjlSXmmbJawZmFd
	 pUZO7y39XmrGgcjbpAhLJDsjcXE9CHC+izGUBcDG4/6zKIrlv90p3JDVqiwzKLklTGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0bNxsSA;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7360A2625
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B7360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0bNxsSA
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c511c0e2826so643086566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604913; x=1796209713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=i0bNxsSAPplSF+i2uVIupdpJeDL3eQwMimBa5SA/vIBsjUjtyplTG1IbQi84i6RNzn
         eNJXmub6ECz8KADD2Z613PQxYJ8exBoXN/Q97KmKMinzdBrLUFTknRMnPhZv4RFpE0sV
         gx5IsxnFZnMjvyNvP3qTVrrY/R8egr3FfytWbFARFy6gtcjtbi9r28PraAtW78aSLXxp
         HeiPDwzxwYh06EvSFUxA7d/gfL+vgM83dM6YSPsCr4DWO0m+h6boQKpSwYHTJM/0EXgr
         1yh7WOfJHhnNXICMltD52PM56luCEKeJeNCnd2RGhfIi6/d7kBiNT3qVwvWErFuduhNS
         Z6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604913; x=1796209713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=KqBeTTtbJ9Ty/hGjjkStn76zFXqwhH0gNjL+nRZvYYYiVJaqOv/oG/Et1CZyQhQ7ut
         hHVRmabiIg1Nn5dbAXgE77ovLIVDHhikLqpdA0NvM8Af+ooVJyFKbsAcaZFmtiiFPu3x
         jqyYRJcBQ/+JdpeKSNKmiw+4Q1iYYySGGaSSz71XVRx+3W/cSAmWvimlkbreeJ3FettM
         u3rv34OmefMv5alXB6eQCcDHGkp+cq6CgfMU201QjoKeJ9xLmE1hMjTikVxxUuXVuRnH
         p6BCBmd5AIO8kLUZO7buscWo8fG8iJYC6BD4cBkvXm/68qmpxy4azeu+pv7dRB7QKHJQ
         2w9w==
X-Gm-Message-State: APuU4Z9yQaOq+i4ueh/I+4czb1pueb+AAbJ5fCg0PU5Y5hpfuF8PtxUm
	rDhNlTo3/wcOcudjQPBNTFAImtfynHyxOnJKXB/UgccHRZ3V97bcCsY8
X-Gm-Gg: AZFdTZetjhWYY89tlH3BAIE5teorhb4E7KWfYBAHAYvYnxMT+il2ZPMMwsghfl08rXY
	d3GeLFRu5Z4lyQ3d1ynk0/tU/lCC50oZnn3TlsOCz9sRUvG/GjMmTCTl73b8sqpqEJIgvzG1rLj
	Ed4F++G48JF5+furnhN0EzZBR3SM3TayMiTgbMKYCtwcWgvE/JIWIM3YOFOKE52G9u7tzfNGlpM
	WBeyob/1JdyZHLL2oOBesqslJxV9jPnvsgrm2uvHRp6zTltOTpyFU5q56RhxXNEb4LglhVmU693
	0cKGbGjyEnQ/tqXNsdWx8RDyAf1Hxv3uIzETAR2VdwyjG9b73bkHYvtCfOPt8k5e/7uSCy+CTF4
	2PF01GkQ0uTxaSo3hWXdhGmoHI4UMwyaJakj+qVkWUVpAZpMTG7dwcN7nhurDqnc7p/zn/I2XDf
	moZ3U1OdaTi0VDU4+cRDbrA3c3DcWXz2F+LTvQRum316e5VgXZRZAZ99MpWLKCFI+6kf72aypWO
	PxN22wy/oqx5DjOG99FQIVtZUaF0yP/Bmf9SLENEsHExvbihBa0QAc38YrSoFbetpKLqEumYY1S
	9G30aQx/TsooxKp+M+1luSNd2ELOO7g+ztxfMSfqfQ9GRYfy+YAh21uZ0LW33XghmZVS9cZLPLB
	bEnZUgyEb5w==
X-Received: by 2002:a17:907:c641:10b0:c42:e6c8:e494 with SMTP id a640c23a62f3a-c513ab47855mr991039366b.37.1795604913063;
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 09/13] media: tegra-video: vi: Configure capture format locally without subdev calls
Date: Wed, 25 Nov 2026 13:07:46 +0200
Message-ID: <20261125110750.223628-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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

Simplify __tegra_channel_try_format() and tegra_channel_set_format() to
validate, align, and store the capture pixel format locally on the video
channel instead of querying or setting formats on the remote subdevice
and allocating temporary subdev state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 81 +------------------
 1 file changed, 4 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 4a0742b514a2b..f2de3aeb05bbc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -340,82 +340,23 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 				      struct v4l2_pix_format *pix)
 {
 	const struct tegra_video_format *fmtinfo;
-	static struct lock_class_key key;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_state *sd_state;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_selection sdsel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = V4L2_SEL_TGT_CROP_BOUNDS,
-	};
-	struct v4l2_rect *try_crop;
-	int ret = 0;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
+	struct tegra_vi *vi = chan->vi;
 
-	/*
-	 * FIXME: Drop this call, drivers are not supposed to use
-	 * __v4l2_subdev_state_alloc().
-	 */
-	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
-					     &key);
-	if (IS_ERR(sd_state))
-		return PTR_ERR(sd_state);
 	/*
 	 * Retrieve the format information and if requested format isn't
 	 * supported, keep the current format.
 	 */
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
+	fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	if (!fmtinfo) {
 		pix->pixelformat = chan->format.pixelformat;
 		pix->colorspace = chan->format.colorspace;
-		fmtinfo = tegra_get_format_by_fourcc(chan->vi,
-						     pix->pixelformat);
+		fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	}
 
 	pix->field = V4L2_FIELD_NONE;
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-
-	/*
-	 * Attempt to obtain the format size from subdev.
-	 * If not available, try to get crop boundary from subdev.
-	 */
-	try_crop = v4l2_subdev_state_get_crop(sd_state, 0);
-	fse.code = fmtinfo->code;
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
-	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
-		    v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel)) {
-			try_crop->width = 0;
-			try_crop->height = 0;
-		} else {
-			try_crop->width = sdsel.r.width;
-			try_crop->height = sdsel.r.height;
-		}
-	} else {
-		try_crop->width = fse.max_width;
-		try_crop->height = fse.max_height;
-	}
-
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, sd_state, &fmt);
-	if (ret < 0)
-		goto out_free;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
 	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
-out_free:
-	__v4l2_subdev_state_free(sd_state);
-
-	return ret;
+	return 0;
 }
 
 static int tegra_channel_try_format(struct file *file, void *fh,
@@ -439,10 +380,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev *subdev;
 	struct v4l2_pix_format *pix = &format->fmt.pix;
 	int ret;
 
@@ -456,16 +393,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 
 	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
 
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
-	if (ret < 0)
-		return ret;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
-
 	chan->format = *pix;
 	chan->fmtinfo = fmtinfo;
 	tegra_channel_update_gangports(chan);
-- 
2.53.0

