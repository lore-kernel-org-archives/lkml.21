Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057191;
	b=c/BDHpQUoZSmEofOUwETkb6wOUEnUYhCMbyFh38NnqnVsaXC/fS1tkH5rlSu595hhAfd
	 sBEwdkEKvvb/RVP44Ib6oFtr5Sb7lNS8BzwwcQaSkhm7kjk/YSCuxHE1fMgjlUAsnVVOl
	 D79pOOHjrgZmZVoWMZJ1Y75DWXoytGtfrQSF1jOMWpdCJ3W4wEV9w/uZIjHTLJH9AflNS
	 KXe+OV1jPzLKGUVn60ykw8+mwytnb6aNfyitbUi5jhbNB9mW2pnaQsjY9QMLHA2gsH6tF
	 tmhg9A9uuJrTb105ZdnJzSkiMPn85eRI3PBYsgPMXQp2sdg80n8J+TCOXj7cNEMRJ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BemN4KAEIv94JTaM/LB9CfX7xPFFKwFGGLfkDjDGM5Q=;
	b=24My0X6XGrg9EhB9Wt1mSBBmNI69zksehmX2c5Upf7MEG4ZN4XpDPHnIXTfKgM8exPf+
	 +dEtRk4PXmYGNAO5xGspWvJyrjDj5LYp4W+xmlN30M1GlnqOc5btGw9N2AN5HKCIXx2yi
	 ZK20ua6VodcjYS5iZoftAJgAWRhi+801mYmmZE0XvXsTWAaADnHK7M8a/bGYqRbali17J
	 En/pGuO+DA1vMBH84aE0xIJN8AhVdfAwk4nATIETXrlMkual7xHx2QJcjg3P/+IsflZJ1
	 6lhiYcETHMlILABA+8IHNJioTfFXCwW+YHPlliy/289dW/mACMQNSGXTOqxpfFiSZag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUwIT1Vg;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A76606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A76606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUwIT1Vg
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381f65e4e4bso2777045eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057190; x=1795661990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BemN4KAEIv94JTaM/LB9CfX7xPFFKwFGGLfkDjDGM5Q=;
        b=vUwIT1VgurTA5PcH58CV+OidjaQlZarrpDkxokT5Dc2FKUvEj1pnfPS32bbDNcWXOI
         iS7TSFfQuJszS1B/dTp2aGKTksWm1ccF7NBWe8lXiANy+kQGZqppOBJQkkvXLqHddlz7
         Z4mCYbXH/JPRElL7Qy5Zlgy3IQABFFNg90T0B9+tmiXAQqRc6Uo8kR2rMXxdHIM4sVLX
         dASfsJFLI2rMl3+D0xOmaQ17kXymY53zTt17yYv2R+gDZUBsekaZ/W+po1ydfdaEYZOb
         5ZeozYdnX+OMDnyYLCSuvB2clE5P4cp87sv7dwEy1QBvFPJMRTa/EarhKESF/D/jnC0I
         b9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057190; x=1795661990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BemN4KAEIv94JTaM/LB9CfX7xPFFKwFGGLfkDjDGM5Q=;
        b=17UE8kXdLamsatkrieWyeN59tu8IwnGBeyAXE8CcUUU+99lm0DW6cZMT+WfeZDoYp+
         MFblPf4KCFZrVYSYC1gh0pWgw6A8KYJt+y0YNtqbC0tM6/aRpYv+oZxuLTOTmHyKLgYe
         835wf9Kr2gpmwBkRtBDaRk13XGkOxYn0UZqQqTGqp+f6peIuayzOiNeKFa4EG5FsWu3y
         XQIJQqvhiQeRIxKrfAf7/bU8VI9VRVJMbLWU/BrCfZ0mXcnO3R9waHGDHxgVgz/eRF87
         Nr5Q5gOD/cs1D2vCarTOcvA/pZxKM2VblUPmlD+y8ENpkMo3a2kgvwRqnmwgz11gz5TI
         Y/qw==
X-Forwarded-Encrypted: i=1; AL+hErFkAMQpt63OaO+/sDcCSyeOYLAJDMMe9RmeY9xxawCorzLu9czZpegkv5fFmkppCOID25WqJfyXDGP3ScE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vljTJslcgGvcjCT7fahy6WoMtuN35twS0w3JshKe5SnYV9FuG
	NBMLE8Uo+rGKjN0IP94uV7GJWD6ku2FVpMj8GmSeeW9hcNZaVZaSTSTe
X-Gm-Gg: AZFdTZcHGuSt77XhIGTc0TR5Vzy++1Xf5aY8xpg6tclGZ313vLxlF3bBQwfAyjz5tas
	TWLau8PbeftkMjvSl62rOneuM3LmgO46jfTfEP2myJpDtHMgFfUilxHkm4X7sgxI6XNq6EaJkA+
	OkOEF/W0F4uAXzupeeamSmtRgi8LjhqgZegM5A5a3nAUx3isjPhkYCLvyDXSAJEZfzs0bx5sTzk
	4ZOT5nGkDftnx/dlBQnE19dmR10FRbqY3ai4z5k66QotIcE0iidejjalWrbhl97r4rdX7Uw+IVZ
	gLwsw6x9+o/TRF9bMyEgdzIvwgXNUe01RehP17EFNiPuwgEkMr7b73wiS3EJGAeChHSiaTZmVyL
	xDSzkXjYb24Ewh8cktkiFIvKxN+/7NdDhlGTP75LssgWrbeKENZ9uL6tErmh//Pn+fKA0XJE3/y
	fVOtZK8U1oprnqh6mLmd28cF9kzDQB9au1ixz47nXycB2I3CmmeS9C/nPYWkcXEjqVgU8lUnuwL
	OCA95c23S9pLex6IleDGnRlqkIzVzTvPBf6Yztc1bbNFE/hrHOxxbaWDiEwe6qiMtyk8a8MBLWL
	TXavky5ljWtdIjlVEyTpm38n1zxNE678xOGsV27Al61SFjJi0g1x7K/Ol80j84ruelZnWIZnwiT
	q3w==
