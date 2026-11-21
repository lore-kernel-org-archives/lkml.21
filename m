Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302474;
	b=M5Pk30WXprMggg1DVJtRL9WCPQ+s3jozmTtD9CSe8QRcTxCSySpNLdUgmBh1I09Rr2hv
	 a567XK9I2IEPtlmzHgZ6wRsPld/uDbovtGDiCpSjAEnC6iaN3mdnFxJQ9le8Azg6q1T75
	 r2leFQD9LwVV2n93HuwLdx4saFIxmN4aEMtlDA7D0qB/q8SBXXXVdesSib7p23Vz053N+
	 FdCsb6Na/Qajgt6B6eATN7nQ+ILbrCjk7Pkpa2tlwCLGNio8YjW9DBaC6+7H/8BHr85A/
	 wzEoZS37h/q+PSd9h6glCU92hIw2vU/T5W3ILFRpW39DWAPmLElsMg7Z5UAWaWBAd3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
	b=B578fXz3HliWt98R9eRw8gXa+XJG9oV4ED6b2oWT6CbMJfjIJAESp7hLbuytZLVDVQZ8
	 cOomK9WEEsMBJDg1/0TxSTbOb/370/7mqELmWKKAU9v0fP90YHe34t4axNcHpQ6s9eG/e
	 wp3d5efJqGbPHM+co65FrLZ3Dh/zX21Vs7nQz7AAGWoyLCnFOOPdRO5Glg+uGQouaSUzo
	 WYOopEUNbCyxOsqFMQnhnWo1usKjvIONGLWW7PQvHY7YtZPGFgkeSiy9P4vFCcXWFQCw7
	 WvaQbh+Yog+4vc5PygpLA96NmVG8l8/te1HIfxR6MXv/Jb/+aX9VDGNgPT2jlk+Jcsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="iAn/gKCe";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D454606A6BF
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D454606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=iAn/gKCe
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so391308166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302472; x=1795907272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
        b=iAn/gKCeDVxoppGDtERRfbQtMG3UyulV8/ug+KryZz+U+gatkxGk/JS19etoExrH2k
         AQDxCI1HLDqRdvHjeTjkJcwJnA/EC9FBoQ+J04FXLfTGwjnIrW6hMev3wb3CFzIIDd8N
         LSfHhbvgmEAdprpqNr4KUJFCCL4gjwqobaNVo5RKM8ppN1ru9ZI2afW/1XWVGu8EJUGV
         3ZK/Z7DNajvIBLzox6xzSvxQc6RrYW1PxER/wpwslJmmaAn+DI5sxDD7RjPBUFBmvhSb
         RPuAACm4PImYIPWTSquQPsmGxBfcFdsFfwpR3jnWEV2VwAF9THfKW0fTfUAp4hjNcjB7
         5PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302472; x=1795907272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
        b=Cr8FrbmhjDgBBRTsMgy5DQHyYWkEq0iU5vdP7/0LxbdXYM3LQKDqIvskLLGEL/edg8
         f4001X9PpJnBRdvZYuc75gpCa1SgkpOwwGczH3jKUvSJft/fZjjisE3T/z78lulhIJya
         AMTdpAsOu47cCAT0zFeC+dzzfa7Yr1pJ+1y3YY/QVyoDvSBiTCDmdB44TQW8OsxSyfHy
         V3JyGbEddzapP7ne3qwgGKELuxKcLOWgNM8aKoGasxDkg3gcSYnmpNCpVFwYxCU9QUf/
         MjyYqfI9lZWLodQIL6nW+481dlSOBFWKrUWzgLoDB4EuWk9nfnaO/0BoYnpUglVJ0QhC
         RNxg==
X-Forwarded-Encrypted: i=1; AL+hErEsq0/6MhEqArD50pTwcWLJVTYBRYnSL+0xQNpHST4QrzqeF7tKqrgHUjPrDou5TI/K4DESQf1lwtkrkCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z82wHICIUSflR4ByL9I0f2FO0MH4nMT7tT4DjISQZXl3Lk0l1nB
	IkHiTqDCrbEogIBogL9H0Z3oRcDsDDRHP1NL9FD6EcCfNjmddtxhzNpmMcgYRdGi6A==
