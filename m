Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143496;
	b=IOhoGmy3ZPJlM6Y207v6KoQEKnr6U2TXEs1ca27jcQX+CNzR+KqXIaZa9+S6WbplktXB
	 R7o7s40vDvWFkvkGduehx+7OeZfI63wthWFncOOf+uYMAqsY7jtdN2C8lhWpmzmVeNW1w
	 DRiWYbj17hIUjCLpLj8noEG71FboAHXl/IQIGK4hP2ft1oxEVmPrQwE8pNQvweOXDliRL
	 baoSyk1PzYzKZ4orwURy3jzO9x3eWhcUWIu6BNaKxgZFgK5MyQj9dYV1bj6WeESaMDGkr
	 dexdogxDrQdLRiv0QlZdlNlfbmvpAFS3ciCw7a1/OzZmikalPzC/u8m+ytCA3qgJSYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aC/g7xjWVfJaoPMEUZKtxHfBHePPvpHU5a/3ivgfcfw=;
	b=HLfkunUU2xgI5IyQTVR7qZdoZ6qtGGGyQJrMvQoFqxg9TOlFnkA4515O58sbyHyVewPF
	 u+Lmtit0ROKypDSmiJwIseRR3xe7pTTzsXoRovDEbdVfp/TwnvUDCfGl/rr2a9BEtfSV2
	 IzwtyUFENrD9h++eZW6vXWfpoh+8K1sdb8TMqAnkzNULnvO1Ikffo4xeDsE7f4weVLM01
	 01HKzOc1M6BXmD0L+cWFQpg/8dHGgjXxmpWQN98vM4dvJSU4hXk++z6Ul0HKj8pcupdus
	 72yHmN2GOkeVM+j34FVxahS+Fxhp2yzi8dyEdZwnSNjuOCMkaUV6GR3mrGn3nm+CRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="J50P8s/6";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E72606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E72606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J50P8s/6
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so364632b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143495; x=1795748295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aC/g7xjWVfJaoPMEUZKtxHfBHePPvpHU5a/3ivgfcfw=;
        b=J50P8s/6yNhUJi5/1Yqhy3qIpky+0BmU4qEywL7YwT1TCTLNVijPnYQgeiukadJ8iK
         jGaITnMXUmnhuvhPgv1IGPTdjSAA7VrdhQK+GUUO4Zb0Ug6YHJSGLvBIrO1PHlGqNxZq
         bSeLnXzZemsGCc/gyfCKd6hcLpn67GE8wuLtMuehgozSmB0xsGvoL7bFqjes9Za/rU1O
         yungO0OzOWa5Za2l0kFjOtNnG8E4w2hzg+ZjCs2i+JCnFRApm5QRbJeMniSl1qrAOrCE
         PBcUm0PRQ9OPrZW2aFQiIufh+hRYu96sx8e9VeLbpg39jTnfaq7Z7Ny0Ns2F6/AkLiiF
         eXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143495; x=1795748295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aC/g7xjWVfJaoPMEUZKtxHfBHePPvpHU5a/3ivgfcfw=;
        b=aWvO08tpk4WleAY4wSP6200Y31ZoGgwgvdLmC8TDx/fnaL6j+y8ytX57UxPRMGEQlf
         qe6oVT64+qxcKfTSPa6LKcyHbOHBKckD3/2r8ztWyMWyd3u7NX7Ov14pc5bVhtLCaATq
         Zc6OI5vwuZlDIoxJUaPpkTCFy3EYMbbUQAOqIr4pJk6SRirZc1KhmKSjqhfAQzHZ2KyU
         Ou539/TjVAjbPus0VD2CSNShYtrm1tOA3M95dn5BxJ0fknVl7riHLhWzNxUKqGatYGH9
         42dw0w2ifRU61uigiHLDYq87RIUxHQplnCEV4VJs9z6ppnkLdZC9ErNIY/oxnNvRKoh1
         dehg==
