Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541546;
	b=ywWSXrxCj6x3lJBTgF3uSdCjuMAWmjLdjZykzP7qL7mWPnvtZD6zg2DEdzTJQFm27e0K
	 eQgQiUhtDodbJQ9rxZ5PQz2UO/QKhCWSZtgv8EgABcZwkTNYi/UK3owz+Q6L9hplMbvZr
	 OTP90UgPKBDKtcK9DMpsERkBa4Un8x5vy6rmEr/kbAy+Y62yC7xThjNjbEy49Tt+uQL1P
	 bAvk6pA/3YdJw7dVDwqJ0GinYidFVsFlw0jxw2XokflQ5aNJAvpG9qRDQeiGA9XEhOXKj
	 nc/pbrxk9hXzKXMkeyfGSCwT5gFz4JnmCVE5XZGtS5UPw+WRNa6sIxQr6aROXwe0Maw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
	b=HNotAkHyyU6Weip8hFxjjkDnYcjW1qnAFiJ9k76vwqWucaFJ2AXT74bgXjGLPF2U6c8X
	 UXKo18LkAsVlPm32W8MTpKkx5H7fC1xS2U760w6DHv89NTYy6bj5MoihbZZE2J0IThqY/
	 mhDzhQmlKAnhqmrKN2xku/DNZe/IzEa/mss6UYPHqj0MVKaoj12LUVyf+4gPsYYZ9zWXw
	 rue2JfZsvVPtC6OMzXinaY9mIhvEnsedWZ/kYKk6wMZM3Haz/JS70VNT/6X834QOrhMf1
	 LuZrqG20KMRkQWrfoAwJEUcxAFt2dlKpZa8T/+/i5MXnu1//kmZpIADT1PhtO91JLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DFHTo7XV;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072C606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4072C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DFHTo7XV
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3edaso3280368f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541544; x=1796146344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=DFHTo7XV5XIKlU6dqbmVNRTyeq6SFFqQr5kTdu6G+iIw5y71fllZI+2cAKYkTA6NlY
         HE4lUeb3VGio/OtEk4MY7kitbftWmceE7Lpac9wLySUBlCLmQYJ1UZOn2kzPuy0h0mBx
         KcynLj6ulYBW1zmH1NgjHWxmoSh7zi3WjgcsgaF8I8SRmaPD3bYzQiWZ48eXX31L0rxe
         BWYNY2aWEkeZl8DzVbJSQ6Y6tJrGlwjH92OgSvs1PfMW4zYYYQrhMxES2f4gL/Cgyr63
         avERobOwyaFLe8nOC9d+1k3vq0a3jdhDxALWGW6ll5xVyEADjauvIC6oLwqZsO7EwY54
         wZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541544; x=1796146344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=UQWVs0kv21g9rUOOhFsBJGgnmOaqklxwJfKQKBga3IWwwjGaLR9QG00elaO+SSbHdn
         XHSjshWz22AG+VRmsqwAyh/BZ09yP+WUc8eOcvwWABoHLMolzoBdqYpMq3MGaN41LXlP
         F6/+kmdzeSmjJGBXE6fRHZeF2Je+3IEE9VsPSJzAm1jRXBYOwHxsIpUhcxppbCjo1T7P
         nTdo5JZcuBzrE77jXMp0a+nvsS7UrYy62usKHdjPVeZ3ZwQNDp2eeMas6SK2uD8yuAuy
         FqD7jXkGeAsvddROTywIbROwgIRIx9jjx+nkIDCfJVaOB98hgq1Kzkoi9917nMy3Kbgg
         WIjw==
X-Forwarded-Encrypted: i=1; AL+hErGVDve+Os+1MN3stiOGi2yOHeqGBby9zcu2W42a6oDvrfoHzuWXcwEY3DmR9xzVGJPfmwSLwSXuj0OIWb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+inGeZbsFLtqwC+BxCp4ADs4DWsujHgaPn7NVQLXvyJcjTBmYd
	6xuRBM6pn2tPRZGpAgtwRLTVwlyWQQvIZ4XL3rdc90xY4D4VMjlWCz566rT3Xpr/jcc=
