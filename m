Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013551;
	b=V7ABu3GR1Xgv7/ndjjDI/8TjMXZbyt9kyX4vaKq5sva980BW0wLiPFqzuJ0A9tqezmOH
	 q7R96vwOUMLo+Eq2VAPYz7sxWY/lXF2YwMMShs56NlsZDut0CkIJtTJiCJ/1BLT2e37UR
	 yjmV00VCQ3E0W4iHYR1yFQvLlX+wM83ZMPyfn6q08/LzWOx/+V62CD3N4OzL60SyboPbA
	 YNxj1URMfH4ElM6b5K+ABshSmsSwd2DSJffqvLsqW6SuZxUR9DcAtKchJ9kCQU5BtgJtE
	 lcMmJIhoqVPJEjfqlas9M8JOeWJ0y7nlif3mEEVIs1rXI5Oz38bkaa6yXkHHtLe2CzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=F0Lf2RemKJ8NFGdxBFKn/ZBk+HF8BSqxxMrrZGrxVcQ=;
	b=gDPJeDeOKhH6sv6VVtg4AThkCvkCWYAQKlgMhm3TUBbeAGSSwdvIYMMndPPO+ejBzo8c
	 tFVflmCSVKgNSh+YSj8gPa8TXIpNzqmRn+tcd4x6f/q8k8W5XdAECK0VWwOpMknKxbpLH
	 Yl/PD5czRLznHFdTfThGIg6+YhIfjdcMw6GcVuXq++y+tLZ/HLq62JUqgvEpzXpSrzQp1
	 AD6Rk0QKxazOTvkzwGjOWdM6/ppUT47cjLp217/UZb1L+860VGgMvLSYghDA9o3JKylWx
	 +tXzzov5+UYbaJ6ZpAajoti2W2dQhCjA9zZqqzNyKVQpFMnDn48fObv1FMYNHgjlQiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=0ZiY3vFI;
	arc=none smtp.remote-ip=185.125.25.15
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329C60A2620
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B329C60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=0ZiY3vFI
Received: from smtp-4-0001 (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jV4MC3HVFzwZN;
	Wed, 18 Nov 2026 15:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1795013543;
	bh=F0Lf2RemKJ8NFGdxBFKn/ZBk+HF8BSqxxMrrZGrxVcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0ZiY3vFI/82n1o0DFT6KN1mL3cvAOXw9a/VfogvxDjpTx7qs3KiMb9bGFGF9VSZoA
	 I/JMC6+Wm1Etvcuxpq7j8gexc2y6ZQyxnkgZdENjf8q/T6vY+c5gZchhsuMYx1X+9r
	 LPsd50+oImdoqfynESQgUWfmLHTTFpo+wBson7Bo=
Received: from unknown by smtp-4-0001 (Postfix) with ESMTPA id 4jV4MB0rpczWhb;
	Wed, 18 Nov 2026 15:52:22 +0100 (CET)
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
Subject: [PATCH v3 2/6] landlock: Mediate CAP_SYS_RAWIO for mappings below mmap_min_addr
Date: Wed, 18 Nov 2026 15:52:06 +0100
Message-ID: <20261118145217.2551053-3-mic@digikod.net>
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

commoncap's mmap_addr hook checks CAP_SYS_RAWIO for mappings below
vm.mmap_min_addr with cap_capable(), which skips the capable hook, so a
domain denying CAP_SYS_RAWIO cannot prevent these mappings.  Mapping the
lowest pages helps to exploit kernel NULL pointer dereferences.

Add a Landlock mmap_addr hook that checks CAP_SYS_RAWIO against the
domain under the same condition, as SELinux checks its own mmap_zero
permission in this hook.  commoncap runs first, so the hook only sees
mappings that commoncap allowed.  This also covers the x86 vm86(2) and
vm86old(2) system calls.  Calling capable() from cap_mmap_addr() would
instead expose this check to the capable hook of all LSMs.

Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <serge@hallyn.com>
Acked-by: Serge Hallyn (AMD) <sergeh@kernel.org>
Reviewed-by: Günther Noack <gnoack@google.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---

Changes since v2:
https://patch.msgid.link/20261117101157.2520463-3-mic@digikod.net
- Shorten the commit message (suggested by Günther Noack).
- Add Günther Noack's Reviewed-by.

Changes since v1:
https://patch.msgid.link/20261110202436.2408244-3-mic@digikod.net
- Add Serge Hallyn's Acked-by.
---
 security/landlock/cap.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/security/landlock/cap.c b/security/landlock/cap.c
index fa59118e3486..10e1ca772b9c 100644
--- a/security/landlock/cap.c
+++ b/security/landlock/cap.c
@@ -9,6 +9,7 @@
 #include <linux/cred.h>
 #include <linux/lsm_audit.h>
 #include <linux/lsm_hooks.h>
+#include <linux/security.h>
 #include <uapi/linux/landlock.h>
 
 #include "cap.h"
@@ -90,8 +91,29 @@ static int hook_capable(const struct cred *cred, struct user_namespace *ns,
 	return check_cap(cred, cap, opts);
 }
 
+/**
+ * hook_mmap_addr - Restrict mappings below dac_mmap_min_addr
+ *
+ * @addr: Address of the new mapping.
+ *
+ * cap_mmap_addr() requires CAP_SYS_RAWIO to map below dac_mmap_min_addr, but
+ * calls cap_capable() directly, which skips hook_capable().  Check the same
+ * condition against the domain.  commoncap runs first, so this only sees
+ * mappings that commoncap allowed.
+ *
+ * Return: 0 if allowed, -EPERM if CAP_SYS_RAWIO use is denied.
+ */
+static int hook_mmap_addr(unsigned long addr)
+{
+	if (addr >= dac_mmap_min_addr)
+		return 0;
+
+	return check_cap(current_cred(), CAP_SYS_RAWIO, CAP_OPT_NONE);
+}
+
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capable, hook_capable),
+	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
 };
 
 __init void landlock_add_cap_hooks(void)
-- 
2.56.0