X-Forwarded-Encrypted: i=1; AL+hErH7J/uUUaLjPYNvhSacNgHiqraaf+0UcrUQQ6ah6hqAxL/X71RnWDJypiKPZmWrVh+jKZB8LjnyGoui0cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+20eFOIR7QCJ3a9/fjKyY50QG93Z5ePl4DIKp/HYMPauC2ixKY
	XlGE+gImf2QAh3LGsODoC5CyYGg3nxtk2c4jkuTLW9EaJ4WHCLiFwhtoGCZLfACV9Zkk0scLJxq
	JfYKFr9kce2UARfk8GcEq3erXPKTGNQKs6OBLbL2LGj+GZdVyQ1w7mmXOMyg=
X-Gm-Gg: AYBFou1O/XB25c7eFS43OwhZewF66rjFdkP/FoGbbScSgzzre6HsSUnIh3mv1lMdOHB
	psI+/0F6YlkxWiDF9tcV0JNVt1D0g6BJDF17B7w+LPc2eboAdZwE/mW19sFazOavqJNFG0NLDzw
	TBW7cOv6LiG6A0t+POYAKAtkuoGEwm0S6exOWP7EoCx7bFkcvTXxtMUrgXgJ66JKOfJg0e5rjUT
	fyAQbqRv1VwrPGUDsaJ3Jrh6YMwofKLYcsynepo2WvZNKmtIO5+Ov9vtKSckqPgHB1mg9B+vLdv
	TK60sjorfHtgPzs7TQJsqZdaD4yrocFAtrf69y4ocZjcoSwMlhtc+C800ZHjPazpXtc/f4aA8Fb
	sI1BfNEJcI3EKKowyW5H14uGQ4veF7F5AGjWVgfzQmljd6Vcch+Y/lRmaV6pAAXDpL2zdYHaQvb
	fsOad/6KwMXuAaKR2tX/Wuyq4I8IPTsg63g32KgedRREl2jOVwF7CGGpLFYO+q4z9AiYsKrW4rd
	9ENI/k60nsJ2BOuer0uE24adeQ1Y7rOLfypKDbZduFLQG0ybSVwRlQSVAtfjLrfKk5ynkIdygwS
	cQum+Y/yq0/GVNa0eAFy4LTcLTgVb0vsLGDIH5ubD5MukIYn1o700MdvZoA=
X-Received: by 2002:a05:6a00:2987:b0:8b6:3e44:8aaf with SMTP id d2e1a72fcca58-8c87b4ee9c0mr1457486b3a.20.1795143495294;
        Thu, 19 Nov 2026 18:58:15 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm749647b3a.31.2026.11.19.18.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:58:14 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [RESEND PATCH v1 1/4] blk-mq: remove stale comment about non-present CPU mapping
Date: Fri, 20 Nov 2026 10:58:03 +0800
Message-ID: <20261120025806.1065295-2-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120025806.1065295-1-lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com>
 <20261120025806.1065295-1-lei.chen@smartx.com>
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

Commit 20e4d8139319 ("blk-mq: simplify queue mapping & schedule with each
possisble CPU") changed blk_mq_map_swqueue() to iterate over all possible
CPUs instead of only present CPUs, but left the comment claiming that
non-present CPUs are mapped to the first hctx.

The function now uses the tag set's CPU-to-hardware-queue maps for all
possible CPUs, without checking whether a CPU is present. Non-present
CPUs are therefore not necessarily mapped to hctx0. The fallback to
hctx0 in this function handles tag allocation failure, independently
of CPU presence.

Remove the outdated statement and retain the description of the mapping
loop.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 block/blk-mq.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index a26a11c73ee3..59452b855afe 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4173,11 +4173,7 @@ static void blk_mq_map_swqueue(struct request_queue *q)
 		hctx->dispatch_from = NULL;
 	}
 
-	/*
-	 * Map software to hardware queues.
-	 *
-	 * If the cpu isn't present, the cpu is mapped to first hctx.
-	 */
+	/* Map software to hardware queues. */
 	for_each_possible_cpu(i) {
 
 		ctx = per_cpu_ptr(q->queue_ctx, i);
-- 
2.43.0

