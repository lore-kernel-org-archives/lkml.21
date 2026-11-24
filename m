Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534179;
	b=v9d6p6ZugJSnstio+kjP0L7ZfV/v/qO0NoO0iNP9pyPJGawCDIngVYDdH7PlA34IUL4X
	 CKIphgYRDzZ2pnhn5rlXgeNz0zXe0A66lzbFkS+Bg8zQxeY/saCOrHmpdBaq3IIZynkUf
	 y5H/h/C/2IrK/b5RROBNy7xrcckjwe3UsTS7euOUhZnEwyvxW4hP5KoQujZ6U3dGP53ni
	 jbt0YFqnVf+7QxQVcalnwmmcAuw0mtSK3qAAnoZuvUIpDccGaOghF+L7iaMux1SDxxEi5
	 jviBgGfWFtRMiOe/33fSG4NskTfiLROtNYIBmOZ90Tgv8z9DAfj4yj2ACoakHsugjKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Upb9mkcI4L7fHZrxtf7TuAgSddn2CA2QS2TCt7RKQ4E=;
	b=T0Cyh+GAwgLmiJKOoAULCwg2WXHOwoTrvEJ1hUdZaLNAxb3YHvPQ8AhspGSSwA/1R+ZS
	 8fE1P3PMGDZbxXEvMEHRIyn4Wv6WCusnmZ7rfNv5kTm5JlA3sKJvkcKOMNcAJr3/KBv3G
	 Ofm3pmwbSiU2m59ZFCPZNMfUs8i8h3PyVvTWXvpoimExQmAFgrSVB3k7w5FzUTt315BiE
	 U7OKbRXvrVpAjkzPAvvx7/m0dmJq5kDCiSSKgGmzdIgQLI3fO6OTJJ+1aUiAqqDsnp4Ao
	 b2p462aUXBtMJom7RjwkUhYEE4mtjk201jpkSsDqtY1TdSG6p4lOVyjvfqUzM4pMCxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eQxUEQF7;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581760A5BE3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7581760A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eQxUEQF7
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso2124022f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534178; x=1796138978; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Upb9mkcI4L7fHZrxtf7TuAgSddn2CA2QS2TCt7RKQ4E=;
        b=eQxUEQF7GA7D942C+TqQ37BgZEOmBYZvjRWGuHjvXvTPdjLqXbkFX7XFRfuwnUHDI1
         no3+shDQXbCbvdjqLzpT8fKsbp5fwRvCJ+XOsH1tS8lNT5Qctu5Gx4cHZKGJ62xpE0JT
         HVJkQdIM2h1/dnfbli+o6r4D5a6hIkWWb/fwaFV8JKeeMtRydYzyK+gJ8eX6BqhEq4yz
         DGlywhvSk1GEQTPgRbI+fiiviQt0ySak+Ga78OHyaR11PsON0p/FuF+WtBLkJn49wp1w
         8199bM6sIFLJ3jMYGBpP6jtybIvkQbgTIDIGwBY8tMO6DKqx+zlTklJyZcTNLXtHjjNn
         XKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534178; x=1796138978;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upb9mkcI4L7fHZrxtf7TuAgSddn2CA2QS2TCt7RKQ4E=;
        b=b9sCIl8AiwX27tdw2sZ5UYdq2d3Fu+H5qBG6zKn6DJSU/NfviaJRF8w0M53PChPnHR
         1psz1QqmhVaL4n/qf0t4Uiimhu8VkhHNO/6F05goeukg/fbAQ1zzDC/pGzRbwI0WndET
         56CtNSpx9MdfANPLUBWSlADnibelYqJkm4oMLsrevRCMOUB0Q/DtEijzqLH/F4wRXjJM
         5GRMMLphhVTminEEJVTmrgeCmswLBaJ7IZ+XxwNgN+c9SuZplusvbUtUDDkGkm9EHla+
         iWAzNH/KE1XWI+OQEKel1UIW83fHzAmmcNY/4sh2V/S+ZZTucxVu6r+bdxeMkPwBh85+
         H7cw==
X-Forwarded-Encrypted: i=1; AL+hErEtjqIVri6wblFz27PM45PnPZoFtzZG1cEiuSYSr3KKMeWielb1C7iH4sAptPgM0u4mVgLi1Edcvk5rNZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oyB7JnNIxADDBqyZBbdlm96viQFiGc+OF3qG3sTMmYLC+4iPF
	+zjjUJvM0ADCPD9t3UElu1z/pwrFKuMmGF/KimR1fbwFGi6euMJOprlOVkDt4wX4aVX3ZYSZl2L
	PMNJukmLWLADsXjIvMgBfIQ==
X-Received: from wrsf15.prod.google.com ([2002:adf:fccf:0:b0:4b2:1ff8:ed76])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:4b51:0:b0:49a:fbfd:92c4 with SMTP id ffacd0b85a97d-4abb3a4d650mr21945630f8f.29.1795534177489;
 Tue, 24 Nov 2026 07:29:37 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:43 +0000
In-Reply-To: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-20-vdonnefort@google.com>
Subject: [PATCH v9 19/21] tracing/remotes: Add trace_remote cmdline options
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Following the same format as trace_instance, add a cmdline to configure
a trace remote on registration:

  trace_remote=<remote>^<opt1>^<opt2>,<evt1>,<evt2>

Enabling events automatically turns on tracing.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 145 ++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 0a899ed5b34b..980f34a7603a 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -14,6 +14,8 @@
 #include <linux/trace_seq.h>
 #include <linux/types.h>
 
