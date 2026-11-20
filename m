Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139785;
	b=jqieUtKGwhopuif5cWm92EujlcMVHYl43KKI3OT2Uj6SWJhKuMWY1TEzLnq2mBe8os1+
	 7Zt2URn+azNH70piOXoTTgNuM9AMSOLV7tPQkgruDr3jN04p2umIzuZDtTkCf1anHW2u9
	 aQjWRJVlVPm/vFLfEh33saO9HBooe+90L74fvjJJn+PpMbmUcDYpr7j2ZGvm1MzKtUdnq
	 99zfXt/h16gEQ8/ql9tk92SOzuQ1SyZiNZ2k1vTVWJLTWW9oziJgIrsC4R0lBH7DGcV8N
	 /sZiLMxxPr5d2Fz0LCL5PukLPpk27p0Ft+uHABe3q6eFm7od1dre9zsDBWzXlebdYLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5nSvuBMZUL/DDBFGPHl37DizpUxFocDVUqNIe4EIGrA=;
	b=1sBGMMPtNJWgX5dcmDsPCtjnSRZn0s0kl6P5Wcqwl+B66L7tEXTu37g0cjMYF08Yiu5h
	 MQ3Kq2DMXDn8d1gbhR8B5Ks0wg+jVCdJaUL0Znzt9x52f7jAKuJRXGzYEFhsezyOib9qc
	 bSpXkqH6EdPzxFcT35RuEEsGhZLb3ljmVHSXSxbI/40ZKCP+ly5Bf2OW/fCVU5ceBfk1X
	 dlj7le87CUdEuuloPrT62A9SmpEklUjq5drVi3+wqH8+ZSXXAHBxlyV4iV6GKFpEIAKg3
	 7wU3vHDQQPs93T34YUcupqU6sk/iu8GO/2i5j1V38OATWLUzPwC5zENrNhwXR9xRbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rex5gL+z;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3563606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3563606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rex5gL+z
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so220256a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139784; x=1795744584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nSvuBMZUL/DDBFGPHl37DizpUxFocDVUqNIe4EIGrA=;
        b=Rex5gL+zVauqAIqVUMbRUb9LymDxrWeDdPsPkcuoAYuM+XH2bTO5vHvl93VquU9e4q
         S8xBZ7wGJMjFF1CT7pq9VtNaIUaICT+425Dx5e3Rbm4YAGeZl5wQb35unmMH46MsEd/c
         QOZ3x/GJtJVNO0db9GdfLTNSslZonoewARgjSpBue/fAbVO9BIo9CNwC3vSy3sloTLY8
         utAtFqYC/CeRTy3n/kS4rUXSDdm9wb62q7nXb3JvcGs4rftQKY8Koft4+iK4PyQRCv34
         MY816KI7NuU8TzpH1yRsv5hEwm9OYESoBJonaCECUEYbt/Iwh9TdzC7hyVW7rYO1SoaF
         2I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139784; x=1795744584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nSvuBMZUL/DDBFGPHl37DizpUxFocDVUqNIe4EIGrA=;
        b=meuAMK9oo1FkHlxOMM12dHnRJpQokvU9dMkU5IDrt4OqLOJTgqBAjrU8kwqGAciYQG
         hPWE49RwA/YMMJpYUdc99Tk4fdcO+J6wWzBuJhMvJDejAZ7mgle8GQ52WyCnEwKEDDex
         MJSxwO5vOBDgxw5RWZiQFEe5Rpk0wyU7jIxbH8U5l8LGskaxP1QlCRSCovqdJlg658Ef
         YOlpUmtoFVDeJ5peN1UtBTCPKKOw2MnW8sT1QjS2E9J2OVJwyLOt491uewl24vO+3Bi5
         V0xmaA+RLdxoHF3W4h5b3wHSmoiuLv+NDJ9ViTUVvA3Umwy5xpCcJwG0Iw/QAQyc9/I3
         Tw4A==
X-Forwarded-Encrypted: i=1; AL+hErH3lma268Ja0pDm1Hcac1DdleZOWqhTpIp2H9tQZbSzA+rR3Soq+u3jVE0CiDRXc286Pv3EvwwNf1rVH18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WMxKTaugnKuEThmnAXgwtQRC9Ydu8QDUxUKakiDwycwco6nPR
	QZlKedoIGDBEUNaDSeV2sWnRJygys8XXwTZ2ACQRq7icQzsowxjnocfd
