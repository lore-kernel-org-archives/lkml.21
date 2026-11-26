Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716711;
	b=NpyEIgyckpz13+/pahtqklbsumdjKnjAzgdFMKGEXNTHYweLLAlvpDKbravvqP7dKTJV
	 6ECq1eWf0eeMdIf4XNcEUGrJnLsvmB04Q6t1kLHQgJBS3qZZtgaZ0kG3e8hhXeuAmRhpi
	 dqV4ywZxT6wr4rB+pNuPYSCV/XEvyIssW7DpLv8v8Ta1KS2Wt4sjZ3N5TqgFyB5SVDHge
	 nQF0Fj9byeSGW9pApA/PK+AI6hmIeobylMi1/nmXan2JifgGpKELIBdAfBv17Qx1n+2QK
	 OchNlvv3WsDO5+OC4RJ6p6xGZB2JJsi32u0u+3vZakUCQhQ6I/hICYoCHUhKK48W6og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
	b=4T/tVnG+5FbllAe4KN3KMi3lRQPH/IZbqJ+c/7Yp73HsTNVxGjWfvAB8GVFQZE6i4H2E
	 ogc6RXB+9NiszT8DTPNF22MusXdJnOQIJTscwt2abeYQAT9Z7tBQeyYRv2osRdNa+jxOw
	 ybAYFSjfkqb/oFij+bgaCpc3yRK3RdaG5DeNqBH4DcnbZ762cUc9IwU+FlPnfXIiG9Mzp
	 wl6jq6xkFWNPQL+gnbVGf5+rTShA3ZX2nvnM7mN5vQQ2+Lq9GawG3IvIVLtM+g5Bjw6Mv
	 qK1vBtm5snEiTSqj/9dYU5dKGsibFD6RQkTc2FnBv6aeA6bY6V/AV3euXWr6Etyy5Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rmK2VkGO;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145E606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A145E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rmK2VkGO
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso9971520c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716710; x=1796321510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
        b=rmK2VkGO2eWbeBdvoWqupscSuLsBay8gABlx28/iVQew2aMLE/FY5M1/MnROZan93c
         ItOXrQWFmSId5ATeAC7HlnFJ3+n4vmVxW3HFLAqfcLjNdwDOgyQxj94JFaFaKMWdtquF
         xPxgegeuEdlO7RwYgV7wr07cWICXM7GmR35LLcfutVuDUHicJs8Jk2U9iBbNS1n1bwGV
         d0Ur61YSEX9krHo2lQIjxSsI8lSvg20omgXFtTfQ4Wwkvcv9QEVuQbTONhxrjn58IvAN
         H8tumupWZVqzdrho6vb8wsCPdy1IXMoNGNVfh5SuEvrwMZz8Pau+N+J+DxOH8Ha9V/TD
         kY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716710; x=1796321510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
        b=TiT2o3sHebL5khWwhy5Dr1u0/gxHgoww2SRh0auiTwbTY7iAIVreoZcLmye3cypLco
         grmcS9vs1gvXRMQ4mFQ3FI2qzxCgdj9/kMeT17VQoLtsUQBDHMlbLCPSNgp4KwDgLu3y
         4ECzHKQ11cn8hV9tLeUj9EPeEiVR6dd+JQjmhD6svkbjFasI9xLLZNbIgY/5wlgyqqFu
         LHnY2jP8H5XWc1d5B/W4nD2f1gp4gWbVwIVHLlNz0axGfVFYmkJzx8fF4woBmfj8bRh6
         p+MFuXAhs9+YeHXNetef88ovchBieo08+uLzAjUAGX1RAsjJQJgBoT8ao9+dnSPlwQ6R
         cQYg==
X-Forwarded-Encrypted: i=1; AL+hErGfGLMGUXOnJCIQFnjvnH5EAqAEAlRq3gSwTo2ox8xjDI+oXgZwaXwEKVbE8NN0OOW+PPTqFYb4eRW7pFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RiNvKUWdFxHj3uUaZ3Fi3AOvD1eNQDwAv65VboqKLFE2oC09k
	ZgE+LLdIG/a1aST9PaMv8O+nfVkehpYK6gw4U28EyuTHKR87hlIwrl2g
X-Gm-Gg: AZFdTZc+WPbbUch0IDGskOyhPTTx13M3VfkE+reJymhhtzuKg5H3oIeKz7YbgzqmjBy
	8KZD0gD/OOwEg9jxTfCXZdSiUvfvuVWqz1AGkGd785eLmX4o1VcaTN5FKMMB7bOvXIOP4OsLQhd
	5XwK8PPXJPHJPjn7JfUeckxJODZbBDQxgdSN2a23ZL4bxcwLnxW4Ss5l5zP7x75cQ5eDYJR0SZi
	BbMSC/J5JI/3OXTPhdZKYKxO9i6rLjrPaey5kwkEPQ8AgD35n8hsqM6jhFFnQj1h4UtAq08NgIL
	PDzbK1f8nmePitRtlq1KlElm0bEnQljkoPZAZyO8f/qhS2XWSSCCoBb4BMNEhvePVCPs8HyT0NC
	D/rx2s1trOJUexNetonJSezCz3GjVOM0fqlrephc6SI6xmMQM6Ie9K3eE2E8IyAswvbWuh0qAWz
	GYsH+BXAFOBCjuy5ytsq38wGhufXXfBX8FcVGLtSqC3AS0djJI7JNfCtsUeulRJBKMOkStnDB0C
	GhZv4wSBguuX8mDg93B5Aj46vouMX3Jl6APFJdf7bzsJ5OQFvOrZCHfO9fNimsICGsBAZL7diBV
	bktuSXfosh385nCn2swFpoe0J2eW4aPe0Yyzw7SUxbtEjeXf5C8y9AaEtJjgYp+Fe0Hks6xbU8j
	5zEo9TI38Rk4SMDLYFvYYD+M=
X-Received: by 2002:a05:701a:cca1:20b0:1b5:86f9:69ea with SMTP id a92af1059eb24-1b586f96d38mr6533120c88.0.1795716709806;
        Thu, 26 Nov 2026 10:11:49 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:49 -0800 (PST)
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
Subject: [PATCH v2 7/9] clocksource/drivers/timer-goldfish: Set clock_event_device rating
Date: Thu, 26 Nov 2026 18:10:59 +0000
Message-ID: <20261126181101.3715754-8-visitorckw@gmail.com>
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

timerdrv->ced.rating is currently left uninitialized as 0, unlike
timerdrv->cs.rating.

Set .rating to 100 so the clockevent device has a valid base-level
rating without overriding higher-rated or architected timers on
platforms that already provide one.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 93a92a823f8c..f5019a6bb340 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.rating			= 100,
 		.cpumask		= cpu_possible_mask,
 		.irq			= irq,
 		.set_state_shutdown	= goldfish_timer_shutdown,
-- 
2.56.1.839.g22a8290db9-goog

