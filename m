Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716694;
	b=ilHr0p0sQq6iZxYD2gE8B/lRKKWIqki1VOmiqrKvc0eCT0QRd05HYd/blkdyrb26kLUk
	 1Lbm8QP4i1qxt/5PDxkRbZjD+8/oKgdKNGgA+rLRdE9y3TwmFrSxeynjRFAnTygHuIxmP
	 vj5w/pzkyBKCUmRjv52UvbjSf953Z08OHXm4pysw+PvcKWVAeZ/siHFjcGtC2riaYHj24
	 TVpA4LrL9VM6cB8xNew8HujHCkFJgAOY5qGbWlmzwPVGL5rGn208z679Cw9LCAcLkS+I1
	 kd/Y0cnU0pMkzCVW7u/WKTy9V+Z6IvTlYS/UmDRUs2DzIPDMokmA3u8Fk7Hjv2Y2iCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
	b=EcCn6njVnVOkOeOgGC5NeK4ZekSw+pVn7gjP74IpdPDvhv7cFOqmgs/OqORM4r2kWBjm
	 /Q3RE1h7S9yFTz5x1tfU3wlPmEV5uqe2UQmI3AsL/bRPNTouHZo+JRGkx80eOCyyiF8yZ
	 BtcJg3PdOktu/5uu1L0g7Y6xLHfg6AEv8mwd8z40EDrlVqpxEZwp/ecwkMTpojguUu/rD
	 VMvRT3SPZSddFIfTm7u2IE+9FXmdbS8VfbBOqgb5J3K7GiV6P04BgNkj8LN6ghqV6UHI9
	 Lq1Zz6FMjXpion7hJoa5AXDzfURxNlG1wzM5gYOnJ11YrqEXEpnpiAxTfwyCLSx7zuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbWOeWMJ;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC94F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbWOeWMJ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8174503c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716693; x=1796321493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
        b=QbWOeWMJXn/8dtL6zbH6XLiYxHwxBmk6DwepsghcM+aFGZRfWQKLxmMUIRueQ1AV10
         0Ash9UY7TGo+KVV2lGZ2gLyeA8Pwhnb2JNhulsf+1jyrh40EajkhylvFiTb0PScl+ckv
         K+xCGUP+Sqy3JuLYY6/Vi72VSEW+HBzpgMcwqyhL/J5PLR9GjwBcSFqJimhWCM7dPPmz
         oBYF5ZxGSpecgU3zmgCegDTJpAD3KUwkTxYzLrpgoLHkPI7G+OnAeFZde8MBO2++hIhe
         gzTWv379qw3R06UtoT1pBDb/jgz0yfaHFqM+S0ubNOE/RLSdPYW4MgwaFT1Rqw+ILUb7
         lPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716693; x=1796321493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
        b=jJS6oyf+gcSAme5Wxo99BEbCLSF1IO2SfmvYB9BH6Y+L4aYZzF+Ym740D/m4fGH3q4
         kAp7qDXvSljdC/6boS2stZraSMKefg8/xKSMDKlv9PVsS3pTvaXVnvc9zdqw2kq/FLdM
         kQZJ15Lc4y7MEnHa6bvc+WCGoeoSuHZJn0RwweyP2MN6+0sfQeFwCHDHac7KMiX3gzP8
         WkCbtZcZb24VYAgu91zTrrHrnRd93qJpv8GB4EaG/ccNGL0VVLxpZ8fFfhd/LZNBWZfE
         h7tefLeaM5xCe3aQ1AhEc+GEQvnxc31el9T0mjvItY0YAbxBxuyzRU8SZMsbJ6TTI2fQ
         oilA==
X-Forwarded-Encrypted: i=1; AL+hErFqjwhx9Vn/VBJEbrOm9iJC2D0IGqmugechloDc0RISIcOSRznaFD2kWJrFCZRbr+MnHxJHd+H92hAJwUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mH6AK7n4sLdj6nQOj2rYycOr1CPLMRx2HNuOgrrANHqvdWsDS
	LRSs3vRkv958WsmdJsm+rcEnWevicKbq7jm+lWSUkXtgUP5jQLHGWVni
X-Gm-Gg: AZFdTZd0lFFVPJYmso4Whcep1OdutxUPHoBICT8oM4RKnjioYMGMqDwHZAC2VjF2THK
	CnUIU8CtgDKagSH4ncuNdfmB5sPEFOM8aAEkHJZrxm6eyHO2nTPTEn4wXQhizsN5artj8tVi7/0
	D290FR2HJYWd2xYLti/25t/PQyxvFD3HLVoCVUN8ezeoQr0srqs/JDAzJ2u1UqepmcBYaWeFs4n
	/H1Hj6JGOvp18QMsoFncJEebzuRJDMlcvBx5AbqyiO4vI6cBQ0N0wHPGzOqmjyIqKYNIBTLuAlb
	VwkWc9DjcqThnyDwpkGRDfkvENiVWgqevghqYtvjvNzGn1Hv0B7vYbOEtJo9grZuucGdL3mB66G
	Paq7Kh8FlF5XqRh981W90JwTnhZkwoGonkihpfuZLIXuDp/jHNkKXIAuo7KD655wDtPieBz6SVp
	vPHIFpJffl3Xmx9I67NhkcQaS0YKMsGrE3T/pTdHbAbLbwKWvHFtjgyXFqPYxainxXY6QvyWjKd
	Pfyur+dfeZwLQVCHA+QElx+b63VVmcuweOh3hzMAQPerlI4UZ0eDkYFhHMVRQoao114BGPnjIWX
	giQHz9WPkYmSZfHzrUmD+vPS1cv1RpL1PgJF0I0gGClNYk9TJz7uIU0q5OIX/tOTEDlv176Tpri
	+onrhS0p+A8DkDdLxV2mfuyywFB4Dz5X2SfHY/RTAIgBh
X-Received: by 2002:a05:701b:4588:10b0:195:76af:b810 with SMTP id a92af1059eb24-1b5972b4691mr510797c88.25.1795716692917;
        Thu, 26 Nov 2026 10:11:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:32 -0800 (PST)
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
Subject: [PATCH v2 3/9] clocksource/drivers/timer-goldfish: Fix resource leaks in init
Date: Thu, 26 Nov 2026 18:10:55 +0000
Message-ID: <20261126181101.3715754-4-visitorckw@gmail.com>
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

goldfish_timer_init() ignores the return value of
clocksource_register_hz() and fails to release allocated resources when
initialization fails.

Check the return value of clocksource_register_hz() and clean up
allocated resources on error.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index b1dc8b388470..8c312c3a64a6 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -131,7 +131,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = request_resource(&iomem_resource, &timerdrv->res);
 	if (ret) {
 		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		return ret;
+		goto err_free;
 	}
 
 	timerdrv->cs = (struct clocksource){
@@ -143,17 +143,29 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.max_idle_ns	= LONG_MAX,
 	};
 
-	clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	if (ret) {
+		pr_err("Couldn't register goldfish-timer clocksource\n");
+		goto err_release_res;
+	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		return ret;
+		goto err_unregister_cs;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+
+err_unregister_cs:
+	clocksource_unregister(&timerdrv->cs);
+err_release_res:
+	release_resource(&timerdrv->res);
+err_free:
+	kfree(timerdrv);
+	return ret;
 }
-- 
2.56.1.839.g22a8290db9-goog

