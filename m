Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447300;
	b=ULf4grfO3OzDG/cqIr+CHHkWVRLQzbuqjm34S+VKunua6JeSWLQzrPRvNcMbPjJlRwba
	 aIsVKMlbjW/uC0SMNoeEBgeNASQkHXdoGLGfg9c6o8i/1KTJW3/qdIFjGesXX8ycpzXx6
	 u4+LFEB4ZHZ3ce//k/Hf3vuW5QlUw9KSYSg2GMmN04EuLTJKgEV5DO4qISLgLC4oS2laz
	 xPeWzz6xjrk+o701PWMul8yrshE1RNPVwSSk8MLRlrm610ANrzxRU3PMHHnpFI3cmo34R
	 1IZNbXLFSMe5f9SWURnAOZ5xFDS3SV1g+FnKKqOMlm/qTuHiFVDbJ7dAo++UhaFamOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
	b=fzFR8S4ys2i2UKX53FkAKDmGdDshw9HgYCHHHrZt21x8U8AVX/Ht4YD9bNz3u1uo7EDQ
	 QCT0ZdUpJS2FORZcsgcU5u7BqMhBXhQdPwsKv+5d7oDX0rtSYufJOcwbZXk3Ln3DL0LdR
	 o0VL4Qct64XbIktFcmXalnloknnDa2HKtliyd2pdgOJtCcON+lcyk+O05CvQb1gdYhRF6
	 dEBiiJdOT/eb8g2kXACZeyCAlXZyTV6wzJbXbPwB3pZYcvpkyxOxH97fpV1Dm7jVlu1pw
	 sVInqAoj4hETZSYovWA7xpakkV9BlIDgEty3X+vJ9NuOdy68N77RdVVJjtDQN6tR0Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fM2K8COJ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5E260A260B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5E260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fM2K8COJ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso42050215e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447298; x=1796052098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=fM2K8COJrhrSTLYmm5PH5oE747bBUhT6wEfrGZC0UsIuA8zrm3Qyf3yuPowhjkyLh2
         9Ce2xQivNEDPt5oQa37fnFZPFLVPOrs7+ba+ltWUC7SsC4hOlUB/UT56Bbe3ne87HCV3
         2MulpLiOU3CEgEHOb6vJ/GwFKCgQAcn0bAxbcqKnINpZvD2gVcT9CWUIeSFBJSDVfMNs
         RrSElVBPOjGzfTD+bqfgpryGq6iGhO7VYmDpuMkVu0RGnPBnfxvYRoQigOyM9+lCt2f+
         /6PuZxc5tGD/IMmTHi8nRuP9tYY6wAf4qQjVjGf0uaiMAu4yQHuO9hFq321lY45b32h9
         yXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447298; x=1796052098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=cSDpsnifIL5EfE88G0rDM7yT8vR4is7nTFUMgWdDPgI0E/NOKqN3iK1gzuzdANUYUa
         /nofumN5zZZt36p7URADIqiRF7l+zwSOIDvS5DhbhVEQ/qePvSZlPxXE03LnWkK+AqlF
         VsY5QRte6Dtl6KmPX52bUkNXnOvzB3T1ufzcnuAoai6qI/qzUU8W+s1CRW5hqeXOXs+E
         mTizLQOLn+hfRg3mDPRb3CJFZtXh1F7qPJstXZOYitloKO/YPvsi1knXTSZdPVDYRR5H
         7Pw23xhIHyUjCIYlhSvqjoJN34fjwucNmeyge3fy6JknWmP3/9nDLvw2SsJgh9kmZwv/
         eGjA==
X-Forwarded-Encrypted: i=1; AL+hErFy4cyHsCmqHnsVRcjz8sbDla11ehVQbUoGROqgZPa6eIzIpa+sewN4AcCvRab12StBRuzet/xUB/H/aYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LcXM3jJhB8+w4x8PpniTvZe2bxw28W6uaTWT/nOFlweeyoY/K
	aRPKsSodYNExLDBVrq6FlcCIWezWvqqaGAd3e/Ii8OcBnME34WxdxQ18yvmkjLBYMIg=
X-Gm-Gg: AZFdTZdUCo4s/OxdwZ5GiR61V3F7PsiFUQpzPraPsc+PS+bDgryY7pYyTA7e3jkti/w
	3cQIi+rIrqIUBG+CqKDOvW487efJd5kAY4bVH7AOXv33zGhMh1zNn9hPZ6LQI1LgrpOnx1ewYLS
	QGU3AZlldYyuXS76xtgNfdiErkbsbDW3AW5A58LRM2Pg5eX7SCwjvaZh4hW6PWEvvET527pi23D
	iWUSPMmIDg5b9fbz8PpExGUv4kX2BktJtaxbTP7siAdX0s0tTCnKClAzFYuikgIb872CekAnrWI
	A2sQJS5nyZg+cZdJa9iiiabH/s9LOA4mOlPxbOy4/LSeIexaJxc3EBeOotWGDDjqmyVqrZQ2guh
	nYHiNAgk3sItf4Hp1hT61ue/Q1msM8NA+YEIRrsgb8f8Pb8b7WE5Q7h0ZUOY/r0smorbGYixfd1
	vn8kxn8oMHFYiPzF+Q6zQsmm+qfCJhnFiMzxjbfvt4jvMMeKMXan/tSrm1reJLLWIOa+xUTcUnD
	XlNh98xzE3xMRzFuS2o0e0zzHT8FxGjWx5FVJodN7/nhyAb/Hrs5T4PZJq83FCTE/nfBFU/BpaT
	Tx49rS8W/jqyHWlBPLxzzC5a7DN1HHTKPpLxhwVvoHLKWwU1e3o=
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr249201805e9.35.1795447298146;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm513780865e9.11.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:30 +0100
Subject: [PATCH v3 08/10] pinctrl: scmi: report whether a function is GPIO
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-8-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 3965f920851b..ed563514898a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -81,6 +81,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.1

