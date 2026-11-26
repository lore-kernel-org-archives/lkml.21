Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667195;
	b=Pi2RXpd+wDjJ1ZSZP73/dezafIVWDcBv74cu5wfmubuAe+SCZEDpLPTjokymk8ZMA/IM
	 KAEgMOL1qX0IC96PTbO5Px/6cNbTJl3+AGDzo3qr8/kr5FykQceuJ0lZoBARBan+QwWYX
	 LwKSXzAq78E6dyD71qVpmSbWKOq9CwxTFdCndExOp5KRZCJcLij6gaLRd03d4SyzzppsY
	 72lngosGdO68/eiTZRw5zO2Yx2IqxdIHsmRk7vuIpnwyLsGDm8i5hwBWs4IWbWFu7z39X
	 x1ZbS0GdpESg29mY9dRkQAJR4XHu0ENgefH0eo/FgHM3y7XxaeV1dijIBm4IjTUF8LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=578266K/EmAtCgk1nwJlNHTzXTCrOAsEpFjzCSiKLP0=;
	b=uONuEQZNkWxTITxmt3vYqHJ0AGY8sI8YOOIszAbovQFjSk9xSQcn2dwuMKknV9Nwj4/l
	 elrb2HBN1k0Jm119feWB2tt2jEudP5W4pMI8KLk8UMflxuXKZt6xvEAmJSaLrEziLzgod
	 El9p/7BPtlyZ2pq1J+VaWbc09VxA91WDwuXGOYpw266vvyuZ1z3wEf0imoly9Xzne6OGL
	 elrdjoEIVZAAfe8/Gi322OA0vqJqQjlbMMrhiIK5P36KeFi6UFf9Gw5NWKQOQ98bS9UzU
	 kTZW61wguLMCti354m/cz9puHT3nW1ZX5uJtGBaK/FXribr4AYoVqhtabRCLIeEWT4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbzgE3TB;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46AC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbzgE3TB
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so9771872c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795667194; x=1796271994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=578266K/EmAtCgk1nwJlNHTzXTCrOAsEpFjzCSiKLP0=;
        b=HbzgE3TB4214UagD7AXyqWJEFFcc1/LEALPWrjKhGGKlwz+liXOfw1LdkA4hN7br/5
         k0zFGrIqSI3f6utqGexH+kUlbsgcZJRMgb7XtF7r6fYAlEfDFpBg/DDCo14HirCbSl85
         sjzM4mS60RBuinPkrB3Fs8Rp9Up9u2P2e1/V8VHqNS+Ft93rTa0pyTrwotlJjR10p/5S
         SF/cwzhU8Rtpoq4wKyqnqDANdYU2fvXK+BX3iPmbSQJzJQW2iTZEv+Qqjr8CXXoKYjKX
         a8jw49kGYXFjo4tsr9ta4lw6FOE2elr/kyVMjXwRlwXU8FIM7wh6BOfKotskZuQujh/m
         t62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795667194; x=1796271994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=578266K/EmAtCgk1nwJlNHTzXTCrOAsEpFjzCSiKLP0=;
        b=ed1Sh7AeSH51NbPf3c7dKVCIwAefY8m+beXedmJbI29AOeDcTNW82tUwYFmY9Ta4Zk
         krHjM58xfmEPUwBqrtzqNOKWhQKBTveq/KhgPDosRalhw/NW3feaTV8mJXt+OWLFK4W0
         iv0uvrn246cI+7U0cZ+oT7OBR7DvxulijmTNVjcMWSxSVlgB3ZEKzh9jGa+G6XR8Gmya
         Nw3IHpm5FNLFG5/+hho2eUmaMsfsToDFFPpXgrYuXhKykA9A9/9k545nMKWXE+/PX2Fa
         Wg427A/BgXU+uUFcJq2RNKqU7g7F3Kb120b75jOvIcDGk2jsZ2zSEqULGrTpeRCr6NEM
         twkA==
