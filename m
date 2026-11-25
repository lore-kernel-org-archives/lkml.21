Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637782;
	b=zNdSiCkS1eM9guI5k66DDVRb1obRgL+rbRlC0SPvkmjs4EAj2LRY0D65tmn/bEy5L1I/
	 /H78mBLmieHT9ay3vbB1pPNl6prgxjmfyJQLp3zoM8oaD5SgA6SbDGvTdN3vbJa61FyTs
	 Keu2mlcjwaXqIwJjVCDvmU1bFHPHDAf6sl+rNUo6XNPnLflDs9HYyCBwoBxhbf5uJkGp/
	 xY5RIpO/uV6Ici4j8c77+mZ+mtVHZQ6eYHafGzpaqEeRWNhYOmynnOgG1XRm+tKQHgg1D
	 qrOQLea/yoKDJ7KAwKoC010gdwmt76YitgmZi/Ikwk0PQeACC7eZtHvHnrxf+NQCW8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=;
	b=Z4nLKCWVKGep8/uub9EuOlBMLq16Dbf6tm546bsta0Dsda5/IRHQu84lVam1464w8wV3
	 h/npsXGnBsICrobeSKvj6+XRhvrHUJtdfBD/u+xQQHzbKRXynWT1STF50ePWYQ1bWtGZu
	 J054P4H7W77Pt9/FfvAYWhAHgjYz9p+K+iQoN8TvEAWXkcln+TvVGfKDarCT1yPOw7Enn
	 e7eRq6mrxlVeVwJysXlGXmOast3Omxw1Yosxd4YoCmf59eeRirP/C4Qw+j189z+n+FKl2
	 X47FW06dKoBv7RvDvBO6fZFFbCVoVRIYYh244pY0wgKKbOpv4eLp8vqJNMGW21SBGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKAzz4ZO;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C8606A69C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30C8606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKAzz4ZO
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-71b1c6cb11fso1150902eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637780; x=1796242580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=;
        b=nKAzz4ZOIyu2lk6/PfYMWGjZbp9w/OPXD53ga00wpC/vdxf98iATXlCBnfgMlXJqre
         E8pz8Cb4075PCb1MyfI6/WeSH5zbyBnTu+kYLAIufOm5bQoC6w7uKhA+8hs//dSTkMYj
         ETulmwYwu6sd63Q2IzYT57IJiFOGIAfnaM6qQE0IOzPDh797M1ATVhMiqOs8r4KOIkE8
         bffgcblNDmvs4LdaGh0xh6oOx9lgGACUsp6JtQggJgjoZYMZZt4rotKpcgjXHerAPdqx
         kT47vb+TIRTsgMsjNgLrgpoXuYu3zt2X2TxozqgSExghWZJFiEKHkw2jIQZgaWfaruWP
         mATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637780; x=1796242580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=;
        b=lM4tPSkjQtKcxvSp5IsgwpwuwGjx0EK0JAhrpY2xeDqG8myyvpAnA839UV6GY4NpFS
         Wz8xkkjduI7RZL/QVaN6p0FvmAv1ctLGKUQvzaBZD10Dsi81r+9/TKHELBQ/Wm8zDfGR
         z6fwMGABn07fz22Qft4kB1MIeHNeovrsg476QCclfKPmQNvB923J8+fwZYopkBCNwvqq
         KhyhRTza9kyDr4/eGRuoYi869uijKlUlZ79VpZpx+MJYZlkaJKFxRpcZZDfVrGwkCiP0
         7wW3hNzBXklGmIZh7yH5e6CT2y5p9K+yzp9ZBGvdfc7Or+2sh7fds3XzyyXifFOCbjmP
         W5ug==
X-Forwarded-Encrypted: i=1; AL+hErFBZOmz1V8g+3rmoFFex8LLYP1/ee43FhKBiREtAvxrM4zzFgN64CLKBXJwNri5ouBxOUPqsxbrcWDzlmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xy7ULrdBJJWlLXG/btzrHY2xQucclaP5CKXihVk0D8htEOxQP
	FUPtddi7c6YmURypyeInyTKdapSrWXvOLZlgspR0JOPqCL/dmsx3baYD
