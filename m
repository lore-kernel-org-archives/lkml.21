Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323211;
	b=mFWgzheD8OnF3B6sTz83v+VIPYpX/yVrtPx7qCU2XTKH748lvJoCIRbrnjiumBK5Bcz9
	 5FkC+vBghfunxame+ZaxK9SgcFrOOCewsSA5Cer6B/HBOh0LyFjDrSluopWLUY6qm8Dnh
	 /b+9mSeOdeGtokc7eoJrqt0Asp/ZEhWVNhCIxv2Qsbw2Hmfrz+Pz0QWcKcLNicV/dsplT
	 bMc/FjRVHqtOKvMKDZtiRPDiFGUeBnovq5gwnvkNinsP53g03o3V0UyQQwEg4LV5SlBK4
	 ugOSCSNmlQnOXLTgKPyv8wEsOlm4GLQGf/N89QtMewA3ViEOuG8admU90YU7PtkPZ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
	b=AsZWRFB+N5tEpNo4E5VaYL24uIrNp8MO/Bb+I+Ycw8FNTQAMEgB6ocmRhM+a8wAf7BuF
	 o1/W2J1p2+axxsq5l9T7/7BOYEOJ2+iBVqJl5NlBoz1PZ5Y5l/RSnNAUcUBMXL+xTp0NF
	 fdHiUL3UPwhIZeGmsvkrPi96QR8vHmMA15cnm/2nXsld0ijLmJf0X2UwF5hkPo6LcOE3e
	 JtjjNd5BjgJM6MZWaiZGjAjJj9u9ScB/Unm+qFwr5nQOORsThg6VSoVYshGRGHndgPE5b
	 rtPAux73rF+s8cudzrYcOzZNjlB7hAHWH73vWgyB9bB3hD6eTzo50kCFdjRLS1AGoDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RNqyiKh3;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EB606A338
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593EB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RNqyiKh3
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso3202513eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323210; x=1795928010; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
        b=RNqyiKh3LlN9xhq9jphMzBVO1T+UboaR0iWld1TeuvzSCSfci4yP1E8BCwOl7QtIy1
         qRj9AibZlaL01lX3HvTncb+JCjAlfm1nggMgvK2XwW1+rfRKOqrDHYOKoSCXepACFk8I
         kdcFYwow33B8QEhDb7MHuXyswa57cl1Kx8OEgorox1LiXBbKhTZySsi6KW0xWo1W0sc6
         yAGRNvFMmDJv/kkbU9X1L4RtEurmf8Vouf6DX2QB1oJ22YEpcnONi2V1y8r1UkwovzVW
         Le5bUxIeS3XNO/rr1VI0LYR9a11JMz416iKUK5fLZcdxql8TqqL2HocuFWPxxWoQBVFT
         pROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323210; x=1795928010;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
        b=KUZtk1x1Tg4FCFBJYuf8jMpZJKhoDpvzM3GjqUHy67/dSQBDwM2bIXwlK2NqSVNW+T
         61uDhUcBOUpCpbu1W8KkakwpzcZoQ9LxSzealR+w2ivopGfzrvQT47Uma/i0dGfnYfh6
         PdSY2RinT2MDzLyQSW81UzgXzD1SabdcrFp8Y82JgM1cDHBsjgvRvOjLZeDgwjt5mLnb
         lxbaKqSF+xbN8OI1ozHFi5cApbOLaOuxntyhPkgL2DRcB8OUzn8zS/2iYoLJdjAAoIsF
         NIS+jaD8IOsiCNMgXTLFrrjuTtaqQlVUqY6ZJqlR6xBx8aE4GlNPU/A9zTvivd7zzfGz
         VqEA==
X-Forwarded-Encrypted: i=1; AL+hErFmnbL6p/vJfTyz7xe+TabubKa0LpchjDTq7zlBDERIKT+vtlE0sNXLtv/8+sQX+Ep84/wHcB/j+NnlYtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+MoHZSszZNbltVVKkbvJo+tSfvjcq7XxRksYKEblS24vl2wew
	BIT2Tu1XCBr/KN99SsFlcdtR835KesHSYDP03mA1l5wi6cvF2vNTkLxTOfz2EGe4XMYrjTOVlbr
	j4odX2bq/sw==
X-Received: from dlbtu1.prod.google.com ([2002:a05:7022:3c01:b0:197:f679:f62d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:290:b0:1b5:dc3:209b
 with SMTP id a92af1059eb24-1b5568ac6b0mr7480933c88.22.1795323210085; Sat, 21
 Nov 2026 20:53:30 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:26 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045326.19641-1-irogers@google.com>
Subject: [PATCH net-next v2] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In tg3_phy_reset_5703_4_5(), the 10-iteration retry loop discards the
return value of both tg3_readphy() calls on continue and never checks
err after the loop terminates. If MDIO reads fail across all 10
retries, phy9_orig is never initialized before being written back to
MII_CTRL1000; if tg3_phy_write_and_check_testpat() fails across all 10
retries, the function silently continues as if the PHY test pattern
succeeded.

Record err on both tg3_readphy() calls and return err if the retry
loop finishes with an error so dead MDIO hardware fails probe cleanly
via tg3_phy_probe(), and zero-initialize phy9_orig since Clang's
value-insensitive -Wconditional-uninitialized check does not correlate
the earlier continue on err != 0 with the post-loop 'if (err)' check.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build with AI coding assistant help. Verified by building
drivers/net/ethernet/broadcom/tg3.o with LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on BCM5703/5704/5705
hardware.

Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Target net-next and drop the Fixes tag (Andrew Lunn).
      - Also zero-initialize phy9_orig so Clang's value-insensitive
        -Wconditional-uninitialized check sees no uninitialized CFG path across
        the earlier 'continue'.
    
    v1: https://lore.kernel.org/r/20261119171021.1535172-1-irogers@google.com

 drivers/net/ethernet/broadcom/tg3.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..4d375328621c 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2544,7 +2544,7 @@ static int tg3_phy_reset_chanpat(struct tg3 *tp)
 
 static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 {
-	u32 reg32, phy9_orig;
+	u32 reg32, phy9_orig = 0;
 	int retries, do_phy_reset, err;
 
 	retries = 10;
@@ -2558,7 +2558,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 		}
 
 		/* Disable transmitter and interrupt.  */
-		if (tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32))
+		err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
+		if (err)
 			continue;
 
 		reg32 |= 0x3000;
@@ -2569,7 +2570,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 			     BMCR_FULLDPLX | BMCR_SPEED1000);
 
 		/* Set to master mode.  */
-		if (tg3_readphy(tp, MII_CTRL1000, &phy9_orig))
+		err = tg3_readphy(tp, MII_CTRL1000, &phy9_orig);
+		if (err)
 			continue;
 
 		tg3_writephy(tp, MII_CTRL1000,
@@ -2587,6 +2589,9 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 			break;
 	} while (--retries);
 
+	if (err)
+		return err;
+
 	err = tg3_phy_reset_chanpat(tp);
 	if (err)
 		return err;
-- 
2.56.1.750.gf70dc682cf-goog

