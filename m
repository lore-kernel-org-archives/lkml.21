Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667182;
	b=O9fvmtU2q3bpwpNGABVI6RE/bTzqSH4OA3vjcV6yZBcIX/q+/sTGzoxeb0ssQNf+1dVW
	 UAxwYw0OxLubF5MN54vXReIvt7NRNB5FN68SdBld6fuRfw19hN1EvqwNMywWT3I1W3Jxd
	 vstWI0Jz5WTNz5ATSjKlUIsMjcOmx+JeiieULh6B03ePix6hENvnFr2zpwcjvwDrCTB3t
	 taOeUpwoURzwvErnqyE8z9s+D+Ky7tI/RgYZWdgzoOfYZ41Zp3+Q9NGGChOgd47vRjgCP
	 VEhuyKJ+XHYIDKCcnkIBx94TokJDASmL0hi4Cr/xkT0oNQqDqm8R40lwzQskxGL724g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lJvM+nq+p5HjlHwyukxS01vay+/sKiGIEUqvf5Org7E=;
	b=iKpRvH9pGBGfp4fjNvMl7OrOV+M1kwdkuzjzAxKnsxIVqEsd2Yb0ZjiNdKfzSPwTQCA7
	 beghOtWblJmxfz4pf0zTkM5SkXfBrsYaEvPp6XpcEAfpslSA2hqW9AC4FJA0oSUV+feYp
	 SM8BJsTNXcPkagmcTkL+U3mHhp0yHqTAUJd/0wNiByclXZdcNdmE47LPXuL0OXPCm630L
	 Nu5Qy+DBLg352+JkWdO/Vwmf+1SfdS5IxcDZPepHv0NQBvbVeDs4r8fjZJp03IDqoGCTM
	 CiPsg/OVFtGXYUBoj3K9eCCkLrmvwDE+URq/d8stGvZxSwHQ/9rm0s77eu7xIcj9gow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUDj+ISv;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2626606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2626606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUDj+ISv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385c497bf94so4557816eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795667181; x=1796271981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJvM+nq+p5HjlHwyukxS01vay+/sKiGIEUqvf5Org7E=;
        b=vUDj+ISvoaVepT86pKP12TxVI056UTa9L99w8R/kHuD9tOu6Q1EPkcdlhfkosxqI+C
         j/FWc0Rna2qQaL9tXcsbl1sN7Q2s6MTqjCNczidDTwXuI01smWHWqWGO/8371RRuMjY/
         z3J4hG/rOmuEU1DTbOi4eFnkDo/g+aR/erqO17aLAETBy4zPzS0Odx3RjDyYwyegdmUG
         BMz5GiEp58mR0FNsVn62BHxntpXTXTxy/575gUWJ/JhTpDN6OAY7tiSupbqrlGeuJnfF
         9zguU6VoAY++dqAEH01pdVieR7Z4rGpg7/7ldt4xCjjdtsdWHATFpDvFGeiKAw3NXUUo
         q9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795667181; x=1796271981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJvM+nq+p5HjlHwyukxS01vay+/sKiGIEUqvf5Org7E=;
        b=jBuy+XYf+h4Xb3Kc2waS8A6mlzE1Mp1dEuqoVld2E/CnIHvfqnNjGa1iQw0ZmLTK4O
         YTliBCq0HZs2ZrNmjM2eqmozm15cPt94wlGhG2VdnLhSgJIpy4i1zkmqX3d3Ue95wZn2
         7RUrTORretyRp45U4gUmbGAmyTavnkuE5hAoSjEdw6WFtPRuVnQhZRY8DN2lJ1sHwRk7
         p7lNPhY3amJJ+nMsZtCE/rP1h3yNBpkY1tNEQ5ZgFPdxBev1fIAddbU4vUg5LklDo+y5
         TbNIiksOm7NO2NmoaDSuBSUOcp+7ctkWirjMVGKaal90BgKFNF9/TEajNzBI/0LjvPAh
         Mwqw==
X-Forwarded-Encrypted: i=1; AL+hErHp48zhp0TEcC/XzPk4/itTEMZXCYA7J9vCjfPNSbKijbevQ45SScdqLjeN58p2fsFrpjLlFOjTmi8Atzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WkmoJ+H3OhNovxsr0B6d/gdZO/71aY5CIWosWzx3hugGtI0m5
	Qfx4ZqH94dhK97Xk7/JYiZdsHdDSJSS72brZ2WIYR2Nkh31NPQ6vr33c
X-Gm-Gg: AZFdTZf+SQpQVCyRY/aA2Ak7a2YlctXtvvUyBTLWCe2ETnupIBtYDUEWUA8wWgAj2xx
	wovKMqzhbn0aTm8lA+JytpdKhQfElcuoCdyskWoTqLHs0/Su6lixukEoGQwlCx4FCn8js3IaJAM
	xdlToasFDHFqwykugm0FFAJwqUoLi9lvGekhNns8cKxx/QmFl93GHzO2TTkhTCnRjXA0ObKUvRc
	7qvVDoq1VOnBYLr1+fL9tBP9rrJcoz+acVTednWe8UrLSmEobRJmu+P1rr25pEc//ilcBeUaZz0
	tpYL2zEs5SKu8ZZOVrDAhb9MzkYY6T3KXCmx36tLh48QsGhoGtRMKZpk5RwQtYGosXJjhksASYI
	zKsuYYGP0KX+ji3yQva6ffSiR1+UdjWTm6OVwQAtDZXd/7mKS4hbjXLexDGYvK7WRK0g0OxfYQb
	Lw1L4uu3dWNPfafty/8jjg2IYs+jAEEnVHMhgBL04h0/xFzYaEcmfwiIZFPOPrlmVSvwFt9TjYD
	tCQxcavGMMoXhTHxgctLx9fug/6szH22+EfJbzs2HdxqBGKjiAeeeibCQnFlext8bttM5cmHVqE
	ZAZ999YxVZ7CiojWhOoq87dh10gij9H/SA==
X-Received: by 2002:a05:7300:d0af:b0:386:a3fe:4503 with SMTP id 5a478bee46e88-386a3fe46b5mr13976085eec.41.1795667180999;
        Wed, 25 Nov 2026 20:26:20 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54542185eec.7.2026.11.25.20.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:26:20 -0800 (PST)
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
Subject: [PATCH v4 1/4] powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
Date: Thu, 26 Nov 2026 09:55:59 +0530
Message-Id: <449cd0ade2cf4f04d378cf34209e9f3cd7cdce9f.1795666663.git.ritesh.list@gmail.com>
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
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
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

