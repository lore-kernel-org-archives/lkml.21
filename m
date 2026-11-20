Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204547;
	b=xHKMJC354aUg77JJmqc8K6N28mb/6ClDxQD+F1WXvAUOLK+vPK8lyRbFETdp2xojy1Ut
	 qB7Xib8sdX0/hComk4JqCbkP95zey9MRxKdPafWvnQ4sWWI/kzDU9gh0SnDIAuvF0yNej
	 Xvo+/eqzA0foiINQ/JYSmGWQ59RprYf/sowGyC6wNaliQXd/ZF5nVKYrIDSIT/BZriLMZ
	 FxW9WHMYhGcKQxgxfqn8FDaHpjQlxtyOjudAGcvD45a1cXZ3QeNlPFVwdX9zUeOvbb9+R
	 VLKfjLUZ/o85mHZcLPH6ZS3mUqqke/GLRrkgqSQq84GWPza6uR026JO7vkBxLLlqf+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
	b=Pul5RO6ybUAapv2OyAdsBRdfn1jEpVQExFP2+CHw9JPq4H2tF+UT94ga6w/JqbRcOGLE
	 IaUBuDFb+CA/9hNEint1Qi5jRYbIdIHEEU+9gRfCzv97IS5y2hbaDAfY0ELc099dIx0Zq
	 aGKoutcW/qt9LozoFZo4Fg/f/4odmD9mSVrPOMJgE3YRUddmupIwdNW668xRQfi1NPyjj
	 eLfCy0At8kM9MK7s1EmF1xpelBP/rHNFbYT9DksA2lzQXY1u/Y90quiNwuzqaJLC2X6u6
	 A2RzkbztiA82sDLZLNOiIq3MCB1yhIh8CmGxUimC5LvXjyxx71diAkhfaHaPAS/6Ouw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jk2vHwSg;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3460A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A3460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jk2vHwSg
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-86203d56413so202052a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204543; x=1795809343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
        b=jk2vHwSg8mDnRIKspvKkSi8BqQSrrAkPmGYU1Va0V9rJqpt7BrkBYSZAIysNBY2arh
         QW6WmtqAc0Mv3KZcnjN/zRkrksk0C21Nul/4fXUEyQkueUirbZFsL/vmmpZqCiQbA4jQ
         nyOYq9HPrfCoAXebuGmh9+bBLIOFc3Fb2JUJwU00LmEpULD4sNSZo4Z2Zc6QkE7ZBxvv
         2WM2KQeFQ4xZRY8JaQ4APIguku+qXRTlS5K8ZnlLTR6189Nw5wcHhZnEVKosPR75owt8
         VI25MF3ZHWBYmolusq5eLK4V4MkHokHeSE4+DKjEMtiuBWfzDpxAe/xqH80sbBTWy7a0
         /hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204543; x=1795809343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
        b=UZeWFFw4TL7kXIzqFKThy92Mj3J1oI2m+yVod5N58nZOtQ0Y0akRxi6T9f9fInwzdU
         12EEmNpbLK5+ePATABpJ7DDXLP/Xo98V6gBszKsQHOFccvcHiE4+N3nzQ64ZIng+tIWH
         mf7ZhsnUIV5xinniO892o5qbEGCS+af1D762a5fWwcokETqAbw/TReGwiHcbzjJ0Ova6
         w64jlsEJZpO8lGckKKgWQZyji1rCymNap0HNV3jspBjmK3kZJCANB5QJupS492D3NjAQ
         g7bMfbhPEn5oALdJThvYukq7cnilhw5MZdfjXxlTiS0WhKqwhs2aEDcM/qkVRZBQoCHc
         e7IQ==
X-Forwarded-Encrypted: i=1; AL+hErENToJRKmOzaMzdLYqDRtDgT1HmlDxR6npX0S70IhDPbB7MO7wa692tRPiLjbCaZGuYCWAwu8kigqDudnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rWTMmFw0mI4DqFa/ltbKBZYrhYOh4oDYpZHIxvf7AnA20n6Xo
	YLukn+KZ23xPRcSE4lIJ1BpUcOuA78J9IG28j+dOxivP6WK5h/Cfzk2W
