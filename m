Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536062;
	b=GKW2lOm8Rd6sU8Vl9sn57RIQ+16HngEHi0O5G4Qr+5isMUa0ylcBPmd6DHLOVwJAW0QM
	 /O9+Sdd6PGuBcD7wjfsxQMtR1EJal9/JrVTdjQkSue3O0GNj7dlBDQ/vD1O8MCpAo2SvX
	 4yv7X6KbkEPWTIjKVFAaEfSEy9IQJktZI7TGllGtzIjNwrCQmnbpU19vlnoVQJrfOS1OG
	 o84VMbFIwxRXlhN4REd4MFlZsiAw6pi4yOyWkb1di7BB4Exjb/KweHHIZJJHlq5v1NRWz
	 JeqleQJ2vupQPV87YUHw3nAsSskT5gKz1F5/KQ4ehSe3GDcu3/4X9gr7AVFRJKfBnIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536062;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=P/DvJ2vRZ8dB3FMLgxRKtDBnTYkrprwbvvpqR8tcuSw=;
	b=4dsrZzGC4/MN2JEX7Wn3O1+cBQ/OrbAHPXKt6XWArw+Du13IXpYrtnDWL4Xeo9wQr+sX
	 4FJxQcgOTbmf2UjvveK7UzEOGenIGLdSRyTQQDL0N2REpVU/1gsfeA+DgdLHP6/QOGM8s
	 HJlFXOZlrbcGmdIJpZhtr2Y/zcHOXUImW8Zn+7obbvQOndw/l+N0xI90XjorY93DtXdP2
	 y4B1rUxnfcyUa8DzoRaSDLlLCi0DLPigz+UyYJ+wlWRMBtw2RZE6O2emnzTnwJSydqm6f
	 0nZRTvxtjQxJMalXbHToIiDbzcks6k5YGNtGzkrLM7FpWjtCQz4AyT8n3oePyKqBUiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=aB2KrtcG;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="a/D28pZ0";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88386606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88386606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=aB2KrtcG;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=a/D28pZ0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78EBB222F2;
	Tue, 24 Nov 2026 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795536059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=P/DvJ2vRZ8dB3FMLgxRKtDBnTYkrprwbvvpqR8tcuSw=;
	b=aB2KrtcGZmdfhOtzISTeDeGJTe01UbsyW0wJL0IPhgq7v7UK77pyiAYdbYn31kRRpTOem3
	mG7Bt+U9ohTQBE5t9APKJaN8heXJ14JHdGtFCiu7H8fV0bhIAI/VNlRIeWj5UakAn7zC7q
	ZCijryk8MP035APcnTqMvfDWIHhE/yo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="a/D28pZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795536058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=P/DvJ2vRZ8dB3FMLgxRKtDBnTYkrprwbvvpqR8tcuSw=;
	b=a/D28pZ0961G7Xu9Ipa0/ic+tmNcAK3Fe5Sj+vYcF/ksv0Yq1yl3Kn01oOZjEDhYKjsJm6
	SEmDly5OCotCuMS/mpXq8XwRJ5yQ/tqEErKwwzxm+iJ8T5wnyJcvo8pF26briYOhggNJ8Q
	GThBJmvtfkObkUEW7mfdOxuaXNmMHG4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8493A1339F;
	Tue, 24 Nov 2026 16:00:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pi4gFrm0BWtKEAAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Tue, 24 Nov 2026 16:00:57 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: x86@kernel.org
Cc: mhocko@suse.com,
	kas@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Kees Cook <kees@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Naveen N Rao (AMD)" <naveen@kernel.org>
Subject: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential guests
Date: Tue, 24 Nov 2026 18:00:26 +0200
Message-ID: <20261124160025.738362-2-nik.borisov@suse.com>
X-Mailer: git-send-email 2.56.0
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
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linuxfoundation.org:email,arm.com:email,suse.com:email,suse.com:dkim,arndb.de:email,ellerman.id.au:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 78EBB222F2

From: Dan Williams <dan.j.williams@intel.com>

Nikolay reports that accessing BIOS data (first 1MB of the physical
address space) via /dev/mem results in a "crash" / terminated VM
(unhandled SEPT violation). See report [1] for details.

