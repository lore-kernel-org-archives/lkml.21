Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015196;
	b=e3/fODHTy68c+FKeyuhP9x4/GwizIt2J6TILxM7BwO+6kCwRh8jMOgEX3n4iACK3G6jq
	 xNLNmRqmnTy4pcIHqJv8O88bdMwdI2afeBFys2r+JcoZiEK7/cqUfiouxt8c2j/vhs/Y1
	 yv4CHnCO9tj8mXU1JXzpYbuNgawmRd9CebBMmvxfQo7rhMB4mknx+eVI8gMgixuAAejHM
	 UXJMMA6VYa7hdNlYUkMddpvPtiroO9KCvvT8CIec/l2jpt9PrpbYyUJSfH4Fb65jL18Ic
	 f/KISuipIng3XqEK/l02JhWn8RHh8yczeINBX3M1UDRoMxXVb1ylnczf8nUqakSa1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
	b=DdpGc7OjT7yPg7J38ijwoZ0DUqpm4ybJhvyTI3xHNVjk4WVd3PLDgATqz4QFT2CPzW2v
	 JMwEN/s3jXPNxVSE9J3L3hMRVETAkS3FI5xomh85Hj3eQqGSrMfOIcMkgiAgBpOmTsSKS
	 bmBuZ2D2014/8lPyju4mpNXRSGE1FTz5hn+vlA7LeZGh3TPfB1dfU+2A4a/XLi4Bninzj
	 mBuRoWzc2w7uc7Jtc8efCY/xDOZGqNT7DYif6KZruIciwMsOrPiM85cK2FSpXM7QMb3Ml
	 oJ1D3qEbhebcHdIgOrGiDj8bSpUqPn8u8SlyCWF3v7OUgf0oMEi2ZXMFYVceKxHh4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zs7LmXjb;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B00606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B00606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zs7LmXjb
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb684859cbso754607a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015195; x=1795619995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
        b=zs7LmXjbJJyrhsOYi1q0qRCWWCdJwIcDe+eiKHneA78MjWz0VV07ZhMOj9t7QNlM4X
         2QAufcprS1mvpQrZ/7E16kUFUO9P+fodQeCb3QukEpyIagjsQgcBxX2R4NqhKsvawslP
         iQ3qAdPlDmFd1abX7L8ICL25D1/T7LOgB8MM7ItYM9ciKr2b2x+mFITTSQmMFLB0mU2X
         gGhV1xd9VDUFf2MJzQWEFeyhktJPrq35+b3bSAg4UQ9ltXg72FxQu/Vm3412oHMm2Tx9
         Z6XiYfxc0uko53KcWTrAOPfsTKFwKnRSAL0o6pQYJ3HV72WN8CAAERULYXJ847Q1/maK
         HHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015195; x=1795619995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
        b=GT2ey/cTwK8YSwJc150fGUl8uKnZeYvd/oIoGCtnnuC80KbHNwBsvqGuc0LcLxV4AA
         HnmLLgS2a6bFV6W8B7slSrrQ297orMRAgjW9vU5gSWZ42PmckY8qOUtPppgWHvVFITVH
         zj9ZYXCLJ57/XgLBb42fWDQ+zq2fUK8VK3LaJ5VbDBEHjaAvPCSJ0bb0AMWtCZgXsS71
         T2rgvaQ5vaONbdc6XCk7TIbdpVsXi9OzXhLU6OFOSpeFz8xd4AaxrSkgRpS6y8vb03h/
         fsyY1osOKVRVk6B6cjVLm6jId+D7RQtY5amKmEErMVo1YOW9642b0S9kcuE3ST1wq9WX
         6C0w==
X-Forwarded-Encrypted: i=1; AL+hErHUtqzPfGT3n3VJZjWC1dJbs6lCB8d/T/A4+NqUr2H59j4Uof/2HIKnDUeyMubvU1nRTn3hI9cNzLt1Mpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ElZow6OmNHTm+zGl62n9fa90p9zPdmuRojASol+UmhdJYoTmg
	DKHcXUBhRs1wGSLGamgWX4BPSKZu8kZPyxyoneC8hNGRqGSw6G0wIn8j
