Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651920;
	b=jXkxpUwEAB3gUGcRaSYTXdRXyEAibWDzFjoBaaqDS7vSYWE+FgpM1lUWVkg7Fj2mN91L
	 PzKya0p/UBa2xkXT2nup4T5w6IAm843dJ/QayKl9sgbbBUrCk+p1z8Fec4cOTDrta6NOx
	 qvxgfeyL7M1i/bj9uC5pY5VC2t1pIlgqm0URI/xLYdeOV8JhFZ1+F42bHwzYb+pi2f3ss
	 BJZ6rivxoeB2DgxApeDQHAKEuIfHALFZHXC8baWLkh/bm2ZYhxLVQQFxcAA+ManEzzXBo
	 k8qFZAq7YbMMmgc6h7O7iigMJclksOXBFEWp5BhbbHRz0dygxyHSaV83jbofJ/RaFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651920;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ua3WKlRyHV7JAactrQt58qL/hkd/P41+zGc/HtLyhFQ=;
	b=WbUw1zvjRUkAQdJz1EFXsvT38Wo8xjiwAfOivUqsruqNuVj7c3aOHWZhyjB6c22pypoL
	 wixCxiID+gYk/j53Oh5DJwY3ZuAHA3i/Ufg8gV6sphP2/2aER5AgwW3HcMbkjLkTLiFGi
	 PBdITP5VAz4o2ULTvQrqJ88pvy8W6tIeJGy+wsJ92H1Ko+IGsWAnG5NYHXgrjIEmDekZZ
	 klFkzkcGXXIeE8zzUcPeNWc+gSxJqOizYKZaG7hLUzV/npGJ79bMb/cOws3aIn8yXHxIW
	 sXKKmW+BE/Xu/Whj/QG6hYFTI+27vdXwhk8V95YbLNr43lqc/6+GAi2XC/zwfYyt5BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BzpW+sU9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F7606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BzpW+sU9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337521F000C4;
	Thu, 26 Nov 2026 00:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651920;
	bh=Ua3WKlRyHV7JAactrQt58qL/hkd/P41+zGc/HtLyhFQ=;
	h=From:To:Cc:Subject:Date;
	b=BzpW+sU9xBr4PcBaB3Sjjbvqu5WT4SEHu3LxTn7rSdZO3zep/4VNvbhp6L3R+R2Fy
	 SMSTd5twMC3QjgrLW2Hnk1y7YO1vpxK5//df9R/Oh5MX1+05quemXJjarhs6QJlbpR
	 g0GhxabkNZ9d+/fsuYkPhjjOMIx52mNJxMH7qWrTSiUAsqttmwhcbQCZD0KNhVNuHa
	 mYnXjSr/ku2Skt5zQpKyfZVQ5+b7MmHmEsDk1zpTF9+7N/H+XHyuYs5gfj58XYOSBT
	 fWYMCOiWoj0sDvigf3WtEEqRJdrwcnSaXGTqhh8b8PyhXuEESgbxJ3y1ooA5AKLDy3
	 hY+L7LK9ewFkw==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Yifan Feng <evanfengff@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v7.4-rc5
Date: Thu, 26 Nov 2026 09:11:57 +0900
Message-ID: <undine-1795651917544796669-555e1f2d7f002f30@undined.local>
X-Mailer: UndineD 0.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Probes fixes for v7.4-rc5:

- tracing/fprobe: Do not let KASAN check the $stackN read
  Use READ_ONCE_NOCHECK() in ftrace_regs_get_kernel_stack_nth() so reading
  $stackN entries that fall in another frame's redzone does not trigger
  KASAN stack-out-of-bounds splats under CONFIG_KASAN_STACK.

- tracing/probes: Zero out faulted dereferenced fields
  Zero the destination in probe_mem_read() and probe_mem_read_user() on
  read failure and continue storing zero in process_fetch_insn_bottom()
  instead of leaving stale ring-buffer contents when a dereference faults.

Please pull the latest probes-fixes-v7.4-rc5 tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v7.4-rc5

Tag SHA1: 0d0b4cfecfbe702cc3edc9fcc994240222763779
Head SHA1: 23c8af89aac3feb3867c5eb47aca5b3a2dccb70e


