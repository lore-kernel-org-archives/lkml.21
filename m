Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752946;
	b=JFB4zA73rdrIsB8poOPWW/6VCb9P6tM2hqgNfT0EVifvY250lJ+ysUXaYt+sc+uwg6kl
	 VpEvqBPbp5zFEHLdd6hz6cijjppcdu/bOd2fz+8EAr88jUf4J/ghLAsPf6k9s1wKRUSmU
	 fa/eMJZJtM5D0dTAUcyMfdyvljzfSK1agpuBTB4L0//BqlL0t5SEIeuMBn8Dlzj4Gk4/w
	 7KOEW9SLWL7DMsHepSHczccqyfDpz/1OJ6AlDBBMH9Iolg/2QLSGscd0Bj6mW2NLcg4pV
	 COixS6Y5ejXhOngwawDN0TDbRnECr2w0qtesVkgVUX1XA2YqmvErHbmqXbem6u9rssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
	b=uDxayEebNl/R8sN+mwfhFrrixGnSJYHpHIng0R3zcGQrur4rZymcnASzWbb1agNBqgd+
	 g7pmhoAyAZjPICq1NVm4vkb7zA22r23C3IkEzjmdrZlBZl98u0wrN6EYsZVGmYGEOmd47
	 8MRswvfU0TYipNYIP6W4ALsYYjfKzkzAMezbEVPKst8MSMODggJVWjTGlPSSTGD1zBanF
	 ESFC/zGAxxeK2tB7lQmUR958D0ox7r4lh0yo28h++sIYzyDt8ZWshfTmMpuOLKU7sV2Tb
	 JV2BxYYHwFi4ioWP41t9Pp8R8reZgZMmyoPhcA/Y8xfW575jFaT0T2YuyK/H2Kg1Mdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zB6eC3Ya;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E5A606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E5A606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zB6eC3Ya
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so21744335e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795752945; x=1796357745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
        b=zB6eC3YagXHocn+XsSBZH7eMHxV2MEu5BtR6+XSndywssf/GBfU5UhcLmIKecRWxm3
         SWamGWsSru5lHMfPJE4zoGbolDBB+tV3cVEwWASKmms1iuGDLQF+x5UDO/mknvMOvmXe
         O1xHc2NKZMnbs14UIMraaBzamo1bLWBNRotNngnULS+FJwVNChBMGH+SEu8Eln5O1bml
         Js0TxU7kRS2pe0S0V/OY6euD6X2MnlLhST/DxLs//y5QgzjhEUYooqiZCiLL4/4TqMvo
         sSLlTdULClt8vUXb+XmId7TWTGl3/qAMNC4ZOlxBVDJyellGy/aVv0kz99IxoeqdFSOe
         yiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752945; x=1796357745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
        b=TzaP8gDHzwO7cjGlLdXPZVlVAGbiCpcYN+BbZrm/CCKrvHShJ7bbheSaYK0PBA+xp4
         CIXMhzo3J+L75mG3P6N+zlj2eSpB2H5Cd7Wv/gXjq/ndeMyNNXeUoSKhvr40IQZlYPZz
         Bjf5zVYhmhG4M/r4mFiaAURSZkrwCwPyVKcXz45448Qcr9bMJnfrQ40RC0wpROWSR+a4
         P/CP+eVzUJoLX9dUhdzH7NZsvZhwKqLHRzUAsyeTrtGrn7gKZIytjjzCOyGT0jGYA/Cy
         prZj204cytL00XlGVP/pM8RAbA15KYtfxmA0FN9Qh1FCz4N65Ffoxyczv955AsUXo63f
         D/IQ==
X-Forwarded-Encrypted: i=1; AL+hErH0YRV10w7aY85DwKCZZg4HmK98YYxKg7fZpu8npH52Uq9eZqawMHQA+jGXpmJXGxdTqWQYnpYx5G4m56U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jRuGzHYHL2G5bE8oqXFTEF1wUEJ8VrsbgmL7kI2oiVbu4uKcA
	ewKh7NxAT8/HSJbgDjU5XeyX3Q5+/EhmBIv6HrGYF/VRitdMZw2bpWayviaNJISNu/JIGfDULs9
	ZyPpw
