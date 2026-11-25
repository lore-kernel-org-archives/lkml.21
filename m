Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630824;
	b=DJqgxnHnAwqQgIF9EP8quDDgug2PiJ271e/zedR2o1Q2hdAH1VJF6/NL4Fmc3Jr63Vuw
	 iDbSNAYOcI3Q91br4QqGXx+PKe7+ZMOTU6t+v5AisAsxNxf9EDfzHj09Vg4Wf76sx8bf5
	 +pjU/IeANfTHuMUFOKbmLthCzRT7xCTtyxeEwLjeRS6LhussgNRq3k4vD32dU+NyBbRd/
	 0a6z1sguizD7ar5yzZxiYl2yW6br+3s41nLjhTa5h6cXvlGyoJI7vAz+O5pF+9y243sWA
	 7bfpPt7wUzof90bQ4clGge3MmeVYxqIwmsJ2dZsZBGj28RuIjIiv86wXoWBaoBby9+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630824;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=6IavvCWhp/sP63qexeKNugV90Dqi9JXzPnPpR0U5dFg=;
	b=F1xdouYndNuO2txF4Z2AS/NM7ObEgmYX/0wCvz3TUAy4zKghxpfRmLtlTMe8D5kfHu2z
	 NQAkaIhsqDGWzWAKNk7SLvpfstKjcOvu+NyMbEzDF33NOlMwvtOgB/NuTLTGWAP4KFMQl
	 fM38WWKiTeW1lz+tdHe3TwYfbEcSc11kgygb4oXPj4gFlDGuFoqB0llVj2IiwE6dw0s/5
	 E/3LKJ9JXs0k8o8wvYMN/9zMRTms11R3c4+pCFYI1FSALpWBE1Yfjk1HeUr0lFhMNw0Vm
	 eU9bHhWqflKSRSAbNSNZG7QDM/CI2tiXNp+KvhM0OKAUivmjwLvcb+M7QzIClm7w87g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBwqEIDd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D26606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBwqEIDd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098C81F000CF;
	Wed, 25 Nov 2026 18:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630824;
	bh=6IavvCWhp/sP63qexeKNugV90Dqi9JXzPnPpR0U5dFg=;
	h=Date:From:To:Cc:Subject:References;
	b=MBwqEIDd9y2i+Ng3BXDJ2oEQOHcSj4EgmrGy+GeNZerYEdvEfR1ue00jojdVSw6RF
	 WE9TcUNmhLJcEnpCh+GOwSb6KS85DFnRbCQ6LY0AAW0+SODD/GzBiFWT7tegEWkrPd
	 sDf80L7jNV99gI5e6h7UZGfMXoZ2BVpjcllFIifHpX2zYz4Ow0kkGDY62mpHe8xHh6
	 C/nVu5s/eauwsmMg2fSb0K8TLsAAd2ju6vWXYzFge5VyDMJ5jtZpEW5dr+14yzIubM
	 15UVSpYYS8rSCI6wB2jxeb+7VB5ifuAICD0GNn4frFnUhe54hVbWZQaS/LX43ogR9k
	 5GoE+MzILaLhw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWHbT-00000007E7E-1UtE;
	Wed, 25 Nov 2026 13:20:23 -0500
Message-ID: <20261125182023.163324368@kernel.org>
User-Agent: quilt/0.69
Date: Wed, 25 Nov 2026 13:19:54 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: [for-next][PATCH 2/2] ftrace: Speed up module enable by binary searching module symbols
References: <20261125181952.861853319@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

Loading a module with many functions takes seconds, almost all of it in
ftrace_module_enable().  amdgpu modules stall for about ten seconds, and
disabling CONFIG_DYNAMIC_FTRACE makes the stall disappear.

Every record is validated by test_for_valid_rec(), which resolves its ip
through kallsyms_lookup(); for a module address that ends up in
find_kallsyms_symbol(), which walks the whole module symbol table from
index 1.  The core kernel instead binary searches its sorted kallsyms
table in get_symbol_pos().  So only modules pay, and the cost is
quadratic: both the record count and the symbol count grow with the
module.  An amdgpu.ko from this tree has 17282 records and 55332 symbol
table entries.

Fix this by collecting the addresses of a module's symbols once, sorting
them, and binary searching that array instead of walking the table once
per record; a loaded module's symbol table cannot change, so the array
stays valid for the whole pass.  What comes back is what the linear scan
returned: the same entries are skipped - SHN_UNDEF, unnamed and mapping
symbols - and the closest address not below the base of the record's
memory region is taken.  Whenever the array cannot answer, because it
could not be built or because no such symbol exists, the record is handed
to test_for_valid_rec(), so the rest of kallsyms_lookup() still has its
say and no verdict can change.

On the machine that reported the stall, modprobe of that amdgpu.ko takes
12.242 s before and 2.870 s after, and the time spent inside ftrace_lock
drops from 9.368 s to 1.585 ms - 15.195 ms if the price of building the
array is included, that build being 13.6 ms, 0.15% of the 9.37 s saved.
The array costs O(symbols * log symbols), it does not grow with the
record count.  Across the 74 modules loaded at boot, total lock time
drops from 491 ms to 2.33 ms.

Link: https://patch.msgid.link/20261105031530.280442-1-tianyaxiong@kylinos.cn
Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 124 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 6654da9d1bbf..958dd7c9bc8c 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -26,6 +26,7 @@
 #include <linux/uaccess.h>
 #include <linux/bsearch.h>
 #include <linux/module.h>