X-Gm-Gg: AZFdTZeSyDV1q6PF50b7Fz5mLANFshlDx0H2hyD+0KmYE7mCL0IQB9wSDZRWj3H7EHM
	0K4GGVqV9InHJ66Ru5k0jLx0BeKsNHGzIjsRo0yJJqIj/plnFNMXNJnZgugQOlsLd3G8UyD7rjT
	nx5mc5QDxOxhXMNXlklGCmpUZWk6sxw+ez9vT21osdrv7Cnnmv7CS2NfwCQ6YEAJRX0Og6KawHX
	ydJgUpNWYzi29RhIHzZJmNRNweaR9KdihGjQTbFtGAUzcqiF+7cu1Ef0mIKu4oC6sARfxYKWmTM
	I/ZhjegNBic4LQj1SRU8JU050RamhLr5wCcRIW++GCZB5AQChvjfvLE2GwfeAvl2/xOBB8FI2Kc
	oAS5y3WQYe93l9Ydr5e8xWYR+5gFUlpOVp0AQ0YJYXC3aeRII1AocOkT5tCZ84d/fKvSHacunDf
	fdS0OHjwLlcMN2yMhnrUlWKC2nRxu6sj01vhBtV99u0Yqy6xuRLI1L1GaGsMXJXS+9E3B9wwJcD
	nPN5gupzGjsRA1ELjzZyHpOgz0IA5tCUZ5aENRaW/qhM4IIHeJl/w8L6TLEUTdg1vRoDlBcMn/o
	ypnl/ucCotBnkk9BZEoMoSVB28yHqx4z41CkxUSekgiTB5dyBQ==
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr4964922f8f.8.1795541544368;
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:11 +0100
Subject: [PATCH v2 04/19] ASoC: dt-bindings: qcom,lpass: add WSA RX and TX
 channels ids
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
Message-Id: <20261124-topic-sm8650-el2-v2-4-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7B0HLPkz/JmSein0hlLzb+UyX+3YoDiyYBasK2j51sI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcobHT3wfA2dFegDM6YyeCf/EjweRT9Bfr20/CMi
 fRq85nmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGwAKCRB33NvayMhJ0ZcMD/
 9IZE1CdzQwYE3MXJB4tNl1yvGP94XqFSZE6c/N4gyF54PCyf6E7gs0CovGuulFHzDiUUhCp8RpE1+0
 xEHQkSUvWkym/v/VDccJKA57XdKX+RRycZ53j7gC4m7d2sHCKH6MNV99s5Og+PfpOo8rC7ZeJfMQ+Z
 1hexuC1yj4i1VBnDxI4ubfyxBnhy3NVW4fvrjL4Rp32FPt66+MxW/Q8P5N6cW3QPkXVy8IsNWkRtbH
 R/JuRuiCm8oh0njunzrQFb4DklIbx24HWR1Bi0mcjWGmdPJj/yEMBkonqpFoG81Afz92Sfzr8JbG0X
 c18hGgABLKE9QBS+8/QWIXnL8t8dUEaUUkhZGKxtHAdyOsx6zO+Pjuj8k9+BNoyxmbiKYdu+BUxONb
 j1tOU2zdHsFIc/UtyiHwE8+3LvIRUxnqywK72uwTOqshJI9Ez0WP6SPO+SyXPAVqi9xfKTzs0o4WhJ
 fNdEBwDVPkKV84tgxthnvvFNyXRh0cnqfLOSj1gOTwV1DKOGO4JqPHqKdYHlcFmeYjZ61cyVhmhPjB
 a0MJ1suqL8f4eftaFz8oDt6K4QvM61bEfyfgA2+a2i4yAFcjl+uRdoVt7mkNQalJwPqrRCu5SGCmGw
 TFEUKcn+akM2cV0P74rKdfqhlkcFU2I+2KYy10c/SWeQorKGzwmzF+UII+3A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings to connect to the Qualcomm WSA interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index 22f5e1fcc8a6..5d8db5195dad 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -44,6 +44,27 @@
 #define MI2S_SENARY	34
 #define MI2S_SEPTENARY	35
 
+#define LPASS_CDC_DMA_WSA_RX0 36
+#define LPASS_CDC_DMA_WSA_RX1 37
+#define LPASS_CDC_DMA_WSA_RX2 38
+#define LPASS_CDC_DMA_WSA_RX3 39
+#define LPASS_CDC_DMA_WSA_RX4 40
+#define LPASS_CDC_DMA_WSA_RX5 41
+#define LPASS_CDC_DMA_WSA_RX6 42
+#define LPASS_CDC_DMA_WSA_RX7 43
+#define LPASS_CDC_DMA_WSA_RX8 44
+#define LPASS_CDC_DMA_WSA_RX9 45
+
+#define LPASS_CDC_DMA_WSA_TX0 46
+#define LPASS_CDC_DMA_WSA_TX1 47
+#define LPASS_CDC_DMA_WSA_TX2 48
+#define LPASS_CDC_DMA_WSA_TX3 49
+#define LPASS_CDC_DMA_WSA_TX4 50
+#define LPASS_CDC_DMA_WSA_TX5 51
+#define LPASS_CDC_DMA_WSA_TX6 52
+#define LPASS_CDC_DMA_WSA_TX7 53
+#define LPASS_CDC_DMA_WSA_TX8 54
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

