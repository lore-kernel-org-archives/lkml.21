Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048149;
	b=ofvingn8ShQA/a4l1Okzit0Y4WUz+IB7G0PFf39hZaFwN4jyITezEaS0MvqCD2txlymx
	 z5/AVYKk3sC4hHhYLBpBHsaH4Ux385QIsd+soNTtl8C4m/087esBxvbkMCFJ6V/FvR1eJ
	 jRN+AP32GCBxuGeEnnafHIetfLneFj8VBIH2Sw7HjZDxe29ExXpvvOTHySRWOMmVgvLI2
	 3Hzc4ziv5iPhy0grbXbJm/fzHg2oyzzgJdBO6lUcUKGb9paoEtM09l0BPHcD56BTF+tpJ
	 8e1cQ5G9TWcolgeHVdKZQphT61J5bqImCR8QUiSKdiH1dyBqSM5NYXcEHgY2K6GCseQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
	b=CKNG0a9WqiB7VpowmvYEnv2ixZ4szzsx3fPursoXEP9lWUjk6gO555w19FND+JTiLIgw
	 MFR4WqDGL0/+CzBUnyrS1xaS11G4RPSMHHVCIJylbLDALotE3I14+59/CMRJkurThy4cY
	 LHcXmsKl+37Vcz57pQ3kw2dJ1ARs3u9oP8H6QH1H3GPhLUsaE8Ax/wqioGgJ1tEQJZI2p
	 B2v3n19Vz3WU4GvwxdqtmgPPZfG9TjZX95PhoHTE9S4i7dnQruEZNtWjevlDnyAnoR83F
	 xy1tQEVSw73VFil2rLjtZselbLXm+HbiFqDyomoUXsqrA3ClLner6MyiuZGWkud/KfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNosMmSY;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA3560A2608
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA3560A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNosMmSY
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53644b28706so23048371cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048148; x=1795652948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
        b=LNosMmSYVWnJETNENXouh3pSxSOcixqfbVhjtJFB4W4x7If/33+aNHIddZVsFFbdGZ
         WJLKx5XKzdzp79zwfIzhKaVdDqJ9xW8YaDzT5Goc03+rhDMuHU/sVKfeRl91f8HQx/bU
         2RAAKG1Phd5ZQtIVBcNBxE019+G4lGoWqy/J2tOXkoqcOgyOn75bysQFaqD1edQIv3A2
         FKJ6iMJZkzFS0z6zDa+IfoKGFW1ytliU50KTxI0dW2DOMRUGWmaK+VJbLJkCXO2+tD81
         wtfPAxQdXqKA+U5tciIsFvE6/Tk/yq74Hfo/IKJa5NuA8udDB4/G+AJYUeOm1uofhQ4g
         +kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048148; x=1795652948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
        b=TY2yfoFrgObdh3by+LqVwPprjdbR5Kv6GDgN/7n3D/d71j5u0aKcI+VLWNEdILa1Lg
         4HvKaXyKKpzlDx7gDOABJXvbMjXEFwNJhdiwilFZIehu3q0AO08h1uoSPUZj08G3oIqM
         V3+0HnQhsf/l5Kdd60NPnvv11cETbFaVudb4Q6vf9e5G7aQUp8/yMKKNIkzcR+Hj5BHH
         ZdtWyqXstKnto10VIDFB2pEjKWXqVxv+5iPkrPplUxzC61RqNZuYeb5l4wk+z9G1Dt4t
         42waHvviEnScRKvO81ItyryefCfPwa5SLrMcZEYzwXfwq00RGeNcAG/DQiPfbWTudyIe
         Kldg==
X-Forwarded-Encrypted: i=1; AL+hErGH9/tWxCuhzHDz2MR+wsCKC0sxE/U3BtUYEmAiRr/YxWKXgTwBS+VGPLaoVbh6b9iEQ6BE6R/vz9pu8vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7MXaMfIlx/GL9KGMpx2SDl933NWtmih5A8VaYxitMCpl3TfpZ
	InIFdcWkeSMtiDoc/HjnfyCJS/wuobBxysZOZGNANRW5qoclu+td2TDU
X-Gm-Gg: AYBFou2ChRINaQXshgOIfT07rUdLTaXLHw/7efLq9IE5ADzX2veLBypM/a44LRhGmtg
	I482RYKII/gn8Y9sJVPFyLHI3SW4TE71Fqe7J6Xq7QbSxuD2qaHz4gJGNX8neHct8j5MLcT/qx9
	GHlgWvM4iXw+EVlhlfUi9bLRGhQeDgikzu6xEA/kOZQFWPTiN6/hx7Oum7oEQOxnbyJhI0mTExC
	rmzyDG2atqHVboOSNLYF8YI0WFmg4VhMJPIqIbRqZ0IBO43OJ9Goh2Ydyn6nNaKb6swO3DZbnb9
	MzmTsA1AeoHq3sdE3zp5p5B8LbGEgUdcvyDFF+Qmmmj7WgdogVWKFX8b3h6IQQBWOJ1Q0ZtZNXm
	Q6N5HBsX0lOTGnB2PNTWCV0zLgznj1UgpNqmrnWRuo1+iZ5w/MhzzCeCws/WQo2jtW5H6JmuBxL
	inniNTk9AvzFLpvqhfxMBhF2HX8UBfztPfyPcjYt5IH1PibKKFxJSCi1y7qWrgp1b2bOUT2O7Vl
	m7kQunZ3KwLew8i5gsFbayjUjKgUr+fAEF7ufmxPkYlg5ks9Ojt83EggQrNnnChLxhvMYfoeGZY
	xXhVxUypEvlM4xeZWSj6T0iGV4+OZxU8aGZvfSGyzi/ti/09JLlbwdkX1kVHz4GOJeQuemSC0t8
	=
X-Received: by 2002:a05:622a:2b0b:b0:55d:33e2:a351 with SMTP id d75a77b69052e-55d5a537aabmr69062431cf.15.1795048148019;
        Wed, 18 Nov 2026 16:29:08 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:07 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 2/2] wifi: ath10k: drop extra skb reference when HL TX fails
Date: Wed, 18 Nov 2026 19:28:58 -0500
Message-ID: <20261119002858.425666-3-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119002858.425666-1-lcy8047@gmail.com>
References: <20261119002858.425666-1-lcy8047@gmail.com>
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

If ath10k_htc_send_hl() fails, drop the reference taken by skb_get()
so the skb can be freed.

Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 298e6a092101..7142dc1c4eb9 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1383,6 +1383,8 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 		ath10k_htt_tx_free_msdu_id(htt, msdu_id);
 		spin_unlock_bh(&htt->tx_lock);
 	}
+	if (res)
+		dev_kfree_skb_any(msdu);
 
 out:
 	return res;
-- 
2.43.0

