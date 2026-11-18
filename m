Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982072;
	b=js+PrwBQarowBHvQJcuBiXH1dbH4opweumyVFdVPXotSezmeJnjbrH9U7OeiLER9SMi4
	 NX7OvAP6sh2jtXeauMjGH+TGxEXSDBjzr6BgQTifeJGcoyeX4GmVxjbTj3ZdHelRgyY2N
	 Ws/Ujec8pH9EQBwrZQ6S989vp0TMySnCG+pRwZ6X2rDBEPMVZzqJZenwTXJAYkRmRGCTK
	 9tz0LoY/EEGgr4q1h4vUJkxpWvwMlRwYhpMPuFSgaL5BObCWAdnFkPGcbd40iWhwMz+0Z
	 dKRauJoXCdraE1PsXxaT55xeJSpsvju1SE3g8nHz+fNxs7z5n94UmGZJwuOkcqGF1rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982072;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mixQF06bt60+GSa1+/+xgJtkVkATow9hbfa1bHpCroQ=;
	b=ySgh8Jnn6W0BndaBJYO9aNEqs23jjlFUEvzeAJSDPzQ+a5PPduBftDY0gwtnIWewSKNe
	 3IqmnK1kIxZDmYnGVMyu/fu0iw/3QPKbBO0dEToYTlyhssohsF4EnPhFoFjqghHLN/1gR
	 bsYv/HfxdlKEH6XeMZQmSj5WzaM7evsD/CBsALSEmf2N5Xto/1GutlcXPaxQlQRmpK5xc
	 OnW1mffzEFktBufkB/cL2KUGBzJmWFfdlDIzdDMFGFomSXPiLhEvYet5oHKGnIdKV0e3m
	 AMpsoP2ArXvGfQAI/QsegjcPQ23uaKXtAJtA1boPquz4gxdHoP0Kyyc6hRblaTkybAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F6MCcd0d;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9011606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9011606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F6MCcd0d
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so358207a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982071; x=1795586871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mixQF06bt60+GSa1+/+xgJtkVkATow9hbfa1bHpCroQ=;
        b=JP8GVwf71IwKK9j8PjEPaF8FGVSFCE8JILuguV2dPg/E3HkOnz7mHC0OPEjx2V/exr
         smEdzsx0jUFrMT9w/AjWIT/EKMyGhzAfmed/UOcXT9cVRMN9N/lBwBmxdnbFXUyHFgZy
         4CzuUiZMXkaccqlMQYqtzVrO9RBZMJNyYhQGNAxZLzVT0gbYPwqYty04WN5hguAkogVA
         hfzZSw11OK+IL0/ZxC/Gw/1hWn0jHGjCiW9gCPCVukB2EIEO0PQGAzBrKuG0WKaz3+R/
         oR8cmJh2jNFSpyIE4rLIkHl+JHESV1LFHX4rFE6JGLC7qBJOQdrTxxl0QIPzLJl1FLA8
         NgVg==
X-Forwarded-Encrypted: i=1; AL+hErGAPht7MWSJQJwvXHP3f54+5nbOxm4Ji79vEU4DBBo4jVMxr/MhYyr1SEbTlAC1RgAV273tXqKhCwIqIs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d00P2P3hDXnU/xw4HVp/KjDPopyCl6pOAVhv2uV2tpbqXIVAN
	+cPUZeJtYvRFJCIf2kxQh/i0UY3zdtC7EIZN0IE/BSPjPfbfCfOJRueThTa4jRufWTv8YOaTDtd
	PUk23jhqvzpUMvYVLKAu3EiARdNWgy4nbXlxKwFmdUYwm7PjXLCdfzC4GKKREc62RwUmDNeYYfJ
	dbKYnyW+qjnDsOWxlywWVqbaR1nVj/MRSrnRAN2Tk1Jr9/lRl1OsabsFBD1xaO2rxDNweqrovNG
	AaEmwyQ/5XjS7k2
X-Gm-Gg: AZFdTZeII99iuJzC9zl3BwvQJaXRXQS44bq23rHX5u6mKIs0zD6zdW5VVw/yZPxRS5/
	4qu/W7mQqEPX76FbISUhkVfxUDSJYmKvL2MUAXlVdyjFO7uXqVvhLLy60g5mxZGM7IxhBXEs6i/
	mym47rJLTwJQzt9odaHMDWckVqxQp0bzuDSRMf+MjdzhQk3Lh2aiMYXtG1RnegB20Z8nIbTjyiO
	RbU7jZt4tCscg1rfqGLzKfI/ODxBNsa83OkouQ0bAlL1QmSu9s2R3qic7a61FCcmTXMHXXbdbhW
	7I4M+IVhTnNu8lg4//CxU9XGMYwxocNvmNiOZujyPiYfPdKf8PrrHO8KCFswKkwMpeZGBaE5dTm
	fl0AL/SYzsLHLbvdPnA5gV14YvSwSs9ROlAL/GCAAN3jOif6EPgpjPyjtxYJtDkMEiXDZqW02jB
	M9rNc4Rhwix3NMxe8ls+8b7G+BUMStV6Uu
