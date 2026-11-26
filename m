Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716702;
	b=ET3ZJsistdu9tswWUrUJkOyErgmo3gSHc3vVXJZjteXaj6OZ++VQs8zP2hZASGtPVWHc
	 VLg+g9Rlz+uBMjdRtpeflwwaFIlcMaLNgJOJWschvd+JNlkwG2smWfre3dwy5sjW7lK+S
	 v+MBEz/mK9UzR2XC/cEVW9XJ0t2juRYi09DVLnNeSRK+RkH2Men+d40PZcbeNz0Anz0ZA
	 ALG/Oh610gfc7mwbiLkxkT6+Rd6tki8iJ6gOJkKbULq1CyaupJ7IzDyAK8T9uI1DYwsIW
	 RTOYdSRWVZZjtEcMh0yjoK3m9qVRuVDe5j/zCbNMJWQxTeocaXckdUVo9STtnbuJ8/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
	b=jyjLapqidH4zedF47JLje4oE5o4SHutd7xkv0gOy+jWPN6fwUICHrGXFa0fWnR0J4oYq
	 ghW43wiZim0Bvcetf/2nNKU8Ni8Ww9TYrREzBEJhZQE5ehrqjrkjRGC0HTun9zoA2S2cN
	 voisT0RkpS8HfhkQ86OgMxRIrO88+T+2ZciLm9VI9mnhVX9LWuvoIJSfYBK2hU1GTx8of
	 aQ+V6abBW7GyqB/rOm9MKP1cEpbhylXuIt5UC6YzU3N21rkAUGLPR3prkhMhIt1E4gX9N
	 fx+2ejaW7aUGcn9o4Y/FcdZ+FB5DpMMnqxrso2d5xeaJegEQTqlp0yoR2yTRUC0iP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PxaBLLC;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6161E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PxaBLLC
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2761c69fbso9971200c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716701; x=1796321501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
        b=0PxaBLLCYaPjIww8CA91NElriRj+KNRo8tGOCS/Xda1kLrGU5SC0aQsiemLZL6JkXa
         YkfRqzCZlYqJxRjQrJdRS6im0pJhhTqugb0+dwiAsBHvN5IDBb9APENcpycrqdoSZDZZ
         ZR9SOgZDoIO5MbyF/eX7K88HDU7JkG3MgJgvXsv1hBR1JJeDxOC64d91Pzq+avADEP2G
         niLCH/F8fzSMTB7uv4oDGJH2Gdq98NnpM95kLbvxWMeJcZoTw+QaKLlOuw4tzbzdpTpp
         MdZ/ZdV9/42kwMI00K4yZ4i48d+6cMqmiqXzg0CCQhuarVPFYhASzVBezQdObwwgdFlb
         dNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716701; x=1796321501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
        b=gdd067nWEV7iGLbGHZuHfPqmhV468HpNXLug7Nfld28MbC2E/vsPlTDK6xJ6teBYbI
         /5GpUEC1HvwTgn/rG4fyYa9TMQKm4MJogoVN+PgoUsCZZSBkBiQgRz4Lte9m7c46iRgE
         3vWpDsovKO+IAB6gsot1YOPKrFpIrizPT2wNTExszGfjhbr2upWz7OTnKGnFWuXoFdWU
         KmabslbvhPvcmeeIKA0C4Mt/4jmeiVz/K8OFvicPsT1U3Z544GlLsO14oVVjjTmtyeVH
         bkUMPWn/b/0zOh7UyaeS0ZnXgVYWrEKRh6V7mRCcIdUYFhFAD/UTnIaOYiFoYNDdgQNd
         y8fw==
X-Forwarded-Encrypted: i=1; AL+hErF/cXbeatvRN7RkV9RFHEaZV9WmUkoqcGJPdIQj4t+l7xhOVEjcrKa4phyBf3iOO+riJBqt9f6i72PbWec=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uRALBqRf4QHmPVlFjSnxkBJdfb7zhj7FRlXp17VtZtML+gy4O
	0LHhXrFJSYLk9J38e1SAaSHzlgC9WiacApxoUpBeRmkHxYvcpbbew0lNr22XeQ==
X-Gm-Gg: AZFdTZchC2PjayTM2WJ4q5qoYJvZSOwdoEkWHp5ljVleQlsH/kbeTBLmbCPpeTulKBF
	X31NTkouPHfw4adydWNLZQGQ17fXvq2KOO8Y814Kb9QcpyULM3sjb9aEa3ewXq6jg1C5Mmn/KJO
	3MeUCFOikAOPBIkvBZ808fJQtqAElS6a2eD3SZ4inVFKuU+XxyMCq9KD/a0mhj9GsF/o9zE+NuI
	nmsZUs5atDmsAr2ych20et/Cln0ckpQ3x74tmwbzmBzlKW5Y9ETCbeFitY+HYoH4gy7GLFePZ28
	7uiyvKKzFuP5KkjnbdbBorTAbM75ESZGEqdN3HFMJx3g9pdAAuPuUk+C6QYTpm2LSODyze1JvN0
	4rLX9zEywF36xWaiRvs5XkZIsQ88bg2HliC83wnb+ue3bJxazGBcNn2TG8xGessUDjnXtuPVtzc
	2TeVnnemCGuRurkLErVzcQmOC2wr/cbdTDUgLfPGkeWXpjvxnAWxib3zrju8uV3nJLVz1u/niS1
	zKX9P3E6VKjmjx2e05VOh9a0jOX+lNOQNc37YJvhKgyJgEngG+Zml9mJ0XhEDONXXHZRO/iAPR5
	3+mj6eVoJ9YPlmbel+DaljyeDWt8GyG4VQa1T5Hc21+jW3A/q5+nm2I0xxz88jgTiPY8rN2Hz7D
	fiLwZbw+XlHstSJ9xy3tItxw=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr6831377c88.15.1795716701414;
        Thu, 26 Nov 2026 10:11:41 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:41 -0800 (PST)
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
Subject: [PATCH v2 5/9] clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
Date: Thu, 26 Nov 2026 18:10:57 +0000
Message-ID: <20261126181101.3715754-6-visitorckw@gmail.com>
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

clocksource_register_hz() automatically calculates cs->max_idle_ns, so
the explicit max_idle_ns assignment in goldfish_timer_init() is
redundant and overwritten during registration.

Remove the redundant assignment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 88253bd1f569..bac84e0f9b7b 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -140,7 +140,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
 		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-		.max_idle_ns	= LONG_MAX,
 	};
 
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
-- 
2.56.1.839.g22a8290db9-goog

