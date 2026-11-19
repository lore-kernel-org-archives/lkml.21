Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116339;
	b=mpGXB2UBNyHjNmR+wKTfVaso1tIOS6vCGEaP1U8DQItq4oY8Ka1L1UWYb2gqo9AAufDk
	 x3A1ia87P7F+bx16XHmloMBdIqf9wsnOJ6QMdtus05tNdQeBuGlgtCdB1BnJHvQygN/bQ
	 6B3MEQJkqbl2Wg/eUAfHgfiCGiov97RZqKduujfVnF5q8291RlsBuCzIeAtr5IdLbbrFn
	 cbOLpG5Q6QyVA8ORhlFdODLoc3rQ1bLhO/HhXcMNwCEVDWKFFFlvbNbhWyT5briL9SmAq
	 ld8t0CsONHjxAqFVM3h8rPV5cpR2gvms21SM9u55YYqfPUFKUATA2ffrkh2cmf2g80g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
	b=tq5wag6l2/nKIhrGyhyf6BnJyKwz7azvzLHasRCKv8lpufA+6E+ROuXeDFKdqqZL4DeN
	 tEZpLS/VBxiuf7WF95pdo9NyPE2cillFSkbLIflAmqHeDWMZemougXjKYkl97F6e57GiZ
	 iSrviqI2SU4oFmBdDOyir0JddwqsPbhu919eBFGl53kQXnU6cNcjI+cXZ5uBq6JkSB3GG
	 fIDENb/LvROpZ1OYPPIkPRlWPEOdyZjlKuxUu/qKjo0zzh4a86hnpKeSgSmMZUmOUuyiB
	 QovTMLpunhNdgeQ25BjPXosN1SFC6gXQ2BvlnywgU3gZDVa4dNR1EhQTD5rbHWMQZSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="nkk/aHO+";
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5FC60A2616
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5FC60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nkk/aHO+
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-547ae874949so264549b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116338; x=1795721138; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
        b=nkk/aHO+iL/QVslKweTpGRJyta8pMKUanDqzsOYLUoHxYvHbcPk0K1oPjzbmUIgX5C
         a4ksEvuUXVb4knCRuLE/pngJN0Fu2U7Ksnr/txK6kZlULF0dMIonkXOHbeOOy6kXkLF0
         hVfNMJ3zBFp3whK2WapWwlMlx+6npAGmfKXoz3p7CihvOHcneCzBcGa76xjoOS4s2x8p
         V7MoBox3I5jV2aUG934ychxiasYie3HbUjHiyYnzAIkJmMHZ2tir8L0UT57NTHVWaibf
         +6uN66iZBFfXTXXFMLCcqQ9E/Qx4vuSInlbSJ/WlGdcn6yjZQcoU5sQtMa7Oi6dIP0VC
         1Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116338; x=1795721138;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
        b=QPrP+b7J2Rfysa1sjzFDfXCVGbaIgx2AclYqKdo45Sy7sXczGvSFScZ5p/0goaSPoi
         5mn5+b2YVU8GTmrovTAuV8BWXdRyzWSpbv1jhzSmQ8BeRW2zkHgjDWZ/Ep014++Jaor1
         HxU9kIfqdaJjjOpKmQgqzJ8AQnYjf/tpg8NyowRpBlgfRAxXkj7xeX0jhCfv4GI2T4cy
         OY5jzlGIPhNzgl6xaPbJorX1/dJYB4COS2sRLuk52hBwRWI4Nimumq9pMUd0MLA8m6HX
         tCMkN43yy3KjbrThNVRIjNRqPiFpz2iLxQmvUiABfUhtQQskOLWYAWNSYFKVcDAZS9Ee
         mSZw==
X-Forwarded-Encrypted: i=1; AL+hErH+3+32nCfgi4QjSdqsqv2PhQEnPG+C8zkRU4nzrc/f5TwdKgOo6O8nIQcHxNLf6LmdhXwhRHgZG20ZTMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z95c6Zjf5AVS5Gw40MjHuI2VG+9gQBVgr8DoQ2nqqS4OVrPrce3
	5slWF0U9+ug4YAbPWfo6cSrP6keJtLQcdq++QxAc70eXnLuwi2sU8OImy+9ucSaHyS/yLOBsWxq
	Zb3m7Niqutw==
X-Received: from ilmp8.prod.google.com ([2002:a92:c608:0:b0:51e:1b8:eceb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:c110:b0:576:4595:9836
 with SMTP id 5614622812f47-57a0ba52419mr994155b6e.40.1795116337420; Thu, 19
 Nov 2026 11:25:37 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:13 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-3-irogers@google.com>
Subject: [PATCH v4 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Reviewed-by: Srish Srinivasan <ssrish@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 395399bbab2c..f3f6ac25ea78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
+static void secvar_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type secvar_ktype = {
+	.release	= secvar_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.56.1.708.g77570a6a1d-goog

