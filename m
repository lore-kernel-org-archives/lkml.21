Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678132;
	b=o98F2Vg2bpoN++ZmQXI2MZV4//d1lRB8UvDC74DZXDj8Q4TeWPpgA2GIKTUTcttdf6pK
	 1ef2BfycLVGIXFYWHh1Yz9/gJD4jbY8sXrO0e9KwvGzePGaiuSkHOIVRnjaT4/JRlZU/t
	 0HhqeURHBaWeuWWJWFmSiwF8CSLkjCd6qc/hRUrtt/WAiDvnqs7bJJZhpioyseAxKqlcV
	 KOC2fva7g+uyCeCSL1nFEojyoPNxWZrW3lgD0d+BkigU0KDxuHJBROx3fdWPv9Ro3R0iV
	 f+m/JRKeEYW00CR3abf0lUgtDoxNUb+jX9b8IT7a0pHKxFkIFrKncxJ2ivTlaWm4KRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZKygLtlmz59V0N/w8QgV02xDSy1geGC9X9NAkNdFK4=;
	b=YlWGneMvp2Fz69ncazTxG5ueS6DRouMtyHTu/qAyoo18HRjGxDSsGRI3JekMOv5MCikR
	 02aU+gJA4ASFs7SynjLXI3HIIxOWS7lbW45fdhHw3WPRNZlntuKTH1aN0IbT/mCF4ncY/
	 Jdry1TQX+6B6/BbiKMP+nBfZA+pSkl00xD1mLqNLZxvD1pl7TL9Od8t7i19aoO9J0YV5P
	 xYj1ocm1sZqS910KEG9QtfyqRlOO8UuLI5gQ512ggI+WGAu/147LKY5mZDTiePkI3NAa3
	 RvTshUAptsEQBfvhA86GUb2uedrESbxAFSJPovnTOhIBFsQR1nPozQ5CY7wcsM5o6eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFgmHnLm;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77649606A68C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77649606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFgmHnLm
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso3793625a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678132; x=1796282932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZKygLtlmz59V0N/w8QgV02xDSy1geGC9X9NAkNdFK4=;
        b=GFgmHnLmfMJ1MurIwtUyStcXNbBxaay9FhNRu2cCQxlfuwVcg+iCgKT0j30xEnqCfl
         /D8ASl/eUU9Isb1cCifU2oIvTYcltcV6Teuqx2JzpZHRNXr+snvloG4dI7/fcN/EglaK
         My5lThhnIW/KWLntGkgfEBwReR2/vcBgX2aybtUQe1zEt9qDH9J33jjXB1ynd4JMxXXq
         YACDQW0iHL6F8LjnabN5qOr7Xw/RCDtWVq1d/pSQ2dZM6WaO8RJySzYpLh5wuGySC7mn
         7Pk5YQR3mSKdCoqJUtvdOiLGSWZYfUsETm/BaJ1Z7nAFjgnVTljShhyKB/nOCQZmbIBq
         M68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678132; x=1796282932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZKygLtlmz59V0N/w8QgV02xDSy1geGC9X9NAkNdFK4=;
        b=FsroZhUjBGaqSLZt/161DvUDh7NhDKsR/2RFp1ZjCHrBVBPredp+a0SDx/aa82EK03
         FnmGB6YZW38001sGfGuTgoME5AvDQnmVtMRGkvGTUm2r68+rV2gzAOe8U2a1p/WbTOxk
         z/Ufp+eH4qjrr7F3De1bZi6Ait02k/qgAv/VVcVBTj3kIELUE+iIVDCSintOsH6Ox6qs
         /jBnTrtoqOTg3NgRImkCC7xgXUXRg246eJd8YIfs/EICpovRg2PsFL9xLXGF2hf3Meta
         baGxTZD/MQqv8QbDT5/3fl2jbeAEjH6gvPXDZGM44L+Cx2y6Fw7wZDfbUk6TASEpC2l7
         k35A==
X-Forwarded-Encrypted: i=1; AL+hErHpZqJGjK9kkvmwp9FtU4p6SwHGmn2XJ9t2VDpC9cnYiMQwwhYVFKWOvzJg907GvBP024Kw787z+3sDBgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wwkdyCzGmVa6ZGOPGaj075nqWsv7LuvsPe9U/N5tMNVGX7pAQ
	UXlVEiYblBy0gJ6+HWSR8NmmDJM00A/n6hy9vZDSBWnx9TG7Phv3tWk3