Steven Rostedt (1):
      tracing/probes: Zero out faulted dereferenced fields

Yifan Feng (1):
      tracing/fprobe: Do not let KASAN check the $stackN read

----
 include/linux/ftrace.h          |   2 +-
 kernel/trace/trace_probe_tmpl.h | 103 ++++++++++++++++++++++++++++++++--------
 2 files changed, 84 insertions(+), 21 deletions(-)
---------------------------
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 1c2056a1a68b..bdb6ee6bc3b9 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -270,7 +270,7 @@ ftrace_regs_get_kernel_stack_nth(struct ftrace_regs *fregs, unsigned int nth)
 	stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
 	if (((unsigned long)(stackp + nth) & ~(THREAD_SIZE - 1)) ==
 	    ((unsigned long)stackp & ~(THREAD_SIZE - 1)))
-		return *(stackp + nth);
+		return READ_ONCE_NOCHECK(*(stackp + nth));
 
 	return 0;
 }
diff --git a/kernel/trace/trace_probe_tmpl.h b/kernel/trace/trace_probe_tmpl.h
index 8acc0f0ebd7a..b9fd2f61a0ca 100644
--- a/kernel/trace/trace_probe_tmpl.h
+++ b/kernel/trace/trace_probe_tmpl.h
@@ -96,7 +96,8 @@ fetch_store_symstring(unsigned long addr, void *dest, void *base)
 		return -ENOMEM;
 
 	__dest = get_loc_data(dest, base);
-	len = sprint_symbol(namebuf, addr);
+	/* Do not dereference NULL pointers */
+	len = addr ? sprint_symbol(namebuf, addr) : -1;
 	if (len < 0) {
 		*(u32 *)dest = make_data_loc(0, __dest - base);
 		return 0;
@@ -133,13 +134,65 @@ process_common_fetch_insn(struct fetch_insn *code, unsigned long *val)
 	return 0;
 }
 
