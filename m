Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204547;
	b=gyro8xxB9nwj3Je3WTjRKK3cNZY7syahlsXy1S0XU+HGOgL4G3HgvD3LtC3ej+m6NsGu
	 x8onIt50jWXfTlW+dh+Wt63XTWzf+JIjR36nMXSIiIue4ms77BZBT6yo1/4vLkD0K7wxN
	 DEq8PY/Aoj+PLTkPDDfIqXxwnMLL0BGcKUPUqlJ9/aUqS0DLDKVx3KHqxKaNdP+5fW/l4
	 klg9b9zu9olHwzZmx3VfmMD8mnKmTVwSniXqlgBPhYfJSIaXl++mOMznPLXJPjoHAlkAS
	 wuxaOyf0A4I2FDb8i5Wy0e5IaDpJiDhuxtnpAscuYEEpuHnhnkfO3VIKJ6ADfG1JNow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
	b=dgSQnWtCU+koDrsDunFrAPuCErkGYmKPo1ZKojCu/cHW8lR886OIcTNhV+lVtsgUQaaZ
	 jpQy88tj02d1krZV0SLgYuKk7q9v1LnmvXMdqBJidun4esujpLAlnul95WMffbr1IlvdK
	 GWYLm8/SRUdg12CtrMb86DgpCjq94qB73rp9/RQgXzLcPWMQXgn1dZYlXC0N8ctqAxZWw
	 JwH60WuKMda0OiMbYJYQXFTNPyWI3KYY9UBP8ddWAhyVOKZWpM4T/KxBsemFiQPTc4Jcm
	 lkOjlTLvZYGaG7OACokAw5DrCksHatD4pXhdBW7PUH3eXGZlaYyiOhyuDHB5sz+nncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhd0ChaB;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85FF606A6E8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85FF606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhd0ChaB
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-71733a926edso165647eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204542; x=1795809342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
        b=dhd0ChaBIiiBhplfGfn3Z1KoOMh9XdY72u42YJUrClpxPo3obVNg2CmLKsuT/vJwZJ
         TODSLVi6tFEu1J/TJBYg03ecRM6/v/iFZKgtq5lfbCHIUA/4SjyKHAFGqUY3AVHQ8Odw
         D87Km7jEVy+Z5L1Ad82DGQeUPVaSdWXYGzaAgaZzMyym5m2vMZyCJv82iL/6Q59FUip4
         9sywXRDccSfIVP55ZBesyDetPKJ1Ltd0tPqCW8m1RGykWsCePO7GGlPt8RvWWvXYi7NL
         iExzNmQeLOdUYg6fLGYCE0A5TifpstEh9go5GsytIMrJs7PuX32yfnj1AIWJ+6Za4K99
         qmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204542; x=1795809342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
        b=yrn5DK2W5mXx5np3KLiUTdPdfTxgtGwytwqToYje2z9j5fN7ASmBOgvjjcyU73TQm3
         ilcQP/TLwV1uYtzU+U3uVsLfrLruLKf07WHDDylSTbkgF0lwxzUTFfXK/54O1hQ3F5+a
         1nlESAwzvmzBJS/ROGrUTqTZYN7/m3fxolnD4ztuNpj3YkFBtcsbtG2QnP1P/lf4NxW+
         d8tm6ShbSaInWPfaqXbmlzFqZ8i8DrJm69lnd+zF4NUwRwy9OCwgFTvvxNaJSizBb7YJ
         gy17chB5NPsYXvYrDAXuWnt4oXx5SiWkgwxj0A0CrU1P7wjucju1O7sInxqUKTO6tTdU
         E7nw==
X-Forwarded-Encrypted: i=1; AL+hErEnTG3GpzpATTHj1akYFZ08z715W5+LtgmnzMfRUIp+pRIk7hOGAf9QdGVu1fmY31zOGh+9DcOot60goSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yk8EKunRgFBUYW7xWMF2RO6bU+CepfrPa9s5HeIxIY4/B3A0S
	RB5DR8l6Hf/9LDHw8aiMjDgxG2bb0VVRgAZrux1tPPkUCT8FyLCBZuSe
