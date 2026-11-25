Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625567;
	b=VUpaVz58/DYTQk8Bh3AAa6TW4Oa2RFCjYmc6Dcm3ZrBDnMpe9dESgvYwghbIx62b0mQN
	 GDeISUG38NBtDrNbvK2wRk1UZ5M9+KUFm57pu9yp67BY6RFMZfl/eDG37viJ/2ASlgUQV
	 sMKvijNJqaQXhChusEnnfecoV/1+f04ZHk9RcGW3nHnGFm/zcy4qJYeyRiSWzz7aJaSl7
	 0LLz8sUWer7vsXUeRcsGKFYrAJ0JuW2Sb0kvS+gS03iJU5Vp2F1kmrWn+X+McGuKVBYGX
	 fpEbtw7bKzRx7U9shhch2emwHm2oS5Ic81JCVCr29DvFA+fpPs4GuWxSXVmA8T+RO/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtvJC4h8ugJIk49Jy7lU/lOFV/X8Ev1N/tXAk6wGQes=;
	b=dVq2xhbW7iDVt43tDwPSMXgcu0jurSt+x1w8OSTKWBuzfIfTIz4dhdeKLjI8z3k7skBh
	 kDm/7T0aA96WM2SmZ+dlJG9Sz0VU41iW+z33TIJmpXxeQZvfCxtNLv6YbRbmOspBguRaj
	 Imub8zTSQ9sprf+nKDjYXJICWAOcYBS5nEx/l2ZbnIRUFKVAK1q9hQHlmkjQVfOlUBULt
	 +YXNz6Y/A84jBo8CGgGtGM+DDRQtmktxzkko8+slXwdPT3v09FYPV2eESyjWJ21EgNaQG
	 0196fjb1WySE5hGBwvrtIwMelp5eqR6rRuHkxGsqHIzQordVuC6IwbDEUXasaDGa7ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSvkLuHw;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0F6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSvkLuHw
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so450744eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625567; x=1796230367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtvJC4h8ugJIk49Jy7lU/lOFV/X8Ev1N/tXAk6wGQes=;
        b=dSvkLuHwQED8ScQ7uYJMil0z8gxhN6SoUGNUQjFrvGT+GkagcVYpxH7hAoqLFKbvMj
         REsZtteX5LvVGq/hoI4GcDg+ckR7jqF3sc+ASuUFt15f4EZ/WdZe/a37Vk7+59B9tZm9
         X34HPEdM+V+mN1HMTbipN2RqhBzS59lZmrvqUeRRsQh19H9/Dmqr9UA1FOQjHEPBNUaU
         k7Dvj9n/ivq7IJD7/+R18GCeKnI+DrMA1kSSSi+kiUBGwGOlHqvlJfS4HZqFZ83T4/JQ
         WeW5dffjzql3IXGQLCbYOshoLijIrTVzQmpbvhD+E80N5fKryNKSnxPLG4X+BM94wi3R
         /i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625567; x=1796230367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtvJC4h8ugJIk49Jy7lU/lOFV/X8Ev1N/tXAk6wGQes=;
        b=u/hoPcdj5Ce3/O9Q+HJLMS/Td+et8tcepJbjN2HLnC38lXZ38x+HjUczrNHEt+WPAw
         YZ642ry2c/Eaf8fzbPY5DiPi3piZeFHLWVKWhPyPyd43wz/zFxu9sP5JKCLpID/xmzzL
         +sHj9HZec9j6PoH3h1bCnUHL3BirSpA+J27pNpxW7Y6Jsla5S7oVkzoA54M3EwU3j9iQ
         K/0c3uS+S0Nc71ONqUQ6SVYL9qWFc1+CSx+eQDqTiAKxWHOtoIoDeSK5MeuaS9gQqtWD
         Wlbj3gP1ODEFISujfGSFOqZtZwBpGioHLc5iybNYe9NRtQUfAzT+lZ13FM7JrWELCxmU
         +8tg==
X-Forwarded-Encrypted: i=1; AL+hErHYSSIczV3KR6oDhJrD9c51z7vfegDjwkszd/wvBjE3DgQ00NXkUy3y6IO53cpD7Q8R64f8L9LKUAhNCdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VE7sjsHrOsjiwY+6q1U/Nphx0hkvl+ttXtDVwc0vbX6oax0xC
	Df8Ozq2+IBaAOebK7UXtRn6CJ8G4Qrcf+Wnu11iXlx5qRggKNN4mh9pG