+#include <asm/setup.h>
+
 #include "trace.h"
 
 #define TRACEFS_DIR		"remotes"
@@ -1177,6 +1179,136 @@ static int poll_ms_show(struct seq_file *s, void *unused)
 }
 DEFINE_TRACE_REMOTE_ATTRIBUTE(poll_ms);
 
+static char trace_remote_cmdline[COMMAND_LINE_SIZE];
+
+static int __init set_trace_remote_cmdline(char *str)
+{
+	trace_append_boot_param(trace_remote_cmdline, str, '\t', COMMAND_LINE_SIZE);
+	return 1;
+}
+__setup("trace_remote=", set_trace_remote_cmdline);
+
+static bool trace_remote_apply_cmdline_opts(struct trace_remote *remote, char *cmdline)
+{
+	bool dmesg_on = false;
+	char *opt;
+
+	while ((opt = strsep(&cmdline, "^"))) {
+		if (!*opt)
+			continue;
+
+		if (!strcmp(opt, "dump_on_panic")) {
+			WRITE_ONCE(remote->panic_on, true);
+		} else if (!strcmp(opt, "dmesg")) {
+			dmesg_on = true;
+		} else if (!strncmp(opt, "buf_size=", 9)) {
+			unsigned long long size;
+			char *end;
+
+			size = memparse(opt + 9, &end);
+			if (!*end && size && size < ULONG_MAX)
+				WRITE_ONCE(remote->trace_buffer_size, size);
+			else
+				pr_warn("Invalid trace remote buffer size '%s'\n", opt);
+		} else if (!strncmp(opt, "poll=", 5)) {
+			unsigned int poll_ms;
+
+			if (!kstrtouint(opt + 5, 10, &poll_ms) && poll_ms)
+				WRITE_ONCE(remote->poll_ms, poll_ms);
+			else
+				pr_warn("Invalid trace remote poll '%s'\n", opt);
+		} else {
+			pr_warn("Unknown trace remote option '%s'\n", opt);
+		}
+	}
+
+	return dmesg_on;
+}
+
+static struct remote_event *
+trace_remote_find_event_by_name(struct trace_remote *remote, const char *name);
+
+static int
+trace_remote_enable_event(struct trace_remote *remote, struct remote_event *evt, bool enable);
+
+static bool trace_remote_apply_cmdline_events(struct trace_remote *remote, char *cmdline)
+{
+	bool tracing_on = false;
+	char *token;
+
+	while ((token = strsep(&cmdline, ","))) {
+		struct remote_event *evt;
+		int ret;
+
+		if (!*token)
+			continue;
+
+		evt = trace_remote_find_event_by_name(remote, token);
+		if (!evt) {
+			pr_warn("trace remote event '%s' not found\n", token);
+			continue;
+		}
+
+		ret = trace_remote_enable_event(remote, evt, true);
+		if (ret)
+			pr_warn("Failed to enable trace remote event '%s' (%d)\n", token, ret);
+		else
+			tracing_on = true;
+	}
+
+	return tracing_on;
+}
+
+static void trace_remote_apply_cmdline(const char *name, struct trace_remote *remote)
+{
+	char *cmdline, *curr, *next;
+	char *events_cmdline = NULL;
+	char *opts_cmdline = NULL;
+	bool tracing_on = false;
+	bool dmesg_on = false;
+	int ret;
+
+	if (!trace_remote_cmdline[0])
+		return;
+
+	cmdline = kstrdup(trace_remote_cmdline, GFP_KERNEL);
+	if (!cmdline)
+		return;
+
+	guard(mutex)(&remote->lock);
+
+	next = cmdline;
+	while ((curr = strsep(&next, "\t"))) {
+		char *token = strsep(&curr, ",");
+		char *rname = strsep(&token, "^");
+
+		if (strcmp(rname, name))
+			continue;
+
+		opts_cmdline = token;
+		events_cmdline = curr;
+
+		if (opts_cmdline)
+			dmesg_on |= trace_remote_apply_cmdline_opts(remote, opts_cmdline);
+		if (events_cmdline)
+			tracing_on |= trace_remote_apply_cmdline_events(remote, events_cmdline);
+	}
+
+	if (dmesg_on) {
+		ret = trace_remote_enable_dmesg(remote, true);
+		if (ret)
+			pr_warn("Failed to enable trace remote dmesg (%d)\n", ret);
+	}
+
+	if (tracing_on) {
+		ret = trace_remote_enable_tracing(remote);
+		if (ret)
+			pr_warn("Failed to enable trace remote tracing (%d)\n", ret);
+	}
+
+	kfree(cmdline);
+}
+
 static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
 {
 	struct dentry *remote_d, *percpu_d, *d;
@@ -1353,6 +1485,7 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 	}
 
 	list_add(&remote->node, &trace_remotes);
+	trace_remote_apply_cmdline(name, remote);
 	retain_and_null_ptr(remote);
 
 	return 0;
@@ -1840,3 +1973,15 @@ static struct remote_event *trace_remote_find_event(struct trace_remote *remote,
 	return bsearch((const void *)(unsigned long)id, remote->events, remote->nr_events,
 		       sizeof(*remote->events), __cmp_events);
 }
+
+static struct remote_event *
+trace_remote_find_event_by_name(struct trace_remote *remote, const char *name)
+{
+	int i;
+
+	for (i = 0; i < remote->nr_events; i++) {
+		if (!strcmp(remote->events[i].name, name))
+			return &remote->events[i];
+	}
+	return NULL;
+}
-- 
2.56.1.809.ga0b61035b5-goog

