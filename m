Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015836;
	b=T+QqcvEQ8fauhL7t5GwJH9A5fo5zyajZmKefsVJLMca5EDtUcITRExNySjJfrXAyynFH
	 3MHwOoVEf/aUXmvsy1JKzGbu3QXMTxB9m7JG9knAGNs5cTuFHVtLtC6WJtnBjsEnCQsTy
	 uXSIyYiX0qCPORf9HtlEMY2pH9PhgtIHeh3FuW3d4eJa2CkpDRAogEuFRXXlNxQ6PIxD8
	 nCXIXRLX6Uw1tQG8nGf1uJl8wz7OJSkz9NioQo/mgbZmEtDwHDBmVo83yM0tflW2noiLx
	 7NjL+9EHoFpSmP/Cfc6K5hlpeBoIPR4Hr7TjOvQmHA9ebbXhxJt2mxZECVEuio7c+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
	b=UNWuFkQmVbJZxOP52ewB5BGTWa+YmmtiKik+U3z4EuLc+AnQP//nYWFCn+LfSpBMQfPy
	 OIEMQCxqpv5OpAkVD4EwTMHooMwNB+kGMRp1bc1aBLlBdqKn4N2mxhG1v57/lkg4hvUXL
	 aCBTJ1rhMenj0hi5TLXnyybV3GCrNkX8Rdyl3kYYiqLYElr74W0bj64SLMfWOPCraKW8U
	 aHO+IvJp+97FQgJqlYkhgd2o80LU3LWXy9RnrHYbfepRXrVXXnOzplkyl/D3z3N3rOYeL
	 hFwH5CNGVil/PUjRfl3o9UG3XQ4tpcZUPdaSZc5YesB/OzDknDgdv/RNDk1GsAdZ2oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNjudTQf;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BAC606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BAC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNjudTQf
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381d542bc29so2165948eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015836; x=1795620636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
        b=nNjudTQfUtItgoHK8wzcYX+IGFRMeXj+D0aA6Rd/YI+IqEGKHlmiwm0DTzxYD6tNIX
         y2UKX/gNMusuX4F3gWYEjtlN+8ppU+9qfpj41cvSgo+uE6MahlY3OMt5dm8/y7FSWxX3
         U6uURVKB4m7HyQAMo42tMpFsLlL5AZVaf936R3u+u1YnmTDmBtbORevicnDXJl1mpD3X
         qHDB4F04WBInTWkXwgwgnlQQR3dcIFIBMjVjqbKWs1chILOjZH91nWO3/5uePD3HNchS
         MHClzeINEWtGDd+pn56VlF6MXsYBD5VxNOG/Nah9zM/VCsYdbhL1xySD7oPug46gf3vb
         IWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015836; x=1795620636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
        b=OEw3xXEjd/9HJ9wT7Ef3ooxMDwT5BjGc6E5r+AalF5wjZaT+oz2rB38icE3xzTb33/
         vpswp9iNJFIb+tRzAllhvvlX71cfSy6xd9T9Q5cV4loqm5tCvPnkMs9F+8NObrQppP4O
         97lmq0INWPbYUHo3YPomZUUdvb6a0LQybruLtu+55o/CXETXQ+lt35732f4Yv/upv9UQ
         kk/XnHvJcM4RoJuLM1tjqPTBNmfFoUEUeOAB3hpRZPlLKRO007wgP/XMBFeepk560NG3
         3aJPKF2w8TJfV5Mid+V0QmYJXAmzq5dEwTzQT+//bqstfO3Ju33ZeHQdL4XiGEMACsOt
         uxww==
X-Forwarded-Encrypted: i=1; AL+hErGlF7Z5OPAYMKv8LciT2SZ2iq+O8uU1gFJv4eaGga2Y3JhazeWjgaH23sx1MzOjIr+j0yvITgXoHvNHzS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kKD5h+3Lh5IRuStWxb+oZbpNCd5iGpVuRaBKW6Y+lhNBKPsn8
	zfMY5E260k120oC8N42nuMWIOVS4jDBOSMcSdNw7rYxGPDylWi0NQiBq
