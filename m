Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782491;
	b=PQUf6d/Kxb2ppWFznvEyjcs8DyUurufgYBLCCQmeSaTyXMhdwcgQTywvHd0/K2UZDgCX
	 S5D9w9FoOaVd5jwHNWVIKoBfAPEWJxm9ozTiGYrx5/9oYW++1MFmuhuFoPhXTHoV9tL2G
	 UmgOnwd67Wao+hI7CRPNEZfY/NUs8tEtYTGWFa2n5wfFk524+l2MijzjzLui+V23g/EXE
	 AQ+VHsOQQjJ/xzFdWjcaMlvwhvOydAHHqAGThs2o0zFF1WnIoyLgLr1G/cyfhsdez0l0U
	 wryzXrP0ZmXhVcKxN6eXSoQyw39o6X9CFeSSm0mT5jKtshrervEq47adgzL8Ie/TlMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ffGLnC0aeYuZNoJ1T080BFlrB7SMYKCZd8bWmNL/oEo=;
	b=5kvZBW4m5nJncmr9ZlhXostCrejmWfwrOY3q2b89BrxBUNZhO9DVZHGg4uxWtn9BPSgR
	 6+QeT9tVoBTkHewB+M9MH9kNnAyTB2EGU1DX7bSuudUjMuEFE5h1lUT2D7OlECQcnyzIU
	 50Jx7g6JCOTOCglepfn8cMAl+15teo+vy42rTWd3TPIw8PDRRtRQbHCejG9kHyVzOVo7j
	 9s6KyNlY+3t408P92wJqK09pwGySelDDDVq7C+/q/oZgh5OFCg+UFPAyItX3Pv3Dgcv/Y
	 i5H68+0pNtNoalOxczchfAwvZIXjEow7VkG47BT+mdjQfNdWBE6GInGg3J7jgOTH/Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz3sVaTt;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D1606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz3sVaTt
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso4958297a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782489; x=1796387289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffGLnC0aeYuZNoJ1T080BFlrB7SMYKCZd8bWmNL/oEo=;
        b=Pz3sVaTtpbmmaBVlyFQbjlZtmm4IGqjrlNDNkTpfn9JeMnRlHFz22C3wGHd+Rit3xS
         SHu1UnPm2Bp+hOU4ekoz9u+z873wqcgNMDHd5CDCybsUOR5ixWEjwVjG/wkzIBS45J/i
         lZIqaoui5H2yforNM8BkfvnsgkmtRFoq7jVYYtgYMeCx08pbfDdE83ZkLTACRuUHaC7t
         uNTSCpE4+MoTjjXYlNJb3wQ4JThBA9xDshxeisC9ZLEk0nHYmqHTBfZMkHIZcaNDzpl0
         pkcljDr5ukJteFtoUnuuUnrQxXMhNDnru4ON6Abf3QrO7c00w1jUlD8vK/ZmdU/292Bg
         ziiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782489; x=1796387289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffGLnC0aeYuZNoJ1T080BFlrB7SMYKCZd8bWmNL/oEo=;
        b=1k592yKXyhwbASQfIGaug5Xo1Dv9xFpq8FGZAkLjwe1orM83ObmKjtDMa8XauDzfs9
         8f84HkjE95lHPjeFT5ZdICkiTjaLf+LoYLWCqClhZ8PQNllJCrM/lPVRIBAbpyRWSP/N
         dNoU2o+q64MHdV0QzPJxQ01vC2ZhgU+RLD3YRHk8O6Y8fzn0KcwjWLh9vUDl0KeDtWg5
         fF+5ncadzY6Ul1mZF5oRNO045UL5fVANpVCEEUZwbPtknsTsOc3n50I/HPf3NkyK2PKd
         D1FmNU51VIjGBQ/BrkNm8S9KWoQLx3ZbWxy6gT69X12H04GrP6VI8t4677Wwm9LttiTz
         RXsA==
X-Forwarded-Encrypted: i=1; AL+hErGcdg/nzq+RSvw5zc5C3S0Y94YAuPAxi6G9Ph/wFR/mM3dw50Mkr9weyR8hH5c5zwJd+qrRt6NlkCL7SDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NmETxP0MBwHCydqJbuCxbW4h+Szw3TVlOj4i3PbF6k2SZ844M
	1AybhV9WtiFGqIjuokKcUhXe6/nvYv+8o6zhf563OUyeC/8uP4eKIcqd
