Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857717;
	b=tZlQl6t/4UBJnX5j977IVVT/gw0hzYQZQVlo4Mw/FwOoVmoRbLRhnAKbbAqeOijReBGD
	 aIdir7Dp/Tm0tfvEVULbLW3cW/wh3h26zlCn3Z0d22XYd6GhVtGJuS9/PVz0E7W4vv/MU
	 k/tBKZjP5T/otVHS0A4Cl3iPENVOKXT19FChf4ra8U7Wb910mcvh9eGA7VYZfhKEGqVek
	 oMm9gbxRyQH02WSYRM33GzWfL6FpfZPEDMwUtUssqgMHtzerr/XW/0UF+Q7dbA9NEac8J
	 J1thfDMfoIVhYBFVQFxxD6QPcqfDHzFerXlHX8v1GvruZTiR5bf2R5M4h9pFFvTFgzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=S/tHl+2/aELrbIwf0Ksau3tprNWFE1rPE6zNQAZmUkc=;
	b=l1g/qqQOzQeRGJ8otWLTjHSFfv9ZaZcmK5UzHCfJsCuzSRxG2EoOQ9t5E9RSM+eNlSs2
	 /6y5xXM904QSKI1IePkAC9My1R+16NjKWvD5W0qJTaVWfHQTjlOhsC2nOz1QPJxcpJLCP
	 X5uXSiqaZJNT9chCj8hUUnAnTo6gAUaLHvN2jxmdT6RzHuqIwBz9U5HN7dOzuvLj8tq9p
	 PahqKEybBUeZjByn1+SWPvp4YKOZxzNTkw2NpN54cETTMCQo65hShgxYdyNMaTUIKefXQ
	 5H0k2yJ9L45MLkTGeS8s5m8o48qjUrHLXMPvC4+/xJ6ztZugjbocE6Qngh1iN3PNxcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=VMWs92Yg;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D230606A337
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D230606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=VMWs92Yg
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67bee1f693bso6875146d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857716; x=1796462516; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/tHl+2/aELrbIwf0Ksau3tprNWFE1rPE6zNQAZmUkc=;
        b=VMWs92YgLlFd/gtyY9CP5RuJ2c6iLZ6vYkKa0qJsrImBVWWU5tGnEOc34yTN8sc6Qh
         340PMZDfqBZ3e+0uQ43u9ruGUQZUiQ94tPo4J1y3CmoBWklEmGi3kHI/D/J62/2D5NND
         mSVr/PTv+VDP6CRtUTCwlp7wmXOnEdggEITQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857716; x=1796462516;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/tHl+2/aELrbIwf0Ksau3tprNWFE1rPE6zNQAZmUkc=;
        b=Tm5VwG+QrgLD2Z4UF7iJmZVlVUZiXY07PJYFRSVAyZUHcrWUv7Px7aQAwNvFYkcELT
         N9GokgNlIlYWpGx89WI0nQgEOMNrD7aejRBwscM+CkR/SRNpFo5aFtJYubgYQypbyj6Y
         VzxIq4W2K2caEuSG1E69UvlTNHfM1BbK0p6d2noTlb1F1BQi62pvogBwG2CXGspEP+35
         mq5X3m3b9bnaP8ohTE4xgMGkoIS/g9NQFqnTG++J3iW59/Q5r3QUeQyQ0RpRUOGYwNSL
         8X9Nq4RxTzcnEpEYLRsKA2XSACAFJy0Cvn8Mg836CDWCdjijuJewUht2ew9sa+1UrzRB
         aPSA==
X-Forwarded-Encrypted: i=1; AL+hErFnTfzwGlrAW2Zf7f4UhrqIVR0lmnqVLcQhwAMBsTNFLWoWYJDHcJ1SC3ZVOh/odcyv/fFvveyEVDj1h3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yQmnrroGI/hcb19lDBC9cD0otB7JVn4FQWS2q6QpX59HQy6f6
	OjoOYeYZ9TsRLj/psAb7GCml9pp8d24Iycc3isQtpUa/k245oD047LNk7x3dlBvjMsw=
