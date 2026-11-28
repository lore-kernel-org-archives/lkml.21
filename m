Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857714;
	b=lsJR/C+2s7EAxl4AvuHHdayO44FhOJg+ywR0PcBqMMjvqMwJCDOl+mwfP8SRqt5dIIWC
	 Nc/W+mcH8B1zPIxvFqP90uEfCMMhETgXYvxMvF9l5qxvB3imrIm1wDHwcH8o/gUPH2iun
	 hCfydyR0OwhijXxJvro3dyJ9NaHwU0WAMOL9L+WBvlG6W9uOPYUxX1LdA6tsyJDhfV16I
	 IqzYFrwK9yfJ/h58r10j4fMqu8ogx5VVW87g7X3zMhdP4yFCPs2ix7XmVbVyLfpWIaTcS
	 zJxieDmbsZIxB0CbqhCYrXxv6nQmEzR2kwGtA2G4TFjER5yU4iw08EMMHFrWWzEMUsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=yf5lFWivuM3/XS9YOi7vjzstZ6D4tWxpwOXiC4SyrQ0=;
	b=lotfSdbC9XrCqg9y2uNwenr6A7O/aBIK3uMRqaa7qD61fj+n3f6OGWB8EmUljH38Kr/I
	 DSl5ZVmKntjTTZXEmkQW7kLf/iZByrzehivPFGNOfgyhXkQIcwAnDtWOIeqZs4Ve4CuyU
	 q0yDOz3VCXCJSOy609vRSWzUm/00ZSbEizeXTeQ5186eByJmAEp+RB3VIhUvcF4gQk2Yx
	 goKW66mV5gSZD1j+otNAir317ruWJN9Z5+BQyv7i6zEvFlCFhY/kfeMEeUCxQgf4n0MXQ
	 RSfrzQDKYgKVzIaOJnOEVEzVcz8qqxm0Zyq85T+FOEAm4/ERtQ6921q7fkqY++RVJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DrfCpQVg;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96DE606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D96DE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DrfCpQVg
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4d5e645d1so54540067b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857713; x=1796462513; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yf5lFWivuM3/XS9YOi7vjzstZ6D4tWxpwOXiC4SyrQ0=;
        b=DrfCpQVgjvF8E8qHAT+HJ3ciFC/BAhyZIuNuI+FIftFEWEnDsGCy99PS2goXQtG01j
         9KE0r71w9J/2eXtA73DceKCK2TrD2PMmjm5XM8XjRP3fAsur+60DIBul5WIK6/Mey5RN
         V3mIfBrJO31YkvyG1UsMeutz1sd9h/XsbJ9D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857713; x=1796462513;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yf5lFWivuM3/XS9YOi7vjzstZ6D4tWxpwOXiC4SyrQ0=;
        b=u1IqNg5BNlXuv6QcPZanP7fXNiaOSJusU5t8HdiMxdGiao22O0sSn+02EhSbt+gmb7
         gomVDggTuTx2QAhmltbMbs3GSk1l7hEAwJE+wbY9HC7njAfwB12Kj3dKs2D/Bdrzw7Wh
         h65GnvpUFdRZzEvSLcNSht5YJB4hVvxZkCoDc4FQgtHpG6nl9NBMeLzeNjAAGQ5cJmrB
         kQWKdph62gWGoPd0c+gtoDEm1SJpFEW7n83YnrWjU3TS/kRBd5gxZKiBX7rHvPFIlLv1
         Q3/8htx6lMBAOqVqeTInHeEzgvRuNDI5VihdizKENX8uUSSc1foE2BvpG6nfKsQkB21+
         4HBQ==
X-Forwarded-Encrypted: i=1; AL+hErGqYoJ84vG+2+w5h+rrzshKcVgbEdNkYAqANEExSTpH5MTR0EfE/kg5tVrz4u/tmAQr4i1P8g1LMiPOnKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qq8/uTJD9gQtpRYiOmoNhKmJV2QH0ntcO0s0y0MHm3QlUmWWn
	fF+tork2+MW73+d5RFVOldLVH+eIzCm98xacTKyn/7jfArBP4ZcfrmYbrPCZhlT9A5g=
