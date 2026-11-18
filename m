Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982039;
	b=CjgO89sCobuy4XbATlyGCLxdZWmKCgE+fT+cY2S/JYXqH0mwV2GXK7y/i2Df0Ci4y0pI
	 pJocdJL4vkN1l7OZFGZu/cVdTfOkFG1dLax89P3eX6UBCJP6VMQlAvJp70A3DogKmZLRc
	 ZhDUWVuaB4f89UL4Iy3wC1gcU2ChiqrNr3kt+gR6T4FRRk1QoSVirfDxAjB5nVIS4mcaE
	 Sxv9DJl9MEwk27goYPX4YxtkKeBff39YLKBDYAaYxMczuv8NUIjpuwayKUc8h+nNVIW/k
	 ZGe+SzAeJFJ7HqfQzJqO4ipinbTvPGkPBywPDiUzSdkUpS+gGRkdAWjonwrr9Dg1fjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982039;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=R4uwpzc2SXxT7GyHeLuy79qw30desez58Shax9ewH5U=;
	b=TySG5tGoThzFIvJcz9AFUpD53Kos+mXMJvWvZxaJ2hQUEuUyqpRzH3rJOPdT+WeGVQaN
	 scIWtRaq4/k/+6uulRXvPmK7dGj1r6eq5GQ8mg+PsvJNIMBzPuoI1a49wcSKBs5LRDnaU
	 c8Z/yrabnA/F4Qvd3USP2nUvvj7pzjCzenBuIMswTA2Xezl51ksm4PS8SIlfYphCkpT1q
	 pWVL+msbvKQcXYAk+6z6NeYUbwhFtfkav/TwC71GEL73j3jhZz728Ga3L+CuUlwnNyjO0
	 ELk6yi6D/DRSH3oR8ruaHSy5NN0uD3k8IgVZv5X806n3wiwtSlC2aclQMw8rwtyyVhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W8J2U6qm;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB71F606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB71F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W8J2U6qm
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-ccca948203aso387024a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982038; x=1795586838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4uwpzc2SXxT7GyHeLuy79qw30desez58Shax9ewH5U=;
        b=eueCUlimVBEI0ch2c4pb41D/6M2gs2hk3i46HTghtA2iej71cCFqiEy41/JRn8HmkO
         1imMqOXoazqqkMBjR9xDG/iLdcJhkCTT52XJ288lY7q403fXkM4wvl271iGZeijlPS23
         Ko5bLPgZ7uLa2ZLFUPpY9cqoEluVyoxOxEZfEZArCk9MD5sYpBIOmTwVl166eY75CNkZ
         dbdS7/PykcuegMqYlu0mocNb1CPWn4rz5RfvTO6JeJpYi2jr6bA8NODDTq+RJVeOzw5U
         CGOmu0c19z3TeXN+PvudzP0GYR5lHAvNsuJ+9y5qeYAiU8XNnOsIZTf/8ztWODKq9bRg
         /0yA==
X-Forwarded-Encrypted: i=1; AL+hErHwMwN9NgZVJ0i10At4z2WsctTWtrFudRBx+66SLlUgAIk7bduOvhBNs0kBAMa5McaEm4dgaXl/oMuB0a4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QUklVDL+7OsaievXhjsjkzuLixyyGzxLN29H6KuJNkYzIZ0dW
	5Y2MXchpryUj9XZoMQvfJBAvElPmZ6r4o1cAU/Pcw8Bp92m5w8TVd67Ubt94v2V5q4olEF/DsQ9
	HBGhPjcUANuKQAaokCBKhwnPIBLnmtyjpyLms4mDWAaC3yBCC8fei0mgxIkRFgwyeLKWyCZJDGu
	sKfbVOCh0eFqBewnZ0SxN37GdWOVlU5PIV5ekSbMHxXM+HXn3KuNimzBTZofXJBMEAm1eGUSqKi
	HXuxqbT++XubRAI
X-Gm-Gg: AZFdTZcBNZJVZIYXYigiquFPXJHB8pDO1b9nGkylIMoGgEoL9vkPSBVPv8k0t60/y98
	KIXuyoxyNFdAFVcVWFM1KCWxt3bVK+2UxNyihXRxuqm0k9z/aTdlsmsZt8knD4p7eWB9CP7VkwY
	YJ4Fl6+JKi0QmZAervbeaiSzYs+sCmvblWsuLJfpPCjVyPEolQr1ySeIts7fGe8SvxnUxKOgGgj
	nKvukw7y96LNng9tuWVZ5zod7wCeFPtbA4ejlTKFVDfDVREn0gUrGo/uA+7E4a3krXeMIfNpL6Z
	PPMIA40rSd/Eweah8cT+0vBUVvBxxIfOq+jCTfF+c1WNBXUIeDsCA3jKjqWMQtHjgf9j3yc7zLN
	X1ReO7uteNLexfQX94oJC4O0I0q/ut5Bno1TuBavFvPeK4DUK9d+Mrd2DSCM3RG11WCzTdSVyds
	axWMEzDzy7v6NvNQagXwQaN/lhdRITndLfoSc=
