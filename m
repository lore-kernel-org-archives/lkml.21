Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729688;
	b=dRGpMsVqRzjlhh7v5QzBpvlfRu5FKEYdNBkvwpqpjp87ZSERHJwaX9X+A1notEBOWqpu
	 kDQzfXmCOskT1ioKCajPAFUj6Rs+ZmO73S6FebrRvyIeQNPTe0sUw1sORtD5ddLtLi/Nv
	 lw5jtzTPhEpPTqtGS9P69oIPWMuFKLgjA4g/C6Yr74VdDldATNzZo/UB3vxvVmk+6DfF3
	 qoBHPTEuU/MXBETvsNC8MF77wj/c4lp+PleIMS8T5rRO1LpUknkv73uvJ5swWYWDU8TXC
	 b55QqGQndM7uh6ZO0BXWMsFNP1ODWDyOlyxm9LycHcrMMOTHowcNcE0yTVY3DW2cFjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729688;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KPl/IspBFUoszKD2U7Ik6G1jfEZeRIzH5GpGBacALBA=;
	b=apacjmIP2QazXx7eq98TbNF9mNw6X3o3v7rLDoep/AyJEhbTRtQijwy3OG0lmtC/VtEq
	 0lv99VlgYqTTSRGN0C8q0gcDHI2Yn7caJOzGD82B8q3Q2/FSC68ZzuYX9jFns4FPEa6xP
	 +EP6DTAiYzHHzzYTd1nfwjmFlb1YAXsPPWjSO/WaK2HKtR3ZI9c8KT+/Ralia6mpS6uGT
	 WpL+rCENMi92yMNWcUcn3qsipSjl1gm79yw1WiqklDAWaqpfHyp0wr5yMtEbIzwZ8XG9I
	 mKakU/YIPDO4Z02AQ4OV03wcLNb67xRpHA/tOEiKlUSM+l+WJjyJohdtnpbJd8lkp9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bFnsuLTC;
	arc=none smtp.remote-ip=95.215.58.253
Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53677606A333
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53677606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bFnsuLTC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8CU31oLH3Irsszkvv3l8tO/0NdeKi1eyValZKt6R18s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795729685; v=1; x=1796334485;
 b=bFnsuLTCUrjuuQ9HojKftExq7uLXUgGnJQ7fCWskys95LcjkUfiP5CVmMngkDO2d8D3CYwJ0
 FFWK6DSv23EFTjjgBWhXtKmDBVRYDagZDBMiVG8/VRanF2UM7I1Fvkg/4a1ZLyGQh/MK5cG8i10
 vdwqKp9V6YXaa4wLAbOaBF9s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 35b97109d6c465ff;
	Thu, 26 Nov 2026 21:48:05 +0000
X-Mizu-Trace-ID: 35b97109d6c465ff
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Chris Zankel <chris@zankel.net>,
	Andrew Davis <afd@ti.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <bradley.morgan@linux.dev>
Subject: [PATCH 2/2] reboot: register legacy pm_power_off once at boot
Date: Thu, 26 Nov 2026 21:47:54 +0000
Message-ID: <20261126214754.3630965-3-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126214754.3630965-1-bradley.morgan@linux.dev>
References: <20261126214754.3630965-1-bradley.morgan@linux.dev>
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

In do_kernel_power_off(), the legacy pm_power_off wrapper gets registered
on the fly and unregistered right after walking the poweroff chain. If
pm_power_off is set, calling do_kernel_power_off() from xmon while
system_state is still SYSTEM_RUNNING ends up calling kzalloc_obj() with
GFP_KERNEL in atomic context, and on arches like arm64 or x86 that
disable IRQs and stop the other CPUs before calling it, returning from
pm_power_off() hits synchronize_rcu() in unregister_sys_off_handler()
with interrupts disabled and secondary CPUs halted.

