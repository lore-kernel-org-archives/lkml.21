Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313457;
	b=jdQbp7QonYH7cWndAsPQMBU+T61YGkG6Y2Ia3+hzsWfMB1lQgvudECmA5jIxTLzagHzK
	 2C9meFUFohfkmze16ex1ScKkjDjeC2XI45YsBX+anAah9Ozg/+SJuhtfLSp+LRol8lfRC
	 880UfJPTmzjnsCcKCBkZYhAAANEf/4g3mKmBwi5V0nIWdoliNJCZHZsIvY8JlT8NZsakI
	 FNZ4oj7bN6nfaSteu4r9dnFdobcagsA6hI+0hIEgmXnkIObkB7ewC9ZIyzQ32CbnVnbzv
	 ZwttUb3NTNT0PE0ZC/Y2j70ROyVOoizdqpYd9B3C7f9MtgV+xjD9Hg+iaLOet27ZRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
	b=2EQY2/r3eavmn/LXwtafoyqjlp+S/dI+zo1JpkBQkrKzeD0hx/8cJW8L5KB/Hy1FO65F
	 EOi3S2ZIJOHWuryxf5ysUBLBsf0Cjuu5/tyMNdgGpbWowcT8c7bR0KCL9Pa8i0NcIkmSP
	 kJhTId0EDS8hUIQgt+LR+qg0q+7axo3D0NWCuAT3+QapLgas3D4IM0tPplrlJyrfoWrL2
	 8fk0XRlN4AYdwRJSMkejdWV0W1oE6csQ/ACxbXoyeEyUIgdDxVD/wDO4nAEYjdr/AOrmh
	 ++/H2lvLZxLA9YLl3QAYlLv3U7088YF/joc+iHO+76ZrQWabs5uyNMo9tKwB+KPyXzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XToMcOLF;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1049606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1049606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XToMcOLF
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so1511861f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313455; x=1795918255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
        b=XToMcOLFOH728bCI6bsvUC8u23sqcwRPfaiXYmbrdWxa1JM8wR7NfO08U2GH/tXpJc
         K5hXKSxqwSGVw58ymqxjAjM+Dg5srkwmznHewK+nu7Lqk7tTcQggW4Rc8cQwSBNuwjZR
         y8OwBrM2QnITs7IrlsmMNNHJDhARmIpZdsEQk/FKml4ibj3RRVhIiVDoq6ST1soTCOkk
         4tTBvEv7Pzt5IuVV7m9QDfIvTuV+UaEIsFNSBwgxQuX230zcwNfSn/RIhc+EXLn0rto/
         rJhHrWR71vJz50aPlKiS2HyPkDLGtLSl9p37xyfZzctnsNedI+4Hr4OiWAI/kVb+OcMU
         p8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313455; x=1795918255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
        b=L+eqg5AkVqNuLrKM9OpdGWRbVERmdmHrFpWgxDm8ajXKVZMX+2xUJJfjd3mHPI87fv
         PX5bYQ1f5ZckuMDjcIVksYYeuOSCbuF3guzhKHb1n1X3u/Ts4JRhiMMVa9tJDxRe+o3W
         G38gTshcOYcGaXsS5/xMGcJ1od4kGky1JUBlCQpzgv30iDl2OrDFsjgBuAuaYft41sfF
         7RSnvrXniBkBIk5306RC434B3mkqgB3F8i20uHsePOIVsUEgL3SeDj/buqbVSG0Ud1mo
         1rOm4sNKNHQJs2ultHOi13YcoOS9t4nqqrtIyrIu41i68JZ5EGJsWEGPwYK8hP1D5s5N
         hXjw==
X-Forwarded-Encrypted: i=1; AL+hErG3WqcbOWMyvmuNc+KpsMhTYkX1Q+fx+VuQYPVQMHOfZXGC6oQvS4Q7JHbpRA/bZn/UArG8T2T4z5T1Qrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PC7/mo3aEc25fauhoYKRUVzxFEPhHrpy7lqb0Zi2gpr1h7PCH
	xmAVzHMG3fWOFm1DoGK89SkN78Oa2P93slkIK515g5/vB3SY/hPGnHMDQ8Il25H/vGg=