X-Received: by 2002:a17:90b:55c7:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b3d07c653amr1376578a91.32.1794982038112;
        Tue, 17 Nov 2026 22:07:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm3575253a91.6.2026.11.17.22.07.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:07:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so96624085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794982037; x=1795586837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4uwpzc2SXxT7GyHeLuy79qw30desez58Shax9ewH5U=;
        b=W8J2U6qmixe+IqMbx7SsfbfJHUoLDVChTNFb6nIjMvUZLJoVawyJ1w0h+skD4sAsxk
         Fso/iNuHFOamuO6swn1eBwJeQ+HbdnHXGoJOv71CmdGpiT+WwtxZSgQ7m+jb1R4zefi7
         8S6hWUO2KIPGIIPl0F1x3GsQ0Hug594xxHrnk=
X-Forwarded-Encrypted: i=1; AL+hErEAA5gwBKH8jp8qdwcY8W0DLL/xBq/ntm219tAx1rIG4PU5t505gXiuR26dOKNpu9aHaOLHmzAsVZKfnO8=@vger.kernel.org
X-Received: by 2002:a05:622a:4ccd:b0:536:6ff4:6528 with SMTP id d75a77b69052e-55d5a543d65mr25648301cf.23.1794981724871;
        Tue, 17 Nov 2026 22:02:04 -0800 (PST)
X-Received: by 2002:a05:622a:4ccd:b0:536:6ff4:6528 with SMTP id d75a77b69052e-55d5a543d65mr25647841cf.23.1794981724238;
        Tue, 17 Nov 2026 22:02:04 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:01:59 -0800 (PST)
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
Subject: [PATCH v4 2/4] x86/vmware: Add a bounded panic log sender
Date: Wed, 18 Nov 2026 01:01:49 -0500
Message-ID: <7e985e2aea6507a0444addd816d4251f78d048f6.1794980455.git.zack.rusin@broadcom.com>
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

A VMware guest may be unable to save its own logs after a crash. Copy
the newest kernel log records to the host's vmware.log before kdump,
so they remain available if the capture kernel fails.

Register the sender on the platform panic notifier list and send the
log through the low-bandwidth register interface. Allocate a fixed
8 KiB buffer during early init; 4 KiB can lose useful stack-trace
context. The callback allocates no memory and emits no printk
messages. Limit the transfer to the buffer size and make at most three
attempts, retrying only if a VM checkpoint interrupts the transfer.

Enable logging by default only in guests without memory encryption;
encrypted guests should send their log to the host only when an
administrator opts in. The copy is best-effort diagnostics; kdump does
not depend on it succeeding.

Suggested-by: Michael Kelley <mhklinux@outlook.com>
Link: https://lore.kernel.org/r/SN6PR02MB41574A11D309A0530C63E0FED4842@SN6PR02MB4157.namprd02.prod.outlook.com
Link: https://lore.kernel.org/r/20260309235250.2611115-3-alexey.makhalov@broadcom.com
Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v4: No change.

v3: Register on the platform list instead of the pre-kdump list. The
VMware code is otherwise unchanged from v2.

 arch/x86/include/asm/vmware.h |   1 +
 arch/x86/kernel/cpu/vmware.c  | 173 ++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index fb011cef01e7..dc3cf8123914 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -57,6 +57,7 @@
 #define VMWARE_HYPERVISOR_MAGIC		0x564d5868U
 
 #define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_MESSAGE		30
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index f7ab9e7902cf..0c6f7248a665 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -24,11 +24,16 @@
 #include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/export.h>
+#include <linux/kmsg_dump.h>
+#include <linux/mm.h>
+#include <linux/panic_notifier.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
 #include <linux/reboot.h>
+#include <linux/sizes.h>
 #include <linux/static_call.h>
+#include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
@@ -52,6 +57,23 @@
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
 
