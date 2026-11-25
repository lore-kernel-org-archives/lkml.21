Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572388;
	b=fFz0OtkMELR/Uf1b4akj43v1h16CvvPBSmZ5pDh2A7gKh++yG8p4DeXXAmE9uqOUts3N
	 szTzonae5M3nbGdOr+hipHTubEnZmHSf/Tp94VPMH3M+MB7RRPY/PjtHAt42fDH2ljrMs
	 FKPUOlV1ZKMjANpkhuRjIvUqMJVhVzFPbPfjK+VcEJ/AdR451d2BtBIuvqafiiyF+u4W/
	 yzSMAsPcMKgGDcHsLcWdZCK/sQBUP8yFyG+XeZbwBzdsB/M2aEqCmYF5+Mr1IN6i8mphg
	 3ycHm+ixQMRjZh/mpWvkmGk3YLVg0051K9UuZLbv4u/0Ltk6j90XwejFloGwcLR183g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572388;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=x9VZATXZ2TGU3i1EvYBEjHFQgX6w0AaIaDMQW8Gdxbw=;
	b=fn94PXcKq9t1gEHprv5SLtM3RlfeexHKIa/ijBiXy8xWsMH0+7YTznOhP7hwD7EKtl2f
	 KdorvQG8++EMQNCg0MkH6xNXLp5ynz8aYdTd1VKKNayC7mD2aru4TTxBCaeTYmXEk7IfJ
	 7+zVNI9vffTqjMTysy9H1emyx+Ai1DXESKuskDNFgJqOg8QTkKx3eBxLejIjBTgpJosGb
	 4o9jpPBr8NeCVsrUbaMGmoclzBZVJobtVgOV3gmrP4DTSqc2cA5w1UQ6t6j+qFyCAMFO4
	 xKNaIcgInRZcJ8Vh5/07KJ+g6Ahd9Z1h7FJKslkb8V3+o3JyjLfbwsXv47nLbBKDKmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fny4+j8R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD72A606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fny4+j8R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204BA1F000D0;
	Wed, 25 Nov 2026 02:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572388;
	bh=x9VZATXZ2TGU3i1EvYBEjHFQgX6w0AaIaDMQW8Gdxbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fny4+j8Rd6gYae5VhK0Q5dZ0cCU0anDhvxezKQaydBCbGAVVqNw9wP8RD/XCy1xGj
	 am6OalORKkiwGraKGI/n7xNgsdvi8mULDcgPCCMGzgVP75hELRPXEGigcXk60ody+d
	 gKzOX8JIDHGffYd0bk0g1vWA2tktgsoGIAUt/vXoFWUuJH5yyW0onJkDlOLG2gHlsw
	 /92R9ldMUls3bOVXaYZsKxB7paa44orSQGFivDFuMl6XDdBwnFVW8ahYd24iRSbDkR
	 /3vStKHtL2ZEoIISixMLnWO8NOQomhCF2fHKZ5PQ3ab2b622bEGe9d/Y5ib11jABb0
	 +IqeebsiZf9Zg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: [PATCH v3 08/19] x86: Always inline empty stubs called from noinstr code
Date: Tue, 24 Nov 2026 21:05:52 -0500
Message-ID: <20261125020603.3934222-9-sashal@kernel.org>
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

The !CONFIG_AMD_MEM_ENCRYPT stubs of sev_es_ist_enter(),
sev_es_ist_exit() and sev_es_nmi_complete(), and the !CONFIG_CPU_SUP_AMD
stub of amd_clear_divider(), are plain static inline functions, while
the real implementations are __always_inline. They are called from
noinstr code, which the compiler won't inline them into when building
with code coverage instrumentation:

  vmlinux.o: warning: objtool: exc_nmi+0x7: call to sev_es_nmi_complete() leaves .noinstr.text section

Make the stubs __always_inline as well.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/include/asm/processor.h | 2 +-
 arch/x86/include/asm/sev.h       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5eb8c7..f7f28c8a09ed8 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -735,7 +735,7 @@ static __always_inline void amd_clear_divider(void)
 
 extern void amd_check_microcode(void);
 #else
-static inline void amd_clear_divider(void)		{ }
+static __always_inline void amd_clear_divider(void)	{ }
 static inline void amd_check_microcode(void)		{ }
 #endif
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index c7ea9845351e3..52251ce42b666 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -601,10 +601,10 @@ static inline void sev_evict_cache(void *va, int npages)
 #else	/* !CONFIG_AMD_MEM_ENCRYPT */
 
 #define snp_vmpl 0
-static inline void sev_es_ist_enter(struct pt_regs *regs) { }
-static inline void sev_es_ist_exit(void) { }
+static __always_inline void sev_es_ist_enter(struct pt_regs *regs) { }
+static __always_inline void sev_es_ist_exit(void) { }
 static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
-static inline void sev_es_nmi_complete(void) { }
+static __always_inline void sev_es_nmi_complete(void) { }
 static inline int sev_es_efi_map_ghcbs_cas(pgd_t *pgd) { return 0; }
 static inline void sev_enable(struct boot_params *bp) { }
 static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate) { return 0; }
-- 
2.53.0

