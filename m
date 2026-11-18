Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994220;
	b=p9FpmpgA7mw/ylo0FyTELEaHrkQ4GJrIBHtMvn7rWwYPBH10l82lp5YM4XLO39V3mJ4F
	 NbRgaT19UCzfR5R8a1MYN43StMo6JlkP8iEySTXb+uwu99zK9ZRJN72pPSL8FZnsfs43p
	 CICvyw71uwM41f5MzU1wCltM839rNa+p8QtPsQgTuG1hFC+rTL5cQbQbyjpk4nnwt1WQb
	 v8BH2Op8j1d2zsUzWT/ZedhVRZt47eXCllR2hJPD0Vk/IGiD41pHSOgCx4s0Fz4ca3fSp
	 k1r9Djc1T3bg7DmsHBnOGjG69NUvqghymWB0cQRFeO9OA8LZswAGfmvSUgEgF8L3zCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7Za5GsguGpH2+D7x/UAp4r9tFrYUeipKYvFh1Jm0R8A=;
	b=S6gSX3qWnr6XNlIZCYFJSCJ3jLe12BuYr6mpX1lqc3o+7ppJNke7n1AUqgKW4bhCxE7a
	 fOPZYd0MarjpgSCORkFI/JZa2tz8F8+2GOywMt1Vruhyn0seqtOkwakfGDC7nvf5UhpBX
	 VML7y6TiPlxYwdAjCep0RnqAJ0mMXZzkcJ5gnuO+a1wv58Z0TgYx3uB+c7sYvAcrG7qlV
	 bwjJ8Ll9JRmjpj1jKVMfZjKobEyrJ5TpqrEaMOKprrWSy1PP74QrtCZpURrih0cMgyhsN
	 Sh5gkEDc2OnXSO0GYFvzBNr8tC2sqWTTFJLI9Zjfoqut8KQXIPItnjlCfT49TLemERA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJqvafZF;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A672606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A672606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJqvafZF
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so354008f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994218; x=1795599018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Za5GsguGpH2+D7x/UAp4r9tFrYUeipKYvFh1Jm0R8A=;
        b=dJqvafZFWfd9Kv8QinkmiAdvK0KfhoCG7+B8wLbP7IkZqASDvDC2IjajNa0icO2Anx
         Ey6acPvwxuAGmRBaK8F2mJTGG6WMOFL3U/RSfInwWG16DGhcQKLKc9MxDUTmEg359rqH
         qhJPORzj8uxSliu+P9SI3ZzQwGS6dJKRHlsjPs1WXgBF6W2CZ0ZLTnz//A82fDBSOI1+
         Ohiumgq4XGse5WLhVlZzIQ9lCuGPVJOudz8saHweOl7aH68QXYRLfFEbyR4I4MSBeSlZ
         myT7yJNE7P9GnldLpvipAjI0HHCoZwLQFEcfZwVT0QEAJK6uUDufXS4X2ZJr9bp25Dd0
         icmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994218; x=1795599018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Za5GsguGpH2+D7x/UAp4r9tFrYUeipKYvFh1Jm0R8A=;
        b=sHb4YCHI7S6YcawZp1lNy0Bnlgdza6ePwWu2MyDNX8Pc1Zfbl2lBRHsxWQZoMHfoev
         GRpMw9XsH2/5yJvKDnV+et4V3sRryOuBHYs87kqJwhCv3fneBJg2vz44M/4xEiAIKJWw
         Eu2eTXimNp5Xg4XkEjzkwjiVe/kE1xpB3Amkcs9PUwlCDUwePQIpEcMduzebIBOdIhBB
         vaX2jRfvKwBdYEhIxWi7w3cG/tAAVko+TEkUTQLYEqiN3dPXPknmezz6GXCj9IA/gjuc
         V3OFA07cUiZ1reeKCzxnndbqc5bKwHq366HbZYbbm/mwa4PUYrYpfcIxHjF51AiRD9z6
         cZLA==
X-Forwarded-Encrypted: i=1; AL+hErFcfCl2Sxn2529qdqA88wiBlnB8vtmNrVLTsNCUAM5GcYRm9KF+JlcMdnBtNwAncH+YFRL0+QVWfqk0e/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qB9RRQ7+QiWS83B8/X6J55SxUafplCs33VYMPFEn1ho7jR7nl
	+8o9EQQL3/5guQH+1RexX/eJYc5Zb5ck66xb0Yx63YKFjjU0LyF29Rso
