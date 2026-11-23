Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475056;
	b=Q86blDTSEN14WUddGI8vVrqnM1fsKe6A8zwMk9gkyiqOjgcsfiF8TXkGiQPFLf7JCJTg
	 mr2nx91wLyAIcAzv3biDU1DnCPSoRThNnr3kBjEyNB4Z1ZUfgj6m2KeSoxBIyyN8auMIt
	 WOZVDhJgwJ0CnRFOUor7azqGdP+gWpKcJyT2Ej0seyx7RrJ+ZxRHTCsYMdwe8L/N8Xj+n
	 /PVjK6itwLCAUa7VRV4JQULPlWfxmy9NnrG7LeTUVs6vTeQEnJaqu+W++GNHhH4zFiAtx
	 WySJUqbxLVCO/X+vDgUCWojffOmym8Cnf0EaB91MP1EOVuuLQS1Qp0v5XsW3HgA2Q1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Yj2xF4o4PUTSiM+FTkNnN1xMYf/ZEDA5Uxdvg8HZkxQ=;
	b=Q6MCKHd5lgPQpBq3ZKKeSniBNJp+9iuWl3385Ib+AzSm8xEl/fAdgRmfUKBjbSql/Uhh
	 TuLbyxihE2+roaxFLQ1AJLr4aGr2U6F7++tobGG+XAGcTubWjT1YTxNej2nr+gc1wAA5r
	 Aih7wu7ZbTtjBcYT4xPiJQAe7UaxFpjX2qAOb4ruH/XbWoy+v1Gg5f3smrRgYfjy82GKv
	 YvY1wPLbUJt4+OYW7wdXZHE2wTi0cEhu+4AgBoG7rfhPUdGLaoceKSg+oXc3fNR2HxK2g
	 ZbtvhNBospjfBYLV+0WirzQFeNYn+PHtDwPaswE876HJt+eLSIrM3dbAfnRNKlr0JXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A9MexrRa;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B26606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B26606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A9MexrRa
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5384e381fbbso3516607b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795475055; x=1796079855; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yj2xF4o4PUTSiM+FTkNnN1xMYf/ZEDA5Uxdvg8HZkxQ=;
        b=A9MexrRaEfcWUl6dMLWjvNT87mpo2E/wfahrmCUgkEUpi/lxq66BZnr2k7tx3iRRr0
         /HS3zryelnqdwF72Eh+/3W7GvTrjh2H4QFfsTnotDheymkNm2yz0Zx/UH99CpaHoQzE7
         vB4VKvoU08fa/H9yCUTMgIconkgDsDnuIeGfiAgyds/QiyywbBc7U46X8vY1z4kqGiyM
         1VYUD1AzNdDeeI2mUhi5FrTaHjbpWvf7bhAFJ0yv5hhv96BxMtgPxlkHPbHbXho5TgaI
         RLxiNvYQbf3yylBCNYCrcO2xWN9p1Muj1CxxVz32FG4prrWS3isLiodUsYq3S4KKkGzz
         NegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475055; x=1796079855;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj2xF4o4PUTSiM+FTkNnN1xMYf/ZEDA5Uxdvg8HZkxQ=;
        b=Jjt/leTryG3zvBXiC8991+5xMNLuuTnbMOtY18ELJWGaKmLzJGaMnoqDdMqz1hIlXv
         cN4EMuKTsrZ2XrTChqFfOnT5pxjI4AyNpXKlB2s57EOmC+ds1bZOmUNSo4QKSKiepV3V
         PFnMhMzD9Vqnny+7r2QSPGb/cKx/jG0U6iAzIJL15NvxKpweFS2qdTSWtMky9vEQYozd
         I5W2+T9ggMONHKK5CovUnPyaRxqgwJfOj6jSo4RRe7EDoWHo+NGdkU20srYoIfTTlNqf
         R2JnFu7Vs4vO5mlsrWb0SgbvlYS7zYHSeIfaizJoMBBD7i28KTk/8o6tdB6rz1YBm2Gl
         bmxA==
X-Forwarded-Encrypted: i=1; AL+hErF+pX2zN2LZQkKQzpWZUI5GbicEVC/sySEmD5ic3aYhm26ZqshF3IDBoSHPYEi/96P2+AOlA+r1gV4ad/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fshPNPXz/a6ijxKdVhhILFmA0O+iSo9iDimTs5jlyc6cWXa1V
	UxThm0jpfzTNYnYaQTMjV2WF6GEjmkTFMj3OH15ShA6X1HWIRCq7g2qNL5yaM4cRAJS3TwoGTyk
	iV3hMALpcMA==
X-Received: from ilbeb19.prod.google.com ([2002:a05:6e02:4613:b0:54f:d1e:e6f6])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:6d92:b0:574:93c0:5aea
 with SMTP id 5614622812f47-57a0c6c050dmr12342269b6e.63.1795475054837; Mon, 23
 Nov 2026 15:04:14 -0800 (PST)
