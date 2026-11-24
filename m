Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541546;
	b=VGrcB5NAji9i1PnA2SKEGLnoz+ce+ti3rqwnNvofpm5N1i504CWNDKMZvj498B8io5R0
	 ko/jBnNH5PNpB3hJbQa8pcp78kbtbTjlORLSJL6Jd8Qr3rlmtmqxoL5GfQM1JcBgEhDTh
	 p6I6kwppr3NXvzZ0CcD0hwQpJOr3RLzsDeAPw829D3J1hdf0+gPus/Xw5rS77hczNbfup
	 xJtdGZFowErdGCqTmG7m/W4gy7EKgTRmaqHqFoMTbaqfnedGVUlPf+jJBObI/3+fneEKX
	 VIdmyLRLvKXHCKFNiKBIcqIJualDjhY9YohmZSYBhRquiP8/P/w02jBRWseeJWR2uAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
	b=ow60JncpfKH7u9GRn8V1369v/rJPr9BfayPvICZDVBOv5epzp+Dudwkn5rv5OJSZEtK6
	 pCEBV5YVSlYuJKDnPRDVOcC1h8MitSTrPWUUDYSdx6nmCs3lkGhPwtbnDal3yHGWd1pi1
	 GSgf0SwWtnXRd/xPFKiAnyoxPwu99ZeobHleEx+6mOwKN46i0OWGAL6KfHS/K4hCdDB6e
	 qrzJt+b/TXj9nI/30a5hEsskPesHIvcUPtJyUwu6gQi3qovSTJUuS5iz3MLQ2MJj72VF/
	 Yit5n8DnIkFX4TuvQYZzjhdutcE8+a7IsyWmhfx0t6JO/T2ar0piWa7UGE8ah+qFhaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63125606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63125606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so22742215e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541544; x=1796146344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=lNsYRe3btU7VMxDTeo1Pfr/oZ3x9wFi1mXH6ULDi+3dGmlc7GVM6Tof+Bl66NeVDzC
         HdLS75BM4CC6auVjh17vhJsNahWpZXKLofgX5XK6T3fux+XJIypDoDuhfSQEMO452HNJ
         suqziFfU9QfsU+CqCgH6uBx6MMQ5nDwjyosp9XgDUV9DJApYpZWbZegfzYHuae/QIQpH
         lGwnnGP5aKc8Sr53uf5pjriYfNzcgk4u56raFMxvEHdp5wpgn/m32pb+IcvP9JqCWPLG
         RiqbfwUrM2CTkEREh/BBY2swpXP/ndLyVDMeu9OcoZrM3/u5IvIfNIFB4W+pAxALHrem
         mULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541544; x=1796146344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=2p/f+wp90q6pezTYSBIdn5m9CJRuJvfU7ZereQMMOcCvnMZobn87I5HjLxeBEgbQUL
         gYCLqe1KuSiQAo2mUFyergoW6ohUTLH8s1C35b64oku9WBlQyYx8hpRvMQuFJVB7gp7B
         pN3Yt5QyXNhTsXqiUi3xyD/VV/VZb3FpEcXD2DQh7Tvq5aP6Kqm+Sws2/CVVf/MFu76T
         2UZh+No7dlyHh5/hdIdt7xZrpK5eL/5q/2/yMoqLDiE62M7QqqOCxlfIfDonSCwfHUuL
         B/GwXCFH3GrDcDUvaFrVBCug6yNYBAvJ4J8EULu7YHng1XNTrv4f0bteApBFlyopY2Hx
         lXAg==
X-Forwarded-Encrypted: i=1; AL+hErHuXK6wB4gZ2Ii+vRqS1uh4wynB/2zLYpkQPHbaa0IR1DaX24jO16qr2wrLuE73RDlPaMsZm4GuiUAIJHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v0PnDSOjE4eDYMa1d1G8E6ppI4T62OpmitP/52PupM+6qSwfB
	oJE4Z7Pihr1HYig3SKQDDwiO5wkUVF9+19P5BRtmEHm9HVFGWiKLPE2Rn2BMDjusfLQ=
