Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018629;
	b=FnvNHxYHfcWjLIngb69jxaSonZNSeL8xmFcxekKt0XsE12sDiENIbT4cb1RYnXux8ww5
	 m9hasZjobGg5URIJkp4Lx7afkuQ/MviYRdHMjm6YzVx2CWV3bv+mDWnodmDNRMCbS/BNz
	 EGVhzc4G3C8Frc4uhBsd9YyMLgr2PzfcFc2NtmYn3iersyFEa0HjQCzeGjJ9oSqJUefQK
	 4ldso3ZSwYgLWJVPqiJHbEjhrz6tx/myYXtO7PemeAt6MTEnf98oWhgbhU/u9MXPA+aTd
	 Iek+sTmwo/ye5mU2UWk5YOy6SLz5eRGucqcq3hbzzrfQIrfFB27n+za7oh6UQdnR1VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KH7bb4VaZEOEZgLtTJYQPM7/j5RYK5pPIJZczw0vLME=;
	b=MDbZpcBAlRR7Aqv+2enLav5l56TyU/MYz306kQSvfhpirLA2SYoGpM5hvR6j/k6/TyNI
	 DTliiDMiM/in/wFNSDAK6lrL3t9uDVqS5tvMmvbgTvsjUAqn5YZ5h/3DHHUbi/amigIAP
	 raX8pGbHshVOQMa9K4zli/pI3xbQBgPyxbxixvn7RwVjqnsTOHKkycQGJHjoXLs35DOag
	 bK8HQmpEPZnDxkvt98aWmlyqv2rkdcmhG7xTpJLBWEWNAFviVS9hXtL+PmoyMdw+iU0FO
	 OrxGotMPxa2yDQFgyBF50JwRfotbo8YtRQ6inbgSBvwn22M5QQn3WTCsXeGvymoh9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtuRzOEa;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C0606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529C0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtuRzOEa
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67da7d18f2fso1296385d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018628; x=1795623428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KH7bb4VaZEOEZgLtTJYQPM7/j5RYK5pPIJZczw0vLME=;
        b=xtuRzOEamMGYgtiYuM6qfVeZbJLoQ4RdjYdaDOdyPo2YNhNfD/OckX6UEtBR3kEZSs
         vJFYRURQssLs/ekgygb480/C5GjFLqICc0PL2XZda4Oeh5itJ9hfynMoCVX4B6NrAoHa
         RR4+DcmB17YhLMRN0/66jLTND0N5OrT6zgUaer0oybgbJJrjI+g1UGWVOnGGjVfurzF7
         0vECaAwjXgM7NKRNJ8W8LG/c2+8L4ITQLaiDcnCGBs6b/0NssZ0Ic/4ydNVaIavxXXMX
         pWUVBNKRojJotDKcw3Fx5CjRz4dU5sjgWRnznTIE4IvXXm/vQ5Cv97Ss/q6hGklS9aV3
         NAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018628; x=1795623428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KH7bb4VaZEOEZgLtTJYQPM7/j5RYK5pPIJZczw0vLME=;
        b=MFhsLUKjQaMlf4e4Wb8Yopb0W/mKI5CYVUctz0vMrEyTXUXbIth1g6oqTJtxV7VX3q
         Dxcy5pBcB41edCvhAjdsk9yiNtXjJIEJNrUJQ6Vo5KYhhdnKP6uxDESW4IX4oMShMAD5
         0alotqcB9rpgAEoM7QTJoaUXeBBOzwAZ7W20S2hnfEub0btrWoTSdt40BoJ2Z2sVY56t
         1XHG0SUxI0/WbpBibKYuXdvv6xPPHC8pz6CXKwXq5BSzqKBlSMgn9KBXRisuQlkS5e3h
         ygVMdSZLEQ+HLTPVlzRsQhaIRvvkHPGEsjK+jC+WkOjfPzIBe6STiPGioMKRUo7+AjgA
         079w==
X-Forwarded-Encrypted: i=1; AL+hErFFVJnhYiAWmoaXnzFDau8z4TaIpqr9f+cHIRxaErapB5WAIMqo+n4483jTis9mKilUeJYBx4QYuIxoeus=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wkl9ZMLg8yQh9Pbl5PFtkt96uXNmB6cBDFugmkiD6Xy2pjjUb
	nfdvPelIf7CVnFH4zvLf64GdvI3M339lhHoWeXqy/VoG5h/bbr78XvUH
X-Gm-Gg: AZFdTZesNq7a2PFBphV5TUoT8skxR7QuEqNjbK6GLsAFS7pt1SqHzIJHwdRDC97o0do
	8qt3tnSh9lacGGmvjNWsBdGJqYT9/NfTj7AOn5Mg+K8/5Z2o/u6WAU0A2qbGa/2R8zoDIFUtdBE
	C3WmmVYMQ2K63pfCIm0BWu+XGJejjk5YRduyvhUPEqDRln0O2vW+uHJlVgdnVeYLQzLd1tMAZrk
	rtwKscYl8XCuoNjChpZi24mQw3ufoesSpk94Or98itI4eHOqEvcWgpQxSUr+0x05BgUFTmWJdS3
	w22pm3A1KVxdbBoet6HQLqeAL4UVSBBI9KuRqng1LnfrfS/Xbp8jplCS0Y1QqFQAjJKeGtzc3tr
	t8vO3SizqDl1dwBZVHmmc729frZnHk7RtplQGxSSmjQAj9sm4acVzOmMVnpa7DLSSR1Y47b919K
	pxkivlapFyRDkkHfqb04GlD1yIBIsOpkgtpe/WJqEkhH1ABtYQFCYL/HjgmDnEuBQkuaMmhskqX
	CiCuuAjtrMgnDIDzi3JsA8nBNV0OWnVMpkGKX2moB8Ftlq9nvdGimL5gaYrXwg+zolT9ZCK54Ds
	96v1Lu8lfiJJNQcurBrjlkIzLJqNl5N19060nu+9Enoodiy7tYBx7IRAfKKDWggxP+rO//0N10e
	Rx839xj9AkgT7/LONuEaQgpx2nBU2GosGmtLwPA85OSKqKsvvluBQCvsTj8Ela9sl/TbcOk49Po
	dlfYMkQIB0aOysw4sR2g==
