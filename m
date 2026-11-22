Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373107;
	b=qQWHKPvW+aLIRCxTiAexW79sU259XanqxPO14M5BoGTAv+6HTLruqnUa7x/FofP82Bu5
	 s4pX6/XVFVlme0F3h92qhijjufLhYPt0HVZBBg7Hf2tOLpX7hDXA9WIbTa65cz2P1ZQG5
	 4WG0NN38uXVYKesgdeYU4B8FKtFdlJNhaeloN5BhDPL275Nzm0IUwxyhI2JkyOuiviqQi
	 9uqLnESu9HH4zjmuj8IRK3glAq2a+awkq+ZzZoTPKp6jLvdOkrLNAa5tTO35dHqnMHE0O
	 JVbnzaumQ8Jvl7Az8V+uSf1EgYvt+zevjRjcj790cRJyH/dFnrjTr4FSLnzBg28bpkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WsuwGey7RkQSop+XnrYKl3vcLnUZxAuob7/LeOfTYsI=;
	b=aSpLJBdzQkqeI6RMiyqJs1sc/zE8iawNuQJ1YHNkD48uUU1zaujclAno08bt/w7bH2DC
	 5/O/WKYnpQ+hdijn7K9XBAy6/SVgSKBcp89GbEeg94jFHxb/ci2/LGoqAEy0bbaBzTd7G
	 TsOTGrCDch/BNe5zyy/p6kQlwnau+iF3Y6zkEBMKzjSnxnBOD3LNCHK5szhMmRoHvVcVL
	 9VbJHBIeU6Cph7+z0Y5oVwOqSAjXtJ9RHLnQ69eiOaPnbTvm0WGZT8OJhdK2eB7eg8Ovp
	 Yg8MJr7ZxdomMkVvYOshZ2UtzlCDpJowzmOaYgh8h+H3FyusXCVS8/hJZhSZh1Y+SkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R8ZQ0c25;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D41606A6B5
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D41606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R8ZQ0c25
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2897505a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373107; x=1795977907; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsuwGey7RkQSop+XnrYKl3vcLnUZxAuob7/LeOfTYsI=;
        b=R8ZQ0c25E6Mjly+reX5GWYDgRx+vkwnziXbugGvpiHujL3hfPTYa/n5CKPxAP67XSi
         z5nNtG0tmUY2iTu9K70W7MnWoJuTz+UUxexxLTDbTmHGcGvd/yFuOCvdSlLuKaNHUK13
         DqR+TYoHcX/c75zBKDmrpOkBdv+r3VGmY6S6HR18b2Tqe0Oa9KeqQ1DqehiuHcMcHcpW
         7C73p59zox+kXFRulgTEp+/gSIbJAfT41z5LQomNl/PocT6V/SEwV6G+oQwcq8jk/mMe
         fdH8kYTeITjvxv3TdrFlc/IVava2ViXDk9T7/fB9llRkCiuNnxvwlGYae0aE6pqfm9ul
         2mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373107; x=1795977907;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsuwGey7RkQSop+XnrYKl3vcLnUZxAuob7/LeOfTYsI=;
        b=i/j+m9fe0yCj+T8STHE+h7/IcIYeuQ8xHESdc1NNqZ2/XCq5wBth14Z6q1JAyHz+NG
         XHZaO5Xog16QL74OwOLRc4LWEK4zt+odZlK68+An7vuSqHd/wOpAKBD52at7HP1XbwXH
         CBU3jSZ3ru8/5aCYZnjx3pcPdSvuEv7c6UBr2/RP8v4Pxevl37CQ+I3cCpNUrkj+xiDk
         bjCWCrmZUtSJ7wRfnnLZhr0TcrXsJUK9HYPv6Zop9u0zjgltRiTX8lVpQzebaCl7ocag
         8DkamfAC9Uv8iwi2V0w5tyAmCvGm2GJnIz9u3EqRXE6i1rXqckfiOOlE0ckxyAPyV9qW
         vEBw==