Date: Mon, 23 Nov 2026 23:04:06 +0000
In-Reply-To: <20261123230410.3206378-1-wfelipe@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123230410.3206378-1-wfelipe@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261123230410.3206378-2-wfelipe@google.com>
Subject: [PATCH v2 1/2] objtool/klp: Disambiguate global symbols colliding
 with local symbols
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Yi Zhu <chuyee@google.com>, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

klp_find_sympos() returns 0 for any non-STB_LOCAL symbol, symid_needed()
skips non-local symbols when emitting .klp.symid entries for vmlinux.o,
and clone_reloc_klp() hardcodes sympos = 0 when a relocation targets a
restricted or module export.

However, a global symbol in one translation unit can share its name with a
static (STB_LOCAL) symbol in another translation unit (for example,
cgroup_storage_lookup in kernel/bpf/local_storage.c vs
kernel/bpf/bpf_cgrp_storage.c). At runtime, both
kallsyms_on_each_match_symbol() and module_kallsyms_on_each_symbol() count
local and global symbols together, so emitting sympos 0 for the global
symbol fails module load in klp_find_object_symbol() with 'unresolvable
ambiguity for symbol'.

Allow defined non-local symbols to receive .klp.symid entries when
duplicate names exist in vmlinux.o, compute sympos for defined non-local
symbols in klp_find_sympos() (returning 0 when unique and skipping
undefined and non-alloc symbols), and resolve sympos via klp_find_sympos()
in clone_reloc_klp() whenever patched_sym->twin exists.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
v1 -> v2:
- Simplify clone_reloc_klp() by unifying klp_find_sympos() below the
  export/non-export branch (Josh Poimboeuf).
- Rebase onto v7.4-rc4 (b6a9fa34ce41).

v1: https://lore.kernel.org/all/20261117000835.1992893-2-wfelipe@google.com/

 tools/objtool/klp-diff.c   | 5 ++++-
 tools/objtool/klp-symid.c  | 2 +-
 tools/objtool/klp-sympos.c | 9 ++++++---
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 34da55e45609..fad4cfea9c9b 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -1406,13 +1406,16 @@ static int clone_reloc_klp(struct elfs *e, struct reloc *patched_reloc,
 	if (export) {
 		sym_modname = export->mod;
 		sym_orig_name = export->sym;
-		sympos = 0;
 	} else {
 		sym_modname = find_modname(e);
 		if (!sym_modname)
 			return -1;
 
 		sym_orig_name = patched_sym->twin->name;
+	}
+
+	sympos = 0;
+	if (patched_sym->twin) {
 		sympos = klp_find_sympos(e->orig, patched_sym->twin);
 		if (sympos == ULONG_MAX)
 			return -1;
diff --git a/tools/objtool/klp-symid.c b/tools/objtool/klp-symid.c
index b19f76dff13e..d01c13b8ffa8 100644
--- a/tools/objtool/klp-symid.c
+++ b/tools/objtool/klp-symid.c
@@ -52,7 +52,7 @@ static bool symid_needed(struct elf *elf, struct symbol *sym)
 {
 	struct symbol *s;
 
-	if (!is_local_sym(sym) || is_undef_sym(sym))
+	if (is_undef_sym(sym))
 		return false;
 
 	if (!is_func_sym(sym) && !is_object_sym(sym))
diff --git a/tools/objtool/klp-sympos.c b/tools/objtool/klp-sympos.c
index dfca9dd74681..087892ef3593 100644
--- a/tools/objtool/klp-sympos.c
+++ b/tools/objtool/klp-sympos.c
@@ -381,14 +381,14 @@ unsigned long klp_find_sympos(struct elf *elf, struct symbol *sym)
 	bool has_dup = false;
 	struct symbol *s;
 
+	if (is_undef_sym(sym))
+		return 0;
+
 	if (is_init_sym(sym)) {
 		ERROR("%s: can't patch or reference init code/data", sym->name);
 		return ULONG_MAX;
 	}
 
-	if (sym->bind != STB_LOCAL)
-		return 0;
-
 	/*
 	 * vmlinux: the final link reorders symbols relative to vmlinux.o,
 	 * so the position needs to be derived from the linked orig vmlinux via
@@ -403,6 +403,9 @@ unsigned long klp_find_sympos(struct elf *elf, struct symbol *sym)
 	 * module_kallsyms_on_each_symbol().
 	 */
 	for_each_sym(elf, s) {
+		if (is_sec_sym(s) || is_file_sym(s) || is_undef_sym(s) ||
+		    !(s->sec->sh.sh_flags & SHF_ALLOC))
+			continue;
 		if (!strcmp(s->name, sym->name)) {
 			nr_matches++;
 			if (s == sym)
-- 
2.56.1.750.gf70dc682cf-goog

