Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541549;
	b=iAjphhVC5mkdOsEe5R/5PIHHcbHtXlYJUQ/PGXumS824jpNfq4ieT95urScvFhIRWr++
	 8cKTmY/GoCYNtI2ZsPshi9ncF2ne7y6CXcU9qwIMUTnth0S1ASzoWurpybENyVAx2jvw2
	 2DntJ1Gp2zE7VD7M0N+NFxgaM6gwnIkuGMLWMzLPGSYZQgvJtMEl5A8B+9WqPE6/BNvjD
	 NQYeGafeqqysX3Z2kl02eglWgRFA83EiJGRpuxxX0JsNZ7kVu2yPb57I7fipqIzWGQCqM
	 3RP+3GkpR+omJgzT57FHvzNKmuSLuLw7TtwIw3sKrKiYSMd7gHh1tV9qZD/nowSaybA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
	b=lNIOvAA0S4hHWam+YSHYZ6Y3iIr+gZolz+FTFMsMteQEqsGOwR/N5sifpPReyvxtm26y
	 sEfATdMBBXJ1QUvHeOZxfxjzX2orrpjIv6rIv4GcGLB3Si7mXQbtypoIIW5GzK9Ke38Sm
	 4DBe1zmroRD/cBspKdupMvK05VfnfiG6luUW3XAhD4v4cQAYGnLHiJqBA/sLNPkAKG5Dg
	 6enXxZc8ozT0Jh5nWnVkTMkpEvuNAJjZ07ae3o24A9g/BcDzfALzYPV3T/2oiPlCZAdm6
	 xboqwXNrp42l3RuuwFG2jHEzdKPjgjNcC30oDtMfH8oT09OxsETD81jLqJrovA4tP1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0328C606A6A0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0328C606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e47347279so2864095f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541547; x=1796146347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=CAzlwEmN9dC0GaiVbvr6PRQMqbM1riHbYgXNkb53ws4oCaBivG/BoCh6bN1Sw/ZEHC
         w07Y5Et6b/7Vwgw93y8Zf9iNg8vLY94qHeb9zERCMCMU/gbsQk7eRXSLhop7B/BBXFbo
         r3kXgiOfdeRzVurOJekr/lfLMZ7bJwhUHvdi9zx4ADlaWpCBE6sElkHpP0oMyTGVk78T
         JDa9oMJobNxa685jtKfLjKFNv7bgE4QDUJ2lh6gVwAGC/sIqtAtVKPd/R6WShfIj97bK
         k6JI+94y8BtWCVvlCbOJcO/Nwmuty1yIT+ES+lJlj1cfMDmBNSk6+eqeEPHGwxq4uT2h
         5U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541547; x=1796146347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=RZBTrQ4v/21mWlmZLOXZnu8NCDgfR8dTtfDd/cp66ubk8JO39GySR0Vm/FSrbqhqTJ
         quykuMC2XojnzieTqfDLXirUSM8+q9dcejDlfuKbduJaZiHl/J62nkSDXiis2GrpsS2/
         vnLkt4xhP71ofhso2GE8rCq/0bPcXPTiRojUwZwmEbBV2U6iWGIuJ/esTePfvbRDavao
         jXsSncWm33/+T995CXOv8veLkGiat294bw7SP//uwyxpi0VlnX6I3AZr5XdkBMMlM9Y1
         x7pVqvPusg51nybkcMGTbCckigKHZxOxGiwd8NV+GLVPpvFNOTqqN8i6uBtirsFEl4Bs
         rCOQ==
X-Forwarded-Encrypted: i=1; AL+hErE2YYXf0pGSIiCWpmgpXLv+EL+hvwQOp5edA0rRe4BwInxMwjQP4ZN5eFtIJ/vXQK6N3OVgvL9fu73mUG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r5T0p7C6hcy511ry7Y5vPTEb05l5QQVOTjkIANWY7YEOCFgky
	epi8beRATlNV4o003KqrX20m1FqlKlr5/Ub3+L4+XlSXpq0r5LE/UPt1BVXFjNnQjKI=
