Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105696;
	b=CMdbh5VlrItsBe3Oco9eQTNCq0EyBZEgnJsu8s2fKUfq7/bmO7C2DBhs9lipRy7fZlbk
	 d9BuUAwgnuj+xqhRk3pVwfmL64qB+Pu06Mv9OdqCR09pE33N6gZNh6V3B4AFmy0RV7SeV
	 nmU7XHf/GJprCyjvKoQMgmSQw4L3kJr7FRVMYeZBQ6m2/PgblMSnRxhhCBqChU8FEgrFE
	 oUp5sZm7LIVe6MkIi6m51426QSZ4H7633vNOedOQG3nt+o1cPCJ6Pf/W38p6Vh3d5ghT2
	 VvqgtHiNYo1AMMxJ7s1n24MSjbEAT0TGn3odRMvTD7oPtUdb4vKqU3c4rBybdrGQe5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding;
	bh=mQjH/1G4I2QwMYT8EjQm95PJnpRkq5Bw5wDBEf2M6gs=;
	b=WmVArFJevfu0DTX7e+xXmL5M2zthUihVePEDNnkFDAjp0Qv5sfx4Sgl3oiha7F1h/LC5
	 vw4wRx+V51MeQEgdBUbwcZXGmFlkZJyqGJ/43caEYN8Bnuzw3vOVHHdMdyjqlKbAulbbL
	 jhCvJce8R/Rzde0lAI38b4fh8b9FS6P05JIcR0uXetaPM7GPrtGj2pCJdPrluO4b0jkVO
	 eahk2KFTe0AX9nCC6tDGjZ8xQEjXOUsq1+A1fkHILDlskLv23fGKk56/Vzlsz+t22mo0D
	 Yd2Cuy1pwBBMrRvaE23q8kHovFQU52XZWZ9YBdS3yuV59+uxSf/Vdxw9GabY1VZYpvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KETQ+bcA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470D606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B470D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KETQ+bcA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb606491faso14284885e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795105694; x=1795710494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQjH/1G4I2QwMYT8EjQm95PJnpRkq5Bw5wDBEf2M6gs=;
        b=KETQ+bcA1guKwDzrwmnjdPYgIwWZQFupivcig1XavGM87YjM78N6Hj0b1NZLaiDI6I
         vpMPG/FPvFXJqVz1C/OONnlvlBmxqAlyoe7II82tJEAkTHVqf3W1+azsapd0vX4y3C4x
         +f571XihvNR1v1UMfoeYV1UwJVC54C+xQ4UFZBuOftTPYf20kDfs9xPgQXLptxVvUGgk
         +V/K4jZ1UjuuvjcK+OkLgILtcE9MsKCw+FIeffwouWKEPNWGyp+grGxfEDlvtLMJpiii
         pX8v2EWW61/S3Wr53UBc/428QPVGqmcUtpOEc8tI6ndUZzvGmHrw6HGj4ZODZNI8H62e
         5W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105694; x=1795710494;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQjH/1G4I2QwMYT8EjQm95PJnpRkq5Bw5wDBEf2M6gs=;
        b=Z1gcL6T35sB9PER12llKjmX6cNwZPvHf+qpMAzScPxalXJbfUbrUu8BnNQxej1GWRl
         7J+9Do9tjYpX9RLwwOhkS1fEDpX6f4OL31BdIhgQyUUzdv3K//GOdAa3rnHcnMmQaeDa
         5SGV5HZOJH2pnboS0UAuWzS/u87yTEdgDU/Bp7DLg1rF2xgszXBvXfmRKojuyIGiosat
         AMfMeKv08+4EIcg22oU19xQ1l9QxIpk/OLVD403yV0PMI+t7M2vfmNvkkYM0WP1MtuhT
         msAwLRNE82k2RPcWISV/H1c2IFgi9hgUqteXnOG5rZg56wIe2F4YWVXVeaV2/qrGsQft
         Udlw==
X-Forwarded-Encrypted: i=1; AL+hErEh/WxDK6YEh5Y1tmUAnK+gvaGLqCdUcAm4c3jjzySHSZCPbm3zdLjmLIVnjdhXEA1TCMWLLaIAgqLYTmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NfQhEq7qZ4auYwYZGKRyLiy3u7UhyTRWxVWhnjWiyyQSafuuo
	vr6gAbJdzVMxOHbEUihq0AD062Au5F/0EO5CCR9Ugjul0fTTDyRXhPWoN2ON08LMop8=
