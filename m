Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706564;
	b=ASBUOlYo34SoEFY+umVzyNIe8B1W3yJ2K04xzoPGF9s0eXcbHFiO1FkQpX1tmxk/iobn
	 CYDazOkwQzv7UeZN6ScxuVSwpxsX+wzwP+uvi4sUxWEFoGWRunVIZaKpsmsRyKb1DiiUZ
	 2Az1HV/tEX5ztioQGLcfUKWfyzkynkn9n227GCiIWzB1Pfkk+jI1s91wGD1EB/XzvKHwy
	 CRERjOLlk9Z3GzAbJpo/dKimuLJhBfhHvGtMElIPVpB3CbJV5/3XEboZOSH7crp/Ehm7i
	 FmhbLFbGSghYHS8bNUx82pGxC4pj3lUaXRnaMcJJvSHg9CcjUMyvMIW7P2t1lovqd0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
	b=DXiWLiI7Z85npw9MJEWCpCrTUuyQkLTzrJIBbEIvMBaRvC1gPEToKuGjN2UStrclsG85
	 +zorJohV6gSH1o1fbmMKkRJtSzQNCYQz7aAXRg4a2ad8Ag8iEeTjTCK/lcKYkid+3jZhF
	 qgw0exlG9DgnrX3EwXU3x7HkmcW4wUf5/CKXVQavqQOeNKrBu4N+Hi9g5g8U25eGPOkTH
	 kvKRpwqsjLQolfNiIFft+c21uC+YaBCsZ0Xx7xh6H36VQUxmyGiIPWIkbnjYukL4gjx5l
	 KlNzYy3NGNaBDHon0HeZ7ekcz80qSd0qq4HnuxGUTz+NYrd7naE5rLDc2y1++5PrAEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iZu+/D3B";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5D606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B5D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZu+/D3B
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so3920377f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706562; x=1796311362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=iZu+/D3BniANHRXs2lzbkw7LWRXccfghYj35WKvmta9S+XdGY6U2rH8Mn/8As16s4w
         lo4HwXSBajMqRiU9kbpUWvPYIDQ1FPJmaZ2AX1EgbehGTLoboaSEqFbm5P7EP4M+GyKX
         znnCZR0o7glLDfiEtbztxhzRozOI6FJpdWiwsCKZFsgiEUGrv1uurtDK2LhAPjO+/jVO
         1rhvel0cCAeM4wV8nDvDjmf+cOyhq3Vv7tJ6jDAZihpHEO2J6xenYpTTyPlsC/TfDzSm
         a++r4qhm2D+aZOLOYMNocDhDij4OquLkvot7uFDJEcUfn+x/QAcr8MYbxNOXUUk6iUo8
         Jelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706562; x=1796311362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=V3cn0otQyw322AMB+hOhL4a9+rS0nCT8ypvBUJOfYMWAwSj/4focpIDa+3RM10Bnpi
         lHrsyJBmtEIIslOUobX8yRazGXDZMRJ9aqZDapgtBNBGxozDHRe12G5vY4eGdKAspzt+
         iim7RThLgMckwIXIOZoMLPyqyPiLBCtEcgXrDfpPU6LInxrTsdixITKi5ohbxy8EXO/J
         pCWxcbrxI9AdZSg8t/rg4J27YNw+SWNlkdaeIkGGwrzuIGihn2ZcmD/51qxYXsSWL/h2
         AGL1oD3zYqiAwryVnuy1pU01qjCiULPHTQbuD/xGRSL+U4DL+6jsJ6Uw1/QIRAF1Gv8G
         o+uQ==
X-Forwarded-Encrypted: i=1; AL+hErGJQbvX6StQM1gNCMhcaHbVujr+pa+1OnA6Ux1kmOVW6pBgUCUKFLCxCfXmzlSOCRXj70NOHT4ajV+SyLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qs7tlkNaiRENqfG82M8n8BOdG+xldQf4TU5J4EwVMRUsE3Ja6
	GgzbjnkkL3ATvlSzJQ1smRTGlsywagkBP3+sJ9zW46qNkljHoYlc0vG7
X-Gm-Gg: AZFdTZcMzEVAeAUmyPirfDeYmPHZIhYHUDlC5YCTE7JasUUq8hTOQ+YHFxmPn3ihPh9
	uPtyN8idZpFF7wYtWCQDXanHHfdaH0n4MBZeFuWBlumzYyVAuiKXjSseGIiKlWAK7aqawlN3WWH
	CeOedVTrwEeviaq5cqfvau6K9BDK5qhP+MsOsaETVNiwOtTVGurPCBDBdHk3dSZUcXbIGLTOkLf
	YUrU7a5drcs/U8HagWSOHPmytzI8fUpCSj/5AcUqC3pHBjGQ8ysF2wGRVbhQgiCesLHUqmlT8Va
	3YH3XLl/SAerzMKX9xkDAfO2cy8HvvmQZZEf3Hl6YJTOVLtk9fywdWDTpD3z4CgjS/lNu3NSxtu
	rhjjvlAj0P9hF+Uzi170CmszabTFTpY4HnB/kpD9kc1SGRUuzGTC4SCZWf7SV7DD+9xmzIPLPod
	b+IPP6h/lg23kW1pYdl6tDvGvh3xV0Rfix9ZwXhRh9pzsaQVK0Zs5bgU0ikDB3VFswWLmG6qull
	KKEXMM3v5/8VmZFctbwcHnZL1/Qblm8OdbpxGi2PJgjuutIIbhCHyZ4JwCsZMaSjHxHtrEYPPjN
	sRU3lOEG66vVfbxLrnLOrhk6JhhbNDc6r1qArQ==
X-Received: by 2002:a05:600c:5303:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4bb88786cfamr410681045e9.0.1795706561725;
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Thu, 26 Nov 2026 15:22:32 +0000
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: halliday: add gp_mn and
 gp_pdm functions
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
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-1-b8543d6a83eb@gmail.com>
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1404;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QegpgPfocKYFJp+cQizBP2hJGKseGJLDx0NLMt+xxOc=;
 b=cnZmYNJ0J/woBA32L0W/n2FpxJmTXEFp2rRyZGRko+DsuEi6MzOSuCfu55i3nZbkgD3GUjjJ9
 lVDNNmqaX7YCDxP78kfu165KKFClqU6BbexaMsOaMD5BlHlOSdC5/6f
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the gp_mn, gp_pdm_mira and gp_pdm_mirb pin mux functions to the
Halliday TLMM function enum.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
index 2615d40b0478..e89220c185a4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
                 edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
                 edp1_hot, egpio, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gp_mn,
+                gp_pdm_mira, gp_pdm_mirb, gpio,
                 i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
                 i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
                 mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,

-- 
2.55.0

