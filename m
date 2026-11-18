Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994220;
	b=xQVtA773K47n20cXuGG38iYznXWdfcsBSvOpPjiTiJb6owIWyA0F4o/4eYJYV5GfgukX
	 p5P64Adtb8ZUgGjyHD7nkf1W0J0xjGrBppHx4GsUmP2uBemF5sA4Kwoe91FtGGpK8wdc1
	 w/LM+XPQq+xlaADgU6egbFXDudvIjHIUROwCY52LinLQ0hVceIaNw80B0eqTRAIe0yIqw
	 9yorWOcVDeVBauROcffl4BP1MsfxQuUbERkEyTc0AIGUN+gILZZ6q8LC3zIIGDjA4tqvd
	 8AkXPIn+qKN6KHillU2xyQhrJbC2W6QCfBsC0GH16z0tiZ99ThC6IK93e0baP51rwUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9QyEpxBvVfPvBVod3Et1pNl54XN/+FJGPYaqZZl9YH8=;
	b=hOlV/F7C3EG6Cp/hCrmqppS+e3EmquAuaxKE+qPcknyysJRI/7TG38dSV/oSnklZx/lr
	 JaVmz4bKM0ECv8VLkfm/AXIzB5QMF3+XAK8hZS7Ku5hoXO9EeCRGMz0/vR0+fcFtQNdi7
	 VF8QejTMrMKW/nVddga+M8AUBYbopxz4QCxTyNrxnKo2pLpyO1l+A/MD/KOb5dc70pNRy
	 q/ux3T/QNDBVdk5FQViLmYKjzumtbc77bQ57vxuulOJCchvB7biu0wuG/5lolQB4++6Du
	 qsXXK09sUoDkpAwQl87SITnCdbDkk45V7Csy2H7aMGPofI9wWGm72wUW2N79WVXjg9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMFkwx7O;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770AC606A886
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 770AC606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMFkwx7O
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so396782f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994219; x=1795599019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QyEpxBvVfPvBVod3Et1pNl54XN/+FJGPYaqZZl9YH8=;
        b=aMFkwx7Oqop7x9FCbwLIgaw9pnwFHO4XYALgNg3pM3vdxdpybBpC2/476aw7/89GKF
         PCLqwY650++fBUaRR/X4fxI+NqWO9czb7gYwUhFvx+PNwnI6u7i3QSAZ4zr5jyCbgBfw
         yqL4me/5Uw6ofe6OEY4XZV0XN/KeXADavfJcFU5Pe1GrOVA7WSjK1+3vgH9ZoCRBEeH7
         GF0F5KsSFLKY+aV+zLAoTKGRUIP9YMOYy9ueEamnG1d3HGC4RTnOsUsEfEe9dCr/SH5E
         coh1Ns5gdoboMRoIbAI7XipVmHD60e8FkBCGt6UWEC2p8EXubVorVsyB/wW39UHIwBmf
         pngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994219; x=1795599019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QyEpxBvVfPvBVod3Et1pNl54XN/+FJGPYaqZZl9YH8=;
        b=FEf24aSoThozG7yxw6cvSsJX56kzYLU4T1uGYTef1WqT9fxHbQgL42bDMiNWN39NpQ
         Fhp7LNU0FzhtFBAu2BmqL0DzVkxXA3mT6jKNj1tD0wDd6SQBDakw/kE5GZ7qMDAbwhHR
         fr67m99XQU8IbfHT9b0dw7YcFY4gC9ndtH57gxYWdHTNCT8j8XcMvmwXTsDMu4MQyNiX
         CDriOGR+znm7iR2my/iD1Z44fIE5YqWEqPeGO1Iz4wNNSFILwO8kXqP2t7OC/idoCuRd
         iRFtTneCz6M4WqHeBoR99JcZuCSXXEv3z6/CaTEizRZ9yq5mWmsCE/sakX1b6GizTudM
         noTQ==
X-Forwarded-Encrypted: i=1; AL+hErFs7QEYXu4cA76lKPtLBrN+tIo2cwHB7urmnmGyIrF8D9NvisUT7aghhsAUCP7KsGbWouj89YeqoUiacHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bnz2NjLxmvATWaOM7C0HN3IY6WOj/nMPZQBv/riPZtwtpgW1c
	fz/9IFCTz5oKRePsEtg3w3nvKmY1qweR8ybn5V8ebLf7LvB7gX8y2Gcu