X-Forwarded-Encrypted: i=1; AL+hErG20Bu3cZgBFsQ5U7+jK8ZjHj7Krkozt7YoKL254uChaUgFTXRprLRB+aiUDMq9c9aHTbqWoP7rsQ4mW/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1Z0QxPqr0zErp028w77bbBEDsFxVqoh2Z1qBfKnNyzj6vVS92
	D6YSjJ32a5GxAuiu0M3XdZAqoHRBCFbjHAYc5O+1y93a/Co0VTepJtKWvEPQP3RtNJkWxegFcPl
	d4TgiJdcNqyByBUCoRvLx+A==
X-Received: from pjbfs12.prod.google.com ([2002:a17:90a:f28c:b0:3b1:81f8:3b10])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c06:b0:3b3:c9d1:9b65 with SMTP id 98e67ed59e1d1-3b41c94d32emr8737375a91.51.1795373106544;
 Sun, 22 Nov 2026 10:45:06 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:41 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-8-jthoughton@google.com>
Subject: [PATCH v3 07/19] hugetlb_vmemmap: Allow architectures to make HVO
 enablement boot-time only
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Architectures may need to configure the system at boot depending on
whether HVO is enabled. For example, arm64 needs all CPUs to support
hardware updates of the access flag to safely update the vmemmap in
place, and may want to refuse to online CPUs that lack it, but only if
HVO may be used.

Such configuration is only valid if HVO cannot be enabled later at
runtime through the vm.hugetlb_optimize_vmemmap sysctl.

Add CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO for architectures
to select. When selected, the vm.hugetlb_optimize_vmemmap sysctl is
read-only, so HVO can only be enabled or disabled with the
hugetlb_free_vmemmap= kernel command line parameter.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 3 +++
 fs/Kconfig                              | 3 ++-
 mm/Kconfig                              | 7 +++++++
 mm/hugetlb_vmemmap.c                    | 3 ++-
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 3cb0138e850c..f29da7a35289 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -699,6 +699,9 @@ pages.  So, those surplus pages are still optimized until they are no longer
 in use.  You would need to wait for those surplus pages to be released before
 there are no optimized pages in the system.
 
+On some architectures, this knob is read-only, and HVO can only be enabled or
+disabled with the hugetlb_free_vmemmap= kernel command line parameter.
+
 
 nr_hugepages_mempolicy
 ======================
diff --git a/fs/Kconfig b/fs/Kconfig
index 70a1d0760d28..0c1a436280f8 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -267,7 +267,8 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
 	help
 	  The HugeTLB Vmemmap Optimization (HVO) defaults to off. Say Y here to
 	  enable HVO by default. It can be disabled via hugetlb_free_vmemmap=off
-	  (boot command line) or hugetlb_optimize_vmemmap (sysctl).
+	  (boot command line) or hugetlb_optimize_vmemmap (sysctl, if the
+	  architecture allows changing it at runtime).
 endif # HUGETLBFS
 
 config HUGETLB_PAGE
diff --git a/mm/Kconfig b/mm/Kconfig
index 18c0beafd4b8..c1c32d2c5cf8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -466,6 +466,13 @@ config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	bool
 
+#
+# Select this from the architecture Kconfig if the hugetlb_optimize_vmemmap
+# sysctl must be read-only.
+#
+config ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO
+	bool
+
 config HAVE_MEMBLOCK_PHYS_MAP
 	bool
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b4d0311bcc4a..142f2975846b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -669,7 +669,8 @@ static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
 		.procname	= "hugetlb_optimize_vmemmap",
 		.data		= &vmemmap_optimize_enabled,
 		.maxlen		= sizeof(vmemmap_optimize_enabled),
-		.mode		= 0644,
+		.mode		= IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO) ?
+				  0444 : 0644,
 		.proc_handler	= proc_dobool,
 	},
 };
-- 
2.56.1.809.ga0b61035b5-goog

