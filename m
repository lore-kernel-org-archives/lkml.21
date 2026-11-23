Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475056;
	b=G3x44A5Xco3KXIFmmgexwdwhoFzoS+QPD14gHL0oK76EGPO5uqAQjNFiPtqndgaFrawh
	 hyo3Cb7I7hspe86dNKwC/LjZOrE8KuDnYnfchUBXFso5VaZfTSapKxIURI1BAAE4jdmfu
	 AWHZTYNtgHUyJtiIk0MEJ1ndoA8scQEevD50u2n24uRXXba0f4rNUf729hT7Ah0G0M5qK
	 fPvoldYflYu9wlrcONLIZsjOEBQp8h8UNz0c0fPVx72CsDiIZ9lNO6e1ywiF2g1BeZyyg
	 Oi7T+4WZGcGD+ZQS1hghMJ8Ysbh6Kb6b7QaG55CRJQ1wzTaxjdQbiKcFOgBuR1arWFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=WE1sJAh68uC49K7CZmY8kXCNTGpiMALaZqurYl9Jgro=;
	b=oyDAE0EarP2RPTHdeQzUFeFMvk6L94hDFnq7Yk3Qlu4GHHRIqp9YzxRg+ZlXfLSxeLKI
	 etJ1kWAaVfvpn0lL1QIgFMjExMdyzy+OlpKcj4kCWZuVkJ0gI0cZQgB8QJ87eGkGT0FGT
	 1Dy4Fr2XQunCPPbbRy2nRnY/r7d1leeKYCWquAAoVlYqtqhVwfFdLf/6LA0IuFdZYBPBU
	 cKlM354o/mOCSmevioVbAq6xhgOWAoRGNIhffheWb7SSolrRjV516o3F9U+1b8jVqr+Me
	 pqF9JqyyGn+qzRqVTRE0JSWszph4OvTi9tDgXobHa7eCrOcrF/REd9zh7q3MCW/AaRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="PsX/vNR5";
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011DE606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PsX/vNR5
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a41f46d629so5712915b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795475054; x=1796079854; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WE1sJAh68uC49K7CZmY8kXCNTGpiMALaZqurYl9Jgro=;
        b=PsX/vNR52o18mYaElV2oHksSAO+vlPbFWSJXqY85DN8ZdBmQ9ZPUuGZ1YNonsH3pha
         I+WlZ8o0IMZzPdHIKbS0VLwbkqHrNglWFqI3VEGgWA2XzrWWzdGcROX4+g5ohxdqBJsT
         oYuguEve0catJ1FKDItSIFFh3rfXmdF+scVbYeTyOYklxNZXWyu5pXpKa66suyyKWGi0
         UpLt6zPQuvHlxI+Rvm5yNqzPeyeX7K1P+ReBfOeYvaG0Y3SK9BnifWkNMeFPyWOzjy/x
         VYLQcU9UogwS1spqRuOdPhGDyWoG09+SnguSLKGmsWiuQT+H/6N4udO6/lzrPTAjAQHc
         TYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475054; x=1796079854;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WE1sJAh68uC49K7CZmY8kXCNTGpiMALaZqurYl9Jgro=;
        b=LxxPKnRfx4p1swbaPtVJFSLq5M64HBeBhjX1lxBufJvPvBN4+tVNYJamtHkNBlAG8x
         tb9h4wZF40hFsgyMKfWL4lRq6x+Czk8b0wXBDV2+xxQDUJGy+vemLdjPT/BJi4nW2dW2
         kjc6DFKe8q8gSngaBQI2v39HyGL04EuVVPrbl1PXJ0EbWEiHgVd5ExMAHnicvAr/Xp7V
         XGzTaELGVLfbrMwvdiI4S1bXmhFfWjgXcZtiUcYx6BLO07QC8fuHD6IHWkMenubHte1C
         uhw2E9IaEiJuzYbjYI/wJ/VQ9lyQ90eqRlCPLI7CXrhJgMEtGGVLrEUplvtD5ResEEQ8
         20ew==
X-Forwarded-Encrypted: i=1; AL+hErE+IAKSbIjgss34Tyq1AJEAgV/1VSkedNXJsYWcU1Ucz9xkMA83bFo2OKcwiPwIPhXuDW/cv1pDsLhdTXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/orUZEXtO1MGh6T03vehLiT45vyCy6bQkoIdk8h0++nFJ1aasw
	iYFCd6b/gITecnbOEIO5pHSrzdf4h06slTcsFFerdCQ5iJl9HT0/V4HD+oAjg62NXx5ZkGBkvOu
	1Fvu2HTPKDQ==
X-Received: from ilej19-n2.prod.google.com ([2002:a05:6e02:6213:20b0:54e:ab26:add9])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1488:b0:578:f283:2471
 with SMTP id 5614622812f47-57a09e0ab1bmr14220527b6e.46.1795475053524; Mon, 23
 Nov 2026 15:04:13 -0800 (PST)
Date: Mon, 23 Nov 2026 23:04:05 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261123230410.3206378-1-wfelipe@google.com>
Subject: [PATCH v2 0/2] objtool/klp: Fix sympos for global/local symbol collisions
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Yi Zhu <chuyee@google.com>, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

When a defined STB_GLOBAL symbol in one translation unit shares its name
with a static (STB_LOCAL) symbol in another translation unit (for
example, cgroup_storage_lookup in kernel/bpf/local_storage.c vs
kernel/bpf/bpf_cgrp_storage.c), runtime kallsyms lookup counts both
symbols together. Emitting sympos 0 for the global symbol causes module
load to fail in klp_find_object_symbol() with "unresolvable ambiguity
for symbol".

Patch 1 disambiguates defined non-local symbols across .klp.symid
generation, klp_find_sympos(), and clone_reloc_klp() (while preserving
sympos 0 when unique). Patch 2 adds tests covering both module (.symtab
order) and vmlinux (.klp.symid address order) paths, including
EXPORT_SYMBOL_FOR_MODULES() exports.

v1 -> v2:
- Simplify clone_reloc_klp() by unifying klp_find_sympos() below the
  export/non-export branch (Josh Poimboeuf).
- Rebase onto v7.4-rc4 (b6a9fa34ce41).

v1: https://lore.kernel.org/all/20261117000835.1992893-1-wfelipe@google.com/

Wilson Felipe Pereira (2):
  objtool/klp: Disambiguate global symbols colliding with local symbols
  objtool/klp: Add test for global/local symbol name collisions

 tools/objtool/klp-diff.c                      |  5 +-
 tools/objtool/klp-symid.c                     |  2 +-
 tools/objtool/klp-sympos.c                    |  9 +-
 .../tests/generic/fixtures/sympos_vmlinux.c   |  6 ++
 .../tests/generic/test-sympos-global-dup.sh   | 99 +++++++++++++++++++
 5 files changed, 116 insertions(+), 5 deletions(-)
 create mode 100755 tools/objtool/tests/generic/test-sympos-global-dup.sh


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.750.gf70dc682cf-goog