X-Gm-Gg: AZFdTZdc9dsfTTA00ts67xhWkdaDf+zhhLo6u9JwE7yGOLiHPqEbgOWe6GakSeZSCGP
	ecoXdVzQ7C02zqwufdp8xu9lMechZUodNw2Aono0ACu+PLIQwmjqAK4r1NMKzn9iKIejQlySVuR
	EqZ+qJDC7Yx+gui0CJZ/4OJIdCOlJvpfdujr8vQF3doVtt55icSGN0FXBgBqmWZDxeX8NzDoUfC
	qBzSQbNsRSST7g5WpeiGlZAUSXwtaZi4UHoyzVMfxuDM4fV4wHU3at7m9ePT7uqEm+BUkafa1Co
	e9qAFS0lxlNFW5rq4lXtH0AQtyCPtQn5R4rfdHwmoPu5VdI98xn10AR8slmu4VTiJ5s948+VW5E
	Ef+wXdmJn9Ai7Oktysk1kTgZkF7IKX9cQeJf+s42qfq3mJewdKCguRsFPXMAWecb2GJS19d2Ddx
	SEBVLUvofXLDZgyvLRgwbIhJxdK9gbE6sN7kNLSKJAQlzd/kVg54G/Ap5wBU6Vo59LWW5Ou4bZb
	OuXLxYx5dtH9yMbictohHgy1iGAJ7XNjkyeyfqdUSLQQ5QfTLlGtP3R1zgg6RFweUYYk2MoqHrK
	BIzgSlD1aBYJ3l4WoadlW7dEbQrNBJtJIJHhhs94/kVasrHVM50yoJQ93U1xl+zw1Cv5JdgkqH9
	7M4bWaKmJ14y4+cuTQ8got6Luk9E2aGfSlbeCggz6J7CufwEfpBHvkGs3Leba0/PsbJI0rJPBws
	a1jBNjbfrPTA0RhuMUmLiWCToKqpepMoLSZzO7XF+vTdskkco4zMlh
X-Received: by 2002:a5d:5d0e:0:b0:4a6:f405:824c with SMTP id ffacd0b85a97d-4a6f4058560mr2734631f8f.31.1794994218862;
        Wed, 18 Nov 2026 01:30:18 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:18 -0800 (PST)
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
Subject: [PATCH net-next v4 2/6] net: mvneta: fix the removal of the mqprio offload
Date: Wed, 18 Nov 2026 10:30:08 +0100
Message-ID: <20261118093012.90121-3-pepe.schlehofer@gmail.com>
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

Deleting an offloaded mqprio qdisc leaves its traffic classes and
per-queue rate limits in place:

  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1 \
    mode channel shaper bw_rlimit max_rate 10Mbit 10Mbit
  tc qdisc del dev eth2 root

mqprio_disable_offload() passes an all-zero configuration, so qopt.hw
is 0 and mvneta_setup_mqprio() returns before it reaches the teardown
code. Check qopt.hw only when traffic classes are set up.

With this fix, replacing an offloaded mqprio qdisc under a new handle
by another qdisc with traffic classes loses them. The replacement is
set up before the old qdisc is destroyed, and the teardown call does
not say which qdisc it belongs to. The old qdisc's teardown therefore
clears the traffic classes of the new one, and for a new offload also
its rate limits and RX queue mapping. tc then shows the new qdisc
without traffic classes. The core does the same when the old qdisc is
a software mqprio. A taprio qdisc left without traffic classes sends
nothing.

Triggered during code development. Reading mvneta_setup_mqprio()
showed the early return, and the commands above confirmed it on a
Turris Omnia (Armada 385) with a 100 Mbit/s link. Only TX queues 0-3
were used and the link carried 19 Mbit/s. With this patch and the
previous one the queues above 3 are used again and the link reaches
94 Mbit/s. No kernel selftest covers the mvneta mqprio offload.

Fixes: e7ca75fe6662 ("net: mvneta: Don't force-set the offloading flag")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v4: Commit message only. Commands and discovery statement added, and
the replace paragraph also names the rate limits and the RX queue
mapping (Sashiko).
---
 drivers/net/ethernet/marvell/mvneta.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index c0abc843b1c1..06b5453543a1 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5251,11 +5251,12 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 	int rxq, txq, tc, ret;
 	u8 num_tc;
 
-	if (mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
-		return 0;
-
 	num_tc = mqprio->qopt.num_tc;
 
+	/* On removal the qdisc passes an all-zero qopt, with hw 0 */
+	if (num_tc && mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
+		return 0;
+
 	if (num_tc > rxq_number)
 		return -EINVAL;
 
-- 
2.54.0 (Apple Git-157)

