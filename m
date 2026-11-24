Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538714;
	b=frGhm+ZJK+XV5sLrwCLK61wDSZqhE54q50UmcYoBM+MNQ9hfVSYjK4Y7F4GX5pJa6Dzw
	 gNx7+CUXOh8mWh/T7u5TD6+yp6vGeapRXi4+9NfnbIMGnZYDKp4BXLzihpkiD7U5ycd+F
	 t6E15a/5W5CwtwvgfCW8+uvqjfgHvYRY2r/ZCZiJZ3HpOhnn+O8xWYc5hWHvqIearqbcY
	 SKd67QMjgSXMxg3XU+D7ZaqNgMxNc/ZOycJZ7V63vfl9rx9rpMBZNwsm+d05exJUNexrY
	 gFzn5OVVTmGmVfhWI8b9sn6m5JLenuo175PpXi2lcPCQ5sr8TuifyDuA/VMyWPdEi1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Zuvz3xSe0E/I6IGKMXvL4wAnV5TL5l4pOkC0AqyMf6I=;
	b=v7ozX4Lm+cDwfffOov9nMhZSiyyviH7bC6CqT5ptHStUPphPttGULN+qgSngGkcfB77r
	 aR9WK/SWcX4ld8KUijFsWByMb+exEgDx7mT67uMJ3Rr4MyUBMJnYVl2kT1nHuKAwOVuq0
	 I9bjXxLowJ6k+MPBCtkLyAeFbdMneL6taGXBOYzKlm1CxvYcN4bDa1EXNxsw/DEPOjtqD
	 ZseOvih8rHC5LxOsqDSEZGo+SR1+jjVySrGeBHQZXoug81cIqstWxkDlWV8ovPCYgqOqS
	 pgOBa8fU7z3hC0HRNknqw0L0PnOknBaNnj1WgX/MXhSCDo0uoOjKw1QFWQVwgv2F6MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="UKqCO0g/";
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B624606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B624606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UKqCO0g/
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c508f61e492so341098766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538712; x=1796143512; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zuvz3xSe0E/I6IGKMXvL4wAnV5TL5l4pOkC0AqyMf6I=;
        b=UKqCO0g/VTG3WB4vz8gQHZHC/z0oCCgfEBpxJuzO4WkBDc6Zt5PUz5LU6Zoi9k66ZT
         8uhMcibcHQOvdWJ+HNCJ7zXeQdUyHJCkh/R943FB19pX0jkCyptA7kcZo1zjYculb8bK
         4ndlqRRaK/3zccvlGnHtZwBNarq3+QZZ0T170uvTAKcXi6x9gnhI03gMEoyPYo6vMv/I
         yTuNwQssZK06sHw5MXrkJb5wzG/JIrMLL6J6JVG3Pw/s07oWP5hvErfudWXhSGhblZP9
         MPdb1MHEnbD7dgsx/ShnZycO2flkBJorpUk8Txlz6nijA2k4q6g7WVOetyY3rpolWltt
         E3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538712; x=1796143512;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zuvz3xSe0E/I6IGKMXvL4wAnV5TL5l4pOkC0AqyMf6I=;
        b=BoWseMUUWDT9xXyzqY0F0Xal7vSWSMLciWs7HC5Nd0/XqT3Cf324QPi3AkAJis3SRh
         KoRWzL+JhNZ2om3kQB9A1GM6Zng7zGNmQAdnw4VZeFdtEHCYISYG7nZPQ+OpS3QMBko8
         xAlY52YoTAwNe3dpfPTkStP7+wMcKtyvyzC9pkA+bn5il5z7IhPukJqYZhAkVOiTHbNL
         SuIRB4ynF0CkgebiT6v9YHZfvDydnsg6cVDov11vFBDJc8v6kRPn42cZcA1kmtUgVPQu
         Xd+61nnXlwowHkLKRq80rF4RtO8Pp2N7ky8qto46daLJdqVpyvn/KbuK7lvnxw/n9Bg4
         NMoA==
X-Forwarded-Encrypted: i=1; AL+hErHQPAevbk1tunUqae0N+QuNxavVlospw5KpUOpGg3UiOMxZvg66wUXEDKBHAJ7PBPo/fW5Abbp6nbDgREo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z88TwDateRRK9amU6ZXT7qdVAHp4EjwZzdYbmLVVwP3sUKgx1
	8MgAusYCiafG2Wz9AHrXpb2dI0KwbWltqkWosSxOkUGw1AIMG68WKKFTVZfOkYROkJReh7CMCO0
	VN85cL6DIvAg0waXgbiOrtg==
X-Received: from ejbca4.prod.google.com ([2002:a17:906:a3c4:b0:c4d:23b9:1c75])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e00b:20b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c513a47e2ffmr836800066b.1.1795538712212;
 Tue, 24 Nov 2026 08:45:12 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:43 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-3-vdonnefort@google.com>
Subject: [PATCH v2 2/5] drivers/virt: pkvm: Make pkvm_granule __ro_after_init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

pkvm_granule is only written once during init in
pkvm_init_hyp_services(). Mark it as __ro_after_init.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index e7d7cedf7f6f..fbcb57c31186 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -17,7 +17,7 @@
 
 #include <asm/hypervisor.h>
 
-static size_t pkvm_granule;
+static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
 static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
-- 
2.56.1.809.ga0b61035b5-goog

