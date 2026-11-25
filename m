Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596049;
	b=liQT3PrUyt1FZh4RO3XbOyvzDuizEUKyXQvhNSIprYH0s6c1TjXCkJlZH7JmR+9n0z4c
	 8we6+ZpoIM3xj1eyW4cYBUmSti/TKWJdk1WJk80SdDLphQANt3ZDYfbHo1ZxA2zcmPhaQ
	 f0gc3jEshDXxlG/17Rv2p9R7WiG5A1baRmp4tX9If/oN/oETIviGfqarDiYG8bR4VzFnP
	 NQUol5EC1SkMSM6+psqCUNKrEuqUnjRRt0TdFmZSvL40wgfRyTqb62a0/WUDIDm+j51V1
	 2W7rDCrbIElVeru+g0qsJBqvKCeKMmKYvBHdxnBfSfo8v8jPsOnanPEIX7061UQM4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596049;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=YtXJlTEvqx5XQygLSJShQwaJUGuYe5/AAwZGVwwLhgg=;
	b=uBEk9NIbWHG+AnqaJN+AL4QhxJZu4EOKzfWyvDc3yGHfBXIFJJeVw7PqGlbV8l77cdzd
	 V2rceOMM46wGjvzLyCbAYwqFRsyOvIhZqfz7+BiKhwir8oGtCVkHTBfWHhNA7eBsBYVCg
	 8CTouuj7CAs3gGjcOo1jAO+SOdYg19ZtrtwjQHEuurO7a2vCgDsXkTr8WfqocrQjNmv7D
	 yLplxizYCcbe7PGe+GVL8p90V+KnNyoE5KanOolmwbIH6A64ADWTAfr0Ts03NhJnxWIjy
	 WaXYdDg16379Ot1bR6OFC4xKUeXKft2GGRUy60FNopPPnRS3wcWUWIqPspWt+1bu2Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lCFmVWc8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=agE9eBKN;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F055606A335;
	Wed, 25 Nov 2026 08:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F055606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lCFmVWc8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=agE9eBKN
Date: Wed, 25 Nov 2026 08:40:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596047;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtXJlTEvqx5XQygLSJShQwaJUGuYe5/AAwZGVwwLhgg=;
	b=lCFmVWc8HCVSz8mgIPp1Q9ayJIawn29mJXQ5jJK30yfy/MTYtoXefDkN8YTcURhNHAYX1B
	FETlZJHrNh+Nae6sfDzq+gG7/Fy9HeJNDkknVvfuAz6ylNqTLOuzoUcXR8CygLMf7wD4KW
	CNmfhHBJvoEctH1OnBGm0PRnO3CPIIUTvwvKqSfEaE5KOQgjyWSc8XMohP6PwysPsicWRp
	Q4DdJwiqrFK8j2CBswN0r5hV2UDXZRwnZ0NWoKHBWMY2OHz3NjSJQ6WsYzUxan7thTB2vk
	rq41JraxRQ02avJv6VvwZtK4zhhgHIOcE4TvSMxBwEFbzwslP0qQpC1WdVAR1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596047;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtXJlTEvqx5XQygLSJShQwaJUGuYe5/AAwZGVwwLhgg=;
	b=agE9eBKNR4vNaO0UENkjb37un1bJo7PAyR0xyAi7SRV2ZqH+c+cK5iC+Qa62jBlT8M14Nc
	USjsNbDviQ1yqxDQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for changed functions
 without an ftrace call site
Cc: Puranjay Mohan <puranjay@kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261022171637.3298443-4-puranjay@kernel.org>
References: <20261022171637.3298443-4-puranjay@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559604542.92412.17801959190123887698.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     94877d50b89cf6a579e406581db7805ec6b8ad58
Gitweb:        https://git.kernel.org/tip/94877d50b89cf6a579e406581db7805ec6b=
8ad58
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Thu, 22 Oct 2026 10:16:36 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:38:32 -08:00

objtool/klp: Add test for changed functions without an ftrace call site

Test that klp diff rejects a changed function without an ftrace call
site, both a notrace one and an inline one emitted out of line, and
reports each of them.  Also test that a fully inlined function and an
ordinary function can still be patched.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
Acked-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20261022171637.3298443-4-puranjay@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/x86/fixtures/notrace_target.c | 71 +++++++++++++-
 tools/objtool/tests/x86/test-notrace-target.sh    | 74 ++++++++++++++-
 2 files changed, 145 insertions(+)
 create mode 100644 tools/objtool/tests/x86/fixtures/notrace_target.c
 create mode 100755 tools/objtool/tests/x86/test-notrace-target.sh