X-Gm-Gg: AZFdTZfylyxwYb+GPX5y4GxQrSUOu0vxD9q+rd/kUbZz5nEQ29mgPmLxp2OwLlNS8qM
	Nw6iR+j5plj/Ej8/8Z3uyzSJoQDx73UfQ43bgoFJO1djtlrPjLKAjxarFjwkyUcP7Hb5G+4KGPe
	XQ1iGrRCxePaSU8Eh3jK0AfLL6KilSxmxfjpFBZthMHB5kChwmY7KpRXO11URQ7O05msNDD8/df
	NaSdXa5mLeSUeR8aItMscbCmgga1jNith5rpUHb8OGhB3PxAW85LHoYxVO0U2oYlsAEvMV4RmJa
	8Z6nLdJtOkCONz+QI1aycYZ5DhOmK0Y331a0GMunJFNjgsnoUvVE6afUsqJ8iEYHBEanl85CPyf
	0wbmC7qUca04tEICNUxxvphuHeXLf2wk5/33tTJI3NpVsZh0TtwaF1pUKni0yLp0ecV9MNXLp8W
	qh9jL9S6rgvbnT6/OQCm85B/Olq5kCcfhGo+KpSp5cYbjyh7ZbdX8Zl/MM+g0D+yBurbFw3Httq
	WPSIgQ/WaiqYvU+VYgAluHnt2xNzAtDGdUuNkkWn1tzhzoWvTerfedpTc9PlAGnBY5euliDj2Ko
	4E7jzoTMSkb7Mqpk+WE=
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr431259115e9.13.1795752944755;
        Thu, 26 Nov 2026 20:15:44 -0800 (PST)
Received: from [127.0.0.1] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm686987465e9.2.2026.11.26.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:44 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Fri, 27 Nov 2026 04:15:32 +0000
Subject: [PATCH v2 3/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
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
Message-Id: <20261127-camss-routing-fixes-v2-3-b7152f0af49a@kernel.org>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
In-Reply-To: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=bod@kernel.org;
 h=from:subject:message-id; bh=jUjgq8L2jsVn7bHs6QQ0lJ9CXtV68QwT4B5NJ6rERdw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCQPp0rzo2ASWG9yYggxffLSBFnl1HhrQXUrMc
 kfUizBlNC6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawkD6QAKCRAicTuzoY3I
 OtmJEACOpqIwgOqxSoOE/8kP6hPgRSGZuJ9y0ud9Z5HLs833JvdKvr3jY/CeoVtsERRUIyx9V7X
 t81iaaOy4vd8+ScdLqv41Bclxx/k3ETiyGvGBuAQOjb61IMPkRbRaUPzx2MkHI622dFobaoDKXN
 raFZen6ZvVaraZ10dGagmwlGOIYKjhV+MUvS2v4cUQKPHCxxTS2qiVFQPC/zBvtB+6n//sd7/L0
 j0NXIPe10fQaQYhwFg7SlI0V4K5Z/HGqJ3wjOtSKNF0ZEYCR76+0n5vUGktIdHwnnQWsuD5DsTk
 GBc/43sBM/vaADtNe/5Fh5IVRMciX0Fpv8HwEQ7fggxOJTaSO6DnUKMeq1jY4sgpSqAJVUtVbFq
 GgsMd/S1osiXNMEesqv61KQDkInIBhr8VuxuHb7S/RgMBEel8EaazYaC0zu6KELybmoFxFoI5fn
 1heTOCgszLt6s5+q/UtKxIKwmVr3GvjdtAp6AMVdaz+Qx0YX2FjQIBV/CaQv96q/btEQwGNHGYb
 3DXMw/3fTfPSYqfAKImCtkiqIjR6oh4rSnxjmN2aUZK+zu0AGishCirtLTAkClNsjzcq3ehvhVH
 Yb9l/8uPC3kxAPlyHhqsrWp13l/Jf11w86+NMXgFWIzEXHdeGn8lFZ720Bo34JcrlRLk6aK84hX
 4dlvtDl4E2aKABA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
and raise an interrupt but it can't drive any VFE write-master. This is
basically useless and not worth coding around in the upstream driver. If we
find a real use for this we can turn this back on. In the meantime drop the
definition, it only confuses things.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Link: https://patch.msgid.link/20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0a0af184bc9db..86bb1df811ea0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4686,28 +4686,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 			.formats = &csid_formats_gen2
 		},
 	},
-	/* CSID2 */
-	{
-		.regulators = {},
-		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 64000000, 80000000 },
-				{ 80000000,  100000000, 200000000,
-				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
-				{ 300000000, 400000000, 480000000 }, },
-		.reg = { "csid2" },
-		.interrupt = { "csid2" },
-		.csid = {
-			.id = 2,
-			.frame_sync_en = true,
-			.hw_ops = &csid_ops_680,
-			.parent_dev_ops = &vfe_parent_dev_ops,
-			.formats = &csid_formats_gen2
-		},
-	},
 	/* CSID_LITE0 */
 	{
 		.regulators = {},

-- 
2.56.1

