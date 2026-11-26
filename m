Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716706;
	b=y7GMTfnFfuF3ihl+Ne3fB9SjBZaZYeIpY7+ro6dUaZAI78q+TUMCnUUqDaapOZlxqXRY
	 vEzBX1AEKOsHe92fOnscF2MCbdmOaGW1TlgOb0MwcNST8BiYQFOw8uGDt7oMpFrp8tpzO
	 aKJ3MMygPvBk/F86I+a4+j2bORSGNWYxCofO5zQE5JGl0O98nyqrZfUIkSwAms6VHpwCn
	 OBx3yV1KIlCrQgXNfWguA8Jg5aiH59Nrs8ftRVB8X0PH9RGvHDipsNCPfzATJDyd21/yH
	 E6jtX1wMwXaLVdOnJZqMgE8Ki4qFwl8wKwHLdVfD5LVVMk2rJ6xSc43AUmlEfvq4VPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
	b=lEOrkpKsBBr92OuuL/3VP2ilNjRhkCVPZEqKWLiU1Ky2SmxNgXv1oCUtHOZ3xwnyVoth
	 S+t3FTaburpeOjFugYwseWO0Ai7Y0+EieNUkmZPj+D76/lnEqe+ocID/S60Ftyv1Ty0yo
	 dp+tSkCnbdYNFQtnYGG26GcuatumPvpF7TLfRpnVBA3RndA/SPRPn0+vR9qdAFpuAGnd/
	 IqCLRf0VXzA/pgDnC4fHnDVqfcm0HXmHBoa09vM4drt+cU+ThR8x2pcyjsdZJ2CwdGcXm
	 aWAa3rTBUDhsrmxM4JLCGeV49dINTaYmhg+tTtZYJUzLpSi567mVul4HRekkH6+cPIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OCRR4oI/";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C00B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OCRR4oI/
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3acec6677so11066122c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716705; x=1796321505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
        b=OCRR4oI/qNTnpKqBJC0ljHNRbWj4xBHME9YoYFL7wXSTcCfMwdvCxpbMgwBSzsbIXh
         mhB757C5IPxz+H7Zv332jGHbrMQex7L/6pvmf9Roku2MeGw7lC3CIekwhVkdwEoQrell
         ieLwgBy073Gtdn82OxNAgFbr+fFVAfwxs8eVfjrLbD+SRk1j20iyI1y9Aa2uC9qd0Tx4
         9gT8fQpBu1eqgKAY4rXQmEd4ahO0JZyJ5Rz01y1Bdq04wwdeqE2Dn+QziCCMLirgj92X
         Bx5Ing3k8q8bDoWnLrkoH20dR2m9tIZxr8h8ovzK516Z6ix1hEUly8kOXT+NdIUUcAHt
         BQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716705; x=1796321505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
        b=f6xiznFfKs/tMcgjkNtMd2RIsvk4j6Q2GvIlJglZDjDKI4oYvv8SO/vp3irNR0ZyfS
         63i56e+h7Xt5roAaOy9sA6ENNdkFoZoZumHrpyy/1H1u4iD7kfilPG4uPSWa5jP1Oko4
         LIx0gYJoNICux/vangV15JFX0UEk55K7L3U0VmKpUAUFE0w8RxyGjG8Py+u8CGc+w3ak
         OLwG4wSHUBglypdYsAg1S7JzGBObWM1i1XwIWw0oLuCKrafvxaDyRULL64Nc3dibmvot
         Wr9u877sf7qMvDBqbEl3wHMIC2Kkxs3zLQ66Q8DSZVZXG9W7xe+0zzFc4F5PT1YRVKMh
         pA9A==
X-Forwarded-Encrypted: i=1; AL+hErEO/qTC3MoI962t/xZhNIprDY1JpvwXEoDImhRwKwp3fgiwOdWoFgkEkxE/aogRTNJrw9ukrMMCrqRbeCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3nIBaUGsqQTNQnmIvB08hVvS1MzL5/izOvpmC98MBfvcWiaQE
	dGyVVgaETHRVz64mjGJN11SeUI+7+cuLVPH7fdLMwLzN/vkkjSAMugHH
X-Gm-Gg: AZFdTZfIW6L8q9+AV4QdoVuG7UQBnnZ8pj0qP4QC3+iDUdGqjRj1fd0n63vJj/me/eD
	oVM4WiPPF2xdKinB6yjjl1PJJwSebbos56WMW3MRWSk7WxBtGc9wDjmDe02+xr9GELMHk4dQIUb
	jKv2Kd8WIvxtA06hkCo1G8xhTFUhKNREw0Yq+Y06pO/kEwDII35SEqV8YJOvvOLg4aNkX3YxgAT
	X/n+NtKixkxXLDd038Ms+H4rZ+FcHYjz5FNC/PPJo1l4u+BClkPgn7LijpjTmcezTdamSP3PNZk
	HKMMkinyXdY78W0LyLisZY8J90DPHIUVWtvEy+zgKLim9jBIfsIy/S2SOegoRvQoYLXEknNT26p
	9HbDs3bCf9np3rnip6BaKzDLTlxn+hnXbC/yClKkoBDCO5DeKQMuJMjCAFw+eaI2RDRGW436Lw2
	OslhQQqOIGFISf3JECEukul1WJZwOwroBqSoCWa9ZNXjk0I4GwiMD5BUZb7H7PTYzcAAcFvW4eH
	c/KImEBle6nn6Tc8Ai9o9WafM271OsTORp7M+Tvv+8nGWNjSjYTxBCitFXUTyJXui2VhCWJG4oL
	fY1Yp7DZg4tRgtjMcCBoXskseauhIgzVZRKS+a0E10+49w0YqelBND7yHT7AvPgxGiE65jEy8o0
	Ga/zZul5NjRxcyIFkweoynwA=
X-Received: by 2002:a05:701a:ca09:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b5568cf673mr23372420c88.18.1795716705591;
        Thu, 26 Nov 2026 10:11:45 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:45 -0800 (PST)
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
Subject: [PATCH v2 6/9] clocksource/drivers/timer-goldfish: Set clockevent cpumask and irq
Date: Thu, 26 Nov 2026 18:10:58 +0000
Message-ID: <20261126181101.3715754-7-visitorckw@gmail.com>
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

Leaving timerdrv->ced.cpumask uninitialized triggers a warning in
clockevents_register_device() when num_possible_cpus() > 1. Once
.cpumask is set to cpu_possible_mask, leaving .irq zero-initialized
causes tick_check_percpu() and tick_setup_device() to operate on IRQ 0
instead of the timer IRQ on SMP systems.

Initialize .cpumask to cpu_possible_mask and .irq to irq.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index bac84e0f9b7b..93a92a823f8c 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,8 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.cpumask		= cpu_possible_mask,
+		.irq			= irq,
 		.set_state_shutdown	= goldfish_timer_shutdown,
 		.set_state_oneshot      = goldfish_timer_set_oneshot,
 		.set_next_event		= goldfish_timer_next_event,
-- 
2.56.1.839.g22a8290db9-goog

