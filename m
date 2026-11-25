Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637776;
	b=0ApVxMW//2uoGORvCVYdCBQxsTvTmLzysMiFdpeWZ9iwIlpqUtlBVg3KrEkdU0A+FAOQ
	 vbrDMuxedWDPG05Z7rFLP6bfg4+Jfzt+1Ey8inLAH257yxotuj4cKRbH1nG3L2E8CmhDq
	 Jy4J7uK7Iun6VxQ5Qb0EcyrsniP4VxDY/fv2xwYOsfrFM17aThpQpOyBGO6l8m2UUDIP8
	 8/sxZEpaF6M4XHvjUDqplRw21fL0AlUKJc6tEGbOeZBUcjcQNn66+mwZ0FM2jC2Sv+HAM
	 3NvLGV+c46maE4+C0PPdyPUrZzeuUWR8tcBdxdK7oKw01in7qcnJ0XLXol0mRzF+nLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
	b=2vkhw3MXonMPvx9neGUTLJqRP4BuZZhX7vpXSr6g0Oq11ptynoCpW9FgFoCfiXVEPmLh
	 kq/vMi3oPGCCtHTXZ0AqpGXSY55C5YDMCnBnZo0nasDDyfiK77vkUg3drR+SAQwZ9aS0w
	 xdGSPUCNpElu13cwf2J7Ljw5uaer5CzJb2KrgAN1bto7FEmZXgfySuzdUe4qkQN3RpXHb
	 rPd/mXnNuikIbDJ6kPx/1kJRe+NrPxy2nWNCZuqMnogYvsdNxWDh6tCsbs/Z/veogfDum
	 cB7DLNgnNPE0pF87uyvwraE0x8kgOlzXrbSKPXrNV+H/VfraRPlPIhjGL7ubq4INV1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qOqmNzN0;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E890606A695
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E890606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qOqmNzN0
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-718facffeffso617043eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637775; x=1796242575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=qOqmNzN0ucSw+zj8LLSgvRF92SCBjHfDrQC2yZvYHZXsYAxDiokfKSE0n6AGDO35Nh
         5ldeZTAciKwnNjalKBpIEEJsooFv1JvOvi8+dp+Y9PDGDsXhcN7dGWQvLjxArZpJEitj
         HZvwUCM2otbQvm36LvoGxZx/PQQHpZeX3iimwHCscS0a/RlR3Hj9TROv0Qpc2ex7J/IW
         rCZqBtEKN9XvCXZtGVpzlCymmpIpHSXM8OeahGAI+48YirgOWPXa8dYwZBHZpurpGOaz
         CdI3ZNrPIJsgG8VFwzt62ScAcSpORiokQ9L/SH44XJ2HyrC8krB3UMtzxDwoBfGDtV0K
         l5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637775; x=1796242575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=vVrSVEeTWhvpSzsdZsu4bHkfWon/kp8bLVSwXhWORW75IUdEiG3RL+gJHxDt0VFs1r
         mpA7NTzqcZ2kfSF1k1t2J5uTXPpxJuZ3TIIWbP3vp01is33sjztrlx1xIWaVZBUfLSBX
         KOrBWlD6bhos3JYBdbzs499ByyhLGWMPgTKjeTfSnLkTQumBi5cf4tv4zbMdG8BVUSzb
         /V3T0n1tQP/oETDDVfsv6NR+Z2P3OHHDNFaqZlqmyyT6WaAPrkd5+qLMMNWTXkbV/2zB
         2OCPXoc/TVqF32De8WlW8e1d6EFJjU6mvTTvAZO7W/WPhu5S0dSQrED3XMjio2qhwjKk
         o15Q==
X-Forwarded-Encrypted: i=1; AL+hErEtXX9V47HFeKqS8KLm35qzQqEFBRIWS0ZghV6g/0oUhNfABct1jPMQfziNiWcR9+o1a+6QoT3xrJ+xqok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ne5IATGZ7lDwqlbp0Nrgs4sO6OE/uEwFYMeGxyKc/05hAMscD
	i0zjDetygUjFwRUDMPU8CEBX0yTLhncNK1qJoo22JPSavgSTDNtqiU9y
X-Gm-Gg: AZFdTZd5QXRFnE9vkcq5q+ZzHpsIh75BTNbAj00ixtmKcJA39O8PSly7vR5zRQe34Qm
	UkDsqyfOCeTr+kREAa86uXfJMkNG7gCSZA7pj/hrybFJk+mXh8jgZTvGLAOiOqqZCAPir4iC7d+
	ZRtUFFvOIMlPRQLMea0VsdCRmfAC3eIe+CTjOOY9Ct1tIoHo9BvWh/y4G4Gg+WxHdVHY1n7vZa8
	/sfrkS26YGdQAMGEDnDFq0exStveyMlJnkjJYI4zL1wOWunLpBWVMLNkoFujYOYk7kYhCSZnh80
	yaMpMSo88945yO4O4hT4Tso0n7wXfPZTJ1+snpP7xDKgR/xVtvwCntL67oKO8rSFroNIexbP90Z
	+fUu7kdPKr9Ak0DoJ8tlCeTtXrs8TxyDiOUkZSfoZ5Q8583pU6QfDEoUJ+wQZqMzpqfXhywMcsF
	5tCdDFavw4ss/AW8/c0YnIyB0FlXqLGK46DVJlOAgVED7KnuMBoxZMVRwaKoiNIJ3cW6N3mEKFt
	kRN468aWdTuSn4lS0yoaT3YDApWqdjMSRePNJ8AJAQ1ypd+BIsm4YXqVW9kmfW3hXNAo/1si3mO
	y06TYP7ZWYWTlN69Wb0xTfQNRNOHkWHOHpzomI4gQGEIfs8fx+wXFPAK
X-Received: by 2002:a05:6820:169e:b0:71b:79df:90c with SMTP id 006d021491bc7-71b79df0a27mr2553155eaf.79.1795637775644;
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:07 -0600
Subject: [PATCH v2 4/9] media: mtk-mdp: Round MT21C sources up to whole
 tiles
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-4-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1332;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SML+TmgHSjoTNgMjQurRhuTtIXSo3udus0sid3UwpCI=;
 b=O6W72FlbWN4LuV0iiRLk2CkaYM593a8j+vtxu/b4eIoC58xSpkFVNzhRcnOAn6Ev/MJIHE5Hl
 IFgMC6jS43GCBp+hiHRxs7WXkGzOImAzk9Iax4nRoP1wVzh7g3/DYbS
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
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
2.56.1

