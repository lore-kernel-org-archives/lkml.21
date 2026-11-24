Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482404;
	b=T7oAO9uV5/qsRE0L7KMi5s5JZKkFUuyaGwM2W9ry5GrDezgjkI9r3qmkBAvkYi5det4b
	 ftmLeSH3e806LDPH6ja0mLjMPp55JZuSR1EjMKw8pOz34Aoch8o3SDcHQsnJw5ss3Yjs8
	 0dYxMcUycrBYarZ3j7D5CNYWr07JIKDFLC2o1pUTyvd9+YCHeo/peigpgxkFkg5zbwpvF
	 Ut5v5m737rWJ5sDY8J1uknYU/Di8tn4UuQR/zlIbOSeqf3HFeWJxhUfhF2IPMmc6HcMM1
	 VpdAvudEGb6juHVUX/5d7vbW2HILqcf8zMVNmvhHTEFF1FQR/CMO4/263R9AzOnKkOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482404;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LHDPEm7MTGmxBB4LmonvO5iFBgMFQMAW4WzI+aJgUeE=;
	b=owkMUIhsYLK8JMeVpM6TInfj40hLS0nkCp5qQbHcPS+NgGRnf58uwQRotWEK3ns3SHvc
	 XNmYIh9gk7omu7UoCyjejUoMMX81cpHGssmzeK9ana15Ef7ygVIqfQ74Pftds1tUZue25
	 Uykd1mrcWkuaG25+oiMxP40PaehTswScAma5hEYNqduk3Um+FRYYw8J6GJPChmV0jJ5VU
	 4RjQ2vp5wvIIjrzK+Q8WA2kart7p0u9jcKjuH7HIBwpTn8q+55PEpsd+w8XDqBa3eWUon
	 r6sWKrSZMUk8zBzGh3BwwBlA+dMPFxDeVXsSwylAHEmJOuHxR2R68Zdt2dXcZfNk5KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=fUnRxEvu;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5664B606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5664B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=fUnRxEvu
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 24FD920B7167; Mon, 23 Nov 2026 17:06:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 24FD920B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1795482400;
	bh=LHDPEm7MTGmxBB4LmonvO5iFBgMFQMAW4WzI+aJgUeE=;
	h=From:To:Cc:Subject:Date:From;
	b=fUnRxEvupcC6y5D6Qa51mQYOZlgj1EoTMwDmjI/MZIoiMwaiROvpTT55oH5Vpxu27
	 TJPh4dUzH4qKR3nbqgRPvCk7l7bMmeQ6awKB1jLTVgQJLGW+oc3CnQWde1mPIqTvEt
	 rLCF0h6+ckbJXZnF1UhhFgbfyr01cyNsLi48YLQI=
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Subject: [PATCH v8] x86/mm/64: free the gap between BSS_MAIN and BSS_DECRYPTED
Date: Mon, 23 Nov 2026 20:06:35 -0500
Message-ID: <20261124010635.1299890-1-hamzamahfooz@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
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

With CONFIG_AMD_MEM_ENCRYPT=y, BSS_DECRYPTED puts .bss..decrypted on its
own 2M-aligned range at the end of .bss. When SME or SEV is active,
sme_postprocess_startup() clears the encryption mask for the whole range
in the early page tables, one 2M page at a time.
mem_encrypt_free_decrypted_mem() later frees the part of the range that
isn't used, re-encrypting it first if needed.

However, nothing frees the padding that the 2M alignment inserts
between the end of BSS_MAIN and __start_bss_decrypted. Kernels that
support AMD memory encryption, e.g. distribution kernels or paravisor
kernels running inside confidential VMs, still waste anywhere between 0
and 2M - 4K on every boot, on any CPU, depending on where BSS_MAIN
happens to end. e.g., built with GCC 16.2:

  .config                             _end - _text  padding
  x86_64_defconfig + AMD_MEM_ENCRYPT         44.2M     616K
  Arch Linux 7.3.5-arch1-1                   60.2M    1160K
  OpenHCL paravisor, x64 CVM                 12.1M     196K