X-Gm-Gg: AYBFou2RzFeywuYer+Ci03u+vUiDgBctxmmzh3DkSR8b6oFFQe/SPg131vsGobK3Mkm
	17QqlUTy/qhOOURL0YniPay/rm0SFhD4e0wyry3XxK9J/BSbQp1c0gs91es6ewjaEPOLIE8q8+1
	R7q6OPj97VfIg1sNySxBVNojJO/AKN1vjTuXRlJ2or/hUP1IOLwhIODuHtR+WupD+y1P/I9w6oV
	6bW2sgDki1UjTmJtsW4uF/bHjRCEGLEEzwI3bRqMoZVBMGsFDcAciWbNlsyoKd9lvF/Vp8sJURJ
	MZhxfIflE4xAv7aL1nv1LzeJ6uZ+onmjEM4PD4HsfOc5e3kBjqKCpgXzJXFVoEjNcgoWPeXL3T5
	cUXmKaDpwF0VvHG+pZFzi12ZmsbN8cNsYCy+AFp/ijidWyLFOjC6l4XvoVjmrEA+Mg8bSOdlMGz
	Td8tqwTTxyVVCtKN7Wgg0h0q/rc7Qy3oFjHke+kcwgYcAYoIjX48uujAPBZh4rnzsk4a46wCdx8
	r+u1UO1nCUN2/uNTjicC3qdvgUps8/CGvKRX+YFJv9EFhnMpbxSnLOa7Ee+8hmeJLrQnOh/vQtl
	FaaY/NZ1ZBUu+jyjoIL8dI4h
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr268485e9.13.1795105693739;
        Thu, 19 Nov 2026 08:28:13 -0800 (PST)
Received: from zovi.suse.cz ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm75275965e9.4.2026.11.19.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:28:13 -0800 (PST)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] module: Clarify purpose and description of elf_validity_cache_copy()
Date: Thu, 19 Nov 2026 17:25:27 +0100
Message-ID: <20261119-module-elf-validation-v1-1-69a74a84552c@suse.com>
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
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261119-module-elf-validation-a5a0e28e6dcb
Content-Transfer-Encoding: 8bit

With the advent of LLM agents, a number of recent patches and bug reports
for the module loader focus on its validation of module ELF metadata.
However, many of them are misguided.

Loading a module is a privileged operation. The ELF metadata can normally
be trusted, just as the module code itself is expected to be correct. The
checks in elf_validity_cache_copy() are intended to catch accidental
corruption and basic violations of the ELF format, rather than to provide
exhaustive validation. The only requirement is that enough of the ELF data
is validated for the module loader to safely reach the blacklist check
without crashing on a corrupted module file. This allows a broken module to
be blacklisted and prevented from loading.

Clarify the purpose of elf_validity_cache_copy() and otherwise clean up its
description. Hopefully, LLM agents will take this into account and the
number of validation-related reports will decrease.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/main.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 34e0204ea37c..0c204f07ca68 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2421,24 +2421,33 @@ static int elf_validity_cache_strtab(struct load_info *info)
 }
 
 /*
- * Check userspace passed ELF module against our expectations, and cache
- * useful variables for further processing as we go.
+ * Check the ELF module passed in from userspace against our expectations, and
+ * cache useful variables for further processing as we go.
  *
- * This does basic validity checks against section offsets and sizes, the
- * section name string table, and the indices used for it (sh_name).
+ * Loading a module is a privileged operation. The ELF metadata can normally be
+ * trusted, just as the module code itself is expected to be correct. These
+ * checks are intended to catch accidental corruption and basic violations of
+ * the ELF format, rather than to provide exhaustive validation. The only
+ * requirement is that enough of the ELF data is validated for the module loader
+ * to safely reach the blacklist check without crashing on a corrupted module
+ * file. This allows a broken module to be blacklisted and prevented from
+ * loading.
  *
- * As a last step, since we're already checking the ELF sections we cache
- * useful variables which will be used later for our convenience:
+ * The checks cover the ELF header, section offsets and sizes, section-name and
+ * symbol string tables, offsets into those tables, and selected
+ * section-specific constraints.
  *
- * 	o pointers to section headers
- * 	o cache the modinfo symbol section
- * 	o cache the string symbol section
- * 	o cache the module section
+ * While validating, cache the following for later use:
  *
- * As a last step we set info->mod to the temporary copy of the module in
- * info->hdr. The final one will be allocated in move_module(). Any
- * modifications we make to our copy of the module will be carried over
- * to the final minted module.
+ * * pointers to the section headers and section-name string table
+ * * indices of relevant sections, including .modinfo, the symbol table, the
+ *   symbol string table, the module section, and version sections
+ * * a pointer to the symbol string table
+ *
+ * Finally, set info->mod to point to the temporary module struct within
+ * info->hdr. The final copy of the module struct will be allocated in
+ * move_module(). Any modifications to the temporary copy will be carried over
+ * to the final one.
  */
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261119-module-elf-validation-a5a0e28e6dcb