X-Gm-Gg: AYBFou1yzCajCAu+qBEvUQQlYI802y+wnjw9tagVT74l4H1Te9p6yDZ8BHgDaLHj+R7
	sTpCHolxz/OrquHj+QEAJxZv1xiyYrmepW8SWZMJj2o9IRJk5BlDWMc6rokh091Zppo3ITDxx6T
	fLVfIB7eLG8GKDwKc01PLWreYhb2wAxwh57xzXPoHugjBFlHwyt8RLCn6M+d8APJlYJVT8KHI+D
	e5hAMu8tNgcIulgjnPK/weNis08A58HSC4WH7KQKff9bq43JJstEYU10c75CExGjqrWILywUE44
	OxBvKl8CkHM9iO+I8YKsO2NcuIuyqXHRj2V3g7TwYQm13k2EgRs3u5l93rmFMl5YxDHA7rnTCq1
	ROnHkml6VhHnPZAoIV8gpgCLTSdwVv18AxA41/Fcr2yNv3ceJZ5i1FZQ4wMeKRF1vUBsYB3f1l2
	mfMKK7BcIrl/369Z+QaJcFTBjLxWqHBS9wybOffxk2+rpI3jhLj/xb9P0E3B9KLyk1hgH5N+Ddy
	ePEm+MgM7m+C+bFCul7is6J6n7ogvf+qviuzgshUNn7NcIafm6QAAuHkdWmSgGS2OZHC5ytU+pw
	hxd8wyt1uHZdJTy4gjrPUxARSoi78Z1VGTy1MFFMlr8HR/eyIDiCp0B+ujz6uYirgTNb3piqe/t
	NbyhthP6uzGxBgY7K35g=
X-Received: by 2002:a05:6830:438e:b0:814:8259:781e with SMTP id 46e09a7af769-863151bb271mr4983334a34.1.1795204543316;
        Fri, 20 Nov 2026 11:55:43 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:37 -0600
Subject: [PATCH 3/8] media: mediatek: vcodec: Report the visible rectangle
 as default compose
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-3-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=3432;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=oiFySgVqt+7XnX7ycDBKE4VLYw9gJVvkD5dQiMAZTM8=;
 b=cTogffUF7xjKiziZK+BVcGyBnc5RI5Ib23pwR0Td1xK+sjGiQJPiF7n90B2SdcuSuAOUv+O5w
 XiJvJBspeomC0HkqHIxlGpJFymYsi665HAx2H9LY0sG8CnDiMCyfytT
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The default compose rectangle of a decoder's CAPTURE queue is the
visible rectangle (dev-decoder.rst: equal to V4L2_SEL_TGT_CROP), but the
driver reported the picture size the firmware gives, which for H.264 is
a whole number of macroblocks: 1088 lines for a 1080-line stream, which
GStreamer then shows with eight lines of garbage. Report the crop
rectangle, as V4L2_SEL_TGT_COMPOSE already does for most codecs, and
return the same rectangle for V4L2_SEL_TGT_COMPOSE and from
VIDIOC_S_SELECTION, which only allows the default.

Fall back to the picture size when the codec leaves the crop rectangle
unset (the stateless VP8 and VP9 ones, for which V4L2_SEL_TGT_COMPOSE
returned the caller's rectangle) or reports it empty. Only MT8173 was
tested.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       | 38 +++++++++++++---------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 9339f53431aa..1223738ece4e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -390,6 +390,26 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 
+/*
+ * The visible rectangle (dev-decoder.rst), which for H.264 is the stream's
+ * cropping rectangle and not the picture size the firmware reports, which
+ * is a whole number of macroblocks. Not every codec fills it in.
+ */
+static void mtk_vdec_visible_rect(struct mtk_vcodec_dec_ctx *ctx,
+				  struct v4l2_rect *r)
+{
+	struct v4l2_rect crop = {};
+
+	r->left = 0;
+	r->top = 0;
+	r->width = ctx->picinfo.pic_w;
+	r->height = ctx->picinfo.pic_h;
+
+	if (!vdec_if_get_param(ctx, GET_PARAM_CROP_INFO, &crop) &&
+	    crop.width && crop.height)
+		*r = crop;
+}
+
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
 			struct v4l2_selection *s)
 {
@@ -403,10 +423,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = ctx->picinfo.pic_w;
-		s->r.height = ctx->picinfo.pic_h;
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 		s->r.left = 0;
@@ -415,13 +432,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 		s->r.height = ctx->picinfo.buf_h;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		if (vdec_if_get_param(ctx, GET_PARAM_CROP_INFO, &(s->r))) {
-			/* set to default value if header info not ready yet*/
-			s->r.left = 0;
-			s->r.top = 0;
-			s->r.width = q_data->visible_width;
-			s->r.height = q_data->visible_height;
-		}
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	default:
 		return -EINVAL;
@@ -449,10 +460,7 @@ static int vidioc_vdec_s_selection(struct file *file, void *priv,
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE:
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = ctx->picinfo.pic_w;
-		s->r.height = ctx->picinfo.pic_h;
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	default:
 		return -EINVAL;

-- 
2.56.0

