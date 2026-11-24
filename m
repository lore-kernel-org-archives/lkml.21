Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541545;
	b=XsGebA4onr8eBuckUf9UPSljIW9SgrWWwNoqg7URMFDVjrQIKxb5o0tgG6FwFnEcP/IJ
	 SXVTDnxIrcu43iJ24QfevnWEOOxbe24QiOOHpABcRMsuFQcLjZVVMV9QrTJLVAFLWtpOJ
	 FMJaROgPCFhTTn2BDoBwRQZZgolxtMRybeUdNqShoYSmScEGZ/RAJb1Puhby3h0HxuzR3
	 BzvjwJVFAfea0h8XaTUzV+J1xrPp3qBeTelwMyQuoUjvrTd0fLpil5dhZT/Qx0OXZm5OC
	 Ch8fXB0pjwdvFNa+VJk00cD3F5SeC/4mEKdP9Gxm0zJ+YXu4jx51JkoKLMQOLpEIVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
	b=OeHZpd6xCCLBZf63YK86MlAoYQgjbs2SS1N6ZJigU7AmKW8xr9rCXyWsAgO0b0C/9Vhy
	 Cji4TQQWU4o5Dmh02jpqsfzax6tzu/QZigcyXxkYp2VVvmSkTpA5QdJQ5JuGadThtJd6W
	 c3tg9BcpR3n0SfIg3aZM+J3KiN+YUhRkizC+hPN6p2dLQQ7AOb1HuLp3k7Mp2Ir0lDy0m
	 f00KcW+KOi3x6wxXPaZiPHp1vEvL3G8qTz9srcCoSO/RvH0inlAKAa9DxfFcIhu6XHfmX
	 HmpRVu+TDDPC1cn8jw9BEwoiPFVeL/CbkFIwiJswFPyLNOJ/nvMTMWkn6uI8OzVCsgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E0606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53E0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a32576da88so2798919f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541543; x=1796146343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=SYGXy5Ap2u/X5/KQA7XPp07sMy5CgEguqu7FL08TXFm/hqOEQruZbw1hMZsKonEV/l
         HOJYbNxnnkiaXjP+iTfNjDb+tCtb8lgbQdlT1/bk2ppPOcgY4HXPs+bO+3wDsxDWhWvj
         /cRKaVH1hAR+hIFtV4glDO+OBWJNnMeebm8W5+O8SCZMkYZIiqkSlHqUi3SJRyCAaRPp
         hLgZlkjKz6wWatMVSQsiI/K+g7CDbHVlDU4m7f3Rw1ja3LW3xJHaotoAE+s9XGycvEiW
         nkysYRYQrV+Ed+F3/EwlLq+QkF+3oKt7Qbn9nhW+QRpJqvJN9FruCRU3crA1YArQm2j8
         AFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541543; x=1796146343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=wXu3v/OTz4Km1hv7Y0YxQQUxYrmAg5P3zkKofZe10LFVvsatZeKvEVUns2xsQg8z2/
         wKWCrbHOSpf34lc0AzeNnWiCvH/a2+RisWeE4dfJ6COeQHZFaO0AntCjt2z2rQeBWVGy
         uQV6Hy9UZrPmfoZ3YxaXJSsfY3biZjV2MxP3If/92TITgDS9gmyZGp71u7SE3g91cK1V
         l+pzCZawI926TCqH2qBo/oWe5Yzx5B3nFVuw2KrI/LN1BSz1NwOVpecr3Q7ueM8XyDZ1
         xhJSaB4ALWUCkOEY2TVsjA6Qs2XZdP7UyVDYG1aX1ImtYS55CY3usesDdowtfAZuXQUZ
         ClWw==
X-Forwarded-Encrypted: i=1; AL+hErHDvYmfIezQtuCgt5zoAudPGa/kBhY7HlwGi/sGvAcJiRZE+iukxg0BypxSoNIayuh4T/1ryEIq/rlsDYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aLuWhezh7sIllY00M9/+eXtt7dY2yjE/4ngkkNj1+tq9BU2OD
	owUj5O2MrlYLx32RjA99MuP8DOYWkVlcbvw8FJHQbatV/W3yXVWXbt/YWnp27pv7frQ=
