Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572410;
	b=BkDbEIh5uZ10xSDfvUUDKUtYsr+0fcghqXNT3TJcbLUKEyHENasbAKwQ7305c2YczLKa
	 oQ8eacnNHWHB6+C8ic1vNYYa4uc3GC34w7iKhG58sX55aehjDVzGu/VY9j13OWULNUfbP
	 ph2+bbe305rqKJnl4D9jw5Y7OJjBFP9A5tryTB1GAcwBr59MZWYdMQDaAco9lzSVucVt0
	 iI8MuzcBskJGEZelTI1GKPsGViWztT2nihz3HI4qtINzipwSP0JBHFvPBlPWAIJW7fYGN
	 JR6VXTIAc5nzJuNPxjrFXTYmlWVtI6tcp2ORFDocPfoIFiPnGAZXwaQD+HRN5f07J7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572410;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FyX242seVRW/trwxedsF+FQyEwOz95dVrUFGd4NHNos=;
	b=eWvSas7JdtUSgVPYrwsNAucLLS9GCp1bsNmDOgp5FUmkGdfFEz0qBEWurlC0KBFRoahl
	 5qkHlpd4cuFMYuSnca9WQ0jhMErBsYQ7F4xl5eRSRJrkrQhz6YRuZGySGEeoosEPf+Exl
	 BJ058f/5zY7rfJkvA8UTET7WpQ2Fm5HYCXiCAZHnUVE+zCaFKNdgW8WHwZJiUfXX8bo18
	 BgVFhEPFfbucZHK56d7RsHlPYgYAPwABAkuHsoqClxY+Fj/5gHWoPFGmZZHRkz5XJjTr3
	 PVB3VJsL4MjGWKeXDxoBoCWucnCnBnh6HsUA5Tx89FIpqPn+dFyqDXs5/WDkFxUFtbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQFXgaSt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D529606A692
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQFXgaSt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF151F000D2;
	Wed, 25 Nov 2026 02:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572410;
	bh=FyX242seVRW/trwxedsF+FQyEwOz95dVrUFGd4NHNos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FQFXgaStiv3qJ5Mvejjgep0quAZ/57duxxK0EZFnFoaDQYFRLtCjXPxcQOpfKCJYN
	 TzIwLqK3fP0VE0EQvglTXZXdVI9NRkYFjj6FOco7vET5dr7qx3Ff3AOPi6THtqeM1f
	 rXSscgdOHtVwzuCCxi5Cg68vY5CpI6hCKd1RiaCAF4Q442Fbc9QPHCe8r66uHxcXNG
	 nPj+vjaO6ljVDD91OWACVptJj5yVcG2tNlh+nbfxT7FSto+xkj508YUQKtMWAlKTNt
	 Jz6TvLeLkoKx+eHzZ9uG4gY+ZGBMgo0U4hsrohtcJhWdy+NBHZsjdvlyXQy6VBwbbn
	 6k4SLAYW95AEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chuck Wolber <chuck@wolber.net>,
	Frantisek Hrbata <fhrbata@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v3 16/19] gcov: fix gcov_info_add() merge semantics for IOR counters
Date: Tue, 24 Nov 2026 21:06:00 -0500
Message-ID: <20261125020603.3934222-17-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
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

gcov_info_add() unconditionally uses += to merge all counter types.
This is wrong for counters that use IOR merge semantics (bitwise OR),
such as GCOV_COUNTER_IOR and GCC 14's GCOV_COUNTER_CONDS (MC/DC
condition coverage). These counters store bitsets that must be merged
with |=, not accumulated with +=.

Detect IOR merge semantics by comparing the merge function pointer
against __gcov_merge_ior, matching how GCC's own libgcov identifies
merge semantics. This fixes the pre-existing bug for GCOV_COUNTER_IOR
and also enables correct merging for MC/DC condition coverage data.

Fixes: 5f41ea0386a5 ("gcov: add support for gcc 4.7 gcov format")
Signed-off-by: Sasha Levin <sashal@kernel.org>
Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>
---
 kernel/coverage/gcov/gcc_4_7.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/kernel/coverage/gcov/gcc_4_7.c b/kernel/coverage/gcov/gcc_4_7.c
index 8fa22ababd943..923cfb34966b2 100644
--- a/kernel/coverage/gcov/gcc_4_7.c
+++ b/kernel/coverage/gcov/gcc_4_7.c
@@ -18,6 +18,8 @@
 #include <linux/mm.h>
 #include "gcov.h"
 
+extern void __gcov_merge_ior(gcov_type *, unsigned int);
+
 #if (__GNUC__ >= 15)
 #define GCOV_COUNTERS			10
 #elif (__GNUC__ >= 14)
@@ -187,6 +189,15 @@ static int counter_active(struct gcov_info *info, unsigned int type)
 	return info->merge[type] ? 1 : 0;
 }
 
+/*
+ * Determine whether a counter uses IOR merge semantics (bitwise OR of
+ * bitsets). Used for condition coverage (MC/DC) and other IOR-based counters.
+ */
+static bool counter_is_ior(struct gcov_info *info, unsigned int type)
+{
+	return info->merge[type] == __gcov_merge_ior;
+}
+
 /* Determine number of active counters. Based on gcc magic. */
 static unsigned int num_counter_active(struct gcov_info *info)
 {
@@ -259,9 +270,17 @@ void gcov_info_add(struct gcov_info *dst, struct gcov_info *src)
 			if (!counter_active(src, ct_idx))
 				continue;
 
-			for (val_idx = 0; val_idx < sci_ptr->num; val_idx++)
-				dci_ptr->values[val_idx] +=
-					sci_ptr->values[val_idx];
+			if (counter_is_ior(src, ct_idx)) {
+				for (val_idx = 0; val_idx < sci_ptr->num;
+				     val_idx++)
+					dci_ptr->values[val_idx] |=
+						sci_ptr->values[val_idx];
+			} else {
+				for (val_idx = 0; val_idx < sci_ptr->num;
+				     val_idx++)
+					dci_ptr->values[val_idx] +=
+						sci_ptr->values[val_idx];
+			}
 
 			dci_ptr++;
 			sci_ptr++;
-- 
2.53.0

