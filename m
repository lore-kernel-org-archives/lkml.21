Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204558;
	b=U0dSmGJVBNcT4SoWQpUeDiweJ+cX8zbIhcvkM9kZ7ICB1l2jlCl+ru/7Ansuy0TQ8IUk
	 OdXjLspAiUFbTcHFRhMmQRbN317syLraiVCip95EZ59DIJq3lpF6+x4Ocbo6u5VIPFum1
	 8cLcUi+pHkg4Gzt/FYVZJv8nhvGovHJZxte9XqLnDzTZ70VaA4e/NJS8bFHBExJ5SGEie
	 C7BbaOh32yTEnEuUu39knZUiQW2+/Ev/n1g/P2WW9ei1+88i5oLClaYExh2oItcMMPZ28
	 gLVWb368mKeAf4/+SYyRNZfC+n77x/jeVqyiD17AUc03epPBffnJQAisiJbbbx/lLew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
	b=ITfPazePWSMuDrzGHS5R3H21JiBMSNPhh7Lz3yOZEtYvbAtyYzSl49pA1ED5ovrw5m3F
	 rb68B3z/olWX4u3maz6M//N6G6Wc0FHk1wfgkLKS2Oe/hi4ytr/40g3zFZRWwIQFWdUUs
	 EHR3a/sERAsszOBMAQzYun6mLoc2Ye+EOIjMHonjas46sVrI5HmH3hCwyO+4bYFh7TbfJ
	 YqIzcddbTEbp3PLDf3nHD8Y1KcM565saN4/AOyxYhaXam8t3y0Bz/k/tsSCF8sxcIEE4b
	 2E5SYh5E8PGvXYJji1v96mUfk3dpHfQHks8kxt4WzhURlV+a3zI+vqENBR7Kh0hlIqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tIcjAjUx;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782AD60A261A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782AD60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tIcjAjUx
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-862a1dbb516so245143a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204552; x=1795809352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=tIcjAjUxrxhmL+ebmvhi+qZn0exkiyeViJ2yXq5Lb+lzSXU1Gl52t1vytvgYqv8TZI
         tf+L8ISi+c2VT+ehdGzxhlLAwHtKhxHx/rckftvB4zySWbdideqFI3Qjcf8FS9zuM9UB
         juhIY8Ux/znoq4/xQvvRdpk/EpoJkEV/nEIw23PGk27hw19Mx5/nI0cFba3BKDsoLZPj
         klNZl22k2e6h1UwJJzc+aF0G2sGnXhoTLV8Cqv2c3EiN6KfutE5wvpirtXS6RwTyJCaK
         OmJpH1sK8TI7p1exyJsN1ebLOrNCBu0FVNU+cv3EpYRhT4+xC10m1+VUT6RKoxJ80+q/
         L6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204552; x=1795809352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=0RuBiWozq8oH43lPCQV67Sw838R01Ky5f9k4SKGd32avMDn/gpm9B6gVBrqhepo76v
         kmcFOtiHSG3OW0Yuzsa0YZCh7Xzw+1p1KtKrq2DojPhPwcfDeT1KHlltLrtO7rbLBEPX
         GywGWA9Aa2mAUVujB41FFp+nuZUBTK4BEonn1quy9mytZt8QN3BhppGyOAQkht+hamK7
         Vxz7zeQDNs0niuCkbn0uNL0RwnfIVixT/wdm2SvGEhMRcf6lNybaDCI/pbSqZHZ2AcpE
         wRQpYSIJ4ql/jxeZUTWmZOVUnlTouD25SQTIlmgtiRmoS8at/Iwg5emFOqnZr1FYhxMd
         5SFg==
X-Forwarded-Encrypted: i=1; AL+hErHhUY4ltlM4EFo0RWpwM6iwHdqsg0o3AyJdfaqBniqwskREBMenZykylNCE2o2xyR0o057tEWcTLO4uAcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t0kf3h4o5XYjZ7VFzp7UV33yHClU4COuYGN0ky9XjhoQk9Mw0
	WB16TgQgeyq6DuQLlxRjw7kLcKl4MhnI9NgfXMCCNdZFKozi1+SZXHYh
