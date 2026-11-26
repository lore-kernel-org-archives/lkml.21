Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710286;
	b=zskeCP0kFx8Qm9mtNUQRH3CrhoSoLmjAUW9X36i9+pvOD25Ut7jubd3ccpMq2VHlfH39
	 WT/eQ8K7IKURPhDCv7u/npWouUY3+7DYOqeH7GZIqkARt1pP5sTpIobWH6zCzlsSj/bXW
	 jSOE/x5a8H4QNfcoPq0q0Kg6Dv+d2nsJmOuRFbxTGKuji5ASX2frke/4VQV7Ubk0UBMCg
	 8m2531Q+rf7vwdX8T1ukyTPGO2c42q7IfZG5q9qXa/wPm1hRvXycw9XmesFuh/qn2eveD
	 FnE7z4wBv8oc16nLf6S0tPP72CyaSzr6PNcaLuyhnwdzfG9tkAjf6RJfqDNQVy8Xu0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710286;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=T5Xtc3Fqp8O3hGg76ydYCt0FHUla3x5fawkvlo4bz5o=;
	b=4GagbBov4VyjcmNPGtWFCo7AmS4Hxpwar8Xz4aOr5R/LaI2hK6wgsQM5LK2bRHkyd85j
	 vp2BtotIeeTVq0yEThFSwD5hSmCmHy2yPKx7ZfhoCP0Q6HLifyb2aebG9oRc3+wF31WmZ
	 F4eFIUw64bBUrJkPixvKfuANWn2ZLiR9R5TX9EAnM41VD/+g9XZTYETdoJFUHZ+oBrrM0
	 8ADOK7zd4uRHAcNrHYy98u/amlUNvaDQCSsaoQm7ZMO6/PkJ/byzVW1PFYS0+zUT65rRm
	 1bihsQxbkKzZ+ds5XNdXxrMJHUSd4MyoQ7XnggrKUYisLTEx0nlsAw3l0npOnyu0QhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOpJFCyn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F1606A680
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOpJFCyn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44F51F000F4;
	Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710285;
	bh=T5Xtc3Fqp8O3hGg76ydYCt0FHUla3x5fawkvlo4bz5o=;
	h=Date:From:To:Cc:Subject:References;
	b=hOpJFCynIL4TfDP1hGOWYmwbmxjn+/4EHCFb6W+aM0m/1eCMAKsFK2Btd1v8dNTV/
	 G6qMtOHcdzetNKgSKBidWcAm0YyaCctTRXncRc8GF9hglTIHg6ZnOXoS64aH8t976D
	 v63vzfVZ7GbNxxo22XGlA91u4uFbkX5oroQHRe2AS/JXs1P7G6q1lmUJVAULdc/yeb
	 KLZaxeyhCx2DuAH4CHB59jYJn47pGhbnGkWdZNTYbjE9QH6bb+9F0ge2tzbsCK+LTl
	 7K21X5wVAp5LazQfAAgHzuawTSWVO2EDUEVYjkaZWCuoT/k/Hcwo5MzJuqRZ9rAEUw
	 gC69pumsNeW7g==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH7-00000007blZ-0Doh;
	Thu, 26 Nov 2026 11:24:45 -0500
Message-ID: <20261126162444.861445343@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:28 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 05/15] tracing: Override the same name trace_instance= by latter one
References: <20261126162423.442922469@kernel.org>
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

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Override the same name boot instance by the latter parameter.
This allows user to override the trace instance in bootconfig by the
cmdline from bootloader.

For example, set default trace_instance parameter in bootconfig
e.g.:

  kernel {
     reserve_mem=12M:32M:trace
     trace_instance=boot_map@trace
  }

This just adds a persistent trace instance.

And when you need to record events, you can override the boot_map
trace instance from bootloader:

  trace_instance=boot_map@trace,sched:*

Then the boot_map instance starts tracing sched:* events.

Link: https://patch.msgid.link/179094974235.609715.7085605075646393261.stgit@devnote2
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 .../admin-guide/kernel-parameters.txt         |   7 +
 Documentation/trace/debugging.rst             |  15 ++
 kernel/trace/trace.c                          | 150 +++++++++++++-----
 3 files changed, 135 insertions(+), 37 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..b12a172b8a82 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7829,6 +7829,13 @@ Kernel parameters
 
 			NB: Both the mapped address and size must be page aligned for the architecture.
 
+			Multiple trace_instance= options can be specified to
+			create multiple instances. If the same instance name is
+			specified more than once, the latter one will override
+			any earlier definitions for that instance. This allows
+			overriding an instance configuration that was defined
+			earlier on the command line or via bootconfig.
+
 			See also Documentation/trace/debugging.rst
 
 