X-Received: by 2002:a05:693c:2805:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-3827dd05b5emr4256126eec.4.1795057189615;
        Wed, 18 Nov 2026 18:59:49 -0800 (PST)
Received: from Desktop ([182.161.246.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm19658301eec.9.2026.11.18.18.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:59:48 -0800 (PST)
From: JunYoung Lee <ljyoung04@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tracing: Require kallsyms permission for the .function filter modifier
Date: Thu, 19 Nov 2026 11:59:41 +0900
Message-ID: <20261119025941.87102-1-ljyoung04@gmail.com>
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
Content-Transfer-Encoding: 8bit

Hi Steven, Masami,

An unprivileged user can locate the kernel image (KASLR bypass) with
PERF_EVENT_IOC_SET_FILTER at the default perf_event_paranoid=2.
parse_pred() accepts "<field>.function == <addr>" only if the address
resolves in kallsyms, and the perf path has no permission check, so the
ioctl result tells whether an address is kernel text. The details and
the fix are in the patch below.

Affected (reproduced as uid 65534, KASLR on), since e6745a4da964 (v6.3):
- mainline 4405c18c95d2 (v7.4-rc3-230)
- stable 6.12.118

Example on mainline: a counting event on ftrace:print (field "ip") and
561 probes return image_start=0xffffffffa1000000 and
image_end=0xffffffffaae30000. These equal _stext and _end in
/proc/kallsyms as read by root; the same user sees zeros there. No
tracefs and no capabilities are needed. Not affected:
perf_event_paranoid > 2, or perf_event_open blocked.

A C reproducer is available privately on request.

Testing of the patch on mainline with KASAN: for an unprivileged user
every .function form now fails with -EINVAL, and ordinary filters still
work. Root keeps .function via perf and tracefs (it is refused under
kptr_restrict=2, like kallsyms values). ftrace selftests test.d/filter
pass 4/4. checkpatch --strict and W=1 are clean. A 6.12.y backport is
available.

A separate issue seen while testing: as root, a .function filter on the
perf function event (ftrace:function) crashes the kernel with a NULL
dereference in ftrace_function_set_filter_pred(), because pred->regex
is not set on the .function path. It needs CAP_PERFMON. I can send
details if useful.

Found with AI-assisted code analysis. All results come from test runs.

Thanks,
JunYoung Lee

-- >8 --
"<field>.function == <operand>" resolves the operand to a kernel symbol
range. parse_pred() accepts the predicate only if
kallsyms_lookup_size_offset() succeeds, so the result of setting the
filter tells whether an address lies inside the kernel image (or a
module).

perf_event_open() allows any user to open a tracepoint event for
counting at the default perf_event_paranoid=2, and
PERF_EVENT_IOC_SET_FILTER passes the string to the same parser without
a permission check. An unprivileged user can therefore probe addresses
one ioctl at a time and recover _stext and _end exactly (about 560
ioctls on x86-64, under two seconds), while /proc/kallsyms shows that
user zeros.

Apply the rule that /proc/kallsyms uses, kallsyms_show_value() on the
current credentials, before the operand is looked at, so both the
numeric and the symbol name form are refused to callers who may not
see kernel addresses. Root and CAP_SYSLOG keep the modifier under the
default kptr_restrict. With kptr_restrict=2 it is refused to everyone,
the same as kallsyms values are hidden from everyone.

Fixes: e6745a4da964 ("tracing: Add a way to filter function addresses to function names")
Cc: stable@vger.kernel.org
Signed-off-by: JunYoung Lee <ljyoung04@gmail.com>
---
 kernel/trace/trace_events_filter.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index c10951bcfc5f..895ef6d7652a 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -118,6 +118,7 @@ struct filter_pred {
 	C(IP_FIELD_ONLY,	"Only 'ip' field is supported for function trace"), \
 	C(INVALID_VALUE,	"Invalid value (did you forget quotes)?"), \
 	C(NO_FUNCTION,		"Function not found"),			\
+	C(FUNCTION_PERM,	"Not permitted to filter on kernel addresses"), \
 	C(GLOB_WITHIN,		"'within' filter cannot take glob expressions"), \
 	C(ERRNO,		"Error"),				\
 	C(NO_FILTER,		"No filter found")
@@ -1743,6 +1744,16 @@ static int parse_pred(const char *str, void *data,
 	pred->op = op;
 
 	if (function) {
+		/*
+		 * Whether the operand is accepted, and which events then
+		 * match, tells where kernel text is. perf lets unprivileged
+		 * users set filters, so apply the /proc/kallsyms rule.
+		 */
+		if (!kallsyms_show_value(current_cred())) {
+			parse_error(pe, FILT_ERR_FUNCTION_PERM, pos + i);
+			goto err_free;
+		}
+
 		/* The field must be the same size as long */
 		if (field->size != sizeof(long)) {
 			parse_error(pe, FILT_ERR_ILLEGAL_FIELD_OP, pos + i);