X-Gm-Gg: AZFdTZejNup8SzByksTbYyC1GQJPTP1KFZSAUK8C0DtR05L6p1czGSQwRjHj5I6gdkb
	XY2ae83p4IUM158CqH/OtdaLpRmg8pXF5l/+sAymJEAUXW+lq/R1KAz+RKLLKAicNy3eTOMRdiD
	8vitA59thEzfsgJT/vs7yamcFXahQ8z1zKucJCFuVOpdtQajW6IKLJA9WbxxtrPRl7y69ZXP/hF
	pRANxGpC9wHeRyLZ5a3UhUNMQB+sIgdr3Gz32TL1+mtJUyTzD3K01Rbgw188D3H6SiPDhGhliXU
	0xrdmoc4R407/fetOo6qF+qxJUzpxbqfuJwc0H4dcK1uX34xJXrq5peh/UGI8ANHZwk8jAJZxcz
	q2SX4nY2TmgKlJ0DtLU2W7qe+R42BN5behoLE6l+K0tEGuPEiubo50Qx5gPljgKaoc2x24Z0J+G
	uFW8no55g/DZyMVgsPtVR3+kQOI+qKwqm0X7/MLndWG8Smv5LllTclLTmn6Eu07t6lRFEbw1pR+
	QSb0PCxWuEGoGzp4r1LF0wRcuexvNgB6TkeSYag+f+pZbJ8JX3fNH+XhjBTCTqBIUqt1Z7mDvJ/
	+T6XeZ+fYVJyXBvC22WgouhX+eL3nQogeXyq4gLOHCyWyqu6ZYdeMgmZ+7BXIpHf+5qn5qvbajg
	JJPkGfQHUkgHkxN0py0OR2Psz+kk/UaFf34rFvXtpKjGQ2vGAAX7wpDaO7OtVvxiRMkwNsG72cP
	Sjt3kceqeN5V1k8viPPTksXXqq7RTmFCDj2r6942K6U6vN30G62+5Ck/YsGQeP58bNcXcMq1cGp
	wWYrV69dug1k7nc0lUp5Tc=
X-Received: by 2002:a05:690e:b8d:b0:679:cc49:55cb with SMTP id 956f58d0204a3-67df44b8ae6mr13485805d50.99.1795857715699;
        Sat, 28 Nov 2026 01:21:55 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33e01e1sm12359048d50.23.2026.11.28.01.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:21:55 -0800 (PST)
Date: Sat, 28 Nov 2026 01:21:52 -0800
Message-ID: <ea408fb02711a52bdd9aef4650c7079945a2bb71.1795835884.git.chris@chrisdown.name>
In-Reply-To: <cover.1795835884.git.chris@chrisdown.name>
References: <cover.1795835884.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 2/2] kho: don't fail kho_init() when debugfs is disabled
To: rppt@kernel.org,
    pasha.tatashin@soleen.com,
    pratyush@kernel.org
Cc: graf@amazon.com,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

kho_init() fails if kho_debugfs_init() or kho_out_debugfs_init() can't
create their debugfs entries, and a failed kho_init() turns KHO off.
That made sense while KHO could only be finalised through debugfs, but
commit 03d3963464a4 ("kho: make debugfs interface optional") made the
debugfs interface optional, and these days KHO doesn't need any of its
files to work.

This is a problem because debugfs can be disabled at boot with
debugfs=off, or by default with CONFIG_DEBUG_FS_ALLOW_NONE, in which
case every attempt to create a debugfs entry returns -EPERM. Given that
CONFIG_KEXEC_HANDOVER_DEBUGFS defaults to y when KHO is built in, KHO
and LUO can't be used at all on such a kernel. With kho=on liveupdate=on
debugfs=off, /dev/liveupdate never appears and a kexec hands nothing
over. kho_init() doesn't log why, so the only sign of it is the
WARN_ON_ONCE() that LUO then trips in kho_radix_add_key().

So, let's carry on without the debugfs entries when they can't be
created, as kho_in_debugfs_init() already does for the incoming FDT.

Two things then run without KHO's debugfs directories for the first
time. kho_debugfs_blob_add() would fail and trip the WARN_ON_ONCE() in
its callers, so let's make it do nothing when it has no directory to add
the blob to. kho_in_debugfs_init() would log an error on every KHO boot,
so let's make it return early when the kho directory doesn't exist.

With this applied, test_kho and luo_kexec_simple both get their state
back across a KHO kexec between two kernels booted with debugfs=off.