X-Gm-Gg: AZFdTZcwhGTbQvKq5RqvAanjUDEFj5EhV8pXtF7ceUHpSqw8m0LQ+dzDPngOiLM1Kam
	sfrRPO5TTufSYKX7Ix2YzX0eUHrRyYxlZ7CB7pVqD1IWARuqoMoSs7Lp6zw7ekcBDdwZUOlrFBT
	5jf43rbKA3Pc3A1OuTG7JsF0om6qSNYMc6sLdBBwWLUsbgAWTAVECOXwKJ1S1Qwfdk7TcWLJI5Z
	7tdFtWm+IRMzgl2rfDNt9+G21lqqHP+i5HE4sv5RxuO9l5GAmJQeJvhaTsszadOeVPziEhGUc5S
	HWoRTYqZkBEdViUetYLU1LjEYr5c0+gGeW+Ax+6VPkIl9yTUZgtU2I/9cXKjjoXqBMDSDDlSYSD
	WMcKYRlPGcYHJGvPUtpcGdZIhYEKZhL3axahbvvgy/kfoofz0IZ1pNVVXZP7+6Kt+ySxfClxuqG
	uqiqPM60XPTXLib+Q/AFVhxw5f2vHKzMfyTSZdOb+/fW7Uz+mTTD7wMbRfv1N8RVV/kaFA0KYyU
	OOrK45GVxpP4Me3jvhvLNMcWOwn8LzIpPhA/KuqwnoImgaijWriWDSFoGsvkoVKMBD80Z8rtFgY
	iEvK/4q7TkgzU9i8Bz+VE+zW65t+aCg+6zUksKD6oTF01EgMBJorxb3kif0z92Mk79+p5N7DKoi
	epFQ3BUxGum9Cx1gHMVdbaryM1qvNmUO3Xqf5bRU30ZuRB8Lr/II8ckqmn2sdo8Vdc84s4rihJy
	kUOtihFdo7zvrQ1rUkVpbYoNFXm+jqx8Rgs4UsaZDf0GAbxhXl5C1xyop8nnkWUzPnXq8tgQkWk
	g==
X-Received: by 2002:a05:6000:2512:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-4a63c374724mr4906279f8f.53.1794994217656;
        Wed, 18 Nov 2026 01:30:17 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:16 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/6] net: mvneta: lift the per-queue TX rate limits
Date: Wed, 18 Nov 2026 10:30:07 +0100
Message-ID: <20261118093012.90121-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
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

After the mqprio shaper is turned off, the per-queue rate limits stay
in effect. mvneta_disable_per_queue_rate_limit() only changes the mode
bits in MVNETA_TXQ_CMD1_REG, but the token buckets limit the TX queues
in that mode as well, and their refill still holds the old rate.

Refill the token buckets of all TX queues at full rate when the rate
limit is disabled. Deleting the qdisc reaches this code only with the
next patch.

Triggered during code development on a Turris Omnia (Armada 385) with
a 100 Mbit/s link:

  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1 \
    mode channel shaper bw_rlimit max_rate 10Mbit 10Mbit
  tc qdisc del dev eth2 root
  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1

Each TX queue then stayed at 10 Mbit/s. With this patch and the next
one the link reaches 94 Mbit/s, and 941 Mbit/s on a 1 Gbit/s link. No
kernel selftest covers the mvneta mqprio offload.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v4: Commit message only, commands and discovery statement added.
---
 drivers/net/ethernet/marvell/mvneta.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 915c4c35364a..c0abc843b1c1 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5204,9 +5204,16 @@ static int mvneta_enable_per_queue_rate_limit(struct mvneta_port *pp)
 static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 {
 	u32 val = mvreg_read(pp, MVNETA_TXQ_CMD1_REG);
+	int queue;
 
 	val |= (MVNETA_TXQ_CMD1_BW_LIM_SEL_V1 | MVNETA_TXQ_CMD1_BW_LIM_EN);
 	mvreg_write(pp, MVNETA_TXQ_CMD1_REG, val);
+
+	/* The token buckets still limit the queues, refill them at full rate */
+	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
+	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
+	for (queue = 0; queue < txq_number; queue++)
+		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
-- 
2.54.0 (Apple Git-157)