X-Gm-Gg: AZFdTZcZtYPyJwvXgGdiMOUSRjT1whcSm2lpXizIdPqHjPof/H7P+fQX2ySpfY4ugJn
	+TdlJlwJANpxevxXCeLzSee4mRxi8blhe1LZwXzjibBnURdDn/FrqBgSefDlRLiV24+/6Msjzq2
	ZSNiOoRyDZK+3uME018nSi/bypa31hVSrIbPucDqKUnP07BDmjupwgZGbEq4QieWxJ/ipZ3pNdP
	hdF352OJEAnWycR1GzoZmI239i9T5EjqQQQmXqWKohtbxGmOvHfqLx5VWELVEPevfQT5lPn3KEo
	cDHaPS0kmxUWsxG2KHMijLw5vFSi+0HqxNtVs1Wsm1znx4o/VjjihXJTlDJZb5LbIoab1KWy7r3
	6oxmH1ea0XQIbT+Uv5bak8YyKjT7GRmD6j1CQyNyefpF0uYLxxBsD1hID5PbIDHPZTt/dEIOvfS
	Vj142gtWSHPdo5GDFBYkE6OROgQdDtBqXEhkZIsrEfj4RznQUQx008pfO3Zco8j+V7nnXOW6ThU
	gelteBjbooV7y0/ZefzUv/kMP8PFyeFKZlX621AZpWNwg7bkRdqisCW9+qdh7ZBEvQxlgGG4uK8
	uirAoiQOVTAPDO3lUvl6NyzXgsCT2A1rDh90Y3nw5zbTXGGFByeKOJpEKSnZGeDLjK/97Jy9uXU
	9jyaFpzmLhZR938/O5kWCDZSZijQXJH0bd5UWM6QWqrQzYS911WBWxsTtpEu3xUfchSRxIBhRKg
	lnjv8Y//jmS7Pj0zXBle+k+Com5puTOEj5q+mMYCpXcsAOF4vfvqhwzTegRFa98BgyudJ2Q67lF
	txR24B71UdSPlzVsri0y1w=
X-Received: by 2002:a05:690c:7486:b0:8b4:d84d:cb9c with SMTP id 00721157ae682-8b520519ae1mr103219017b3.66.1795857712909;
        Sat, 28 Nov 2026 01:21:52 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520309d3esm104901847b3.30.2026.11.28.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:21:51 -0800 (PST)
Date: Sat, 28 Nov 2026 01:21:49 -0800
Message-ID: <c9c7b0465b1b27312eaa170692836dd30541bba0.1795835884.git.chris@chrisdown.name>
In-Reply-To: <cover.1795835884.git.chris@chrisdown.name>
References: <cover.1795835884.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/2] kho: don't release incoming bootmem areas when
 kho_init() fails
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

On a non-KHO boot, kho_reserve_bootmem() reserves the bootmem areas in
memblock, and they stay reserved until kho_init() releases them as CMA.

On a KHO boot, the bootmem areas are inherited from the previous kernel.
kexec loads the new kernel into them. kho_populate() adds them to
memblock as free memory, because early allocations are made from them.
Whatever is still free afterwards goes to the buddy allocator like any
other memory.

Unfortunately however, if kho_init() fails, err_free_bootmem currently
frees every area with free_reserved_area() on both kinds of boot. On a
KHO boot this frees pages that are still in use, the kernel image among
them, and frees buddy pages a second time.

With CONFIG_KEXEC_HANDOVER_DEBUGFS=y, kho_init() fails if debugfs is
disabled, so a KHO kexec into a kernel with debugfs=off added to its
command line is enough to hit this. In a VM, the new kernel then oopses
in kho_init() and panics.

    BUG: kernel NULL pointer dereference, address: 0000000000000008
    RIP: 0010:free_pcppages_bulk+0x10f/0x280
    Call Trace:
     free_frozen_page_commit+0x1fa/0x430
     __free_frozen_pages+0x205/0x600
     __free_reserved_area+0x7b/0x120
     free_reserved_area+0x89/0xe0
     kho_init+0x301/0x3e0
     do_one_initcall+0x89/0x260
     kernel_init_freeable+0x1e0/0x250
     kernel_init+0x1f/0x140
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009

To fix this, let's only free the areas when this isn't a KHO boot,
because that's when kho_reserve_bootmem() reserved them.

With this applied, kho_init() still fails after the same kexec, but the
kernel boots and the bootmem areas are left alone. A non-KHO boot with
debugfs=off still frees the areas it reserved.

Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
Cc: <stable@vger.kernel.org>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/liveupdate/kexec_handover.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 42c6609a1766..663dd22e7172 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1899,11 +1899,13 @@ err_free_kho_radix_tree:
 	kho_radix_destroy_tree(tree);
 err_free_bootmem:
 	kho_out.fdt = NULL;
-	for (int i = 0; i < kho_bootmem_cnt; i++) {
-		void *start = __va(kho_bootmem[i].addr);
-		void *end = start + kho_bootmem[i].size;
+	if (!is_kho_boot()) {
+		for (int i = 0; i < kho_bootmem_cnt; i++) {
+			void *start = __va(kho_bootmem[i].addr);
+			void *end = start + kho_bootmem[i].size;
 
-		free_reserved_area(start, end, -1, "");
+			free_reserved_area(start, end, -1, "");
+		}
 	}
 	kho_enable = false;
 	return err;
-- 
2.56.1