X-Gm-Gg: AZFdTZcwn/vcgj3Osh/LSlRQ5IMSnSr1qCjfO/nJemnAB4XSTN0CsTUu0YZy1Hes0Sz
	0lM3gQ3/uGsvJR0u2gahB2ij9LgalgfbxHj3hukUxVbbwycJI6oxfZjCgpHW7vSCEFmw4srreZs
	CQ0Z+l6v8WNfOmCFReJSd9k7PlfvfMJedMQ0tVJQuB+OMc19vPQIzVb8XVVakik6Jq2mQMGJefR
	jFbxYe7aW4ixPVGlK2GiuQAeMH8qg+LqDrxIWiw91rOhRhJqQR3juBGwSsMyasSFJEzrqRXERIN
	etiFgrJSNAqpT7Bwa5+ry0zBUfe+QYQ1BXdv0Aiv+7l9QB18wE1XinQkdFRG45tshR7lN/NuUoU
	jKSCOlzUDn3ylcvF4ZierNIUbz1jMXnMQvZSgzyHFEC3HKwl5abLXOTjG+wENNH3oQMvafYJVRf
	bgInSUWUhn8+1bJhMJOJiPkbXdGMnon2kWesX4E/4kkvXPROsd0S/Q83nHg8QlPJbQMofaBbryT
	ldBp+hhkzHpz4EmcYVtkbx/lt+gz54wnDgLDyNvBmlnhm+gGBSNdqS/M3gcR57hUQdig/RMZ/8O
	TuLI7xG2iM0+5kE1+HzPlTk3sSs05bYfdk6727sdefP86EgR3Q==
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr392620865e9.15.1795541543609;
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:10 +0100
Subject: [PATCH v2 03/19] ASoC: dt-bindings: qcom,lpass: add Senary &
 Septenary MI2S ids
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
Message-Id: <20261124-topic-sm8650-el2-v2-3-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5I6Gvg7c3l0nKuQTPTMB1qG4Gtu3tCn1ElSv/OYu2fU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcobWxAIrUaikBSGw3tfCDe/BvDN5W1VJ7l4ptzE
 Q8mTg52JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGwAKCRB33NvayMhJ0YbMEA
 Cef2bCqZVVI2O8r/CtoVbur+J5keWp49wViKQ2UMUyMQ05+wYQ1avJUMr0rgVlkz89rmzd7XhXaXP3
 +aNBSBgseud2LTgLyCkhIEuqJh788RVeLRfBPA8AuQkmqgWBAlhofTxFtRHlunh5hL4+nItKNvjBk+
 Dm+ArKSVLTyUtzv3p21ESILkMDaZ7DlfsyyL00VLWmI+E2ZyUEKLpDy0SIfMw6LSOqU76PKSwOCrmy
 HdPPxRyqCnUCa6dyQ0OmqcbhiHwSBFFR4Ds5GNZuDiZUCLVZAVNDh9Zzdg1DAflHfcVpF3ggzGRdxm
 nLAZyeYo+OvEERaSHbn2IcQ6Rp9hkwQQ1wV+M9vdcY0t0HcCWFmrLAuXq8gfCLh24JtnIXLBi8Cem3
 +XFPB+n+xuVG7X/CjoVGpBl3VosciA9ZVUmpHT1L3kZk7c11tobtt6rsdptFXpr4OEKuhJrInAT1pz
 Cg1FmGKwPZkSkBXcBWVS6SKhsRFNUn5u7c0lUinKo/9rLK5UpeiWDE2uAFlfk9uGzWRbLDh0GuZCKz
 G+KSxZa0GJpJVVBhUYyVEdWboaKAMGz7gIb2BDfjlKafK8pL0eukLVqTtRRRfBa+9sJ20Zip14VkCf
 Xfa9Fl2qwYUYTzP9B3Bk13LHA2Bj7y96Q+BjlRvdzNnH+Ec2xp97Q+J6acSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have Senary & Septenary MI2S interfaces, which can't
be referenced by the LPASS CPU DAI ids.

Add the MI2S_SENARY & MI2S_SEPTENARY DAI ids.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index a9404c3b8884..22f5e1fcc8a6 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -41,6 +41,9 @@
 #define LPASS_CDC_DMA_VA_TX7 32
 #define LPASS_CDC_DMA_VA_TX8 33
 
+#define MI2S_SENARY	34
+#define MI2S_SEPTENARY	35
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