X-Gm-Gg: AZFdTZfGgR2E2jPt2WTzQv6ft6oKxBEnDqIX5v0jQXTPpHYt1xydNr6eI4p/9zNRsc1
	UipNkjSZ0DdEesadgnDTaToSECr8WgLxrO0qGkwjjv/xqjsg25kc9llOn0wIzJXzmGbjSWOm1Em
	0177BZ73UPVCjk5mWN9Q4CWUpBGiihDJ9mLg3rwsO3m2hxF9hXHlSzG1qipbWlnSWrxcQdEDHbv
	0LE77KELgZ+kXPTTR1c87mU1xLtE4ENcY9/Mmcw+qrJVsMPkmqODgTEj1S3368ZPxT2mROt0EH8
	+qk6uGVZSnJM3QoNAcCCkEoRX4JsxoHr9ZI0THdfphGsf3I6bUicmkk2nXiu9zBusrRgptPG+cR
	DjKAqH+OtwDgu/HjgplfkTVZsPaq7hQl4P1R5yudVbp7c0RyFhB72aUPwx3aO0JlyF/zb6SQU+5
	vMOVS/8Njs6lQtu08CORpKC2Hvo516pxLVpHuv1LoRWGgNCx0meU4kDEvtOGxxyplxLecXX8Mo4
	7iJByRZrpTlBLEoghUldaDlMClP2ezsNtjfVvlrU59Vk8vwaOa1+b+ugg3pss+kTIgv9Dn0M0OR
	EYSZn8Z6g0P8fHuSeQsith7Ue6+60gD0Grk=
X-Received: by 2002:a05:6820:829:b0:71b:845a:3340 with SMTP id 006d021491bc7-71b845a3cacmr1304758eaf.67.1795637780542;
        Wed, 25 Nov 2026 12:16:20 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:20 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:09 -0600
Subject: [PATCH v2 6/9] media: mtk-mdp: Check buffer plane sizes against
 the format
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-6-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1943;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=cuEbWTB4pH0BRk1X8WiZhDbNCpoA3GtHpeZU0Znpd0c=;
 b=Fk4k0A+X9pfrp5/bZ/6fIHGtDbMlWMdQhCZTNBXGLqrrhv8Zz0b1rhsC2ajbotj6wJD+CmQrL
 vLFuz3wryijAdlRCk9T/dEZW1Z9zxE7eokb6NXV/ZzUIE3EVelyj1qk
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

queue_setup() ignores the number of planes and their sizes that come with
VIDIOC_CREATE_BUFS and always answers with the current format, so a
client can allocate buffers too small for it, which v4l2-compliance
reports:

  fail: v4l2-test-buffers.cpp(872): q.create_bufs(node, 1, &fmt) != EINVAL

Refuse a request with a different number of planes or a plane smaller
than the format needs, as vb2 expects of queue_setup(), and check each
buffer's planes in buf_prepare() as well.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index a40bcf61b7ca..e0627127430b 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -546,6 +546,15 @@ static int mtk_mdp_m2m_queue_setup(struct vb2_queue *vq,
 	int i;
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vq->type);
+	if (*num_planes) {
+		if (*num_planes != frame->fmt->num_planes)
+			return -EINVAL;
+		for (i = 0; i < frame->fmt->num_planes; i++)
+			if (sizes[i] < frame->payload[i])
+				return -EINVAL;
+		return 0;
+	}
+
 	*num_planes = frame->fmt->num_planes;
 	for (i = 0; i < frame->fmt->num_planes; i++)
 		sizes[i] = frame->payload[i];
@@ -563,6 +572,10 @@ static int mtk_mdp_m2m_buf_prepare(struct vb2_buffer *vb)
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vb->vb2_queue->type);
 
+	for (i = 0; i < frame->fmt->num_planes; i++)
+		if (vb2_plane_size(vb, i) < frame->payload[i])
+			return -EINVAL;
+
 	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		for (i = 0; i < frame->fmt->num_planes; i++)
 			vb2_set_plane_payload(vb, i, frame->payload[i]);

-- 
2.56.1

