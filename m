Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810453;
	b=Ub0FymdJVJh/OUIdbkNJgkyf24YjN75tVJq+JsdXcqgRnrVmT9gxoGEK6ugRe3XAmaEk
	 8kbMIuKfblm6vSMQ5ykMVlnbhhhN3EyzejJdBf6NVlPgIDvNJGNIpCSO3wdvCf/kml94+
	 LfwpMHspaPikVJKzGsTGXQDBWf5nz8ShaNBqKVmQXzF5v9+vwdvy+EYJdecux3a+XXxCj
	 FPUGdQupYJMywIWRsvjrVA3Sd2HqRsvLDh6UpWVt0Z9BmzYrllnxpY+nURB417AA0aa0W
	 HbDHD+IVaS98lcZGIRvRSNShOLUzVybAGYF7EbwwwGVMa+SsxPq1U2LET01HoWgNM9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810453;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=EblhYd5J01wGoc6SJLLVR+P1E2myP4zn8kCYwnsJfpI=;
	b=ttYv6XHFPi1MbjFKJiSBnmqbKAKLb1oOYVcW0bJPQdH+uY3VfSMOfSjxcPw2G8mu6hli
	 s9JgCuVZNzsDEU6LqoXu14FCb8sfEPaqWuUQuMqa7J4kN6CXRRJejNleT50qiQYx96pMW
	 0UxXAOv2TLFfHLI9ud79AYyLV6Db0/dy6lxAcLLtlUKJ4sUXI7btU3p0JDuUdiCagyEiX
	 8P+8RjjE9F/k5W1WnusQYF2xoRfmSUSSnHCCZtWd4PipARxn417otYzreRn4U5wHTyMgk
	 c+DHpFmCqoGf97RjkJOZV0h3mgbLs+l0v601+/LYnu20ZfQmX+vuJjPygiezGD/tUww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="f5FBlO//";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6309D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5FBlO//
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795810451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EblhYd5J01wGoc6SJLLVR+P1E2myP4zn8kCYwnsJfpI=;
	b=f5FBlO//NpfVAQLDDZRokjwslJK21+VjexzoB8F1hvT/XQRGpKgA0V5KPKZ+JJhZkDcND2
	kB1lhgA50tl6iMAWR07QkRhcQEeZd8rfJmT67Sv5A/LZ0FJGQgIgDiAbqSNb9/dAN9KzsX
	aDEhaI6WcuUJMqYt773GKAMtDSiCpA8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-pN25tfccO0qq0rJtdfDLNw-1; Fri,
 27 Nov 2026 20:14:06 +0000
X-MC-Unique: pN25tfccO0qq0rJtdfDLNw-1
X-Mimecast-MFC-AGG-ID: pN25tfccO0qq0rJtdfDLNw_1795810442
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 733891944B37;
	Fri, 27 Nov 2026 20:14:02 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20EBA589;
	Fri, 27 Nov 2026 20:13:52 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Dan Beimborn <Dan.Beimborn@qube-rt.com>,
	"Pak Hung Vincent Chiu" <pak-hung.chiu@qube-rt.com>
Subject: [PATCH v10 07/10] x86/jump_label: Add ASM support for static_branch_likely()
Date: Fri, 27 Nov 2026 21:12:18 +0100
Message-ID: <20261127201221.434876-8-vschneid@redhat.com>
In-Reply-To: <20261127201221.434876-1-vschneid@redhat.com>
References: <20261127201221.434876-1-vschneid@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

A later commit will add some early entry code that only needs to be
executed if nohz_full is present on the cmdline, not just if
CONFIG_NO_HZ_FULL is compiled in. Add an ASM-callable static branch macro.

Note that I haven't found a way to express unlikely (i.e. out-of-line)
static branches in ASM macros without using extra jumps, which kind of
defeats the purpose. Consider:

  .macro FOOBAR
	  // Key enabled:  JMP .Ldostuff_\@
	  // Key disabled: NOP
	  STATIC_BRANCH_UNLIKELY key, .Ldostuff_\@ // Patched to JMP if enabled
	  jmp .Lend_\@
  .Ldostuff_\@:
	  <dostuff>
  .Lend_\@:
  .endm

Instead, this should be expressed as a likely (i.e. in-line) static key:

  .macro FOOBAR
	  // Key enabled:  NOP
	  // Key disabled: JMP .Lend_\@
	  STATIC_BRANCH_LIKELY key, .Lend\@ // Patched to NOP if enabled
	  <dostuff>
  .Lend_\@:
  .endm

Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/jump_label.h | 34 ++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
index 05b16299588d5..524368fb9f308 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -7,7 +7,39 @@
 #include <asm/asm.h>
 #include <asm/nops.h>
 
-#ifndef __ASSEMBLER__
+#ifdef __ASSEMBLER__
+
+/*
+ * There isn't a neat way to craft unlikely static branches in ASM, so they
+ * all have to be expressed as likely (inline) static branches. This macro
+ * thus assumes a "likely" usage.
+ */
+.macro ARCH_STATIC_BRANCH_LIKELY_ASM key, label, jump, hack
+.Lentry_code_\@:
+.if \jump || \hack
+	jmp \label
+.else
+	.byte BYTES_NOP5
+.endif
+	.pushsection __jump_table, "aw"
+	_ASM_ALIGN
+	ANNOTATE_DATA_SPECIAL
+	.long .Lentry_code_\@ - .
+	.long \label - .
+	/* LIKELY so bit0=1, bit1=hack */
+	_ASM_PTR \key + 1 + (\hack << 1) - .
+	.popsection
+.endm
+
+.macro STATIC_BRANCH_TRUE_LIKELY key, label
+	ARCH_STATIC_BRANCH_LIKELY_ASM \key, \label, 0, IS_ENABLED(CONFIG_HAVE_JUMP_LABEL_HACK)
+.endm
+
+.macro STATIC_BRANCH_FALSE_LIKELY key, label
+	ARCH_STATIC_BRANCH_LIKELY_ASM \key, \label, 1, 0
+.endm
+
+#else /* !__ASSEMBLER__ */
 
 #include <linux/stringify.h>
 #include <linux/types.h>
-- 
2.56.1