X-Gm-Gg: AYBFou2/WNMkEMfaWxoYmuBogVyYct4XRljFoSEOYQExexHtNxhF6eBSQbRnyVMTmWu
	I3lkc3cA/ucxOojmY0w/us7OnJ+YnLftJCjiwvOu6e2XaOUwjdixf+pCX+pahM/3TulRe/wtBaS
	udAWe0LKc3cQ5Ys4r3EkNCILtSVDRtBWGaHkub05B7WtC9Yq/Vv/JowOA3c2qh2SjZLS60GYcwx
	hwKdf78ui1bm3i1UNqdH2O4XoDAeQQXCKMP0zMtQVfpP2Dh+nWfEz+DuvwZWbd227GADUGlr87z
	GvEioi3QiKlxpcfZJv12Mx2zAyCXOINl7wgiGjgHuqhzImZ5y/nBKDJwHJb9lh6yUOMGqqTunc0
	n/65+pJxNHcmSok5BTnCwmwW8CmEy0089ndxA9a7XfI58rF3fR4wQiYD2l2H4LicXxkZoh6V/Au
	8bupdUJSphrk++x6HEFtPyXVYpoQh6WXw/Ovt8p1WsBxlokCHdVVcANmEs9w355bs3qhyUwjfhp
	G+vWCru5Fo0MnC3+mIOJ0bk7XRKJ13a2Y4CCrtgPFOFT9VIpPjSkxkxtX0F1tEFR+HtSazaAnZ7
	L53oAb5COcfJRfcC+bcawViykTeXOG+KG6B+ldRxm0Mju4q5SIBva660Asi2y40w2CzCmTMJyvl
	gDm6K+fNSwkBHlgUcr4A=
X-Received: by 2002:a05:6820:2ac2:b0:71a:df0d:e9fa with SMTP id 006d021491bc7-71b39591da5mr2512697eaf.80.1795204541857;
        Fri, 20 Nov 2026 11:55:41 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:40 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:36 -0600
Subject: [PATCH 2/8] media: mediatek: vcodec: Pick an OUTPUT buffer size
 when given zero
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-2-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=2640;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=MdHaPFnIJfi7B9svaRku2VvRxyRKfqWOKsblgQ6Pmac=;
 b=RGnd5wD8UWEUd4ugoBRg/wBGw/yk6CJlzgxUEwHK4g+3osGkf6SAUebULJ59+LFIABjMwSBZY
 1O8x0cg4QqMBy/NSDP3xvBC/ASWTTTsiQwVZKrktw4UHLMREL2t+Wm8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

A client may leave the size of the bitstream (OUTPUT) buffers to the
decoder (dev-decoder.rst: sizeimage is the desired size, which the
decoder may adjust), and GStreamer probes with zero. VIDIOC_TRY_FMT
refused that with -EINVAL, while VIDIOC_S_FMT, which does not go through
that check, stored a zero buffer size. Choose 1 MiB, or three bytes per
four pixels of the given size, whichever is larger, in the format check
that both share, after the size is clamped.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..9339f53431aa 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -5,6 +5,7 @@
  *         Tiffany Lin <tiffany.lin@mediatek.com>
  */
 
+#include <linux/sizes.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
@@ -306,6 +307,11 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
+		/* The client may leave the bitstream buffer size to us */
+		if (!pix_fmt_mp->plane_fmt[0].sizeimage)
+			pix_fmt_mp->plane_fmt[0].sizeimage =
+				max_t(u32, SZ_1M, pix_fmt_mp->width *
+						  pix_fmt_mp->height * 3 / 4);
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
 
@@ -370,7 +376,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	const struct mtk_video_fmt *fmt;
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
@@ -382,11 +387,6 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		fmt = mtk_vdec_find_format(f, dec_pdata);
 	}
 
-	if (pix_fmt_mp->plane_fmt[0].sizeimage == 0) {
-		mtk_v4l2_vdec_err(ctx, "sizeimage of output format must be given");
-		return -EINVAL;
-	}
-
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 

-- 
2.56.0