To fix this, register legacy_pm_power_off once at core_initcall using a
static notifier_block at priority SYS_OFF_PRIO_DEFAULT - 1 so default
priority handlers still run ahead of it, and count registered
SYS_OFF_MODE_POWER_OFF handlers in power_off_handlers so
kernel_can_power_off() does not treat the static wrapper as a real one.

Fixes: 2b8c612c6102 ("kernel/reboot: Fix powering off using a non-syscall code paths")
Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 kernel/reboot.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 87f307ab46faa..12449adfcc61a 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -347,6 +347,7 @@ static BLOCKING_NOTIFIER_HEAD(power_off_prep_handler_list);
  *	to power off system.
  */
 static ATOMIC_NOTIFIER_HEAD(power_off_handler_list);
+static atomic_t power_off_handlers;
 
 static int sys_off_notify(struct notifier_block *nb,
 			  unsigned long mode, void *cmd)
@@ -493,6 +494,9 @@ register_sys_off_handler(enum sys_off_mode mode,
 		return ERR_PTR(err);
 	}
 
+	if (mode == SYS_OFF_MODE_POWER_OFF)
+		atomic_inc(&power_off_handlers);
+
 	return handler;
 }
 EXPORT_SYMBOL_GPL(register_sys_off_handler);
@@ -520,6 +524,9 @@ void unregister_sys_off_handler(struct sys_off_handler *handler)
 	/* sanity check, shall never happen */
 	WARN_ON(err);
 
+	if (!err && handler->mode == SYS_OFF_MODE_POWER_OFF)
+		atomic_dec(&power_off_handlers);
+
 	free_sys_off_handler(handler);
 }
 EXPORT_SYMBOL_GPL(unregister_sys_off_handler);
@@ -660,7 +667,8 @@ void unregister_platform_power_off(void (*power_off)(void))
 }
 EXPORT_SYMBOL_GPL(unregister_platform_power_off);
 
-static int legacy_pm_power_off(struct sys_off_data *data)
+static int legacy_pm_power_off(struct notifier_block *nb,
+			       unsigned long mode, void *cmd)
 {
 	if (pm_power_off)
 		pm_power_off();
@@ -668,6 +676,20 @@ static int legacy_pm_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static struct notifier_block legacy_pm_power_off_nb = {
+	.notifier_call = legacy_pm_power_off,
+	.priority = SYS_OFF_PRIO_DEFAULT - 1,
+};
+
+/* Keep pm_power_off static so do_kernel_power_off() cannot sleep */
+static int __init legacy_pm_init(void)
+{
+	atomic_notifier_chain_register(&power_off_handler_list,
+				       &legacy_pm_power_off_nb);
+	return 0;
+}
+core_initcall(legacy_pm_init);
+
 static void do_kernel_power_off_prepare(void)
 {
 	blocking_notifier_call_chain(&power_off_prep_handler_list, 0, NULL);
@@ -683,23 +705,7 @@ static void do_kernel_power_off_prepare(void)
  */
 void do_kernel_power_off(void)
 {
-	struct sys_off_handler *sys_off = NULL;
-
-	/*
-	 * Register sys-off handlers for legacy PM callback. This allows
-	 * legacy PM callbacks temporary co-exist with the new sys-off API.
-	 *
-	 * TODO: Remove legacy handlers once all legacy PM users will be
-	 *       switched to the sys-off based APIs.
-	 */
-	if (pm_power_off)
-		sys_off = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
-						   SYS_OFF_PRIO_DEFAULT,
-						   legacy_pm_power_off, NULL);
-
 	atomic_notifier_call_chain(&power_off_handler_list, 0, NULL);
-
-	unregister_sys_off_handler(sys_off);
 }
 
 /**
@@ -710,8 +716,7 @@ void do_kernel_power_off(void)
  */
 bool kernel_can_power_off(void)
 {
-	return !atomic_notifier_call_chain_is_empty(&power_off_handler_list) ||
-		pm_power_off;
+	return atomic_read(&power_off_handlers) > 0 || pm_power_off;
 }
 EXPORT_SYMBOL_GPL(kernel_can_power_off);
 
-- 
2.53.0