+#define VMWARE_MSG_STATUS_SUCCESS	BIT(16)
+#define VMWARE_MSG_STATUS_CPT		BIT(20)
+
+#define VMWARE_RPCI_PROTOCOL		0x49435052
+#define VMWARE_GUESTMSG_COOKIE		BIT(31)
+
+#define VMWARE_MSG_TYPE(n)		((n) << 16)
+#define VMWARE_MSG_OPEN			VMWARE_MSG_TYPE(0U)
+#define VMWARE_MSG_SENDSIZE		VMWARE_MSG_TYPE(1U)
+#define VMWARE_MSG_SENDPAYLOAD		VMWARE_MSG_TYPE(2U)
+#define VMWARE_MSG_CLOSE		VMWARE_MSG_TYPE(6U)
+
+#define VMWARE_LOG_BUF_SIZE		SZ_8K
+#define VMWARE_LOG_ATTEMPTS		3
+#define VMWARE_LOG_PREFIX		"log "
+#define VMWARE_LOG_PREFIX_LEN		(sizeof(VMWARE_LOG_PREFIX) - 1)
+
 struct vmware_steal_time {
 	union {
 		u64 clock;	/* stolen time counter in units of vtsc */
@@ -64,6 +86,12 @@ struct vmware_steal_time {
 	u64 reserved[7];
 };
 
+struct vmware_rpc_channel {
+	u16 id;
+	u32 cookie_high;
+	u32 cookie_low;
+};
+
 static unsigned long vmware_tsc_khz __ro_after_init;
 static u8 vmware_hypercall_mode     __ro_after_init;
 
@@ -142,6 +170,151 @@ static unsigned long vmware_get_tsc_khz(void)
 	return vmware_tsc_khz;
 }
 
+static int vmware_log_open(struct vmware_rpc_channel *channel)
+{
+	u32 info, id;
+
+	vmware_hypercall6(VMWARE_CMD_MESSAGE | VMWARE_MSG_OPEN,
+			  VMWARE_RPCI_PROTOCOL | VMWARE_GUESTMSG_COOKIE, 0,
+			  &info, &id, &channel->cookie_high,
+			  &channel->cookie_low);
+	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+		return -EIO;
+
+	channel->id = upper_16_bits(id);
+	return 0;
+}
+
+static int vmware_log_close(const struct vmware_rpc_channel *channel)
+{
+	u32 info;
+
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_CLOSE, 0,
+			  (u32)channel->id << 16, channel->cookie_high,
+			  channel->cookie_low, &info);
+
+	return info & VMWARE_MSG_STATUS_SUCCESS ? 0 : -EIO;
+}
+
+static int vmware_log_send_once(const struct vmware_rpc_channel *channel,
+				const char *buffer, size_t length)
+{
+	u32 info;
+
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDSIZE, length,
+			  (u32)channel->id << 16, channel->cookie_high,
+			  channel->cookie_low, &info);
+	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+		return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
+
+	while (length) {
+		size_t bytes = min_t(size_t, length, sizeof(u32));
+		u32 word = 0;
+
+		memcpy(&word, buffer, bytes);
+		vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDPAYLOAD,
+				  word, (u32)channel->id << 16,
+				  channel->cookie_high, channel->cookie_low,
+				  &info);
+		if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+			return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
+
+		buffer += bytes;
+		length -= bytes;
+	}
+
+	return 0;
+}
+
+static int vmware_log_send(const struct vmware_rpc_channel *channel,
+			   const char *buffer, size_t length)
+{
+	int attempt, ret;
+
+	for (attempt = 0; attempt < VMWARE_LOG_ATTEMPTS; attempt++) {
+		ret = vmware_log_send_once(channel, buffer, length);
+		if (ret != -EAGAIN)
+			return ret;
+	}
+
+	return -EAGAIN;
+}
+
+static int vmware_log_rpc(const char *buffer, size_t length)
+{
+	struct vmware_rpc_channel channel;
+	int close_ret, ret;
+
+	ret = vmware_log_open(&channel);
+	if (ret)
+		return ret;
+
+	ret = vmware_log_send(&channel, buffer, length);
+	close_ret = vmware_log_close(&channel);
+	if (!ret && close_ret)
+		ret = close_ret;
+
+	return ret;
+}
+
+static struct page *vmware_panic_page;
+static bool vmware_record_panic_msg;
+
+static int vmware_panic_log_notify(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct kmsg_dump_iter iter;
+	char *buffer = page_address(vmware_panic_page);
+	size_t length = 0;
+
+	if (!READ_ONCE(vmware_record_panic_msg))
+		return NOTIFY_DONE;
+
+	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);
+	kmsg_dump_rewind(&iter);
+	(void)kmsg_dump_get_buffer(&iter, true,
+				   buffer + VMWARE_LOG_PREFIX_LEN,
+				   VMWARE_LOG_BUF_SIZE - VMWARE_LOG_PREFIX_LEN,
+				   &length);
+	(void)vmware_log_rpc(buffer, length + VMWARE_LOG_PREFIX_LEN);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block vmware_panic_log_nb = {
+	.notifier_call = vmware_panic_log_notify,
+};
+
+static int __init vmware_panic_log_init(void)
+{
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_PRINTK) ||
+	    !hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	vmware_record_panic_msg =
+		!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+
+	vmware_panic_page = alloc_pages(GFP_KERNEL,
+					get_order(VMWARE_LOG_BUF_SIZE));
+	if (!vmware_panic_page) {
+		pr_err("failed to allocate panic log buffer\n");
+		return 0;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_notifiers_platform_list,
+					     &vmware_panic_log_nb);
+	if (ret) {
+		pr_err("failed to register panic log notifier: %d\n", ret);
+		__free_pages(vmware_panic_page, get_order(VMWARE_LOG_BUF_SIZE));
+		vmware_panic_page = NULL;
+	}
+
+	return 0;
+}
+early_initcall(vmware_panic_log_init);
+
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