X-Gm-Gg: AZFdTZd5zaJag/K9A/xEMSkjJI8HpLXefRlfQBcbhSuxrV6HYqURBVusTqiUML8bJ83
	Xnhj0Kwfx9/qNyz107Kt66oXzlUSczxicvZhnLMbKC7u96EV2OBxEStkXm9IfOTO9pLDlIbqKtU
	aY/ARcnwWhtWpVQCDMXB+4g/vxRpzKvvuhUUW2DUH4iJdBGcjhQ8Xm0Fuvrk7ClGW9fCwDa38SF
	KI35hFm545jW/Mb13FUCb17TilQCTbzDl9QLc2Ux1BCl1FDP66M27t7BYxu8t/+9GTRcRC9glc1
	2VUm6b/0ZkxF7c/x2rzBGFATr13CKlGvHVDzciXA91IN3XfMkbCa5vylzTh4e80klU6NO6hoYJu
	x3bIcmfeh8mdrJiJogI4UViLCNeLwkLsHAxSTOiLRwIHeodgiqIgIGSjonHGuXCgYzM/KO5bEis
	IpY9/1zothsoASxWS2Olf6wGW12/AFRVj6FRKaEDxQzJIj/xBXrqXV0x1N2lb4etYG4nmfRzdE9
	Sl8P2iQa3di96aFA2kzhwIFRrNKqkwUFOHUE/+gkp0e8fDLjLBBlKxNOz8probVaQyLv4P0J1jh
	rMHVh6nGwKD74n8de8Ua
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr20839619f8f.11.1795313455355;
        Sat, 21 Nov 2026 18:10:55 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:54 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:48 +0000
Subject: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
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
Message-Id: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=bod@kernel.org;
 h=from:subject:message-id; bh=92IHekfTyjvBbs8tT8DKzGarLMgWEdLE770DO+618EA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8q0bMyIBH26m3izyE+H7P0FtGu9HCkK61dB
 OOYKhXUzSaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 Ok9CD/4iKkZnRVSqZAY0XVdyEfKn6tvIN1E/c2yJvgWSMbkO7ZVdSVXXq8trUTgXvUYAceFMYEb
 EjVI5F/fP/uJEGmXFphVfV8RIxqbvwSVyW/C+3o+o/iF1LbVfpHPhloTY57T8ZoBFkNBbqU4+6i
 0HjXKZEC+5LIzQfX5yfpH1hCpI2/HI0ghX8GCCzYAqEvtCot1SOPAMKcRFAfZR+8ihSE0toilHD
 jc+gOaFTLarjP6pM9HkhEXXSmwXcw/Uetzlu+wHFJTiACXhHWrKHu7Wnbn0sm/XShwhS8yyprTv
 e0OuA8Qbi2aGnKyAH+JJTV4D+X913PWbS+aolF5myG3aeiteSv2z7Vjz28IQkidcc1Gn6cDaQzX
 8u+YQ9hafaoStVQzzvvooo+MWi31jeNsJCXUEv7JJjOKVyEMVItsBlLn7O8+NnTKI9j/KJdTpI7
 6vkPA0Oy441yHS+9IMxQbVNayOj65QJ2zA7BaQH6oN5crnV1+VG05sGtIiLkJT/j1mAGIla8y9g
 L+PbENIHVq1lox4BAP2iB50N0GQ8o0mxxhObS6ulvrkpeJDW2O4Vx+9wFmigOJNllk01PIrl7c5
 rKp9MDXv0GjTgueGCGwoxzVwiFHlEYhTRPEOdV62z5LfApXxwUa7qx8aafYibGrZddKlgNss3BC
 oSd9IiXjopuZ2qg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
and raise an interrupt but it can't drive any VFE write-master. This is
basically useless and not worth coding around in the upstream driver. If we
find a real use for this we can turn this back on. In the meantime drop the
definition, it only confuses things.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
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
2.56.0