X-Gm-Gg: AZFdTZe185FWLw+JaWWw9wrvZWiOq5Tmj28u8I7+pkuPDSC1x1vvbSfJ8Zop6gyxcon
	51HJ4Qgzvt2Lmx2AJkqMlz0Ab5uBQnx2Yq4lOdKjJF+qphoTDGBmWUjVp7F0B3w4lHIcCB3gU9c
	m+Nk+R4A0/zNC//Abzko1jQNryCBTh4SVcMg5XhJhJYMmOcqMfu+DZOiHJH/zKUqqwEW1syQsap
	WiqeQ5kQkzitMw7w4c961l6QNc0doSotWdf3n3qrMHByJqaUXFpfDcUQMpiVCDyELQkrHLMiRnQ
	a72Hg+jNAi9OSGlXjv4kfngqRELhYdFqJzqjd5DtFUm+1wx5dujDpZKCRhWVV9ClMZ1ZzoWEj43
	6eVkoZksLbSCbINxhVC2RI3r5s0aAP1h3vK2HuPULtQuU4G9guDchLve4IABy5Jh7MAcNA3pfVX
	QqfbxkzwM6Zw01UBFsJA6I6C3bDhBtU93V8KBnGPvh9kbFXXWRXTGwuMshoxLJVt8cr4hMyrsdf
	nZGySS09tJgNYaVeArVdt0ErF2nydBzoVPYV5eJcWkxYftROmkMJD3oNjSNCKT04pR4nwCH//UM
	wtOq2baSXoTHFzOtNM7fGQwLiJL56OUdonIwVLV2Fjnechl51lW2/cYCkCs/1rSqdDR8oV4ES1b
	qZEQwXFiB07/UPJqR0wu6NZ+4IoSF0dtpurM3n93ZHCV5lm6PPR/3O6HkhogRqT95nf5OfExf9r
	EO0AqF42apzjILCvQgOxMhrpMVnB0wP7yr4EPp3Ss3xLgfcOlSoPEFcJM7IpR8wXrsW6028B4QB
	SpooFtpsyF+/GFHNwtF3oXQmRot4H2e9oV3xSf7ZF+qVQjL65YdSttUW0Ew1liRWzkx6a7Hp/gO
	TZ2IAIVyvXqcudtv0bekim9Jm70OXrq+IP6OiBIhdE+YD2Lf5mW64Q+hPJIK6PaP9vZEocsgNE8
	=
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr425452666b.30.1795302471991;
        Sat, 21 Nov 2026 15:07:51 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:50 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 10/13] wifi: ath11k: ahb: configure the IRQs before the firmware is booted
Date: Sun, 22 Nov 2026 00:07:28 +0100
Message-ID: <20261121230731.1206043-11-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

ath11k_ahb_probe() calls ath11k_ahb_config_irq() after ath11k_core_init(),
which has already initialised the QMI client, created the debugfs
directory, registered the PM notifier and booted the remote processor.
When the IRQ configuration fails, the error path only unregisters the
SSR notifier and frees the CE pipes and the resources below them, then
frees ab: the firmware keeps running and the QMI client, whose callbacks
post events into ab->qmi, the debugfs files and the PM notifier stay
behind.

The order was swapped by commit 166e22b38aa3 ("ath11k: ahb: call
ath11k_core_init() before irq configuration") because the ext IRQ setup
needs hw_params.max_radios. hw_params is now set in
ath11k_core_pre_init(), which ath11k_ahb_probe() calls before it maps
the resources, so configure the IRQs before ath11k_core_init() again,
as ath11k_pci_probe() does, and free them when ath11k_core_init() fails.
Nothing can fail after the firmware is booted then. The SSR notifier is
now registered after the IRQ setup, which it disables on a shutdown, and
unregistered in the new err_free_irq path.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 166e22b38aa3 ("ath11k: ahb: call ath11k_core_init() before irq configuration")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/ahb.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 893a3270394e..736fd368f8c6 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1285,26 +1285,29 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_ce_free;
 
-	ath11k_ahb_register_ssr_notifier(ab);
-
-	ret = ath11k_core_init(ab);
+	ret = ath11k_ahb_config_irq(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to init core: %d\n", ret);
+		ath11k_err(ab, "failed to configure irq: %d\n", ret);
 		goto err_ce_free;
 	}
 
-	ret = ath11k_ahb_config_irq(ab);
+	ath11k_ahb_register_ssr_notifier(ab);
+
+	ret = ath11k_core_init(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to configure irq: %d\n", ret);
-		goto err_ce_free;
+		ath11k_err(ab, "failed to init core: %d\n", ret);
+		goto err_free_irq;
 	}
 
 	ath11k_qmi_fwreset_from_cold_boot(ab);
 
 	return 0;
 
-err_ce_free:
+err_free_irq:
 	ath11k_ahb_unregister_ssr_notifier(ab);
+	ath11k_ahb_free_irq(ab);
+
+err_ce_free:
 	ath11k_ce_free_pipes(ab);
 
 err_hal_srng_deinit:
-- 
2.53.0

