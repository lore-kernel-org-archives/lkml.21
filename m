Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013554;
	b=EnSm2HyuoShEyuUmxu4uFAC2jp8eK3w4zGhoSIBLhfjWfSDznyMBl6demSk4TKc69iCX
	 p35P4Rvxeui5ckY7TwhPd7pr2SiruSe+2AgQyRQhV7eavVwTUN3+E8ybQtLts2AQKzfA3
	 Jt5qkPJEy9Je9s5B77OE0HNq0zE22b0akAMZ7/DmwTALk533Bf+WP2M+waz5406OWp+Z/
	 m6oLMsiU3zrXsMNHyK8kxx35919VMynuDutODQ1hXFIWSxzjSR4nWfqapJ/gktDCzdle8
	 dOcozXxt5JkMe4kUiaCunAZPZfVPqYRGZ/hwtPpVhxZ6ggjyrap9tlfc/FP7qoGiphA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=i2SaJ9gUHBIVMEOpLbqH7JalWM14u8n77eMtMyXyxbg=;
	b=hx3h9cdck2UQswIuZxURySI9oiJ0s4OIpmZPZK5OOoqT8zfBpCqk3TwVDmNdG7x803W7
	 wvc64ltH145UcNIr7BBLCnBYB5OkK+bqLBdVpua2q7ngEctT0bKNSVBOkt+VgeO+ddM6H
	 yniOQ0GPzXZ0suTbVe1rJSpCdS1Z1r6VsE+TO2O05WhsxONRBvyoShSxM8LcIe4VobKi7
	 DUnUuUTPgFVg1OgqkOi8OwFA4Nj/x9hAHf3D26lV+t0H3ruyIi5iZEsPLszOq3HmICV1l
	 zX03r+1d62AKbX5C9RLXkhIpKopBzV24zfvFXzS1wbTWHr0W0i34PNQbTvuqWp947sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=XZK6+8kd;
	arc=none smtp.remote-ip=45.157.188.12
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9895E60A260E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9895E60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=XZK6+8kd
Received: from smtp-4-0001 (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jV4MG49TYzFT3;
	Wed, 18 Nov 2026 15:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1795013546;
	bh=i2SaJ9gUHBIVMEOpLbqH7JalWM14u8n77eMtMyXyxbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XZK6+8kd2frcBtAqTEFNLewPr+xbEAFfdkVzTEOPbQEoVElQ/HyU/+G3HiDP+AbK+
	 D7q5kwB08IA7OYntK+6Ua4wIiYScuD8JdmvZvEtT94kv3eqP+q9ao45qb939OkFRuV
	 5fb4ln61MHUF7bmC/xb495d1CX7Av6ODQ8VFCCFQ=
Received: from unknown by smtp-4-0001 (Postfix) with ESMTPA id 4jV4MF1xhMzWhk;
	Wed, 18 Nov 2026 15:52:25 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v3 4/6] landlock: Mediate CAP_SYS_ADMIN for the admin memory reserve
Date: Wed, 18 Nov 2026 15:52:08 +0100
Message-ID: <20261118145217.2551053-5-mic@digikod.net>
In-Reply-To: <20261118145217.2551053-1-mic@digikod.net>
References: <20261118145217.2551053-1-mic@digikod.net>
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
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

With vm.overcommit_memory=2, __vm_enough_memory() keeps the admin
reserve for callers with CAP_SYS_ADMIN, which cap_vm_enough_memory()
checks with cap_capable(), so a domain denying CAP_SYS_ADMIN cannot
withhold this reserve, meant for an administrator to recover from memory
exhaustion.

Add a Landlock vm_enough_memory hook that withholds the reserve when the
domain denies CAP_SYS_ADMIN.  Like commoncap and SELinux, do not audit
this check: it runs for every accounted mapping and only selects a
limit.

Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <serge@hallyn.com>
Acked-by: Serge Hallyn (AMD) <sergeh@kernel.org>
Reviewed-by: Günther Noack <gnoack@google.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---

Changes since v2:
https://patch.msgid.link/20261117101157.2520463-5-mic@digikod.net
- Shorten the commit message.
- Add Günther Noack's Reviewed-by.

Changes since v1:
https://patch.msgid.link/20261110202436.2408244-5-mic@digikod.net
- Add Serge Hallyn's Acked-by.
---
 security/landlock/cap.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/security/landlock/cap.c b/security/landlock/cap.c
index cdb95b979eaa..caf514be3df0 100644
--- a/security/landlock/cap.c
+++ b/security/landlock/cap.c
@@ -141,10 +141,32 @@ static int hook_mmap_addr(unsigned long addr)
 	return check_cap(current_cred(), CAP_SYS_RAWIO, CAP_OPT_NONE);
 }
 
+/**
+ * hook_vm_enough_memory - Restrict the admin memory reserve
+ *
+ * @mm: Address space being charged (unused).
+ * @pages: Number of pages being charged (unused).
+ *
+ * cap_vm_enough_memory() lets CAP_SYS_ADMIN use the vm.admin_reserve_kbytes
+ * reserve, but calls cap_capable() directly, which skips hook_capable().  Check
+ * the same capability against the domain.  commoncap runs first, so this only
+ * sees tasks that commoncap let use the reserve.  Like commoncap, do not log
+ * denials: this only selects a memory limit.
+ *
+ * Return: 0 if the domain does not withhold the reserve, -EPERM if
+ * CAP_SYS_ADMIN use is denied.  An error does not fail the allocation by
+ * itself, but without the reserve, the allocation may fail with -ENOMEM.
+ */
+static int hook_vm_enough_memory(struct mm_struct *mm, long pages)
+{
+	return check_cap(current_cred(), CAP_SYS_ADMIN, CAP_OPT_NOAUDIT);
+}
+
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capable, hook_capable),
 	LSM_HOOK_INIT(capset, hook_capset),
 	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
+	LSM_HOOK_INIT(vm_enough_memory, hook_vm_enough_memory),
 };
 
 __init void landlock_add_cap_hooks(void)
-- 
2.56.0

