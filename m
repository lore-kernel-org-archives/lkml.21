Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637774;
	b=38L1fNZd693Nv+6+MfyR/GcGxHMJ9MxCV0xWC+EF9hSFhuen4TKAlX1g+A/3BDLLLxgW
	 kWbLZdGzFVaOP32Is6Lvq90D3UO/+PZvFnQcvZt30GsgeMJ3UDw1dzk9/lnPlQs4Y5Evk
	 drssA9CC/hY1wcbUW6JfiR8i4MXTqn0ccDPWqmbwNj9PrqUw02OIwVoWm2H/dcaml/bzJ
	 dZXfKHfRwqmBMK0eRmQ+9v3TkxUUgpZPke+MLpuPUKFzDbMToU+rWz1tsgfkcQBR+DT8B
	 ZMSdITlCoSEU1d6feda1JKWtXmqC+oaPVVA+P+YLSwb2KjjBELqroZAQM5NTky5i4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z4bRGKH0kOHCjEmxIaCcb1feO+j2LY4X9/sKXGw0aNk=;
	b=0iIs2jzuEixdOoiq0OVCkjKXULJtomB/KH3FaeE4/NId6RHL+o1U98svJQP2MebNpNLh
	 wnEBM6xmWQVILnNKwGj2YNkZXqwLZtmjgcI9cIcmbxHqSW2yly97OVoIAOm1VYmrVKk+w
	 1K+eDsE7YVQHeFfSJKYnXxVpHK8Ln3zULxja/gEvMwlqyt6FTPydicH3o6mvRPjxpdui4
	 8BSqMGW7v+EVXRIrjf5ZRb55UIv+Vh3IkPNtu41vYLQ8oJNbtZpwql2MC8hR5qSLK65Pw
	 wVue0Qv4GdiT8bnpcmfIIz7uqX/i2DqYIXn9pyKMw4KLU5XPn4uyo9ojRsVlDdX3E5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbaJuvhv;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FADD606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FADD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbaJuvhv
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-71abadc4460so1916189eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637772; x=1796242572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4bRGKH0kOHCjEmxIaCcb1feO+j2LY4X9/sKXGw0aNk=;
        b=WbaJuvhvYb21JOsifUaD2cfhSIKyoCDHlsbVG3IXVQZMkkG6drWVMO4v1YFaeavJV8
         yE1R3Pn3s3jElp8v1Ixfq4nreUKqXacDU1ZDHn09sxaCwr/78QXjt++r/K+4xDYdnj7R
         Z1q7Dph4ugbF2vyaf6XpcvGoskm1GxkLbWSh/vyzVg5DP1YDA+5e/Hpkgu2X+ePI08fQ
         Y1xMczevruwdLrH5LLxRvlBO4YRUQ3mydmilxBYl4vlgYG5DUt29ctknTOT0uTX5Z1cr
         yTa45tJT2V5ZqvU7M+fgDdvpnyBRy3MUk3850gLELyX/2/Bl9k5oAPADxt0qLWBiAlEo
         5z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637772; x=1796242572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4bRGKH0kOHCjEmxIaCcb1feO+j2LY4X9/sKXGw0aNk=;
        b=gF24kfTz8hl8gNf01vRwMH0JCKfWX6JzCsrLK/mtLs2nzN0BeM2UJRZpZ2zg47gJWL
         69OwcxqVZ4gD5g2vJZuaHiMF+EcCsHcvrcgmINd9nJbLWdHgb5YarN2Ko05ONYGz+XZO
         z/OtZzoJmBZGIU68PJFNUs2NkbKG3+axDFyyqNivoCtpVOD5Ku5/wRlKaD+cDTxSzNsy
         FNaKx4fYmO173Wk7hooVZu1VZkmG5zHSnhoupuCEW0TqiP9ul2owe4D38+3d1ebqOxv9
         /YqisHGe+wIOcnXfp2fNrE04EsU7q3kBBOpYP94kjU0SlrUaRReGEI0x0tcEvORRIXT7
         4RSg==
X-Forwarded-Encrypted: i=1; AL+hErENNbPvzy6R36qGzbbWb4x5jNKo2jowS3zaz2OE9hghu9FcImZ5mDOYiI+bRyMW+1J5fDjaeb+f00HPk34=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P7PE77BpARIQrWzpceHDLh0d0YLDlc9j4AW5VQPBY8BpxYseg
	M5WObG2W/j1jcGNbpHTp1DUUG/j+GTRKsfgnm4uZfAyVrUTE7U47jElk
X-Gm-Gg: AZFdTZeI15L5QCmKsfd4hw5uRQc3Xmpq2GTiNXswNL+leTjGSaLHdhpSDT487+1Uw4w
	S2nhzyM7CdjfPvgeXIb0MVV23AcLc+0EJI4DkMRDEWrzJJmnMhF90Y2TLVYzdtQzcNt6EQU5VSV
	SyXrijwtYE1gn7J5mvOGoIlEygFDwKI4fV01WixDTvB8z43PhfIW8LCW9Gy8pSqUs/loHyE1wsN
	YQH88o+b3IzNhCnpjFWY1G3FHmNUzrgC4gFUfnv3f7Y3TuiaWEJy7br2AUzH7I9pEw9/eJCDgrO
	/71rTZGVTwpWvdIVSsYcwH0EVM6RqiHm95GHDyVW5UhZ00FYveOtVg+iUeEeJmPeMpK0BnpH9kv
	ldNNwmSGya/zGumexuaiESPk7WGHH10Aiqh4JD3YGD4mjjKcILXVMch6HZYCcFN5Bbftxk+6hZ7
	gLiAqayHu8uGjNnkdgSxJp8gqzHQfwqzGCYH57CbprINFN83eE+dczODbIB2hs8eot+9q0BsOMO
	5Pd5/VYp0Ktf60/aaMRNl6kzcQcSrpOiQRLgGLq/xWGkhDb0/2fwu5DgqGeamZrIsSG/Ym9tiwz
	GZv4Ci4YPvfquqYEsNiVQMb0Eai11oX0Q18=
X-Received: by 2002:a05:6820:55d0:10b0:71a:fb0f:810b with SMTP id 006d021491bc7-71b394472d7mr10513277eaf.29.1795637772452;
        Wed, 25 Nov 2026 12:16:12 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:12 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:05 -0600
Subject: [PATCH v2 2/9] media: mediatek: vcodec: Pick an OUTPUT buffer size
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-2-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=2668;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=u6eyQBgm+7CuBxS3WF1G1ok0eRHrZUlhD6WNNdtOUQk=;
 b=WxRjo4KeMoOuIJ4FGG7qmX/OSEYiiQ/nKPUxeP722l1ZbSvJZm+x57AhtvqX1z/mF3xxpoUDU
 bvExabDNPlBDoR4kzMV65cq+97DhFM/aELIqNzQ/r+YfGM3mF0f31UP
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
Cc: stable@vger.kernel.org
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
2.56.1