X-Received: by 2002:a17:90b:3807:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b3d0645d91mr1649159a91.4.1794982070884;
        Tue, 17 Nov 2026 22:07:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f98bdsm3638704a91.0.2026.11.17.22.07.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:07:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363763b556so11004391cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794982069; x=1795586869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mixQF06bt60+GSa1+/+xgJtkVkATow9hbfa1bHpCroQ=;
        b=F6MCcd0dHGDnzq+g6J1uSGDSp8nvMALZ7clwdHuoMOMHGLDDTPYL3sCVlg9/TdowfZ
         spd35uL8tcd68v0POsXvkrCoclrwnz/fJlbNh02nT3NFtUx9cA9jQkT9BKe3lDPMiYiv
         u4EVZydW8BSFWD6zHfJld1kpGgGEr3xonjPcg=
X-Forwarded-Encrypted: i=1; AL+hErHlDe+reURWKPT//bvw4oMlOwZzDY5v4aKIiGRjX0cL8l+5lBDbwo1+Yyie/98JDW/C9u/UK3FWzh8xjP4=@vger.kernel.org
X-Received: by 2002:ac8:5e53:0:b0:535:a5f9:7523 with SMTP id d75a77b69052e-55d5a7dfdb3mr23883531cf.66.1794981718881;
        Tue, 17 Nov 2026 22:01:58 -0800 (PST)
X-Received: by 2002:ac8:5e53:0:b0:535:a5f9:7523 with SMTP id d75a77b69052e-55d5a7dfdb3mr23882931cf.66.1794981718214;
        Tue, 17 Nov 2026 22:01:58 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:01:57 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v4 1/4] panic: Add a platform panic notifier list
Date: Wed, 18 Nov 2026 01:01:48 -0500
Message-ID: <3d156f7b5ec4f3d6f91e288a38f87d2368f1365f.1794980455.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794980455.git.zack.rusin@broadcom.com>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Some platforms set crash_kexec_post_notifiers so their crash handlers
run before kdump. That also runs every other panic notifier and kmsg
dumper before the crash kernel.

Add panic_notifiers_platform_list for platform callbacks that need to
run early and are safe while other CPUs are still running. Call it
from vpanic() before kdump and before stopping the other CPUs,
independently of crash_kexec_post_notifiers.

Also call it from __crash_kexec() if a crash kernel is loaded, since a
fatal oops can enter kdump without panic(). Call it before taking the
kexec lock, so a callback that panics can still enter kdump. Run the
list at most once, including when a callback panics.

Add disable_panic_notifiers_platform_list to skip these callbacks
when debugging panic or kdump failures.

Suggested-by: Petr Mladek <pmladek@suse.com>
Link: https://lore.kernel.org/r/ateYxCu63pRY9EGq@pathway.suse.cz
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v4: Call the list before kexec_trylock() in __crash_kexec(), and only
when a crash kernel is loaded, so a callback that panics on a direct
crash_kexec() can still enter kdump (reported by Sashiko).

v3: New. Replaces v2 patches 1-3 (pre-kdump list, crash-core call and
panic_pre_kdump_postpone) with the platform list Petr suggested: one
early call in vpanic(), one in __crash_kexec(), a shared guard and a
disable switch. The guard is a plain bool, because calls are
serialized, normally by panic_cpu.

 .../admin-guide/kernel-parameters.txt         | 12 +++++
 include/linux/panic_notifier.h                |  3 ++
 kernel/crash_core.c                           |  8 +++
 kernel/panic.c                                | 51 +++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..85ddcad397bf 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1308,6 +1308,18 @@ Kernel parameters
 			MTRR settings.  This parameter disables that behavior,
 			possibly causing your machine to run very slowly.
 
+	disable_panic_notifiers_platform_list=
+			[KNL] Skip the platform panic notifiers. They
+			normally run early in panic(), before kdump, and on
+			crash paths that enter kdump without panic().
+			Intended for debugging panic and kdump failures.
+			Skipping them may lose platform crash handling,
+			such as a copy of the kernel log on the hypervisor.
+			Format: <bool>
+			Default: 0
+			Writable at runtime via
+			/sys/module/kernel/parameters/disable_panic_notifiers_platform_list.
+
 	disable_timer_pin_1 [X86,EARLY]
 			Disable PIN 1 of APIC timer
 			Can be useful to work around chipset bugs.
diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index 41e32483d7a7..1eaf1ffba0bc 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -6,6 +6,9 @@
 #include <linux/types.h>
 
 extern struct atomic_notifier_head panic_notifier_list;
+extern struct atomic_notifier_head panic_notifiers_platform_list;
+
+void panic_notify_platform(void);
 
 extern bool crash_kexec_post_notifiers;
 
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..704a39875ea5 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -23,6 +23,7 @@
 #include <linux/objtool.h>
 #include <linux/delay.h>
 #include <linux/panic.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -126,6 +127,13 @@ static void crash_cma_clear_pending_dma(void)
  */
 void __noclone __crash_kexec(struct pt_regs *regs)
 {
+	/*
+	 * For crash paths that bypass panic(). Run before taking the kexec
+	 * lock, so a callback that panics can still enter kdump.
+	 */
+	if (kexec_crash_loaded())
+		panic_notify_platform();
+
 	/* Take the kexec_lock here to prevent sys_kexec_load
 	 * running on one cpu from replacing the crash kernel
 	 * we are using after a panic on a different cpu.
diff --git a/kernel/panic.c b/kernel/panic.c
index 91e48d33b7db..bb27c14ef9f0 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -62,6 +62,7 @@ static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
+static bool disable_panic_notifiers_platform_list;
 int panic_on_warn __read_mostly;
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
@@ -82,6 +83,10 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+struct atomic_notifier_head panic_notifiers_platform_list =
+	ATOMIC_NOTIFIER_INIT(panic_notifiers_platform_list);
+EXPORT_SYMBOL_GPL(panic_notifiers_platform_list);
+
 static void panic_print_deprecated(void)
 {
 	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
@@ -577,6 +582,47 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 
 void __weak arch_do_panic(void) {}
 
+/**
+ * panic_notify_platform - run early platform crash callbacks
+ *
+ * panic_notifiers_platform_list is for platform callbacks that need to
+ * run during a crash without requiring crash_kexec_post_notifiers.
+ *
+ * vpanic() calls this before kdump and before stopping the other CPUs.
+ * __crash_kexec() also calls it for crash paths that bypass panic(),
+ * if a crash kernel is loaded.
+ * Calls must be serialized across CPUs, normally by panic_cpu.
+ *
+ * The list runs at most once, even if a callback panics. Setting
+ * disable_panic_notifiers_platform_list skips the call without marking
+ * the list as run, so a call made after the switch is cleared can still
+ * run it.
+ *
+ * Callbacks receive a notifier value of 0 and NULL data. They must
+ * return NOTIFY_DONE; NOTIFY_STOP would skip the callbacks after them.
+ *
+ * Context: Callbacks run with interrupts disabled, possibly in NMI
+ * context. Other CPUs may still be running. Callbacks must limit their
+ * work and must not sleep, allocate memory, take locks, wait for other
+ * CPUs or invoke kexec.
+ */
+void panic_notify_platform(void)
+{
+	static bool done;
+	unsigned long flags;
+
+	if (READ_ONCE(disable_panic_notifiers_platform_list))
+		return;
+
+	local_irq_save(flags);
+	if (!done) {
+		done = true;
+		atomic_notifier_call_chain(&panic_notifiers_platform_list,
+					   0, NULL);
+	}
+	local_irq_restore(flags);
+}
+
 /**
  * vpanic - halt the system
  * @fmt: The text string to print
@@ -669,6 +715,9 @@ void vpanic(const char *fmt, va_list args)
 	 */
 	kgdb_panic(buf);
 
+	/* Before kdump and before stopping the other CPUs */
+	panic_notify_platform();
+
 	/*
 	 * If we have crashed and we have a crash kernel loaded let it handle
 	 * everything else.
@@ -1217,6 +1266,8 @@ core_param(panic, panic_timeout, int, 0644);
 core_param(pause_on_oops, pause_on_oops, int, 0644);
 core_param(panic_on_warn, panic_on_warn, int, 0644);
 core_param(crash_kexec_post_notifiers, crash_kexec_post_notifiers, bool, 0644);
+core_param(disable_panic_notifiers_platform_list,
+	   disable_panic_notifiers_platform_list, bool, 0644);
 core_param(panic_console_replay, panic_console_replay, bool, 0644);
 
 static int panic_print_set(const char *val, const struct kernel_param *kp)