diff --git a/Documentation/trace/debugging.rst b/Documentation/trace/debugging.rst
index bca1710d92bf..b66cc070ae79 100644
--- a/Documentation/trace/debugging.rst
+++ b/Documentation/trace/debugging.rst
@@ -178,3 +178,18 @@ instance without stopping the trace.
 Note that this "backup" instance is readonly, and will be removed automatically
 if you clear the trace data or read out all trace data from the "trace_pipe"
 or the "trace_pipe_raw" files.
+
+Overriding trace instances
+--------------------------
+
+Multiple ``trace_instance=`` options can be specified on the kernel command
+line to create multiple instances. If the same instance name is specified
+more than once, the latter definition will override any previous definitions
+for that instance.
+
+This is useful when an instance configuration is defined in bootconfig, but
+needs to be overridden or modified from the bootloader command line (for
+example, to change the enabled events or add flags like ``traceoff``)::
+
+  trace_instance=boot_map^traceoff@trace
+
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 65b9d67647e5..926a2eb247df 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9754,33 +9754,44 @@ __init static int backup_instance_area(const char *backup,
 	return 0;
 }
 
-__init static void enable_instances(void)
+struct boot_instance {
+	char *name;
+	char *flag_delim;
+	char *addr_delim;
+	char *backup;
+	char *events;
+};
+
+__init static int parse_boot_instance_info(struct boot_instance *boot_instances,
+					   int nr_instances)
 {
-	struct trace_array *tr;
-	bool memmap_area = false;
-	char *curr_str;
+	char *flag_delim;
+	char *addr_delim;
+	char *backup;
+	char *events;
 	char *name;
-	char *str;
 	char *tok;
+	char *str;
+	int idx;
+	int nr = 0;
+	int i;
 
 	/* A tab is always appended */
 	boot_instance_info[boot_instance_index - 1] = '\0';
 	str = boot_instance_info;
 
-	while ((curr_str = strsep(&str, "\t"))) {
-		phys_addr_t start = 0;
-		phys_addr_t size = 0;
-		unsigned long addr = 0;
-		bool traceprintk = false;
-		bool traceoff = false;
-		char *flag_delim;
-		char *addr_delim;
-		char *rname __free(kfree) = NULL;
-		char *backup;
+	while ((events = strsep(&str, "\t"))) {
+		if (!*events)
+			continue;
 
-		tok = strsep(&curr_str, ",");
+		tok = strsep(&events, ",");
 
 		name = strsep(&tok, "=");
+		if (!*name) {
+			pr_warn("Tracing: Empty boot instance name\n");
+			continue;
+		}
+
 		backup = tok;
 
 		flag_delim = strchr(name, '^');
@@ -9792,20 +9803,84 @@ __init static void enable_instances(void)
 		if (flag_delim)
 			*flag_delim++ = '\0';
 
-		if (trace_array_find(name)) {
-			pr_warn("Tracing: Instance %s already exists\n", name);
-			continue;
+		for (idx = 0; idx < nr; idx++) {
+			/* Override by the last defined instance */
+			if (!strcmp(name, boot_instances[idx].name))
+				break;
 		}
 
 		if (backup) {
-			if (backup_instance_area(backup, &addr, &size) < 0)
+			/* Check if the backup source instance exists */
+			for (i = 0; i < idx; i++) {
+				if (!strcmp(backup, boot_instances[i].name))
+					break;
+			}
+			if (i == idx) {
+				pr_warn("Tracing: Backup source instance %s is not found for %s\n",
+					backup, name);
 				continue;
+			}
 		}
 
-		if (flag_delim) {
+		if (WARN_ON(idx >= nr_instances))
+			break;
+
+		boot_instances[idx].name = name;
+		boot_instances[idx].flag_delim = flag_delim;
+		boot_instances[idx].addr_delim = addr_delim;
+		boot_instances[idx].backup = backup;
+		boot_instances[idx].events = events;
+		if (idx == nr)
+			nr++;
+	}
+
+	return nr;
+}
+
+__init static void enable_instances(void)
+{
+	struct boot_instance *boot_instances __free(kfree) = NULL;
+	struct boot_instance *bi;
+	struct trace_array *tr;
+	int nr_instances = 1;
+	char *tok;
+
+	if (!boot_instance_index)
+		return;
+
+	for (char *p = boot_instance_info; *p; p++) {
+		if (*p == '\t')
+			nr_instances++;
+	}
+
+	/* Parse the instance name to check the overlap */
+	boot_instances = kmalloc_array(nr_instances,
+				       sizeof(*boot_instances), GFP_KERNEL);
+	if (!boot_instances)
+		return;
+
+	nr_instances = parse_boot_instance_info(boot_instances, nr_instances);
+
+	for (int i = 0; i < nr_instances; i++) {
+		char *rname __free(kfree) = NULL;
+		phys_addr_t start = 0;
+		phys_addr_t size = 0;
+		unsigned long addr = 0;
+		bool traceprintk = false;
+		bool traceoff = false;
+		bool memmap_area = false;
+
+		bi = &boot_instances[i];
+
+		if (bi->backup) {
+			if (backup_instance_area(bi->backup, &addr, &size) < 0)
+				continue;
+		}
+
+		if (bi->flag_delim) {
 			char *flag;
 
-			while ((flag = strsep(&flag_delim, "^"))) {
+			while ((flag = strsep(&bi->flag_delim, "^"))) {
 				if (strcmp(flag, "traceoff") == 0) {
 					traceoff = true;
 				} else if ((strcmp(flag, "printk") == 0) ||
@@ -9814,35 +9889,35 @@ __init static void enable_instances(void)
 					traceprintk = true;
 				} else {
 					pr_info("Tracing: Invalid instance flag '%s' for %s\n",
-						flag, name);
+						flag, bi->name);
 				}
 			}
 		}
 
-		tok = addr_delim;
+		tok = bi->addr_delim;
 		if (tok && isdigit(*tok)) {
 			start = memparse(tok, &tok);
 			if (!start) {
 				pr_warn("Tracing: Invalid boot instance address for %s\n",
-					name);
+					bi->name);
 				continue;
 			}
 			if (*tok != ':') {
-				pr_warn("Tracing: No size specified for instance %s\n", name);
+				pr_warn("Tracing: No size specified for instance %s\n", bi->name);
 				continue;
 			}
 			tok++;
 			size = memparse(tok, &tok);
 			if (!size) {
 				pr_warn("Tracing: Invalid boot instance size for %s\n",
-					name);
+					bi->name);
 				continue;
 			}
 			memmap_area = true;
 		} else if (tok) {
 			if (!reserve_mem_find_by_name(tok, &start, &size)) {
 				start = 0;
-				pr_warn("Failed to map boot instance %s to %s\n", name, tok);
+				pr_warn("Failed to map boot instance %s to %s\n", bi->name, tok);
 				continue;
 			}
 			rname = kstrdup(tok, GFP_KERNEL);
@@ -9865,20 +9940,20 @@ __init static void enable_instances(void)
 				addr = (unsigned long)phys_to_virt(start);
 			if (addr) {
 				pr_info("Tracing: mapped boot instance %s at physical memory %pa of size 0x%lx\n",
-					name, &start, (unsigned long)size);
+					bi->name, &start, (unsigned long)size);
 			} else {
-				pr_warn("Tracing: Failed to map boot instance %s\n", name);
+				pr_warn("Tracing: Failed to map boot instance %s\n", bi->name);
 				continue;
 			}
 		} else {
 			/* Only non mapped buffers have snapshot buffers */
-			do_allocate_snapshot(name);
+			do_allocate_snapshot(bi->name);
 		}
 
-		tr = trace_array_create_systems(name, NULL, addr, size);
+		tr = trace_array_create_systems(bi->name, NULL, addr, size);
 		if (IS_ERR(tr)) {
-			pr_warn("Tracing: Failed to create instance buffer '%s' (%ld)\n", name,
-				PTR_ERR(tr));
+			pr_warn("Tracing: Failed to create instance buffer '%s' (%ld)\n",
+				bi->name, PTR_ERR(tr));
 			continue;
 		}
 
@@ -9899,12 +9974,12 @@ __init static void enable_instances(void)
 		/*
 		 * Backup buffers can be freed but need vfree().
 		 */
-		if (backup) {
+		if (bi->backup) {
 			tr->flags |= TRACE_ARRAY_FL_VMALLOC | TRACE_ARRAY_FL_RDONLY;
 			trace_array_start_autoremove();
 		}
 
-		if (start || backup) {
+		if (start || bi->backup) {
 			tr->flags |= TRACE_ARRAY_FL_BOOT | TRACE_ARRAY_FL_LAST_BOOT;
 			tr->range_name = no_free_ptr(rname);
 		}
@@ -9913,11 +9988,12 @@ __init static void enable_instances(void)
 		 * Save the events to start and enabled them after all boot instances
 		 * have been created.
 		 */
-		tr->boot_events = curr_str;
+		tr->boot_events = bi->events;
 	}
 
 	/* Enable the events after all boot instances have been created */
 	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
+		char *curr_str;
 
 		if (!tr->boot_events || !(*tr->boot_events)) {
 			tr->boot_events = NULL;
-- 
2.53.0