Mark the start of the padding with a new __start_bss_decrypted_gap
symbol, it ends at __start_bss_decrypted. The start can't be derived
from the existing symbols, as nothing marks the end of BSS_MAIN.

Free the padding at the beginning of mem_encrypt_free_decrypted_mem(),
which runs on every CONFIG_AMD_MEM_ENCRYPT=y kernel, whether memory
encryption is active or not. The padding lies outside of the range that
sme_postprocess_startup() maps decrypted, so unlike the unused part of
.bss..decrypted, it doesn't need to be re-encrypted.

Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
---
v8:
 - Go back to freeing the gap from mem_encrypt_free_decrypted_mem(),
   like v5 did. It is called on every CONFIG_AMD_MEM_ENCRYPT=y kernel,
   so there is no need for an #ifdef or for a !CONFIG_AMD_MEM_ENCRYPT
   variant of BSS_DECRYPTED, and only one new symbol is needed. (Boris)
 - Free the gap before re-encrypting the unused part of
   .bss..decrypted, so that a set_memory_encrypted() failure can't leak
   it. (Sashiko)
 - Explain the problem in the changelog, add measurements and move the
   testing notes to the appropriate location. (Boris)

Testing: x86_64_defconfig + AMD_MEM_ENCRYPT + kmemleak +
debug_pagealloc, booted in QEMU/KVM with pti=on, pti=off and pti=on
debug_pagealloc=on, and in QEMU/TCG emulating an Intel Skylake CPU, where
PTI is enabled by default. Each boot ran two kmemleak scans without splats,
and the W+X check passed:

  Freeing unused kernel image (bss_decrypted gap) memory: 1948K
  Freeing unused decrypted memory: 2036K

Also, tested on a CoCo VM running on an AMD EPYC 7763v which generated
the following print:

  Freeing unused kernel image (bss_decrypted gap) memory: 184K
---
 arch/x86/include/asm/mem_encrypt.h | 3 ++-
 arch/x86/kernel/vmlinux.lds.S      | 2 ++
 arch/x86/mm/mem_encrypt_amd.c      | 6 ++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index ea6494628cb0..c9722be2808f 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -112,7 +112,8 @@ void add_encrypt_protection_map(void);
 #define __sme_pa(x)		(__pa(x) | sme_me_mask)
 #define __sme_pa_nodebug(x)	(__pa_nodebug(x) | sme_me_mask)
 
-extern char __start_bss_decrypted[], __end_bss_decrypted[], __start_bss_decrypted_unused[];
+extern char __start_bss_decrypted_gap[], __start_bss_decrypted[],
+	__end_bss_decrypted[], __start_bss_decrypted_unused[];
 
 #endif	/* __ASSEMBLER__ */
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620..fae895638d06 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -94,6 +94,8 @@ const_cpu_current_top_of_stack = cpu_current_top_of_stack;
  * decrypted to avoid exposing more than we wish.
  */
 #define BSS_DECRYPTED						\
+	. = ALIGN(PAGE_SIZE);					\
+	__start_bss_decrypted_gap = .;				\
 	. = ALIGN(PMD_SIZE);					\
 	__start_bss_decrypted = .;				\
 	__pi___start_bss_decrypted = .;				\
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 2f8c32173972..357e4389a5e4 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -545,6 +545,12 @@ void __init mem_encrypt_free_decrypted_mem(void)
 	unsigned long vaddr, vaddr_end, npages;
 	int r;
 
+	vaddr = (unsigned long)__start_bss_decrypted_gap;
+	vaddr_end = (unsigned long)__start_bss_decrypted;
+
+	free_init_pages("unused kernel image (bss_decrypted gap)",
+			vaddr, vaddr_end);
+
 	vaddr = (unsigned long)__start_bss_decrypted_unused;
 	vaddr_end = (unsigned long)__end_bss_decrypted;
 	npages = (vaddr_end - vaddr) >> PAGE_SHIFT;
-- 
2.56.1