Fixes: 03d3963464a4 ("kho: make debugfs interface optional")
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/liveupdate/kexec_handover.c          |  9 ++-------
 kernel/liveupdate/kexec_handover_debugfs.c  | 19 +++++++++++--------
 kernel/liveupdate/kexec_handover_internal.h |  8 ++++----
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 663dd22e7172..4cee37ad9426 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1847,13 +1847,8 @@ static __init int kho_init(void)
 		goto err_free_kho_radix_tree;
 	}
 
-	err = kho_debugfs_init();
-	if (err)
-		goto err_free_fdt;
-
-	err = kho_out_debugfs_init(&kho_out.dbg);
-	if (err)
-		goto err_free_fdt;
+	kho_debugfs_init();
+	kho_out_debugfs_init(&kho_out.dbg);
 
 	err = kho_out_fdt_setup();
 	if (err)
diff --git a/kernel/liveupdate/kexec_handover_debugfs.c b/kernel/liveupdate/kexec_handover_debugfs.c
index 3a91c47ad7a6..cedfc955391a 100644
--- a/kernel/liveupdate/kexec_handover_debugfs.c
+++ b/kernel/liveupdate/kexec_handover_debugfs.c
@@ -59,6 +59,10 @@ int kho_debugfs_blob_add(struct kho_debugfs *dbg, const char *name,
 	else
 		dir = dbg->sub_fdt_dir;
 
+	/* The directories are NULL if they could not be created. */
+	if (!dir)
+		return 0;
+
 	return __kho_debugfs_blob_add(&dbg->fdt_list, dir, name, blob, size);
 }
 
@@ -101,6 +105,9 @@ __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 
 	INIT_LIST_HEAD(&dbg->fdt_list);
 
+	if (IS_ERR(debugfs_root))
+		return;
+
 	dir = debugfs_create_dir("in", debugfs_root);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
@@ -129,7 +136,7 @@ err_out:
 	}
 }
 
-__init int kho_out_debugfs_init(struct kho_debugfs *dbg)
+__init void kho_out_debugfs_init(struct kho_debugfs *dbg)
 {
 	struct dentry *dir, *f, *sub_fdt_dir;
 
@@ -137,7 +144,7 @@ __init int kho_out_debugfs_init(struct kho_debugfs *dbg)
 
 	dir = debugfs_create_dir("out", debugfs_root);
 	if (IS_ERR(dir))
-		return -ENOMEM;
+		return;
 
 	sub_fdt_dir = debugfs_create_dir("sub_fdts", dir);
 	if (IS_ERR(sub_fdt_dir))
@@ -155,17 +162,13 @@ __init int kho_out_debugfs_init(struct kho_debugfs *dbg)
 
 	dbg->dir = dir;
 	dbg->sub_fdt_dir = sub_fdt_dir;
-	return 0;
+	return;
 
 err_rmdir:
 	debugfs_remove_recursive(dir);
-	return -ENOENT;
 }
 
-__init int kho_debugfs_init(void)
+__init void kho_debugfs_init(void)
 {
 	debugfs_root = debugfs_create_dir("kho", NULL);
-	if (IS_ERR(debugfs_root))
-		return -ENOENT;
-	return 0;
 }
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index e9685e1ef6d7..424467a98da2 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -23,17 +23,17 @@ extern struct kho_bootmem *kho_bootmem;
 extern unsigned int kho_bootmem_cnt;
 
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUGFS
-int kho_debugfs_init(void);
+void kho_debugfs_init(void);
 void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
-int kho_out_debugfs_init(struct kho_debugfs *dbg);
+void kho_out_debugfs_init(struct kho_debugfs *dbg);
 int kho_debugfs_blob_add(struct kho_debugfs *dbg, const char *name,
 			 const void *blob, size_t size, bool root);
 void kho_debugfs_blob_remove(struct kho_debugfs *dbg, void *blob);
 #else
-static inline int kho_debugfs_init(void) { return 0; }
+static inline void kho_debugfs_init(void) { }
 static inline void kho_in_debugfs_init(struct kho_debugfs *dbg,
 				       const void *fdt) { }
-static inline int kho_out_debugfs_init(struct kho_debugfs *dbg) { return 0; }
+static inline void kho_out_debugfs_init(struct kho_debugfs *dbg) { }
 static inline int kho_debugfs_blob_add(struct kho_debugfs *dbg,
 				       const char *name, const void *blob,
 				       size_t size, bool root) { return 0; }
-- 
2.56.1