X-Gm-Gg: AZFdTZcZadkHVa+/xzrVch0CcWnluKX9N3XGwtSVlu3HUeNZ51jxq9HvL4QJzr6u8Wf
	3Sqxq+11UGAVE71m/TicPbkT1A4N0NeRX+twJJuWMAfUHQgN8Pqiauxx9vSXrFUYofa9+ccq/Kg
	PF5/luwB9CrtP0R+L5yHO0l9nMAy8tOXgvskqAo8PfIdKKp6rMsHQxQqkPbMzKPrri8c6IxKRK0
	Z11hZNzllGTf8DIMwoAh4vzJfDtMOVDswsPD/al9fEa0+YmgPvuseo4i5sEYVRIzCdm1Obif9Ap
	7iED0PN3XmiLs2S9Kc7THPNdA7qfcIY6r+STL84opSn2ueCoHrIjFC4/oitR2mQoDIkUBTehQE9
	tp+eTA/PrrAxshoxTOp6/PZgvqAha5K8p3eNKOZm94PCEPcz9fgCsnHQGyGW+cK3BRRAt4x77rd
	bHXmLj2ZhKSkBdreAS2L1HFHRfCpVbxfVywiHhih10gEu1iZmFkrwXLz1PHjuJ/ruTb20JNpv10
	P9/dvY2klsv1rfDe4fBf5frkP7Oi/Jip0tHoxLWouJp+4eLqu9CVDsTNeSGEK/zCmhYxYqrWDlQ
	ZJhOESkHg6AdNCRaqSiejR9svdJuScveZDY/4EZteXxTGkuuPaK/DGQB5sOjWPWkCutaFg7kJI7
	Jjpy2UCBsVi2EfVYW3e94i2uHcNQTIxwbKwpDMLKaDA==
X-Received: by 2002:a17:90b:2ecb:b0:3b3:acea:46b6 with SMTP id 98e67ed59e1d1-3b41c95e795mr22986239a91.58.1795782489182;
        Fri, 27 Nov 2026 04:28:09 -0800 (PST)
Received: from envzhu-ertl2024.taild6e5db.ts.net (115-179-78-224.aichi.fdn.vectant.ne.jp. [115.179.78.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm25088215a91.0.2026.11.27.04.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:28:08 -0800 (PST)
From: Yoshifumi SHU <envzhu@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Brad Hawthorne <brad@sim.vu>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yoshifumi SHU <envzhu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "irqchip: nvic: Fix offset for Interrupt Priority Offsets"
Date: Fri, 27 Nov 2026 21:28:01 +0900
Message-ID: <20261127122801.4189591-1-envzhu@gmail.com>
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

This reverts commit c5e0cbe2858d278a27d5b3fe31890aea5be064c4.

nvic_base is mapped to 0xe000e100 (NVIC_ISER0). Thus, the Interrupt
Priority Registers (NVIC_IPRx, at 0xe000e400) are offset by 0x300 from
nvic_base, not 0x400. The reverted commit overlooked that nvic_base is
already offset by 0x100 from 0xe000e000 and incorrectly changed
NVIC_IPR.

Link: https://lore.kernel.org/linux-arm-kernel/b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com/
Fixes: c5e0cbe2858d ("irqchip: nvic: Fix offset for Interrupt Priority Offsets")
Cc: stable@vger.kernel.org
Signed-off-by: Yoshifumi SHU <envzhu@gmail.com>
---
Vladimir asked for this revert (see Link:).

Tested on MPS3-AN547 (Cortex-M55) and EK-RA8P1 (Cortex-M85) hardware
against v7.4-rc4. On EK-RA8P1, confirmed that the driver now writes to
the correct addresses for NVIC_IPR registers.
---
 drivers/irqchip/irq-nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index 2191a2b79578..9438891e66f2 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -26,7 +26,7 @@
 
 #define NVIC_ISER		0x000
 #define NVIC_ICER		0x080
-#define NVIC_IPR		0x400
+#define NVIC_IPR		0x300
 
 #define NVIC_MAX_BANKS		16
 /*

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