X-Gm-Gg: AZFdTZdyj/qadpRv5HdKnKBksr6XAiOssR/rNJzsAfFoNjOFwZwqW3cKCp8HmNtQqdb
	4mdrwwzdO2npOPBm9nC3J5++C5vthLhjGUhluM4dYsYwcxI5+0UnGa3mlqE2UtUhzhJ+JsZ2acO
	B0fdAvQIJMADelRGdXXNz+yJScwhl2fsm2R9kxsanv8VPPs7MCGCuvWiEs2HX8NqMbaPYtqFvAH
	ygODM5Pp2Qpq1RnYMhYF1jm+BEEaSafI5ILl12z6Whnn2ua465zqoHPvNhu/76ZQfdzZ8MMqM4s
	AjmuB6qEg9Yd8hKHZrgfzKkX7Sx+JtuaXoJhmnlA8AFoGQY01qGKzHA1oljrw3Cr3VoQuMWSLmE
	S2qFTXe+l7xT1oaTHQ0m0F7NSqxRbtVs9jWfTbhaArQ5+taPVcn6b1EyHGCDRDdA9b8msocwiFC
	iB7r7vR7rTY4HnJzyfAL/IPzpCj+/kyOIA9jDoAe2VI6K8FuMlfLnKwq/1bhBnf9LscRPqoUhJo
	xlna6LjJMf3FfyafsVn+BBGcX/qnYuJWoLzLzMed4PpCCaojz0RbnqfyDQRCBIVMSdSYYlJpeFL
	vmS1brgOkwgTHlAL/uCa9M+YUeYnj1GwO/SmKG4lTlSiCJj7DlfYpjFmix/6CSeNjRHNEXUcdmI
	wcuvwygqJp6Zq/kZx9Ax7Kw==
X-Received: by 2002:a17:90b:4d89:b0:3b5:29e:11aa with SMTP id 98e67ed59e1d1-3b5029e14b7mr1558186a91.43.1795678131781;
        Wed, 25 Nov 2026 23:28:51 -0800 (PST)
Received: from localhost.localdomain ([240e:46d:2300:827:b108:4552:5e9:4319])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm14772112a91.0.2026.11.25.23.28.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 23:28:51 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/2] livepatch: Protect the per-CPU stack buffer in klp_check_stack()
Date: Thu, 26 Nov 2026 15:28:28 +0800
Message-ID: <20261126072829.97792-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126072829.97792-1-laoar.shao@gmail.com>
References: <20261126072829.97792-1-laoar.shao@gmail.com>
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

klp_check_stack() stores the unwound stack into a per-CPU buffer and
requires preemption to be disabled. It currently relies on the caller for
that. However, on PREEMPT_RT even read_lock(&tasklist_lock) is a sleeping
lock. Therefore, we must disable preempt explicitly in klp_check_stack().

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/live-patching/sashiko-outbox-228569@kernel.org/
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/livepatch/transition.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transition.c
index 2351a19ac2a9..4739fc170f48 100644
--- a/kernel/livepatch/transition.c
+++ b/kernel/livepatch/transition.c
@@ -253,17 +253,27 @@ static int klp_check_stack_func(struct klp_func *func, unsigned long *entries,
  */
 static int klp_check_stack(struct task_struct *task, const char **oldname)
 {
-	unsigned long *entries = this_cpu_ptr(klp_stack_entries);
+	unsigned long *entries;
 	struct klp_object *obj;
 	struct klp_func *func;
-	int ret, nr_entries;
+	int nr_entries;
+	int ret = 0;
 
-	/* Protect 'klp_stack_entries' */
-	lockdep_assert_preemption_disabled();
+	/*
+	 * The unwound stack is stored in a per-CPU buffer, so preemption
+	 * must be disabled.  Do not rely on the callers for that: on
+	 * PREEMPT_RT even read_lock(&tasklist_lock) is a sleeping lock.
+	 * When called via task_call_func(), this is nested inside its
+	 * raw spinlock and is a no-op.
+	 */
+	preempt_disable();
+	entries = this_cpu_ptr(klp_stack_entries);
 
 	ret = stack_trace_save_tsk_reliable(task, entries, MAX_STACK_ENTRIES);
-	if (ret < 0)
-		return -EINVAL;
+	if (ret < 0) {
+		ret = -EINVAL;
+		goto out;
+	}
 	nr_entries = ret;
 
 	klp_for_each_object(klp_transition_patch, obj) {
@@ -273,12 +283,16 @@ static int klp_check_stack(struct task_struct *task, const char **oldname)
 			ret = klp_check_stack_func(func, entries, nr_entries);
 			if (ret) {
 				*oldname = func->old_name;
-				return -EADDRINUSE;
+				ret = -EADDRINUSE;
+				goto out;
 			}
 		}
 	}
 
-	return 0;
+	ret = 0;
+out:
+	preempt_enable();
+	return ret;
 }
 
 static int klp_check_and_switch_task(struct task_struct *task, void *arg)
-- 
2.52.0

