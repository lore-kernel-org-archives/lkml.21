Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204550;
	b=2JWX0Ua0iPeP8rfTZujQgAZVLhAXgSrN+Fb8/c1NWoZ/j41aPJxfNsye7NaF/I2kxKZQ
	 hVH0V+y+7E7fvk2EuSiXG1+FBypxmXLfH+8+88zdN4O5O/k3sjY31qTT5xxUsVRhHo/IL
	 zXejUNHNuhUTePLyXQkoi0yssdXxxwzEWqeg+NGAOMsLzuiQzWqBc/nWGKrt5eSXFZh6B
	 MWBAt/qiQsTPNA16OowbGBJer30IcxkWoVKBGNMQWzpDK0ZbYAfhxi+6eli8qVbb6Q1gJ
	 ZZs6FM9/1sdJ5sRpjhQjd1Dzz0dCTa7Rz4SL18ShU9Ox3xerUd9fUBWvAiBwCbpFB5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
	b=wHnwUWbFtTpdbc/j1aLmO9DAhAwN5fMpxUZHSRLnNFX4VMw8XU/tKjlZV0TgSRySwRhg
	 Df7V4ZqL99ERIB4Saq1iEgY0uABFraXG762jSOnM8RHcTA1A3ghM35hkVdQ5af49oiFPo
	 Hn/soyOS0+Uo/5ocNs2FU3xCyDyUO7s4FgwPO6nOsljLBEHcHYpaQOzDjNfvP1j0U56nn
	 z9ye+zk4tDWYkroUzbZR8L9++KkONMCzVLXQKq03jqcys72nlsQP+4UEXl+hLswCusPhZ
	 oYuweKZ1xxB1S0y0HfoI+O1u2HEEiEjH7sVkFIoSxlLP3KsOB3B0E9BdJghY4jh0ALQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dg5Y4G04;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C4606A6D4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907C4606A6D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dg5Y4G04
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so522008a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204545; x=1795809345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=Dg5Y4G04zd/flSaG2DATozlJ9DAhSpNASpjVFqrRMBoRMS8bvOJuNeFaV2C/TnawEs
         +2a4tTO8kaF4ow9kSvSE0abqK/697h4ySXkkjJMBbLXNbIGGX7U3nLdewFY14+xNQjF3
         CfVvaoueLoif2VZ9dK70GtUGD+/h9eGq4NDq7AAUdUK/RDDuZMv2Z6p8Kxv5Z8lY5izM
         xjE+3r8gV7L7ULJYly73LWnO+ke5o3ftNNYPYXHsehJOQJajeLtqPSVbwZ3pzjKNt62n
         Ulw5bvfClXrGx1JPxpAg3OcKmLl1go0H4mUkgg4Uj3rD4YPLU+Y47rbsjIgq9wUWR6ZO
         ly1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204545; x=1795809345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=hiSnEfq4/+UvXf2/8iJzlm2NcOQif6jD29wY9GJMAarNOU6o9Ig9Vi25VAS7CfObbz
         wwwhPS3Ep0Smh4w0T4gdUzGOVjzMe2e3Qs7jIRSChff2BJ0LR6bQ7xs8l6D2Zqmo8S4D
         sTCX1zJczVoFci5pUwyDuXWhvmQ7GkBvg5cV7629GUi4hGmeUzbUpOBpp21cBl+aN62I
         S9hqq9Vw6ucVfZgYqQKrqhcCeX09nerJJ61HyOmZHEcoct/nCAbFHVPHnjZGl/DtMfSO
         uzH+IeBgK1KIOaYSyCV3KDYzb7rb02fNYYQCwiyFWnm+xP8RVplDxir3MCEAaEDqbaLv
         exOQ==
X-Forwarded-Encrypted: i=1; AL+hErEOG+fLoRkWPukyPqzq4OEhkfKiak3aB1ui2laZzo/k2ssFnz+QmNaZJYh+OMv+SxodjonzL8Za6y3SbpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fi1iAIBX9z1nydG5SijQ/83Mvu2C+3O4Nb5//JZBrJCI32gAk
	pZ0+mRetkPH83NveONmnSrFL0kAVo8E1huom/XLhrAJN1rs6axqa+NR9
X-Gm-Gg: AYBFou2bL56YEWKmnh+qsq7DbUYyWQ/zVTNQu/ao+kCCTauWGeAfgc7EPzRPK6ytvDv
	iNlqUM9nq1ACKAUSJ8yR1h8HxZIEaNK4qiATXRjh9wBFU3PZXJMbxd2+SKFrndEh329106yT4nP
	WBvg8wK1WiySTGbdw/PmRnvTU8eMCn9wTu+fogp7wLez5rRz1ftJu9MRToyBxepuP2gA/Zb1a1u
	QbEy47JiYebSCCQYWjHoIjQKXfC1aoZZsjwUkuWNOennZBMVrQpdt8dA4qohiPzHjO52A9omJmI
	u4Z4XbY7S81r0Z4GAQSairDLj0DcpWSyDk0381wy4yZ6qrsvgGMp6dBg21jej0UgGVwbITZXf7P
	LbWz7SIeVncnsXA/OjaoK7a3+z5aO/eixF2fmqugPdNT6JyZPwMOwU/Iy9eDmsJ2PMVNQhv3ZHk
	kYTHz73QEN2SPMoyIhNqUHOgZmUR3fpo4ZWwDLKp0Wve60ELnvDNUsSfXxzmfmxQLs8IsTNYbbY
	cGhYcVABkgf1dj8wSRmLpuxh15j+k4o7llrSLLxtvdKB8VCVg8ucCXGw/pnUC6I+ISNt/SlVAHu
	eu21BqlbBTR6I3PcDV9EdvgjoL53DPQaymZ3d1cBGGgnX9j1u6hcy20G7/ktrr9pgZYG2NYHXCW
	uqGU0JAq2Le9pHK607KQ=
X-Received: by 2002:a05:6830:2309:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-863152f7039mr4827356a34.2.1795204545560;
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:38 -0600
Subject: [PATCH 4/8] media: mtk-mdp: Round MT21C sources up to whole tiles
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5J/eI70FCyDjB2S3myLsMuolgA4DStIsxM91Bga1384=;
 b=SqbifpdhBYdDKEWSD1Bg9yo3dJkJj/+ZjLhPLwuCFT2ajdG3xUkTtmCGEe0nVkbHMfOyIpOuI
 2jFrbzN5uKiABZiVVyvpT+MJPpE0NCPpLF9mPq4/OmLydHf+5NNUDB6
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
pixels, and the MDP firmware refuses a source of a size that is not a
whole number of them: converting a 1280x720 picture fails with -EINVAL
for every frame, while 1280x736, the decoder's own buffer size, works.
The alignment was 16x16, so 720 lines passed the format check.

Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
up to the alignment, so a source covers its picture, and the visible
part is the crop rectangle.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d2813890cceb..34d02de4453d 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -40,7 +40,7 @@ struct mtk_mdp_pix_limit {
 
 static struct mtk_mdp_pix_align mtk_mdp_size_align = {
 	.org_w			= 16,
-	.org_h			= 16,
+	.org_h			= 32,
 	.target_w		= 2,
 	.target_h		= 2,
 };

-- 
2.56.0