X-Gm-Gg: AZFdTZcf25SJ3yUNDzFX3qnXBvYImka2y4dHa/CMcg4ylleKm1xXBXOrXaRDM1PCOVX
	NUq0BBZ3i3L1RhOsv5L1vRFq7SA1X7iun9wC/2UY882pfmfRbmod5JfR7i1cdwnSbGD6plM3ZDn
	6EVOFegZ3VIQiCqSXMIAaSJDQckAQKzdSy8aIjiLAzksfEnwPjjQu0EV4DYa9/MIjhjSi5mmHa/
	JbID7dskbjGjyN++TSrPafjehfr3JNV0AQ5tgcwtZpNzaOgNw166PAqkE3kF6rVu85eWWUDlBsg
	Pjolhd6aGlgog5MfNJ+rVX/xM1vV7lL1RcOKHPfJBW17mjUSbuEZmeBO7x3Vc+QGHmnAlo+T5ES
	5dAWivHzkaxwWaaI23Mh4zDteWXypzgvaCIABbme4n+z9QfNP/S9hrLEypH+OpF67h2qpKeDyXP
	jK87Do35h0cS3QA9PVX3inAoRW/+Y1MyK3Lw4BoPLFuTYogxUbttShSTln913Vet3X75jUkFCF2
	T0FfXM9Q6TuUCA8C/naVIhMNmefnZAmfAT6fZYVTU8W+5xNi8RbAS0LmWqo+1n2iJCXi5JRMj2Q
	E7Id7iqYkNbJgbU31fqsm5aHln6KhsiK8Lg=
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr15566931eec.32.1795625566576;
        Wed, 25 Nov 2026 08:52:46 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm98545358eec.3.2026.11.25.08.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:52:46 -0800 (PST)
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
Subject: [PATCHv3 1/4] powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
Date: Wed, 25 Nov 2026 22:22:30 +0530
Message-Id: <5f5185b80df2a3a4e85ca711b5071096f36a7892.1795625038.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795625038.git.ritesh.list@gmail.com>
References: <cover.1795625038.git.ritesh.list@gmail.com>
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

commit 2e83e2ce34ff ("arch, mm: promote DEBUG_WX to CHECK_WX"), made
CHECK_WX default STRICT_KERNEL_RWX.

Now on powerpc, when we boot with CONFIG_KPROBES=y and CONFIG_MODULES=n,
we can see the following warning splat at boot:

    powerpc/mm: Found insecure W+X mapping at address 000000002ea08992/0xc008000000000000
    WARNING: arch/powerpc/mm/ptdump/ptdump.c:194 at note_page+0x4dc/0x4fc, CPU#0: swapper/0/1
    NIP [c0000000000ac204] note_page+0x4dc/0x4fc
    LR [c0000000000ac200] note_page+0x4d8/0x4fc
    Call Trace:
     note_page+0x4d8/0x4fc (unreliable)
     ptdump_pte_entry+0x70/0x94
     walk_pte_range_inner+0x15c/0x260
     walk_pgd_range+0x6d8/0xd5c
     walk_page_range_debug+0xa4/0xf0
     ptdump_walk_pgd+0xec/0x304
     ptdump_check_wx+0xd8/0x154
     kernel_init+0x94/0x26c
     ret_from_kernel_user_thread+0x14/0x1c
    Checked W+X mappings: FAILED, 1 W+X pages found

This happens because CHECK_WX noted a writeable + executable mapping.

This happens because execmem_arch_setup(), checks for
struct_modules_rwx_enabled(), while kprobes depenency on modules was earlier
removed via commit 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
Since the insn slots are only written with patch_instruction(), which does not
need this mapping to be writable. This patch fixes it by checking for
strict_kernel_rwx_enabled() instead.

Fixes: 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index b617b69452cd..77b63b52d8f2 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -388,7 +388,7 @@ static void prealloc_execmem_pgtable(void) { }

 struct execmem_info __init *execmem_arch_setup(void)
 {
-	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
+	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	unsigned long fallback_start = 0, fallback_end = 0;
 	unsigned long start, end;
--
2.39.5