diff --git a/tools/objtool/tests/x86/fixtures/notrace_target.c b/tools/objtoo=
l/tests/x86/fixtures/notrace_target.c
new file mode 100644
index 0000000..64da58c
--- /dev/null
+++ b/tools/objtool/tests/x86/fixtures/notrace_target.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/* PATCH_<name> changes <name> in the patched build. */
+#define notrace __attribute__((__no_instrument_function__))
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+#ifndef PATCHED
+#undef PATCH_OUTLINED
+#undef PATCH_NOTRACE
+#undef PATCH_INLINED
+#undef PATCH_TRACED
+#endif
+
+#ifdef PATCH_OUTLINED
+#define OUTLINED_K 2
+#else
+#define OUTLINED_K 1
+#endif
+
+#ifdef PATCH_NOTRACE
+#define NOTRACE_K 2
+#else
+#define NOTRACE_K 1
+#endif
+
+#ifdef PATCH_INLINED
+#define INLINED_K 2
+#else
+#define INLINED_K 1
+#endif
+
+#ifdef PATCH_TRACED
+#define TRACED_K 2
+#else
+#define TRACED_K 1
+#endif
+
+int sink;
+
+/* Address taken, so emitted out of line. */
+static inline notrace int outlined(int x)
+{
+	int i;
+
+	for (i =3D 0; i < x; i++)
+		sink +=3D i * OUTLINED_K;
+	return sink;
+}
+
+int (*outlined_ptr)(int) =3D outlined;
+
+notrace int notrace_fn(int x)
+{
+	return x * 3 + NOTRACE_K;
+}
+
+static inline int inlined(int x)
+{
+	return x + INLINED_K;
+}
+
+int inlined_user(int x)
+{
+	return inlined(x) * 5;
+}
+
+int traced(int x)
+{
+	return x * 7 + TRACED_K;
+}
diff --git a/tools/objtool/tests/x86/test-notrace-target.sh b/tools/objtool/t=
ests/x86/test-notrace-target.sh
new file mode 100755
index 0000000..09414ae
--- /dev/null
+++ b/tools/objtool/tests/x86/test-notrace-target.sh
@@ -0,0 +1,74 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A changed function without an ftrace call site can't be livepatched:
+# klp_enable_patch() fails with "failed to find location for function".
+# klp diff must reject it instead.
+
+. "$(dirname "$0")/../lib.sh"
+
+# mcount_entry <function>: orig.o has an __mcount_loc entry for it.
+mcount_entry()
+{
+	in_relocs "$orig_obj" | awk '/rela__mcount_loc/,/^$/' |
+		awk -v f=3D"$1" '$5 =3D=3D f || $5 =3D=3D ".text." f' | grep -q .
+}
+
+# check <expected exit status> <-DPATCH_... flags>
+check()
+{
+	local expect=3D"$1"; shift
+
+	setup
+	build_pair notrace_target.c "$@"
+
+	assert_input_symbol outlined
+	assert_input_symbol notrace_fn
+	has_input_symbol "$orig_obj" inlined &&
+		fail "inlined() was emitted out of line; the fixture tests nothing"
+	mcount_entry traced ||
+		fail "no __mcount_loc entry for traced(); the fixture tests nothing"
+	mcount_entry inlined_user ||
+		fail "no __mcount_loc entry for inlined_user(); the fixture tests nothing"
+	mcount_entry outlined &&
+		fail "outlined() has a __mcount_loc entry; it should be notrace"
+	mcount_entry notrace_fn &&
+		fail "notrace_fn() has a __mcount_loc entry; it should be notrace"
+
+	run_diff "$expect"
+}
+
+rejected()
+{
+	local n
+
+	n=3D"$(diff_log | grep -c "error: objtool: $1: no ftrace call site, can't p=
atch")"
+	[ "$n" =3D 1 ] ||
+		fail "expected '$1' rejected once, found $n: $(diff_log | tail -2)"
+}
+
+check 255 -DPATCH_OUTLINED
+rejected outlined
+cleanup
+
+check 255 -DPATCH_NOTRACE
+rejected notrace_fn
+cleanup
+
+check 255 -DPATCH_OUTLINED -DPATCH_NOTRACE
+rejected outlined
+rejected notrace_fn
+cleanup
+
+# Fully inlined: the traceable caller gets patched.
+check 0 -DPATCH_INLINED
+assert_patched inlined_user
+assert_not_patched traced
+cleanup
+
+check 0 -DPATCH_TRACED
+assert_patched traced
+assert_not_patched inlined_user
+cleanup
+
+pass "changed function without an ftrace call site rejected"