X-Forwarded-Encrypted: i=1; AL+hErFOa/Xs2Mr/UBN1QnAK3FpqT/CpI/BIHG140yQmK3glZTm5ZOe0xF5cwLGEV3QwQLtczIOCMUYRCOgR+S8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h5yiDaylwaGVwVFnTRiZbKR6Fzgmu+rPVJv8Xb/NTsnsQcUGO
	AcNe9KWsBn3gY0GFfTmAQ5xGfxNZdV2cNDLNO6ocNte/hG7uXkJHMKyh
X-Gm-Gg: AZFdTZe/yjZVIJVarobOFdFuPRhnpNH5TTaIeoOYqLWYb/cFydenh/3z0l/iEbjKsff
	XX6s6lPFsPeBBuhhauaNt9Fnr5xmo0VsFMwc9EcYR4f4lWcpSUW/papJRfwSzOoj3gMC7KRGuMr
	6zCHDC6oYSu8FtUve03BdM3A7ziCPmuzV9K9ZwAgZ7HI4/sEmrN4tkGKe6lEjARSAGGDOzMeaCk
	wO99akfZanNYvvJthKSMhEtPYkwPO6PuBnvn7z1ifA3L4fst77k3y00CJcR65OqSgPF5sK66I3J
	Y1sPTa7CnfBdLxgC74CvqbXhap+uW3dPEehe9Id1rfPiu/F7AKhD+ohtyhpdajtwZpj5YsI618z
	sB61ub19vICEWKSbHZ8UfbpMKkg5mFCjV3i4jhPuhHTp5PgzXMMnXgVxOnR1fA4I9gQ1ovWiLq/
	m6IYTdrqQ8uJoa1dHTPOHicDPNofhLrJY63fdbLg+GF+DbZH78OVQCvoCIp2Pw025D17LwtF0Ek
	AU0zyIZhuJ2QD96d3aIVpFTil7J3HEsswPamFc3oiqnHOmWjA1DiADoaNjsd/WblK/TO4JLGxDh
	LaLbe2cBN55Svf47d148h/nRTiDqr4of9w==
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr15008373eec.3.1795667193709;
        Wed, 25 Nov 2026 20:26:33 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54542185eec.7.2026.11.25.20.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:26:33 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v4 4/4] powerpc/mm: Drop PAGE_KERNEL_EXEC
Date: Thu, 26 Nov 2026 09:56:02 +0530
Message-Id: <24f9efcebdfed51d3048bdd4642b8ba40dc01c2b.1795666663.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795666663.git.ritesh.list@gmail.com>
References: <cover.1795666663.git.ritesh.list@gmail.com>
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

On powerpc PAGE_KERNEL_EXEC is just an alias to PAGE_KERNEL_X.

The comment above it's definition saying
	("Make modules code happy. We don't set RO yet"), is stale.
Since commit 4fcc636615b1 ("powerpc/modules: Make module_alloc() Strict Module
RWX aware") module text is allocated with PAGE_KERNEL when STRICT_MODULE_RWX is
enabled and only made executable later, so there is no longer a reason for
a separate name.

Convert the remaining users to PAGE_KERNEL_X and remove the definition.

No functional change intended.

Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/pgtable.h | 3 ---
 arch/powerpc/mm/mem.c              | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index d20ff2ae02f5..ea06a85f0fa8 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -20,9 +20,6 @@ struct mm_struct;
 #include <asm/nohash/pgtable.h>
 #endif /* !CONFIG_PPC_BOOK3S */
 
-/* Make modules code happy. We don't set RO yet */
-#define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
-
 /* Advertise special mapping type for AGP */
 #define PAGE_AGP		(PAGE_KERNEL_NC)
 #define HAVE_PAGE_AGP
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8a0fdfd028dd..bc83e45b7ae9 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -388,8 +388,8 @@ static void prealloc_execmem_pgtable(void) { }
 
 struct execmem_info __init *execmem_arch_setup(void)
 {
-	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
-	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
+	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_X;
+	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_X;
 	unsigned long fallback_start = 0, fallback_end = 0;
 	unsigned long kprobes_start, kprobes_end;
 	unsigned long start, end;
-- 
2.39.5

