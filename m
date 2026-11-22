Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336189;
	b=Ug2Hms6apAkv/v21qhRctvrnq4YMrJx6N6PGEd+TEs7dU757wdKTJklhj2d67knRhjA0
	 S7aveMUYdO38jcqer5lUvsvM5rdduNcS6EkqWu67/KyMgtGOW5tIFRgZmZJfiA5e0AJgz
	 K7jfwwR30YVZRPC6gqpte5bwJWsMthQt8C+AvzkXZahzMK9vvTyInav9VCKmOGRpRZsfe
	 GmijkBMt88Vv10dVCtrrznohU4fccUD+WS6QWShPAlm+jYIYfQzHi6jc6aIYx2q6wE352
	 4NLUp2y6res1nbbx6AnGqWYRWVgJ7wyEcIoqKgWTlAkxsv3N06fI2eITYWUH/gSO7YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zDSvzl1Gx/Aqp+Qnd4iIo4LN86WJizYkgXEiZnnjt7k=;
	b=po6+czEhp880VKKDyOYWWt+NQydm8DgAX++kcFUWOZwQNWkC0U3lVzVAYxYl+ApcphAR
	 buFDZ2AFRzTgaSxM2S07yUvpSD+uYcPrpBU7zUed8UST4EdniU0nyFc7lzQQvvNhPKFHm
	 9n3u7dztS4TcBInk4IyHV3QiGbzXL6/62MM0CcSnQmgJLonhCfyQ2qZs+m52dSWpni3HV
	 IwLl44GIdzmtLRI6rilVGyBWVITazfeKbLVc69WAia5z22JMPnSSHht1ZcKYBNhmsW18l
	 goSPkHALnES1MBNDWy1K1esnBoOfJXoAuiBsGFAGI+iVIVdAU8ZNx5uoS6V+fSdSBgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUH6hyzI;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92586606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92586606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUH6hyzI
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b413997581so1997749a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795336188; x=1795940988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDSvzl1Gx/Aqp+Qnd4iIo4LN86WJizYkgXEiZnnjt7k=;
        b=DUH6hyzIJG+cWQTiB4umG7yN3dF1aZAe7V4GunH1oCvonuB2i6gwyPlll6HEzYvRdw
         JixNKlguagGorSjowb1j9tKca/sNOemoH/KCyWN+b+VbA/JKexAdzJFW8JWIU3hljxQ+
         541NCI+2NZcvIdCLTkhb7b2HHsYzlbAKS+OalMhUWa2vZ8Sm11ED+0g00Cg6KSBvHmmD
         +GV+/J3nvkz3yjVCh6/Vm159qp5uABn0pfSAJbJlJrCdxXjN6Yi4YsjwRCQKaRm9KHEi
         RKShldYElNzG3o+8G6yWS/FM8kP2/VraL4WjZudGUZBxeCcvrj+XLSN2yUjxjwSoEt6d
         Mk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795336188; x=1795940988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDSvzl1Gx/Aqp+Qnd4iIo4LN86WJizYkgXEiZnnjt7k=;
        b=UWQL2A+z6y/NjOF5+pvop/cI3Vq3Tlb+SjTResM7KtpRMJS3HQqSBA/WaoLvfkEsCZ
         Rkl8v1tNYwvUuDF598hWwS1GPPFB2cNFflId+ko4JRWtuiCE4WqF81cPz8L00gLKbyMv
         gAE7Khiwp4qXLx36Kxq7ZHfpsAwo1+075AYoxDk4OcW6ki3PYYsjTiwMm1G6HkoEtqof
         NZRM1Ou3wXwTIii8EeTW2R4yVmNbJluBaey4x4u6Ldaq+zZt/PpEXEmpRsG5Tw5ENMTh
         4Kou8ouNDZQwckECgo7v9wPlaMfqewKwn5Bgn711WI+fWWpDUjj3tNbrPuUdIVnnmORc
         lIMw==
X-Forwarded-Encrypted: i=1; AL+hErGpiNtddBVcouA/KiNuDz40Isc9fsujjuVQSjxWzwIpa7d+FuCFeL3s+JbbvL/kQ0nV4hUmc0mGJfnBopA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oK1O0z0rLMaqB2hNFtvWjXJjByvPK9CR9y200iXglhkK9Chix
	8dQRwAxhaqHKgYa4kPUy90KJSx0MCCHhCacUaA88bMe/RAqBUHzAMZNZHEdToI37
X-Gm-Gg: AZFdTZcoc6fULmPnnJZSlmpRd2Cy4HgaWohCkG0/cSDrc6ludP1qJkKDN5Nq719U7H3
	DZ/KAa9Sku1GQLCy9kYoVrEaZt30kRXB7YSDAxlZTfZNR5znfLz6nsvj8XdNvxjqiUT9H3d5Qkx
	u7ObL8bSrUeggeD2zC9pNLchiGRba6n09cd2bjUIeflFfQ+ElHtenesHBwiKvVzKA74/O4fJqWK
	W5YULtP7C5mZFQZSd3m/9LUV1hSjW7jMD5/a/Wr8djHTbXgL0AJsfUxlEJmiP6U7cTfC5Yh9s8J
	IWZSB6NKCor8bNeKOPzRjml5F2y2kXfE4fYy4S/yo8o1vKUSpcJ0cgVaD5wK3Bpew7dAl68JK82
	moiA6cmRKIyz48gEMonND6sks3WAtnL03XA8bTcf9RoqabJRYOgtJe9WTWe3K4rgHgaHaMkbt5d
	Wftwh+tvXr8HjU5s5BnugnD3W4nevfvhbHN48PiZb5qO5Mji7OJs8Oxp5pKETokTnPxR7A6mMDR
	Tb65SR26U+D14RNXRr+LEpZjKuugHhio8QWp9Oy8AJfJ4dpX9lBX7mJ/kQ/zRGlwa7n3Pdk4KrR
	kR0PzWOYar61I2WWn3Qt76AbCbL65hpuSR3H6rr7aOdYIMe/e08=
X-Received: by 2002:a17:90b:5407:b0:3b3:c998:6d6e with SMTP id 98e67ed59e1d1-3b41c961528mr6953366a91.37.1795336187924;
        Sun, 22 Nov 2026 00:29:47 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm12957455a91.5.2026.11.22.00.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:29:47 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-watchdog@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] watchdog: bcm2835: add newline to dev_info message
Date: Sun, 22 Nov 2026 02:29:43 -0600
Message-ID: <20261122082943.173681-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/watchdog/bcm2835_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index 755954cbadee..df08236d2689 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -213,7 +213,7 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
 					      SYS_OFF_PRIO_DEFAULT,
 					      bcm2835_power_off, wdt);
 
-	dev_info(dev, "Broadcom BCM2835 watchdog timer");
+	dev_info(dev, "Broadcom BCM2835 watchdog timer\n");
 	return 0;
 }
 
-- 
2.56.1