X-Gm-Gg: AZFdTZfUiBBK05AL8NJ+gJGNMEzpuGZlidOFduniHFynEv4ZoWW28Kly7+Nvvn8YoX9
	AkQyunUJhYJ3xKF7AWwkDHYEK83c30fVkOfnpXs6PBciEz3V9miPsDQpU8YvpQ8xeg/0okTtzIc
	7gXK61CLU25PVwfBpYTyDbp9HujsvixSnAHC+jxb1wWb8sLMNMgAIANz2Rbh5lwSg2f7HIXv72y
	dYMdOdua30Cxwxu6xLiZwJCwFuuRfjiOVl7eYmh2HrP4++qJqXn0IxR6SiOKXDNN6iHHQeSyh0G
	4B86JRhFK6m9QN7Zftk2RX3tDDuZxZje9Te28scaiX0PRQI83+9Q+tS+XBRujC0+/RobcMLDWQx
	zuXoxuoSOKLC5SMqLuKLoqLi8bZVMLCPCbL+nr4nvh9AdEDEoVpjZ15s3v0VSmV9TDoyFrrZBm6
	Yja5dpXJBXtnrn6iop0CgbFBAX4vfK/widRZCyLBlcHnPh5oUaTsGkUtta4jDBdpqS/00x7Ii9z
	htxta9OH0rrqtqWQXpxZY5+mQDQKxl9Ks6ic4RrMY1DyeSx19GSPdVV0HMVZja3sIpihyxg8kkG
	2OjuQdHBzki7dPCu56VzxKlTlhmTnY5p0CcBlBbCeZRIFBI/+w==
X-Received: by 2002:adf:e197:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4abb3678774mr26445608f8f.12.1795541542844;
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:09 +0100
Subject: [PATCH v2 02/19] ASoC: qcom: lpass-platform: disable the RXTX & VA
 DMA interrupts on stop
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
Message-Id: <20261124-topic-sm8650-el2-v2-2-174e159f0f69@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/fsIHu6LLX02EBqFrzxtmSXw80zjZLf2vPoqG7Eq77I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoaUI+Ey3cpx0oclxJ0BXcgHjXP65kiip5bZsF4
 lAYCriyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGgAKCRB33NvayMhJ0QQuD/
 9pJ9+7KRKgBDU43qgCv+lNJYfANeC2u/lWlHn7lj/L+rtHC1bC/dnwZ9MKq0FokNeYhOX3KkafaNBC
 JEnp4fIJSy8vMDejmTUsLiNTDm2xt2WG2kcf0YcyKS8v5LCIQnRdgYC9NyOsTZek1AkpvKQYW/AHN4
 sE/LUiXpldjN136fa4G9Hpz9nJAr9PU5wRQOEPlMxdIvb8rO08iQDfv1dzhrtyjp6X674F83QOD5Gc
 2WBm4rfbqbcDZ5GQ2z9djiBaijVzHUIuldz90XoFybzb1w8L70TyyXu63ePVE2RUeMuRc8FMp8kyOh
 uklsd8vrZ+NMKjCFtlaImyDaQr9KDVpnXA7qv/U+Q4B5tihQcG1s4zWkwYESgzrKZRMzCfU6BhW6qa
 RJvClCA1YStk+grQd7OFMb+VHK+EWHy/Loor9fU2gFuoKg3AY1SoPVVhe+wcuIdbqjH8uyQIBJk/6r
 +624C8vjUIToXwKU/Xfg7dPhUPZyLWNfrftTFaiNC+bm3zS1O84AmtBQTyKyDLnBDCzq2pKWhnbFKx
 6nSmMLOdRHOqDwt7ZoKzMMj+ntgYrHqvdFGCfyYs/EdUORbYB2gORzUfb1bKDcgYNvAaZOldcrPKli
 qApjQsl9XIWZbkw9CXE94le3TeSIMKUwsKNbPsfH5AT3YXA4Swwf5QcNAqrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On SNDRV_PCM_TRIGGER_STOP, SUSPEND and PAUSE_PUSH, the RXTX and VA codec
DMA cases set val_irqen to LPAIF_IRQ_ALL(ch), so the channel interrupts
are kept enabled instead of being disabled like for the MI2S and HDMI
DMAs. Once the stream is closed the substream is cleared, and the
interrupt handlers ignore the pending interrupts of the channel
without clearing them.

Disable the channel interrupts on stop, and drop the irq clear
register setup which is unused on stop.

Fixes: 7d7209557b67 ("ASoC: qcom: Add support for codec dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-213518@kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..9666049ae51b 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -814,12 +814,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
@@ -829,12 +826,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);

-- 
2.34.1