X-Received: by 2002:a05:690e:810:20b0:67d:bcce:d615 with SMTP id 956f58d0204a3-67dc786a8dfmr2191044d50.10.1795018628172;
        Wed, 18 Nov 2026 08:17:08 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd58cad32sm1901629d50.22.2026.11.18.08.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:17:07 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Paul Mackerras <paulus@ozlabs.org>
Cc: Tanushree Shah <tshah@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] powerpc/perf: Use SIAR for kernel sample addresses on 32-bit
Date: Wed, 18 Nov 2026 11:17:06 -0500
Message-ID: <20261118161706.2454031-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117-ppc32-perf-v2-7-2072e9b90009@gmail.com>
References: <20261117-ppc32-perf-v2-7-2072e9b90009@gmail.com>
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

On 32-bit, perf_read_regs() sets regs->result to 0, so regs_use_siar()
is always false and every sample is attributed to the interrupted PC.

The MPC7450 family's SIAR holds the address of the last instruction to
complete before the performance monitor exception is generated
(MPC7450UM Rev. 5, section 11.3.7). The exception can be generated
with MSR[EE] = 0 and is taken once EE is set again (section 11.2), so
when interrupts are disabled the interrupted PC is wherever they are
re-enabled, while SIAR still points into the disabled region.

On a 7448, sampling cycles system-wide with --intr-regs=nip during dd,
perf bench sched pipe and find, 46% of the kernel samples have SIAR and
the interrupted PC in different functions. 13270 samples have their PC
on the instruction after the mtmsr that restores interrupts in
ata_scsi_queuecmd(), and 11661 of those have SIAR in udelay().

With interrupts enabled SIAR helps less. Sampling a 32-instruction
loop with one store and one branch with -c 10007, 99.8% of the samples
land at:

  event             interrupted PC   SIAR
  r122 (branches)   br + 13          br + 9
  r014 (stores)     stw + 21         stw + 17

Because the exception is held off, it can also be taken on the other
side of a user/kernel transition from the instruction in SIAR, e.g.
just after the rfi at the end of a system call. Recording a loop that
alternates user work with getppid() with perf record -g -c 1000000,
3022 of 16953 samples had SIAR in a different mode from the
interrupted PC. The callchain is walked from regs, so taking its first
entry from SIAR there starts a user callchain with a kernel address.

SIAR also holds a real address while translation is off, and a real
address looks like a user address. The hash_page() fast path on
CONFIG_PPC_BOOK3S_604 runs with translation off and EE clear and
returns straight to user space, so an exception generated there is
taken at a user PC with SIAR holding a kernel real address. Reading
one word from each of 2048 pages after an mprotect() round trip has
flushed their hash PTEs, with -c 10007, 1674 of 2659 user samples land
on the real addresses of DataAccess, hash_page() and
fast_hash_page_return when SIAR is used whenever its address matches
the mode of the interrupted context.

A user SIAR cannot be told apart from a kernel real address, and the
table above shows user samples gain little from SIAR. Use SIAR for PMU
exceptions only when the interrupted context is the kernel and SIAR is
a kernel address, and the interrupted PC otherwise. With that, neither
test has user samples at kernel addresses or callchains with mixed
modes, and 99.9% of the kernel samples in the mprotect() test still
take their address from SIAR.

Suggested-by: Tanushree Shah <tshah@linux.ibm.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v3:
- Use SIAR only for kernel samples, and only when it is a kernel
  address. A real-mode SIAR from the hash_page() fast path looks like a
  user address and was used for user samples taken after its rfi
  (Tanushree Shah).
- Retitled from "Use SIAR for sample addresses on 32-bit".
- Link to v2: https://patch.msgid.link/20261117-ppc32-perf-v2-7-2072e9b90009@gmail.com

 arch/powerpc/perf/core-book3s.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 10ded865583c..aab18f4dda94 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -112,9 +112,28 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 {
 	return 0;
 }
+
+/*
+ * The MPC7450 family's SIAR holds the address of the last instruction to
+ * complete before the performance monitor exception was generated, so for
+ * a PMU exception it is closer to the event than the interrupted PC. The
+ * exception is held off while MSR[EE] is clear, so with interrupts
+ * disabled the interrupted PC is wherever they are re-enabled.
+ *
+ * Because it is held off, the exception can also be taken on the other
+ * side of a user/kernel transition from the instruction in SIAR, e.g.
+ * just after the rfi at the end of a system call. SIAR also holds a real
+ * address for code running with translation off, and a real address
+ * looks like a user address. The hash_page() fast path runs with
+ * translation off and returns straight to user space, so a user SIAR
+ * cannot be trusted. Use SIAR only for kernel samples, and only when it
+ * is a kernel address.
+ */
 static inline void perf_read_regs(struct pt_regs *regs)
 {
-	regs->result = 0;
+	unsigned long siar = mfspr(SPRN_SIAR);
+
+	regs->result = siar && !user_mode(regs) && is_kernel_addr(siar);
 }
 
 static inline int siar_valid(struct pt_regs *regs)
-- 
2.56.1