X-Gm-Gg: AYBFou00dZqjXL0cZa9CjShgR2N8x4q33tnG+c3oNRasORutDNFsz7uyM03aPcOgtjc
	fnFyFyaf4psO9oOGylz6tsCq8nG6lAXnTSG9kWIbSEdnHQmCAVlvVo5nFBuspegLUzaM84JLcUZ
	vvhBeYFCcPSXwN7S8lMluE4ZnfpF2kCRWko8NK5iEPBL2d7JAhJpn31sgngik4No8IQYfkndQo5
	eUPHGreb09TpuJFB646zaFdHm2WbSxOZnBJHeW4xzQeAmf+3/r3W41tVap8rqG1Hb3ArPbq5ygO
	Zuu5gd12yEt7QuEpMYZ20EOe2YGdtqdvoXM/mf3aVdPj/v+IY+vAHWC84Bhtf4Gml/F3HF5Mce4
	Vy915fS+25rYZZo0D/SOD2gOSckv9oWKw07G3jfJqWKChGCMfYcsdiXSjhl/NSg4oChxfwmDR/v
	qVT1VtLFvTwGrTqxFqGRg5oVholREMEAa675Fek1yHcLUTih84TLHpY7gwrmE+RRFoQkKziTq5u
	XgSltyR8kC5Noh7lP3QE3YZy+TN3nGOUVDgBmFFfhI17SCH+xlJKfY+5UqfLVo9+m+RKno81nd5
	Wf+ZyVRXNqjFYdMGo7IR0VmGjVFSXD/SkrVW3nFRnt4W6JnodPEzp7J7xsXRKXbSauqiJG1YNBV
	gxm4lT88PuTNw++itYqc=
X-Received: by 2002:a05:6830:2303:b0:862:a48e:24d7 with SMTP id 46e09a7af769-8631595152bmr4939139a34.23.1795204552390;
        Fri, 20 Nov 2026 11:55:52 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:51 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:41 -0600
Subject: [PATCH 7/8] media: mtk-mdp: Refuse a format change once buffers
 are allocated
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-7-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1946;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kJaFb9TDiCBW9wH5WEhVxXJkX3lfruWKRoGStsnFGKg=;
 b=PCPt45813EoOYNHjxRgmlOVKVszumvKZjt/ednF2qJK8wPlqgWFtSes8GV7N82tDxXhjIVjXf
 8Y/vKnhc0YNCkSxZuIIevgZmBuoRH+twcsRDuNmFFFjAm9j2qLjIYA0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

VIDIOC_S_FMT stores the new format in the frame before it checks whether
the queue is streaming, so a refused change still takes effect: a client
switching a streaming CAPTURE queue from NV12M to YUV420M gets -EBUSY,
and the next frame is set up for three planes in buffers that have two.
And the check is for streaming only, so a format set after
VIDIOC_REQBUFS can need more than the buffers already allocated.

Check first, and refuse once the queue has buffers, as vb2_is_busy()
does for other drivers, logging it at debug level since any client can
trigger it.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index e0627127430b..1be0f44fe1b2 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -698,6 +698,12 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 
 	mtk_mdp_dbg(2, "[%d] type:%d", ctx->id, f->type);
 
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "queue %d busy\n", f->type);
+		return -EBUSY;
+	}
+
 	frame = mtk_mdp_ctx_get_frame(ctx, f->type);
 	fmt = mtk_mdp_try_fmt_mplane(ctx, f);
 	if (!fmt) {
@@ -706,12 +712,6 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	}
 	frame->fmt = fmt;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (vb2_is_streaming(vq)) {
-		dev_info(&ctx->mdp_dev->pdev->dev, "queue %d busy", f->type);
-		return -EBUSY;
-	}
-
 	pix_mp = &f->fmt.pix_mp;
 	for (i = 0; i < frame->fmt->num_planes; i++) {
 		frame->payload[i] = pix_mp->plane_fmt[i].sizeimage;

-- 
2.56.0