X-Gm-Gg: AZFdTZdGEAhwwiqWsI3aEN7q/N4OKnNuyxO9bNsSLyn6P/5nXF3hDZuSJU73wIihstv
	LpxF/KI3JtWXYjR1Zw4eVTfgCOCQhzBbnwIuZ7vdIG4JL6/ZSaR26sQmZOYeet6YYWTHlT2J8Pq
	u3LhLt94r2qeWPjB9DIHnxvXKGAHy8r7Nx5klQLsQfd2FJWJsn1txZHi/EXcF6lJWSdOoTnxLSt
	XYiSavODDOr4MuiSLSJqfJaJrjvjUeK2Nu0UkLncp6Ts0JKV+CTy1DKgquvz2WFBuohKlBMLOkt
	ACbREuPQgsH+CzkX8tQfqAwHEKby2Tzm0fhO1+U8rjZwqVeiIcdpe88tKfPdt1WuxqaJH2yvXGP
	AMK27+3Pan4xGHzjZfeEJtyzOs+nFDoQjZlPUiDqwoysR7pX9gII8mRu/Wjhhl7cXcArHRCIebC
	+M1su5A1ZLEDDbtpk3Ds1UV7rTbLzQd0kpiEok8nmSC599MBr4nKCFAUJPR/zfwszBUn6ZoiI5B
	Cv8M2DJUR27j+ldYgP7cfEoK/bonB56hX2jZl62UUpMLTv4fHE0RffIe9NMNuUXzXbwpVYlFNEZ
	PNGSBHjPzXuiQk/Pr+VzHZmuS25FkTDbGn8twZ/RIfpn5mhVRVU=
X-Received: by 2002:a17:90a:d650:b0:3b3:b71b:b01e with SMTP id 98e67ed59e1d1-3b41cb533d8mr1019892a91.64.1795139784159;
        Thu, 19 Nov 2026 17:56:24 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:23 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 3/6] net: wwan: t7xx: fix skb double free when CLDMA send sees -EACCES
Date: Fri, 20 Nov 2026 09:55:53 +0800
Message-ID: <20261120015556.131547-4-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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

t7xx_cldma_send_skb() tolerates -EACCES from
pm_runtime_resume_and_get() and goes on to queue the skb on the GPD
ring, but it keeps that -EACCES in ret across a successful send and
returns it. The callers treat a non-zero return as "not sent" and free
the skb (t7xx_port_fastboot_write(), t7xx_port_wwan_write()), while
t7xx_cldma_gpd_tx_collect() frees it again once the hardware is done
with it: a double free.

The same path also drops a runtime PM reference that was never taken,
since pm_runtime_resume_and_get() releases its reference before
returning -EACCES.

Take the reference with pm_runtime_get_noresume() and resume with
pm_runtime_resume(), so that one reference is always held across the
send, and clear ret after the resume so that only a failure of the send
itself is reported.

-EACCES is only returned while runtime PM is disabled and the device is
not active. Not observed; found by review.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_cldma.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
index e1b37deb6d9b..5b4b9ed4a95b 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
@@ -926,9 +926,17 @@ int t7xx_cldma_send_skb(struct cldma_ctrl *md_ctrl, int qno, struct sk_buff *skb
 	if (qno >= CLDMA_TXQ_NUM)
 		return -EINVAL;
 
-	ret = pm_runtime_resume_and_get(md_ctrl->dev);
-	if (ret < 0 && ret != -EACCES)
+	pm_runtime_get_noresume(md_ctrl->dev);
+	ret = pm_runtime_resume(md_ctrl->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(md_ctrl->dev);
 		return ret;
+	}
+
+	/* ret holds the resume status (1 for an active device, -EACCES with
+	 * runtime PM disabled), not the result of the send below.
+	 */
+	ret = 0;
 
 	t7xx_pci_disable_sleep(md_ctrl->t7xx_dev);
 	queue = &md_ctrl->txq[qno];
-- 
2.43.0

