Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368949;
	b=fFmdkf2yy3b5MJogfAk8yUnRZLnNB0KqT7JadNDf4B+Lm43oDw3JFPVYm49SrK2KO1OE
	 tb4JIRQczD0eP+4Qboqc8EvZT0h+Bhjg8nxro0I7y2xK9RcPBGA23YoDam7Fsi1eRCyi8
	 xrbhLY6l8rxcRcOq3eWsLAg07enN/hkBaZVAmML81EAqog+s2+/h/bIvuT0yEv+TkVs6j
	 K0wnoeOl5bT/1olOp2Bf2KtxJq5HPt0OdUnUkM0u/q+kFE6XBjrH5Ubndia7UNEgFme7s
	 F7ax0+Sw0BoN+mkuvZPHkgzo9bDLiJRNhN80rGoxLyLm4OIx89mgSIMYvwiuFxDHpXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
	b=YzliEliCGXlap4Cnv7olYaJiy5lnf/eOlgGFH/YpiPmjSqw6m2xPUL6zj/HjQYq5o44o
	 XPQUOkSYJlMuHsam3hrsQ1myEQjTjwzN1ogCB4QkETMnZnISRi9Knr2JDmtpFysxysiUc
	 zep845QFWtH3vG4bG1kPPYEV29cwW6FDaASNmv2pUz5XhxupvC/SfSfZ6ObIWH4bxyId8
	 mBFhd3eBY7m/i3r9A1nWKrPrSyBNQKbJOiYiMimWCb1UyCGkzFyav1QYPBvNphhYynrzx
	 AREaL/sJuRebnW5xvVTYhk1mwjb21KzCLxxSfE8KZIs25NWA/L6L1T5D+FnW+7pFiiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED4F606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED4F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUAGvOS4
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso547795c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368948; x=1795973748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=RUAGvOS424fngzXVXGnBDW25yR6ASDwqNP4nBG6P0RkE9ctSrz2XI5dWkla9yQdNRU
         8bc+GZlnNJmIL+GnPOD5i/FJh16cvhqcLYZIkG5s/IkqkrVNbUlWzbaclMWsw5QGc6Qd
         yT2/i3zW+d70nhhLwUMIP11m73mOojUYl0aXoDYXwtqEmJhKXxzb7ppUZSOP1TCZoMUa
         zFpsiJE8TN7BQ5GCwoYiz1+ILN3lGf1t4zBTybBd0aFdLHXrkrS6miH8A9n+WXnX9q1t
         tx+eDUcBs7EJU9tDABYma36Kjm9TPSCLgU1cAeRSx/G9t3CuwamMijnomdFYbGBUmUWH
         H6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368948; x=1795973748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akBEH5Mu5RKcJOqX+P3AWfnGfbksoU5XtkoXP6m3PJU=;
        b=1V+o8K5cbHHAmJHVr2xHKvFghpyIWyV1SoWyEvcVp96G5utnWNU402F5qXVBcAe7ul
         Tit2HJd2h8qKgOK7gFb2JoYVynLY+FhmPa9nL1f0+n6ITCxIbAMFBIW01qKn/BYVnFJD
         YyGHyA0O3SS5mPsb1uGDVeEwE0mFIH7aw4e06H+iL8U3Ln8jq0t/x+cJ17+rD5QuKzAq
         fUGaSOCjQmNUHii5f6MJUhqWwkI9OkywOYzk0YOebB4n1u+MT4+MUxGd7CdDi5cbEJ2x
         ztRzEx+bR16amqaTuO1GwKI5V98Qe3478UaYcCglLfVfkDEPXxGYJOnvIHbISNnZky8r
         GLQg==
X-Forwarded-Encrypted: i=1; AL+hErEIEcW+GC+oWDK4dhw3MT1yz9kyQnYQ1R/NItK6ayUzVyGBxIbVU+TsPnvrZDwDS+DlUluNfPWllmDpR1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K5RVm8NVAzSLS3FiYw5cYjVISV2aZsrjA2fXxOZiAX5GZMZNL
	wgAHeRSKy8SOtWLcx+MkOX63E1MMIPSPwUOTYl1UY9oEjNxOton5+dTTnXb2jft3G6Y=
X-Gm-Gg: AZFdTZeEcNl9wHn9lWBFFpp5vSKN6QyJahZ3R3tYc5dE2c/Hc/TYqmavn3pcouTvLV7
	2b6LEcgkUgHNmZM3Xuij6fRneURRIDiLYdLDRHlOD61eruagQp6vtaLielk0fDEMe+eAnM0Qxqc
	EKyA2/3bvBKz1P8afyB7EzksJ06cWI8MUk9/nXqlG/nVLp9WQGzwk0ati39GVTYgrxugpF7gmar
	/SgpD7bkVtAmg+ykcBY9NOboqsPc+GmQCVpWbcHkOPPjttXj5K49cwyuYSiHSlA+UHwTkhKn1Pq
	DVbtds+ciFGAvYkXjg43T47Y75AqCXC3on7Xt8/DfwnROgfArW9GxmrQ6kWEZGpWYsABWmORJ60
	gEL+iL7eQHgXy0gjAD5uYmeQYeDbO9DE/ChR2SdwWpwkBYTmkBbeMTCBH8xGz4XYDECCa8DbfNR
	HcWyo3EK1F3EaPNoBLD29ZdNyQUXtErXPvSWJkdja2STMdjPwIT5nWoUpKsrnkO8Kf8o+DFatbG
	oPzXE0DaDdwM3CKhFqG85LcSLeHh/KaqkkJM8PSF8AMgXngFPJGQXc5ZPWatDfU/R+ZJLzUgU71
	FV96+Ic0TtBokmBOE9jl/OmyFnGOl458llZo9SSXVbyS+n9Gh1jFZBqy/4dUWqz053kwL86UmlR
	J3mtHJtBK77UNZWIXe38n1IYg1FsT5mrDlKohFggEk429TXrrsad0Lk2fJ/0sgsxUgMACP/w9fQ
	1o7bPrbRWToB63eZeajFA3Gwtl4g==
X-Received: by 2002:a05:7022:ed02:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b5568f335cmr9548851c88.24.1795368948100;
        Sun, 22 Nov 2026 09:35:48 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:47 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:49 +0530
Message-Id: <20261122173449.21009-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LPASS LPI gpio5 can mux EXT_MCLK1_C. Allow function = "ext_mclk1_c"
in the SC7280 LPASS LPI pinctrl binding so DT can select that mux
once the driver exposes it.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