X-Gm-Gg: AZFdTZcYMvH+eL+LWUOM2/tuvyuX5oPIo+nooePc8wgRxguxBdQ6nBWujiMI0F+LM6l
	unh6WTrHA0HNTJXWe1bz/NkFpsaerfb9cgFtdxUu0qz3y6OywtNvgmDHxamWpmvSqFBP1A1aqKl
	BMiMRa3d6EwfSZ/qobH4fwuUz9N0kGIA5NFwvom7wvqaLl/uy1rx8HGIbGV6JzaDPZW3HN0BuuZ
	OzcgDfloHnNrUL8UZ4pICyCgB4dZhGMaGNUEjqjswA5M6IzONcJ/DUmOR9QjH9CHZEgB7WMMOmG
	L9SMFbOjr1OnR1imaeCRo9myf8Ju3pHmr9bkXe6G84lHVBEsJjZoJRyW3MxtoWkuMs1BkxOzuoC
	OvFRsU3+VGaCb2FR4VH/tbuxLpaWkUg+Wm/v3IpVySqfLH7D3QmyZg3zc8YxeeXVu/SuWvaesEy
	H0XLbSa5OLbxPjbl6C2aTeGUBqb0Xchbb++DWg9hcvZVMHFmFcB7+Uc1OPuOYe9JXPSV1A7Ajsx
	G0mohmUxhmPPBYYpr3hDqYrmH9H9pGYFluHPojopTVw8NXbFNLWHZtbWi1XYwkeXVOLtmiG9xJM
	wByOD3fHUcMUNFzGhvih82qe7WgLq6fe9PocGSPpcylr43eJGoh8vw+UXvU=
X-Received: by 2002:a05:7300:d210:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3828083e094mr2685513eec.18.1795015834724;
        Wed, 18 Nov 2026 07:30:34 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:34 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 2/3] wifi: ath11k: free the regulatory state when the device is freed
Date: Wed, 18 Nov 2026 23:29:41 +0800
Message-ID: <20261118152942.62838-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
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

The regulatory state of struct ath11k_base, the reg_info_store array
with the rules it holds and the default_regd[] and new_regd[] domains,
lives as long as the device, but ath11k_reg_free() runs from
ath11k_core_soc_destroy(), which only ath11k_core_deinit() calls. The
teardown paths that follow a failed start skip ath11k_core_deinit():
ath11k_pci_remove() when ATH11K_FLAG_QMI_FAIL is set, and
ath11k_ahb_remove() and ath11k_ahb_shutdown() when
ATH11K_FLAG_REGISTERED is clear. They reach ath11k_core_free(), which
frees ab, and whatever regulatory state the failed start allocated
leaks.

Free the regulatory state in ath11k_core_free(), which every teardown
path reaches, right before ab itself.

AI assistance was used.

Fixes: 61a57e51e46e ("ath11k: fix rmmod failure if qmi sequence fails")
Cc: stable@vger.kernel.org # needs adjustments for <= 5.15
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
that frees a synthetic device through ath11k_core_free() after a
SERVICE_READY_EXT event allocated the store, then reads the store to
see whether it was freed: without this change the read succeeds, so the
store leaks; with the series applied KASAN reports the read as a
use-after-free of the store that ath11k_reg_free() freed from
ath11k_core_free().

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..90124a826088 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2021,7 +2021,6 @@ static void ath11k_core_soc_destroy(struct ath11k_base *ab)
 {
 	ath11k_debugfs_soc_destroy(ab);
 	ath11k_dp_free(ab);
-	ath11k_reg_free(ab);
 	ath11k_qmi_deinit_service(ab);
 }
 
@@ -2734,6 +2733,7 @@ void ath11k_core_free(struct ath11k_base *ab)
 {
 	destroy_workqueue(ab->workqueue_aux);
 	destroy_workqueue(ab->workqueue);
+	ath11k_reg_free(ab);
 
 	kfree(ab);
 }
-- 
2.56.1

