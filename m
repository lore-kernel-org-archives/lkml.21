Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795056222;
	b=Fu2QdP218wEpOa0G1ArFRlPbsYL6A0gjjZm69TxKYq9yHo2cl6EDU3b+L3bT1dj5sK8R
	 gY54R3VTkGeazkplYuEM0lsDgFCmd1BloxfN8i5o/Ah8MlGWaeBPcHi8Z1Mc4Xn05yvmS
	 /nGgJMqBx00KR2ZiSKneuAwgheFD8rcd2JD/6C6ytgN4fzmUBCLoy32z5POenTZJ2EuYi
	 gDqOAh2mO7KcM8234gI59885KPgsnRBvBDcFAd5jSt26RmRC6DlwUJ9p/+DrZ1djo2N01
	 /6uCZ5gO+apwXvUu2tZuXRWKlfwHYIO/m4UTAZ+4naLS3MRC/YLZrPp30j9XcaIZLyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d66UMPv6yC/s2AzK4CfOK+WTQNXn/BlfhFXZPeLZHuw=;
	b=w7tkPbOQElOoCQm2epf6qtjQRkbvPzu1eAqcPFusGVTV0CwEHeeBNZSJRjrwAxBj3KfQ
	 cpGFsgxZYsfKNlufT7sdEFWxNTQc5OURgzZBC3VkZv+yQIXTB4veF+DJm0vfSHHpqSgEF
	 Rsg1DM9rJcZU3BaKTfHbB9HAd15Xk0JdqjJc/hoWX6FHjWG4341csZ/THj18f/3vsEMFO
	 v+X8lTEw9kyWq231pV89HLEndcHFszidMxXVoZ1Ghsfg5CXUrTV42S2zA+5QU+TTt/8FL
	 KUNRnn0dad7JUnQ4IcQklQU314Twh06WsS9/LAQ062s5/5S13IlwdBQdFDO7mZZ6Fsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9X39aE7;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEC6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BEC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9X39aE7
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so1029159f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795056220; x=1795661020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d66UMPv6yC/s2AzK4CfOK+WTQNXn/BlfhFXZPeLZHuw=;
        b=m9X39aE7amo3fjJZ2I5yZIyN5fxFVF44vXXd0m2f87af6weJx7wtCuaBj4q8o/rcTJ
         J7XvS7XHeO2/Dce4DzOeUnIGf4FiJJ/4gDJ7a9/kyEp0HeZu1vu2sTgySG85Wwc793eE
         v3yRN5Iv+dbN284dpogH3PBPM9Q97zd0e01Bf4VlnfsIKmg52Tgs19i+Nv7kACfI5ymh
         0zg2aXnDZpF6uWVztInl4BhDIxqmy6LG7P7syWRqKcVZai/iJRtaQtkoDl3gIZ6EJeoz
         2NDnPdpiicgr4EkMA6wor5WpZ22usHOLjnTVLos6UDoNnF+Th+IL53332GD54sbYtYAh
         S/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795056220; x=1795661020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d66UMPv6yC/s2AzK4CfOK+WTQNXn/BlfhFXZPeLZHuw=;
        b=P5vMAN0I4NsFMR06yTaEwTMSk2RMon6wB90iiEiUKxEU/elzu4eyZMKPPfg1GkDRay
         1ZGEhdbRV98SdRC0fOLgL4AP6kdftPtnQZTULdyuAucaLd/oS9ll1tXkGWsGsIN0wt+b
         uHbA0CQGNo2QhOmiV56KiF6P2wGypFC/5F4OUvk8vo0/IueR2O3emrSr6lhKmix/Ake+
         uKWtn7T4qnLFoXgrcL0DT+PPXoIBn34EBkqrT87W8Us85g9i9eTGXrXbzpqvxWFnRTrJ
         +5VxfUc/FzGbn0rqrpz/pg68J9lRyTi1ykjBWivssG8zO1mBPU6IffcXwMsaVJ9tedT6
         jH+Q==
X-Forwarded-Encrypted: i=1; AL+hErHXyTAUxoSxS5od+TsQYyW/dzewSoZAHMARGbSLYnxVS4BG1MJ7fT5jnRCSWwYrYZnH7htMt8JmPLkQ6WM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3kytj6sTmF3+GgKLhewl8RXTCq+qoiAnqvqQG9ui4tYjpRoP/
	1kmKXNokzoWn6DC2PVYl7GR8vC2WYhQsCcFYLNHv5IdGBTYeNmL6Q++W
