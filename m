Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116366;
	b=RWgDDtc5t1KdvpqvrhAfImywE/7vnFXLstRtnHw52eKbyuoTwFNYZufU67r/3NIEAzuy
	 PaiDoIIMIe/i7FC1BcMUspKcE2x3vNozflBuFGO7PynhCEHOpiGXw8v9Fg3HhdcLyzBJ2
	 W3ArH89nMNYuxMq+R8bv4IP/xWzoNRsOZG7dLp2oed5vIpBDactyXTwIssMZC4556/bJg
	 uZvaa4oLU1xd0Ga/8JfwOUE0iP88jdjN5i8lWTL9F7dng8ZwOsVGHywZU1ObRNkviheis
	 wfq3PhC+vKvcSrr6YVotAyjB9V8YbdfbiHJi7+MVuvlnvdD06zGNxVqWudbs3vEO+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
	b=3JkFWBXtrBNUjmsudEZwOvahyGhcPpDbXMFqrX1r6OOJcWkotpI1HZAP/QKlkljwhzQz
	 asE1Uc3R7068wig+Cac8HyqIFy08KNEqLtQsA8xTkc10NaLmsY5cl4U1j4yUATpUbyHz0
	 n4rTZKQ0dDUCd/SWZhroK33CQqpO+fNpqP5EYaQbpLqUeIYUDqCxQ8iiTcfLyCSBve6eB
	 tqpNI3CqWUQRSZZgkQ5DyiIQjOF8DyB25ro26ld4s7kAnhNWlfzrrrpCASxlC2J70lrmR
	 /+nHr5WAWjlX2VABX0AqKpuz4jl5w+K5ErUPZ11/yVSEfekpDEUwOrC2u8YIasLPD2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YBs2MILh;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7860A2605
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D7860A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YBs2MILh
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so208747a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116365; x=1795721165; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
        b=YBs2MILhY55v/SQ9iMjVlWdkJSBzZbgx5TLpNUcSvwgq3Gdne+kN7UT++5xPGbIvcu
         zpAsOJF+l1PQ7rw6NT5HgqNxfyjPyVlFhUdCjzG7QGGL+uAb4ICaAwb5stgzbIeEfbLE
         7cI61IS+kgKB1/2eFv5klLhq0pEGNxrWC9dgayA/cO0BJW6Sofi6OpF8HHlceAfJRokM
         +37qb2fcqv4ope/hJrwW8KDGoPrN74g1yYsMWOjugLtfhwQtS2IUt3wh8CmE9xrZUTGj
         0+bYgRis47zEVPDEs08p12qXfrQFKibsGqHzmxJsIPEhMqyH3chzIPPz+w8KbBuqoUrZ
         /HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116365; x=1795721165;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
        b=T64DPmWDaGG5xsT1bdHMYrnH19KJpknxSrBg03JH6bad503dBwzKAueUdVDQWQ48P0
         D+13wLIiTyD/f8SMFTdX5T0Ml1C/qqNmjS7RNWrpIHD72bwTUdDIfP17SKxdUmGNKSbr
         J0QoSeB7kJCLkC0kTXP1LEIYNd0Z+nesTisZ02h6dndJAxOdzwrdSYYpyytEhw5NZNOT
         elBjAaKARlClnpVjThQTvO0JbiYyXNPARBfhmc7WrbsO/dC9MI0c0KEylwAn8j7/tZfI
         /LxomuSTU5ZXLQx2ohNe3XvWLvvW84OA13/3OHPT2ywN323wMYoTmZQWIDgXGoIq4wac
         nHpg==
X-Forwarded-Encrypted: i=1; AL+hErEbolWdGikfMRDEUlQk2Ja0njH5Ok/ZZdRRGVgo60Z065xBW4iqyqivjcrDAw1OoegLP76aZ/nYOXLA5WI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lEVBdGF4044QWYobDRH0kGnKx8HBxv/ol6IFanA5RTE0KB64z
	k6aVs2SOV/VbGuM8XMfeoaQYyhijucyYVMxOzDs4x3H4Ae5IRfb23dq3Lt/NpyYWxMXmPVnFDwD
	D2h29nn3DhQ==
X-Received: from pjbsk16.prod.google.com ([2002:a17:90b:2dd0:b0:3b3:ada0:c008])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c03:b0:3b4:1bf1:988f
 with SMTP id 98e67ed59e1d1-3b41cb138f0mr288962a91.54.1795116364835; Thu, 19
 Nov 2026 11:26:04 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:18 -0800
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
Message-ID: <20261119192520.1983406-8-irogers@google.com>
Subject: [PATCH v4 7/9] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
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

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 2e3cbf425804 ("ubifs: Export filesystem error counters")
Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/ubifs/sysfs.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index dbf967dcf26e..e20931e3a62f 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -80,13 +80,7 @@ static const struct kobj_type ubifs_sb_ktype = {
 	.release	= ubifs_sb_release,
 };
 
-static const struct kobj_type ubifs_ktype = {
-	.sysfs_ops	= &ubifs_attr_ops,
-};
-
-static struct kset ubifs_kset = {
-	.kobj	= {.ktype = &ubifs_ktype},
-};
+static struct kset *ubifs_kset;
 
 int ubifs_sysfs_register(struct ubifs_info *c)
 {
@@ -107,7 +101,7 @@ int ubifs_sysfs_register(struct ubifs_info *c)
 		goto out_free;
 	}
 
-	c->kobj.kset = &ubifs_kset;
+	c->kobj.kset = ubifs_kset;
 	init_completion(&c->kobj_unregister);
 
 	ret = kobject_init_and_add(&c->kobj, &ubifs_sb_ktype, NULL,
@@ -139,18 +133,14 @@ void ubifs_sysfs_unregister(struct ubifs_info *c)
 
 int __init ubifs_sysfs_init(void)
 {
-	int ret;
+	ubifs_kset = kset_create_and_add("ubifs", NULL, fs_kobj);
+	if (!ubifs_kset)
+		return -ENOMEM;
 
-	kobject_set_name(&ubifs_kset.kobj, "ubifs");
-	ubifs_kset.kobj.parent = fs_kobj;
-	ret = kset_register(&ubifs_kset);
-	if (ret)
-		kset_put(&ubifs_kset);
-
-	return ret;
+	return 0;
 }
 
 void ubifs_sysfs_exit(void)
 {
-	kset_unregister(&ubifs_kset);
+	kset_unregister(ubifs_kset);
 }
-- 
2.56.1.708.g77570a6a1d-goog

