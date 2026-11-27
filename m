Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789440;
	b=nBimHiwK9cGMuK5wVb5gjElTl8xnFjPTTctCMIDLG6OEctNrtLs1Y0+mud4VIfXcRS+Q
	 SjPYU+jWNOF4TuenYZnenwzIQzuEIKiiNGOEWkpFvACmislV8kzDgAl0UD1l2TPRwoWI9
	 ihXdYedRipweOBAENOKx9BXvVdzxQGyRdhPI/WhM7lIu0rZLg1/OubVh+AOpTSMhi7/3w
	 /1R2S9+WzyZUIggvUB4km7JTH99UP8+wqHdfLPFzyzpQTFx+jtOUHsqXYhSFtXeWKG7/q
	 IJvxfcBw63ws1OblAiL2ezK+RVd8CBuZntZ2L5iIaasrKLcLxwZIoU9qVmkK8leyZ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:Subject:
	 From:To:Cc:Content-Type;
	bh=Nr4GHdi8TuNIIYYptR82W4hGTIpm1KHzw93c/HPqhLo=;
	b=mLaQHnTOSNZhR/xk1bG0hEa13Cagy/DAfFqlk9YaD7Mm4RaWBBG7MQqWcNaju5+pkMuc
	 jJRim6UNBNamvSiJtImFzw0dqFUmmPsTyQVjGBMP9qZC6oZ/KxKykvEFpM1JAlQEhOmJY
	 vWOPGkAQSpw2dEZJL/NR7QgFiKF7uTE48K0LG6V6aL4vm9jYS73lSxZgm9aXjCuGsUAYT
	 WJSRGRzJpsU76OLfcYMWG/HSnmRGUPQv5rjxIvO0Cl5emp+V7qvpIUIiKrjKPU5nXZDlz
	 wI4jjwTVHwz5UZdN77ACRfP3hvxNf52rSmpameHAD5vl9kswcCNvQIiySOajKmoGZhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MoeWim+0;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787F606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4787F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MoeWim+0
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b3f6d9827eso1616418a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795789438; x=1796394238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nr4GHdi8TuNIIYYptR82W4hGTIpm1KHzw93c/HPqhLo=;
        b=MoeWim+0P/+RQz4DlYNaE/QtCxMaM4mv5GR6+Q8NyrpZ4APn/4lWxXsPd8bgUWhnw1
         rURbkJOLYq3zIWXxRrQXsCRECGmtiIF60z/eW2FSfrdEZbr/GwxLNZHT+dLPkb3Di1gA
         OEnvnOByueQxhY4qqac61pwgGr9q1y9z7fjrIild0sndzARkw74mHBFI8sJHHLEu2JOZ
         NSY4+903Hz5jh/lWO+VtfLL4YSljnokape8lZ/TA+yXS6fdyzSpqxw2cCui24KGAG/fi
         aX88TyMp1QlX2fgKDeBm4M4sDgDxlTkJFg8wyprzxrT1AKfySgNh09g2os70zexIA38X
         /thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789438; x=1796394238;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nr4GHdi8TuNIIYYptR82W4hGTIpm1KHzw93c/HPqhLo=;
        b=Clf9bjh64x/ZIZb/SKQ1mQ/xfEmSC2ZR/jgE8wzfmCwSFn2naf9q/m6dhkbOaYiajd
         8IKaH5yDcBL8ue2ChI+8tvsB5JE+DIqGL4vZUxQ4DWgOiZawZnj51TkiB0QtQdFm8Y/c
         SsPn0ULhYQirmWEZeGONU8UDJTn2s+2+VjTh9PfU4vInb9wd+xgYQ+R3MbHUz1lObJvn
         P/2dICFc1+thrg/ZNb6gK4/OvKwftAKY/JCX7YQAmArD++FSkoIm/iEkLSJ/iq29XRQ9
         ztNusi+iWM4eMBvn+wWwz+fEZaph6xdsJoVPeHLRck3MgcY+K1BMBGgaYvnNF2ud50Ko
         +Q3w==
X-Forwarded-Encrypted: i=1; AL+hErHFa0ABmheFxgy9PoGG5I7pOByXsOqOFCzeshPSXmw7OhjRKwxAud3ZU/Jqu8byruUUGji/ivK0YevyJMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+qDoeXvuxo+x6h7XiL04SVEn4ZIXPo37KrY25i+PKUJHDp+0+
	ZMNb1QOfbCyEoUGysodcgMaTxRWj4YOhfn+85hvy3FDNyszCkcakEVg4jiL7oAL68VzVwf715g=
	=
X-Received: from edqs19.prod.google.com ([2002:aa7:d793:0:b0:6ba:1277:9974])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1e8e:b0:6ba:5993:cec5
 with SMTP id 4fb4d7f45d1cf-6ba5993f458mr16315738a12.35.1795789436818; Fri, 27
 Nov 2026 06:23:56 -0800 (PST)
Date: Fri, 27 Nov 2026 15:23:47 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689; i=ardb@kernel.org;
 h=from:subject; bh=vU/fdwAiBRa6c+OuOUG6Wglb6aTzwZfj0yngfrJ3Py0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZtzUnHE15YDE+sKeLpumrVN02Zszj8hf+2hidvCtln3R
 NdN1VfoKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNh/8PwP01aL0p9oaiew62s
 h+v6Re6yLopRuVVf/3mZSOaFsBRbEYb/IT4PNcPjrG10XSW263//1dqyYmURe9LlhmksT4q2XeV hBAA=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127142346.788995-4-ardb+git@google.com>
Subject: [PATCH 0/2] x86: replace stack cookie hack with named address space
From: Ard Biesheuvel <ardb+git@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Currently, on x86, the C name of the stack check cookie per-CPU variable
is deliberately different from the one passed to the compiler command
line option -mstack-check-guard-symbol=

This was done to work around a Clang issue, where a non-TLS C
declaration of the variable results in Clang dropping the segment
prefixes.

As it turns out, all Clang versions that Linux supports today have some
support for address space annotations, and annotating the C declaration
with the correct address space is sufficient to coerce Clang into
generating the appropriate prefixes for the memory operands. This means
the linker and asm hacks can be dropped.

Patch #1 makes EXPORT_SYMBOL() work as expected for symbols with an
address space annotation, so that patch #2 can export __stack_chk_guard
normally, rather than from an unrelated .S file.

Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev

Ard Biesheuvel (2):
  compiler.h: Use the symbol's own pointer type in __ADDRESSABLE()
  x86/stackprotector: Use a named address space for the Clang stack
    guard

 arch/x86/Makefile                     |  2 +-
 arch/x86/entry/entry.S                | 14 ----------
 arch/x86/include/asm/asm-prototypes.h |  4 ---
 arch/x86/include/asm/percpu.h         | 10 +++----
 arch/x86/include/asm/stackprotector.h | 29 ++++++++++++++++++--
 arch/x86/kernel/cpu/common.c          |  4 +--
 arch/x86/kernel/vmlinux.lds.S         |  3 --
 include/linux/compiler.h              |  4 +--
 8 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