X-Gm-Gg: AZFdTZf1yCZZ0xYZJFqD61CTgCLHT+0rdVonXcImcDfy8gbkHBmGlcNbKs8REHLpQUU
	6TxL/p76EKE9BYC4aRk2wrfg5nY5iCwnAB0gHiXCB/8QS4DTTyWD8VMSXF//hwV5YS7rLfiGABe
	wyXrHOpZv5qqikKBqiUTlHTBnffxpsMUtIPKzBJ63ur4ErRqI4fbVpFBOXWLBHuPdfWrn45YfX3
	xMwdCQbzWpVj7NZ605dYPisQKoMQAlL8AIRTxvKFt5OEplTiZfQM6eLOeAAcvCd60w8DY77Kzt4
	3YmTWwfqv9RKVwIdBlO7Aw6apsMXLT2KteykXqB0kvKm3WOJJvQJcPqzILUwgrOmS12QpH3ZWsc
	PIYjgpztfgholaxAhBzOhXtEEBBvfvbW7ddRhNKNsUFgPJ6zYrvB21YFirkjlgdrhQ7rXR3+t+L
	gfn0jK4i3LzmChlTiwGsavSJDvtBzLb6qe5d18//IVJeGBbTTY54sqiu7pVNzDzfm8RJ+4lGd2z
	vxNjOFLKQMmoNaS/szGmhuv7PQDU6sOa8KoIEW45UAdQV+P1cxwIcV2k1exrp01AeTHgC9W/Yci
	2CiJ7LC6Fr412k6TcSZ0pFC09WAEuqZ35rXptdzi9MTVu8G8BbD0FZpjSBchApzKXmGt80xLwTE
	phEc+oKaXmIj0NbMYsov+aAKA2XrMLCBt2NpN0PUROdyQARrbdkSSNg2cQHPhq63j7gqB9dMog8
	zzb5Pj8QVmrblUpKYTAh7lOFuRUfDKIoQf
X-Received: by 2002:a5d:5848:0:b0:4a7:b365:19df with SMTP id ffacd0b85a97d-4a7b3651b17mr6493139f8f.35.1795056220087;
        Wed, 18 Nov 2026 18:43:40 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aee2-3801-51ff-dc56-c5ae-f027.310.pool.telefonica.de. [2a02:3100:aee2:3801:51ff:dc56:c5ae:f027])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a885b81daesm2965497f8f.20.2026.11.18.18.43.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 18:43:38 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Michael Neuling <mikey@neuling.org>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: errata: mips: Skip vendor extension lookup during early alternatives
Date: Thu, 19 Nov 2026 03:43:10 +0100
Message-Id: <20261119024310.37980-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

When an enabled erratum selects RISCV_ALTERNATIVE_EARLY,
apply_early_boot_alternatives() calls the MIPS errata callback from
setup_vm() with the MMU disabled. Each enabled P8700 probe calls
riscv_isa_vendor_extension_available() before rejecting
RISCV_ALTERNATIVES_EARLY_BOOT, although neither workaround is applied in
that stage.

KASAN instrumentation in __riscv_isa_vendor_extension_available() reads
shadow memory with satp=0. On QEMU's mips-p8700 model and on a Boston
board with a MIPS P8700 CPU under KASAN_INLINE, this faults during early
boot before console output starts.

Move the existing early-stage rejection before the extension lookup in both
probes. All later stages retain their existing lookup and patch selection.

Fixes: 0b0ca959d206 ("riscv: errata: Fix the PAUSE Opcode for MIPS P8700")
Fixes: 2cf0b2992203 ("riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with mips.pause")
Tested-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Reposting without RFT after Aleksa Paunovic reproduced the bug and
verified the fix on a Boston board with a single-core MIPS P8700 CPU
under KASAN_INLINE.

Changes since the RFT [1]:
- Dropped the RFT tag and added Aleksa Paunovic's Tested-by.
- Rebased onto riscv/fixes (5c52d52b1b8a); no code changes.
- Dropped the removed Assisted-by trailer.

[1] https://lore.kernel.org/r/20261016203052.2026-1-kmehltretter@gmail.com

 arch/riscv/errata/mips/errata.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/errata/mips/errata.c b/arch/riscv/errata/mips/errata.c
index 6e71555274..9bb1c3de95 100644
--- a/arch/riscv/errata/mips/errata.c
+++ b/arch/riscv/errata/mips/errata.c
@@ -18,10 +18,10 @@ static inline bool errata_probe_pause(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;
@@ -32,10 +32,10 @@ static inline bool errata_probe_wfi(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_WFI))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;

base-commit: 5c52d52b1b8a2f884b8fdfe3c74741ad5b48f2ce
-- 
2.39.5 (Apple Git-154)

