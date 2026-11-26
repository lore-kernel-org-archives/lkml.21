Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716698;
	b=CyLhdTLpyHF0L1esYobb5TmfBQFfmikGFBSvCnQ6p0QLKhd3c4C/N5jAdw6bMkn/J4nH
	 BjmLGczuCwHvzIBR3FDICpn9vtp+4zRui9jGTSPbZdUBkLz5GquOO8GiT1ojN3mNv1QEd
	 uEVRkvKxJT2E/mbFLOOBVRayvmkWzN4ys7s+HPm4rTF4NhQls/2xoCJeKxwv5Mr2M2uu+
	 bUBpwr3upZpJcIchzd8FEnfUd9UYxj7K7kMUodUL1t6NzigWtyA/UgexCqk4ngY2/nzGC
	 qSMHHt9fC3ClVVPvgwiq34K6OYbH00ICTgckuG7UW2olDUI+OLa7tv1tNykBtiU/dvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
	b=cC4Sy5t+4RpVK4dR1NqZehWBlqtrC4EGTfaIYJCNJK7cBAyi30uLj2yLkiE3GMwmAj5K
	 7ryyMpGJ8T0MFiuRQmUGEGF2e1UoKESoD/zkZnU1OILB3vmJQUBakwAWWwhtfuqF6xKrQ
	 EqPF3c+6XmcG5fKlZHSOkYkDoDK3Hr5BRhTYq4v+j/A2UCHz/Rv36O6jd6kawg2EOMdMJ
	 7H76NLMoikVFaQEj10QOVyJKgj+MneNdYqDOO8QwUcD4kjFMzSenNfX+fRg5pKSOXJdGn
	 aRc4GBYZo97Dv0RPQLllBPabxtAKhXraeBvmXxVz4BfDjpQ/wgWDhNnspBLb10UhhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpvV2Xdf;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50694606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50694606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpvV2Xdf
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-18818daa3e7so4098326c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716697; x=1796321497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
        b=TpvV2XdfXmbea4PbgEAJgUWU+Rri5Vo8qQZB1nRN9z29C2fxMKL36Tyu1Gwp1LO2IQ
         8XBgUcTDFuA45jsMZkE3wl8FQq/IT+pJ+PfKcbQPHbgjKYcAhvA7VeC9vqrldFqAKD7N
         3LBHbxCrk6cH+Od3BjSYfAe+ZU1lwr5cvpYrOYAct7KWpAKFzR9MSSsTAnNV5u/dGEJF
         rrDkaopMPBrPUmkqxjijKAEHJQ0oLtMVTTE1jQiH3qQdoWsAktyD6nxt7Far5YZZ/fD1
         7NDzNxNk8P0n4yOObqrQk8XF+ET1oTkEf6dil2lh5+vZ1QlFKQnzqLjClzbKq3mqC4Mo
         vQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716697; x=1796321497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
        b=Ac0Sh9Aq5/c90b0kIZc6df4C+0ksyk8bMLJWW7teyCN+Goo8nXAwxOFgrP4+C1HHhh
         kp/rwpCZQBvo9WnQl9AraaGcSxxlAu4KDfOt9c/MTyIn2mphbgrFhai2DSlKn9226a/e
         BnvfmFfdleYE8wgNYqnvr+B9CeeTk3lIbQVWOpWNBTXnRLJqonK/3pTwvBZ5BBoLhEva
         LuXX+go1wiTd5/agFqIBgAsmk4+dQ7k+Sr9EzLEgmXbu6E7dfmKb/sKwbvvJSuugayqD
         9Mj9CxE4Z7FsJ060I8fJpQYjFm4e0WN9aMl+b3QLEMHpcRGTbrJxYoOu1NUM052ImaZj
         P2Ug==
X-Forwarded-Encrypted: i=1; AL+hErH5SckFDG69aO5PabrVa6Wv5cjyVC4EOZWkURKKHgYGT9q+CcW97r2u5qV+P9FsDwRQ7tMZPQqBE7ZyD9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HOnltogNf/uM8Hk4FXsM47OzFt4uUq/sflll2bDthnz7loLAO
	X3l0qLeFW75vqSX3YQ0PP95mJds4XVbfhwEkAVqYbHxALb0LYadfIX8r
X-Gm-Gg: AZFdTZf2P30u0+YoaklmMj92YC4wz2OS5c/zVsqc9js3rW62Om9oNLo6V8A+BZZjkun
	9yfkDiQy/51FLiRTI27z9g6vGUQkJMcwqhDPKLj5U6xgnCCS7EdF/EPNHCtfFTlBazeZtrax73m
	Gdkr806iy2MuYTkix7ypJqGnzO7sUi5OSIgLGpUqWONMZeZUEEjpf2x/KGLgfJDpB0tmRZxUs2d
	gwJvKERDd5jemevbRVJgZ+DOzA5UPpjGAoMjg1TUUvHQa3NY7heGP3d6blBxqyxHzFdCHxOfTtA
	/b2dUo8UJtV+KlNTOfve9pCQB/LJTZEbz9Ofu4++qZs3wUEloG8aYPNFPX2M+7U284ND8FeM01T
	BzFo5CZqB2ACVRksN+FMdiPgfRo5Tzwa0EefvMzXy1PV7vzzMLtPB0NGJQKfLDStcbW/agye89P
	SxS1DMQ8g0Vv3s92XqYl8UuoT3m9KvIN+9ZFEYfdHgP9HArmiNLE0tId0tRbVsx29+Cy1EYBdRR
	1e15E9rQmcto3DpyHVPAs4GqjUomgBnen2Vd2jbtiwSf7yVSepYwNjuHiDvBS2YAibvwDxaLiWS
	wIMlwuzPkl3M/QwFwOgPfWrHMl2R/2MOphkI2dEaNbWnointFSirfwQV2rq1C6B6nmeKL7yz+/D
	EhtHy5XzzotSVK/tXwheJ6UAP
X-Received: by 2002:a05:7022:1703:b0:1b5:64c0:d2be with SMTP id a92af1059eb24-1b564c0d31fmr16340401c88.19.1795716697184;
        Thu, 26 Nov 2026 10:11:37 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:36 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 4/9] clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS flag
Date: Thu, 26 Nov 2026 18:10:56 +0000
Message-ID: <20261126181101.3715754-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
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

The goldfish timer is a free-running counter, but timerdrv->cs.flags is
set to 0. Without CLOCK_SOURCE_IS_CONTINUOUS, the clocksource core does
not mark it as valid for high-resolution timers, preventing the kernel
from switching to it when oneshot mode is active:

  [    0.751173] clocksource: Override clocksource goldfish_timer is not currently HRT compatible - deferring

Set .flags to CLOCK_SOURCE_IS_CONTINUOUS.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 8c312c3a64a6..88253bd1f569 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -139,7 +139,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.rating		= 400,
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
-		.flags		= 0,
+		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 		.max_idle_ns	= LONG_MAX,
 	};
 
-- 
2.56.1.839.g22a8290db9-goog