+/* On failure, zero out the destination */
+static nokprobe_inline int
+do_probe_mem_read_user(void *dest, void *src, size_t size)
+{
+	int ret;
+
+	/* Do not dereference NULL pointers */
+	ret = src ? probe_mem_read_user(dest, src, size) : -1;
+	if (ret < 0)
+		memset(dest, 0, size);
+	return ret;
+}
+
+/* On failure, zero out the destination */
+static nokprobe_inline int
+do_probe_mem_read(void *dest, void *src, size_t size)
+{
+	int ret;
+
+	/* Do not dereference NULL pointers */
+	ret = src ? probe_mem_read(dest, src, size) : -1;
+	if (ret < 0)
+		memset(dest, 0, size);
+	return ret;
+}
+
+static nokprobe_inline int
+do_fetch_store_string(unsigned long addr, void *dest, void *base)
+{
+	/* NULL addr gets zero size string */
+	if (!addr) {
+		void *__dest = get_loc_data(dest, base);
+
+		*(u32 *)dest = make_data_loc(0, __dest - base);
+		return 0;
+	}
+	return fetch_store_string(addr, dest, base);
+}
+
+static nokprobe_inline int
+do_fetch_store_string_user(unsigned long addr, void *dest, void *base)
+{
+	/* NULL addr gets zero size string */
+	if (!addr) {
+		void *__dest = get_loc_data(dest, base);
+
+		*(u32 *)dest = make_data_loc(0, __dest - base);
+		return 0;
+	}
+	return fetch_store_string_user(addr, dest, base);
+}
+
 /* From the 2nd stage, routine is same */
 static nokprobe_inline int
 process_fetch_insn_bottom(struct fetch_insn *code, unsigned long val,
 			   void *dest, void *base)
 {
 	struct fetch_insn *s3 = NULL;
-	int total = 0, ret = 0, i = 0;
+	int total = 0, ret = 0, i = 0, offset;
 	u32 loc = 0;
 	unsigned long lval, llval = val;
 
@@ -147,25 +200,26 @@ process_fetch_insn_bottom(struct fetch_insn *code, unsigned long val,
 	/* 2nd stage: dereference memory if needed */
 	do {
 		lval = val;
+		/* Prevent dereferencing NULL val pointer */
+		offset = val ? code->offset : 0;
 		switch (code->op) {
 		case FETCH_OP_DEREF:
-			ret = probe_mem_read(&val, (void *)val + code->offset,
-					     sizeof(val));
+			do_probe_mem_read(&val, (void *)val + offset,
+					  sizeof(val));
 			break;
 		case FETCH_OP_UDEREF:
-			ret = probe_mem_read_user(&val,
-				 (void *)val + code->offset, sizeof(val));
+			do_probe_mem_read_user(&val, (void *)val + offset,
+					       sizeof(val));
 			break;
 		case FETCH_OP_CPU_PTR:
-			val = (unsigned long)this_cpu_ptr((void __percpu *)val);
-			ret = 0;
+			/* Do not dereference NULL pointers */
+			if (val)
+				val = (unsigned long)this_cpu_ptr((void __percpu *)val);
 			break;
 		default:
 			lval = llval;
 			goto out;
 		}
-		if (ret)
-			return ret;
 		llval = lval;
 		code++;
 	} while (1);
@@ -175,17 +229,18 @@ process_fetch_insn_bottom(struct fetch_insn *code, unsigned long val,
 stage3:
 	/* 3rd stage: store value to buffer */
 	if (unlikely(!dest)) {
+		offset = code->offset;
 		switch (code->op) {
 		case FETCH_OP_ST_STRING:
-			ret = fetch_store_strlen(val + code->offset);
+			ret = val ? fetch_store_strlen(val + offset) : 0;
 			code++;
 			goto array;
 		case FETCH_OP_ST_USTRING:
-			ret = fetch_store_strlen_user(val + code->offset);
+			ret = val ? fetch_store_strlen_user(val + offset) : 0;
 			code++;
 			goto array;
 		case FETCH_OP_ST_SYMSTR:
-			ret = fetch_store_symstrlen(val + code->offset);
+			ret = val ? fetch_store_symstrlen(val + offset) : 0;
 			code++;
 			goto array;
 		default:
@@ -193,27 +248,33 @@ process_fetch_insn_bottom(struct fetch_insn *code, unsigned long val,
 		}
 	}
 
+	/*
+	 * Once val is zero, it is pointing to NULL. Any new dereference is
+	 * also treated as a NULL pointer.
+	 */
+	offset = val ? code->offset : 0;
+
 	switch (code->op) {
 	case FETCH_OP_ST_RAW:
 		fetch_store_raw(val, code, dest);
 		break;
 	case FETCH_OP_ST_MEM:
-		probe_mem_read(dest, (void *)val + code->offset, code->size);
+		do_probe_mem_read(dest, (void *)val + offset, code->size);
 		break;
 	case FETCH_OP_ST_UMEM:
-		probe_mem_read_user(dest, (void *)val + code->offset, code->size);
+		do_probe_mem_read_user(dest, (void *)val + offset, code->size);
 		break;
 	case FETCH_OP_ST_STRING:
 		loc = *(u32 *)dest;
-		ret = fetch_store_string(val + code->offset, dest, base);
+		ret = do_fetch_store_string(val + offset, dest, base);
 		break;
 	case FETCH_OP_ST_USTRING:
 		loc = *(u32 *)dest;
-		ret = fetch_store_string_user(val + code->offset, dest, base);
+		ret = do_fetch_store_string_user(val + offset, dest, base);
 		break;
 	case FETCH_OP_ST_SYMSTR:
 		loc = *(u32 *)dest;
-		ret = fetch_store_symstring(val + code->offset, dest, base);
+		ret = fetch_store_symstring(val + offset, dest, base);
 		break;
 	default:
 		return -EILSEQ;
@@ -237,11 +298,13 @@ process_fetch_insn_bottom(struct fetch_insn *code, unsigned long val,
 			if (s3->op != FETCH_OP_ST_STRING &&
 			    s3->op != FETCH_OP_ST_USTRING) {
 				dest += s3->size;
-				val += s3->size;
+				/* Only update a non NULL val */
+				if (val)
+					val += s3->size;
 				goto stage3;
 			}
 			code--;
-			val = lval + sizeof(char *);
+			val = lval ? lval + sizeof(char *) : 0;
 			if (dest) {
 				dest += sizeof(u32);
 				*(u32 *)dest = update_data_loc(loc, ret);

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


