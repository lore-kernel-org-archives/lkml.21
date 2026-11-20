Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147439;
	b=s/fSfCWCeN1oUyBFB4zOy90qP18GFAyy334lESolvaRSJ3yfl3bWRNhus6skSCnea2kp
	 tw/vyuYBF/YpEVEGad9Y7zWhA9s7Ki7ElVTXg18xi4Dh0AJMUJBeh70uBhrk6Qv6ZDQyG
	 EAOKSPjXv8UkHucknGzRmGNDsJ+Wibbq+EkPqXyLheiQWgHOKeulzNvr7Q8u2BzczV3BV
	 8BBg9w7rSEPS1qaPxUb9ZR9mX13scPcBkyKU2vqQQDEXtaOcESz0BQgdsWJ6q/SI4HEOp
	 jQaVFfRrpf+vqMXczHAbdpp4R4vOqL1/w9W2ZNMrGEfUZ5M6DhjtP1JZ3MFu5QCrKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
	b=gHz+MrmzbQVvxlEm9Y2a7L1ERkkcrA2CiaThmbRR67ZV8ujwDG3jQJdQlSc91O5wbz7w
	 +3YcIgw5uVtx9/6+zB+uVKWeMggjzZztqTPVrUYnp0dCQwPjgRGEXiyemScoNHHbyv0uz
	 SGGPMEUor/Lstg8lfHI2jVCkqruLCuiUYpYK19S3yw3f9Hiq6AEpKbSB69JTxNIQYmIfU
	 1PUr7AQpJ+YwOWvdX+mPRsJ4Wk8indpLzJUL6pUHLieIj4V7lyN3m866GMPbbavfjd9+R
	 BMPra5iE3ZjuvPyFpfH5kvkBZql2nN+r1WfgJLSEKq6Q418DsM3Vq8frNxMcEjAx6ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeeB2lr6;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7735C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7735C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeeB2lr6
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so1243317eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147438; x=1795752238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
        b=DeeB2lr6t0GQXG0viXjeZhsaa7z9icQw8+9QTs+nHT2Ssk0byESLdrcZGFZ6NFRSeF
         UunyabDqAU9ZF3v2VvHmvQfvMp9605XhPJngjampSH6fyca2nrehs59YQ71NQdqUqUHl
         E7E7nnNQNr8caRISt0ziMqSKmVL4zHiDp0/CHPXnfVxbDDkJZN9cdIH8GcZ2ziuXYcS8
         y/l2ZG2A60VUmY6jBh5bp4fNiVL3+iZ+W4o6H+c/UvRHnI9OmHNfRWKt2Rx4ZLdMOhi7
         XSW2/Ggs8ZALSdG/c8myG3PNznc9B8xp9roek2C4yeX8CnpEQoI6XXJruQcFL7XaKSRG
         60cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147438; x=1795752238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
        b=MYU+EdDH5bMm02JgAWf4Y7LRLawJ+yGz2LUcj2TGAsTvwz9fytruZnUfK1d677i25v
         6U9DjqOE8W8Kit6HkerKfPG1ZkuB+S/NxBZaOe7d5Nixir10qGnGe9SPB+VIWza5AEUF
         hQrunmQbLt3GuP/qUTypOoAgtDXDLDtamfok03s1CrihqGMMH3jMMo6HxKD3YZIE38KB
         1c9VAaiuFTHaa7EYyNSBZwmtqHl2z6WITNJafAm5lRxRj+K9nAhbnPbEFnpW2qzxYc+P
         E9gzRc6r3rmI3Q00BFFHIndVU4XyjISWOCWgQNY8aKkyJzzG40ZRPrvpVJ+MgC4gC07g
         OOrA==
X-Forwarded-Encrypted: i=1; AL+hErGxe7Dn1sK1K1ghbTDrzLdbBG80gbFI1ZihyHFbkyiS1dQksQrHutMc9MFBS3SAhvIA8jo91CSwDdVEkQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wrf5VB2xK2iFt+9fMTt88inZUVZ/5kZLXbzxHRWoBwhxTI42N
	7OMNctVOUAWhfeiSPqSjSR2Zuka8irUVqTR4tDfiNC7EV2NEfcgF6aRj
X-Gm-Gg: AZFdTZdW8FQKGlirZrJTZyMcfLFGeE9luyGQSWNNtmMnjFWugcNl++RWON6aiyvEZBu
	LsKE121IpKuNdc6GW45+ikuEtD/zI2RMew6Xw8146NtHY4maDxeUaExKA6nRatiQSgKgZsnffHl
	PzZ6tJCxILk9lSV43bKdUGlUA+phxMQ4z2cBsMDJUS9QQjRA4UoQBE6TxPWBVMPXoYdZGCx8WDE
	jWSF7qXdllT9yoOVxp9AIsODKzsxmoSbb8hPHr+C5+Y1oRDFamfleMtIh09aCqf6WW98JPiO1W0
	cDzNQMgwzGR7Ft09gRt3d5IVxO3mQmGD01DlS1ZEjex/+IcxK5Pf8MdMTVuWtD6bZKZWq3bmZTQ
	WFxCnlRG8MvA3j8eSyzMFekDUbWIsudyLrgRlcucQYn5jdbhV2yKtcsB8p0CBXPejXCUy2E3AuK
	I2LF3sNvInlhIriujy7RMHessq6TDdoVLUYtI15boGGjLK8seos4rKt/rOgeOW6Bhiss9/7HsWu
	xoqSEVAjV5lcy6DYle+OfT1vqdW5yyhE/m6Qbf9rFtu85jUQji/pzaI052M1YbuiN4IApF0S3MG
	rbX3YSAPAcZAws6BZhYy7nFdl4TPLdVQMQ==
X-Received: by 2002:a05:693c:41d9:20b0:382:cef9:e354 with SMTP id 5a478bee46e88-385715183f6mr1436107eec.36.1795147438538;
        Thu, 19 Nov 2026 20:03:58 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:57 -0800 (PST)
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
Subject: [PATCHv3 07/19] powerpc/mm: Enable context analysis
Date: Fri, 20 Nov 2026 09:33:06 +0530
Message-Id: <9381c873240a164ea8ebd69dd40ebbf1a94fea45.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

powerpc/mm/ objects now build with Clang context analysis enabled.
Turn it on for book3s32, book3s64 and nohash mmu.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/Makefile          | 2 ++
 arch/powerpc/mm/book3s32/Makefile | 2 ++
 arch/powerpc/mm/book3s64/Makefile | 2 ++
 arch/powerpc/mm/nohash/Makefile   | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 8c1582b2987d..33e51abb5aac 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the linux ppc-specific parts of the memory manager.
 #
 
+CONTEXT_ANALYSIS		:= y
+
 obj-y				:= fault.o mem.o pgtable.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 50dd8f6bdf46..d5069a586c7b 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS	:= y
+
 KASAN_SANITIZE_mmu.o := n
 
 ifdef CONFIG_KASAN
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 33af5795856a..c5d8d2ef72ac 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS		:= y
+
 obj-y				+= mmu_context.o pgtable.o trace.o
 ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index cf60c776c883..7d7409d2cf97 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS		:= y
+
 obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
 obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_64e.o tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_44x)		+= 44x.o
-- 
2.39.5