X-Gm-Gg: AYBFou0yybw2LFG2N458N0eQvujZmWNu2bByU3n5wdyc0rQeTzQRo6BUAq7zAS8g479
	wSmVFT2aADrgp7A8oyY6ExPSoMCH6GjGywagNu44xbeCD8zY3FZtz4bjuFZUSr0yAvlqWCAYFGn
	jjxfm4THsIlVCfD8Lj2ZJ2ZkCQtmP/1Rp2Ertdrfawm88USzr+XZLlJ84uhTa2WEqAC47VWoeHW
	yyiQBmf/0QVR1cbrBUxeoIBnJE9x28Fjsj7dC1yPNyV+8iBzRSAFfRfp2xQcVbxShK+aNWhrj8s
	jtP9gwMWcK+Op7t8qSjjgel6zLHUJuGzjSUDDmJEo5mPBpYBjkM2cWuBhjPJKY6V1ElsF1/H6Qx
	pQyaHGuUbsZlBKUObpqA+74XC3ZcP3g96WBla4LZCBKKOeFQLQ7TsVvKw8TilzvYBJRQwTzlUSL
	AQakpBvidh5frqjVEGBdGSAJCgUnJrE9ahmufCDQGi5CvMGzJe61h8Fsp00G7xMj4TcyCCD7GuQ
	rjNcU/swe3Jdlq4F2xk5S5k9Lrw8VS75Hb9XdZJa0sPiw+cx/b4+amz49Q+NZQTMiv/36uPetSL
	LnXN3SZhyoHagA191cL9janvnS3JFyBGzZSDOqnmaBzQl+pqZbAxVMm+QP6KttwfaqWTNA==
X-Received: by 2002:a05:6a21:32a2:b0:3eb:98d2:cd89 with SMTP id adf61e73a8af0-3fe892fd694mr3439498637.25.1795015194581;
        Wed, 18 Nov 2026 07:19:54 -0800 (PST)
Received: from eric-N-A (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa27dsm1408559b3a.19.2026.11.18.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:19:54 -0800 (PST)
From: Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
Subject: [PATCH] EDAC/aspeed: do not fail probe when ECC is disabled
Date: Wed, 18 Nov 2026 23:19:07 +0800
Message-ID: <20261118151907.3949719-1-ericyunlinchiang@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The AST2600 memory-controller EDAC node is enabled by default in
aspeed-g6.dtsi (it has no status property), so aspeed_edac binds on
every AST2600 board. aspeed_probe() reads the memory-controller
configuration and, when DRAM ECC was not turned on by firmware,
prints an error and returns -EPERM:

  aspeed-edac 1e6e0000.sdram: ECC mode is not configured in u-boot
  aspeed-edac 1e6e0000.sdram: probe with driver aspeed-edac failed with error -1

Running without DRAM ECC is a normal platform choice, not a failure.
-EPERM is both the wrong errno (this is not a permission problem) and
one the driver core reports as a probe error, so every non-ECC AST2600
board logs a spurious "failed with error -1" at boot.

Return -ENODEV instead, which the driver core treats as "no device to
bind" and does not log as an error, and lower the message to dev_info so
the reason EDAC did not register is still visible once without looking
like a fault. The AST2500 node is disabled by default, so only boards
that explicitly enable it are affected there. No other error path is
changed.

This change was prepared with the help of an AI coding assistant, which
analysed the probe path and drafted this changelog; the author has
reviewed it and stands behind the change.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
---
Tested: the pre-fix "failed with error -1" was reproduced on an AST2600
(Facebook Bletchley) BMC by triggering the aspeed-edac probe over sysfs;
the fixed driver builds (W=1, no new warnings) and passes checkpatch,
and the resulting behaviour -- aspeed_probe() now returns -ENODEV, which
the driver core does not log as an error -- was confirmed by disassembly
of the built object. NOT boot-tested on hardware (the kernel was not
booted).

 drivers/edac/aspeed_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 6e069b255..e6f8cf78a 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -295,8 +295,8 @@ static int aspeed_probe(struct platform_device *pdev)
 	/* bail out if ECC mode is not configured */
 	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
 	if (!(reg04 & ASPEED_MCR_CONF_ECC)) {
-		dev_err(&pdev->dev, "ECC mode is not configured in u-boot\n");
-		return -EPERM;
+		dev_info(&pdev->dev, "ECC mode is not configured in u-boot\n");
+		return -ENODEV;
 	}
 
 	edac_op_state = EDAC_OPSTATE_INT;
-- 
2.53.0