X-Gm-Gg: AZFdTZdejoKqbD9zMSIfyD+BaPuHJh8TfPKlXgfe+9sWhbsC53a2SPKaVUnpqeNWg3J
	bYzlMBvy0Mt3wk1YQgK0urU34yF3VbnKOX4pIyRGfRrQ+mRHk+opE09+Gdqu2rtucvQSQkyUTG3
	r3Vo/+10DHTHR6dv9fgzxl1RDPs9CE1j1ltkLe63VeIjZdHIK1X5L9+cQzr/5J09BeDhxiXrKVv
	lJNiX2VvhsVhIsxB2iGtcBFp6tmCHYF+q8WYbhaeRpgsNrjOp3aEGFBN/QooVf+hAyAPrkDVO7N
	kEg4qjw0nI4+5/tBs7VOPPdR/SpA+YXV9h+exjURFqYuNgiVdEg4amZMbS8/e6hfpUJEXFS1Y5H
	dwQrGNcdlq8wKqIe9RcWqYluKsTYJSRU832V0tdbtnXeTpAuXgUqgX0N1TzZnbQ9SBVFeqIMzt1
	/E2x7VpTc6Y4fHBxfooyn17ZTfzBOsNeWCtE5yPp2wvF9Joo4bNOWCoT9G/xzaa7/rWngR05s0x
	ZbMNcufwvnJqUD/kLiXEqFyzu6jlcSjmy0BYyqkVlqJb1c1V8K8R8uzTxQYd4sHd9X9kZn9sMSc
	Ms8qNClQS7bnanxxhExIQQUqB8D2nJAKNyEW1AfmM9YA5s7LwA==
X-Received: by 2002:a05:6000:2383:b0:4a8:8004:5261 with SMTP id ffacd0b85a97d-4abb6d04250mr34327691f8f.44.1795541547074;
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:14 +0100
Subject: [PATCH v2 07/19] ASoC: codecs: lpass-wsa-macro: handle the macro &
 dcodec power domains
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
Message-Id: <20261124-topic-sm8650-el2-v2-7-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hVFg3Y31Ispb6dIhV4lKOW6ZJCfvIzuJH+rNG0A18RE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcod3y0YQ0h2BUQpIM4apyqk8yOgOGlztGUy36oe
 7e2JPcqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHQAKCRB33NvayMhJ0Se7EA
 DFos36gYy4RYDRa7R1O6n7gn3ZjBST+lXq0rc+BtlYRhQBkv+plvM/fdkv1vhFxFcAL3LMJm26pgg6
 EAc4ea/zyMm9nLe9JZyBXI6R6tXmPSAmnPfA/pkc1g+26Bi6HDrv0w4qYPDemOZ4TR9ErrHRlxZiZu
 mpt2Ay4r42L0T5QF0jszfiuoqbbFFNGNiGzfHH4Tg0br95tQSgrAQBQx0RkLJR1s8YJfxUpEe63yof
 SC4bjrgMa0Ahd1TUkY6pTmdg+OKqeokhbO+Q/Fx/ay0lrjEHJVMytyAXvxH+PFZY2iyjXS/y9jhaF8
 VhOvgz9bAIx6y+fvgPBlsT7Dr//jgYQ7DswTbC/UxeDRt9LTUo4Mj+9atQYvyI5jyPcfTpcamZD7kK
 w6cWGJvKV3dh1t+oG9+UReA+HOfaoaTxhqTRKBcawcNNKXZPJBAfKylGj3lepPQKcOr355h5x5kT54
 1i9QipL2N1hlE/atQCVwnJqBXhn8CLUitlCjTufD97ldbJisg0H39XzrNTkk+7vYdzMqM9EbVnM8X8
 DLDZFllX1fV2ip2iOIdk0cOgB8X+pJgjDWJqUG116Z2A/oTam9YlFZUMurEh2KcRo5TI3JTrI8Efsy
 URFlBGIaJG7OAI/gE5gHeOFA3XAzLGZtxhSz552Lx6KQ/360SRc1kHU0qUFw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the LPASS is not handled by the ADSP firmware, the WSA macro lies
in the LPASS core and audio power domains like the RX, TX and VA
macros, so attach and power them with lpass_macro_pds_init() like
the other macro drivers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 2b63954f783b..254b8faaa8a1 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -419,6 +419,7 @@ struct wsa_macro {
 	struct clk *macro;
 	struct clk *dcodec;
 	struct clk *fsgen;
+	struct lpass_macro *pds;
 	struct clk_hw hw;
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
@@ -2769,6 +2770,14 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->fsgen))
 		return dev_err_probe(dev, PTR_ERR(wsa->fsgen), "unable to get fsgen clock\n");
 
+	wsa->pds = lpass_macro_pds_init(dev);
+	if (IS_ERR(wsa->pds))
+		return PTR_ERR(wsa->pds);
+
+	ret = devm_add_action_or_reset(dev, lpass_macro_pds_exit_action, wsa->pds);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.34.1