+#include <linux/module_symbol.h>
 #include <linux/ftrace.h>
 #include <linux/sysctl.h>
 #include <linux/slab.h>
@@ -8035,8 +8036,129 @@ void ftrace_release_mod(struct module *mod)
 	}
 }
 
+#ifdef FTRACE_MCOUNT_MAX_OFFSET
+/*
+ * ftrace_module_enable() validates every record with test_for_valid_rec(),
+ * which walks the whole symbol table of a module for each address in it, so a
+ * large module loads in quadratic time.  Search a sorted copy of the symbol
+ * addresses instead, the way get_symbol_pos() searches the kallsyms table.
+ * The array is an accelerator only; records it cannot resolve are tested the
+ * old way, so the verdict does not change.
+ */
+struct ftrace_mod_syms {
+	unsigned int	nr;
+	unsigned long	addr[];	/* sorted, @nr entries */
+};
+
+static int ftrace_mod_syms_cmp(const void *a, const void *b)
+{
+	unsigned long va = *(const unsigned long *)a;
+	unsigned long vb = *(const unsigned long *)b;
+
+	return (va > vb) - (va < vb);
+}
+
+static struct ftrace_mod_syms *ftrace_mod_syms_alloc(struct module *mod)
+{
+	struct mod_kallsyms *kallsyms;
+	struct ftrace_mod_syms *syms;
+	unsigned int i, nr = 0;
+
+	/*
+	 * mod->kallsyms stays valid until do_init_module() replaces it later
+	 * in this thread, so no RCU read-side section is needed.
+	 */
+	kallsyms = rcu_dereference_raw(mod->kallsyms);
+
+	if (!kallsyms || kallsyms->num_symtab < 2)
+		return NULL;
+
+	syms = kvmalloc(struct_size(syms, addr, kallsyms->num_symtab),
+			GFP_KERNEL);
+	if (!syms)
+		return NULL;
+
+	/* The symbols find_kallsyms_symbol() would consider. */
+	for (i = 1; i < kallsyms->num_symtab; i++) {
+		const Elf_Sym *sym = &kallsyms->symtab[i];
+		const char *name = kallsyms->strtab + sym->st_name;
+
+		if (sym->st_shndx == SHN_UNDEF || !*name ||
+		    is_ignored_kernel_symbol(name))
+			continue;
+
+		syms->addr[nr++] = kallsyms_symbol_value(sym);
+	}
+	syms->nr = nr;
+
+	if (nr > 1)
+		sort(syms->addr, nr, sizeof(syms->addr[0]), ftrace_mod_syms_cmp,
+		     NULL);
+
+	return syms;
+}
+
+/* The verdict test_for_valid_rec() would give, without walking the table. */
+static bool ftrace_mod_rec_is_valid(struct module *mod,
+				    const struct ftrace_mod_syms *syms,
+				    struct dyn_ftrace *rec)
+{
+	unsigned long base, best;
+	unsigned int lo, hi;
+
+	if (!syms)
+		return test_for_valid_rec(rec) != 0;
+
+	/* A record is in executable memory; anything else kallsyms answers. */
+	if (within_module_mem_type(rec->ip, mod, MOD_TEXT))
+		base = (unsigned long)mod->mem[MOD_TEXT].base;
+	else if (within_module_mem_type(rec->ip, mod, MOD_INIT_TEXT))
+		base = (unsigned long)mod->mem[MOD_INIT_TEXT].base;
+	else
+		return test_for_valid_rec(rec) != 0;
+
+	/* The closest address at or below @rec->ip, if there is one. */
+	best = 0;
+	for (lo = 0, hi = syms->nr; lo < hi; ) {
+		unsigned int mid = lo + (hi - lo) / 2;
+
+		if (syms->addr[mid] <= rec->ip)
+			lo = mid + 1;
+		else
+			hi = mid;
+	}
+	if (lo)
+		best = syms->addr[lo - 1];
+
+	/*
+	 * No symbol, or only ones below @base: let kallsyms_lookup() answer,
+	 * as it also looks in the BPF and ftrace trampoline tables.
+	 */
+	if (best < base)
+		return test_for_valid_rec(rec) != 0;
+
+	return rec->ip - best <= FTRACE_MCOUNT_MAX_OFFSET;
+}
+#else
+struct ftrace_mod_syms;
+
+static inline struct ftrace_mod_syms *ftrace_mod_syms_alloc(struct module *mod)
+{
+	return NULL;
+}
+
+static inline bool ftrace_mod_rec_is_valid(struct module *mod,
+					   const struct ftrace_mod_syms *syms,
+					   struct dyn_ftrace *rec)
+{
+	return test_for_valid_rec(rec) != 0;
+}
+#endif /* FTRACE_MCOUNT_MAX_OFFSET */
+
 void ftrace_module_enable(struct module *mod)
 {
+	struct ftrace_mod_syms *syms __free(kvfree) =
+		ftrace_disabled ? NULL : ftrace_mod_syms_alloc(mod);
 	struct dyn_ftrace *rec;
 	struct ftrace_page *pg;
 
@@ -8075,7 +8197,7 @@ void ftrace_module_enable(struct module *mod)
 		cond_resched();
 
 		/* Weak functions should still be ignored */
-		if (!test_for_valid_rec(rec)) {
+		if (!ftrace_mod_rec_is_valid(mod, syms, rec)) {
 			/* Clear all other flags. Should not be enabled anyway */
 			rec->flags = FTRACE_FL_DISABLED;
 			continue;
-- 
2.53.0