The cause is ioremap() (via xlate_dev_mem_ptr()) establishes an
unencrypted mapping where the kernel had established an encrypted
mapping previously. The CPU enforces mapping consistency with a fault
upon detecting a mismatch. A similar situation arises with devmem access
to "unaccepted" confidential memory. In summary, it is fraught to allow
uncoordinated userspace mapping of confidential memory.

While there is an existing mitigation to simulate and redirect access to
the BIOS data area with STRICT_DEVMEM=y, it is insufficient.
Specifically, STRICT_DEVMEM=y traps read(2) access to the BIOS data
area, and returns a zeroed buffer.  However, it turns out the kernel
fails to enforce the same via mmap(2), and a direct mapping is
established. This is a hole, and unfortunately userspace has learned to
exploit it [2].

This means the kernel either needs: a mechanism to ensure consistent
plus accepted "encrypted" mappings of this /dev/mem mmap() hole, close
the hole by mapping the zero page in the mmap(2) path, block only BIOS
data access and let typical STRICT_DEVMEM protect the rest, or disable
/dev/mem altogether.

The simplest option for now is arrange for /dev/mem to always behave as
if lockdown is enabled for confidential guests. Require confidential
guest userspace to jettison legacy dependencies on /dev/mem similar to
how other legacy mechanisms are jettisoned for confidential operation.
Recall that modern methods for BIOS data access are available like
/sys/firmware/dmi/tables.

Now, this begs the question what to do with PCI sysfs which allows
userspace mappings of confidential MMIO with similar mapping consistency
and acceptance expectations? Here, the existing mitigation of
IO_STRICT_DEVMEM is likely sufficient. The kernel is expected to use
request_mem_region() when toggling the state of MMIO. With
IO_STRICT_DEVMEM that enforces kernel-exclusive access until
release_mem_region(), i.e. mapping conflicts are prevented.

Cc: x86@kernel.org
Cc: Kees Cook <kees@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Link: https://sources.debian.org/src/libdebian-installer/0.125/src/system/subarch-x86-linux.c/?hl=113#L93 [2]
Reported-by: Nikolay Borisov <nik.borisov@suse.com>
Closes: http://lore.kernel.org/20250318113604.297726-1-nik.borisov@suse.com [1]
Fixes: 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()")
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>
Tested-by: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---

Resending this with the hope of either getting it accepted or arriving at a consensus
what exactly is missing so that I can take it from there and eventually get something
merged. As previously mentioned this results in real problems for confidential
guests both on TDX as well as SEV-SNP.

 arch/x86/Kconfig |  4 ++++
 mm/char-mem.c    | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3159852fd6b3..1490e0019c71 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -901,6 +901,8 @@ config INTEL_TDX_GUEST
 	depends on X86_X2APIC
 	depends on EFI_STUB
 	depends on PARAVIRT
+	select STRICT_DEVMEM
+	select IO_STRICT_DEVMEM
 	select ARCH_HAS_CC_PLATFORM
 	select X86_MEM_ENCRYPT
 	select X86_MCE
@@ -1490,6 +1492,8 @@ config AMD_MEM_ENCRYPT
 	bool "AMD Secure Memory Encryption (SME) support"
 	depends on X86_64 && CPU_SUP_AMD
 	depends on EFI_STUB
+	select STRICT_DEVMEM
+	select IO_STRICT_DEVMEM
 	select DMA_COHERENT_POOL
 	select ARCH_USE_MEMREMAP_PROT
 	select INSTRUCTION_DECODER
diff --git a/mm/char-mem.c b/mm/char-mem.c
index c5761ddedbd7..5d383befd87d 100644
--- a/mm/char-mem.c
+++ b/mm/char-mem.c
@@ -30,6 +30,7 @@
 #include <linux/uio.h>
 #include <linux/uaccess.h>
 #include <linux/security.h>
+#include <linux/cc_platform.h>
 
 #include "internal.h"
 
@@ -609,6 +610,15 @@ static int open_port(struct inode *inode, struct file *filp)
 	if (rc)
 		return rc;
 
+	/*
+	 * Enforce encrypted mapping consistency and avoid unaccepted
+	 * memory conflicts, "lockdown" /dev/mem for confidential
+	 * guests.
+	 */
+	if (IS_ENABLED(CONFIG_STRICT_DEVMEM) &&
+	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+		return -EPERM;
+
 	if (iminor(inode) != DEVMEM_MINOR)
 		return 0;
 
--
2.56.0

