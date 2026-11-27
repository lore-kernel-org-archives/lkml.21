Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770539;
	b=x1tUunM00e4iaxeyOEIChgYnLoD8tzAwFvy+QALbVcbrH+GbM7Mhum5yI8f8INYPQqk8
	 SpL7QrXVSkvDsnTMZhWSVlxrgI7KER3lQ7JF+sRmOQhlMdKIapmScduQZqkTQxb/vD46m
	 iVLN00RMqv2tyBdy81MiXWfTGy4FP0dlB2a8ASBTHFehJB2V4alzEXiNZCe2lihIllHEb
	 tIIymOUId9wKUc2yZII2sWri8Pyxn/On8tJnGjJK/ofTU53dAXr3ZC6VXOoTIHtlz5FjA
	 qPMcQGp39+0pwQz/OfN6ADH6mmpc2/lgxSkjh9aaZPwWn39B0gvZEdUZKSPlWG6664g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
	b=UBEX7NG4ff39AKTzE9tFyifJDiuqptMNjCgDUHqOVhhPgaJUKKJd6KOGHswuPRG624P8
	 bWxMWyKMhknNemaRSlV9IuKt34CEKtcuD5zCVXaujv/3DN5O4KdqEeQ+WTCITWzJoOr0W
	 D4xxHoeFsFoiGZTegTvXikXv0pzcYhi8/PDhITgDZl+ooErnQAswmfnOOIKggSBJHzLlA
	 TfZowlW2GVZfxfJ7gE3jJx48AjamoJnaHFl4LFaEyZuhphdkxcmL5Jw/vO1+ZVapNksHl
	 SDNefPAw4HEw3WtzN6B0XOe9u0XyUBgPkeP6rDHME43nqBh20mkaqeox0UJqQEXkYgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr9VzQgL;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5D606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr9VzQgL
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so1403149a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770538; x=1796375338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=xr9VzQgLoqkzYCc8awgGNcYdoxo33W937HaBi3e+ooucZltmCGvMHdKYS79ZjjT85N
         T2f+9Biz/dJJp2JqrAWQI/c6/s3J5xZfJu7CG/3OfrrhccMzSTXCJWpfdRZ9jVJY4uPT
         ODSHI7Loudt8mvxrLuio3JUZAn6vf62CLxrw3TitxfZPyKfIAaR5uq6S93KJjinEMUP6
         34PkHFZ5dkVwhXwBnRs+cQ7/BrCcshgFEKIN6ri81CfF4D5wwNnJx3UU+CvTl0DqMI1E
         SQpQhjoqfIuR5cKbU4J6eBjCtxKyOR5AphviRmRfBcXg1SZG+d0a2oABYqtttbvDWETg
         UF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770538; x=1796375338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=UqDnDnJAFhClmXUH8j+mGbfv0q3hNOnhPTfU3vzLuVRW8WT+DPHmIYmXkcbjQC4wC2
         E4zArVf3fb0Rz8Iy3ThRosScvaqEGaVn6J+pRZlau5L2+PW/B+OTO17A8zxeGlmtHWGv
         jtmSCNf02JBCI3FvUN4fbI6k6+OaGaGXxDgkZfvtAbIkSxQBywnzEmI6xaxPOxdXWxUf
         4tdWRtvU0VXTOTW6WO05aVPjh9Ua4jieDMJv6+DCYDRw4eFgtGY1bCUe4d+Tju+cNt4y
         Rri63cD8rXIXqjrVFrpmJBAJCla3ji6VcNq3ENQFfaPNlN07D39DoX6NzytfmVN/QJe7
         FsJA==
X-Forwarded-Encrypted: i=1; AL+hErG0mF5exsbfVDQtZ7VIsv0u1W1+aE87jaCMDwBYA159+rGGmm7g7Ykap1Gk+lrThsWcTHtxG4M1JKpXMX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0xn8L/R0gzOYuqu4ZbTtfVBGGaaoaHv6PPwDB/XYJlV7tI4Ez
	Nb8e4v7Xq0Rv4lGbosofanva0mjCBZE9XsD6AYp+8Z9hU7FY7BLXQGNu
X-Gm-Gg: AZFdTZe9itU7xvhZehPjxb0QPWifK+/V8yzIq8C13uPiYXSQMQaDsRktl9mg4eYYqZ6
	/hmDmS8jYiG7xMp7C+eglT9SO9YMXd2coxudl4R2YvtDRd3r6xyy5ww7kTt5bs4aaav9R9ZLKb0
	q8tyEszuq6Ms+WHVDgssEdoK9GvqqA6ZHm4Mrfx8tiUbwAbQLofIGaXvhF4no24z7EfdK/3CaYg
	RePGQbZY7V+Hy+bQ1vQrmSeSOf5+xLkKj9xjLLG8GfEi8wL0EL6I7604c4wLofAy4YBxuCyvQyW
	quAdWHj86JEbfqS3VEXnUoWZu71hHA2OPMDadk2AWM8NbumXAwjOWXvUYnD1tIBFDtrclf2cSDG
	d+BfCNaAM5LOy0pYab5dbAYd8zPtBMBUyON4V6Y9thqPkVhPmtElMke7iVL/v+eLov95ZM3Ry4B
	w1NHsRmE/vGP1TTXV7lQ7RxwuCeOhRXC5y/nyk4RzlykuEt1KaczbgJTuakRv1kNnHiRfIcXD9I
	KAOy0lIX5WetOnPzIn9ycOXMTF+5mCc2mqy7fjiim+QuLDz+dtYOQKW3W3fuki1Eo0l00bH1g9t
	Q3F3M2lNpI8Cm/KwIvvfUrRhCSvgkmu3HJT1sLAchiY=
X-Received: by 2002:a17:90b:3d92:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b41c8dc8a3mr20396792a91.17.1795770538277;
        Fri, 27 Nov 2026 01:08:58 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:57 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 27 Nov 2026 17:07:21 +0800
Message-ID: <20261127090723.741253-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 7a940d1815b6..caac366bcb66 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 865d7cd2f0e1..ff92dfb09649 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -555,6 +555,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

