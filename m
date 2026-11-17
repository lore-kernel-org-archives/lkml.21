Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937448;
	b=dQzfAhJ0VnW2L4YQMSz9gw7Wtm+mDJHtSjaUlrk+YZqQNpjkEdBh8a3ZSTLPITwk1Gk2
	 kTEXFCGR1omt/Mg22uGe+jqvKx8LOVMKmZ6iFk5dbriIlrnrBtMAYySFgXQ/U3lR7o80r
	 YMZL11MXxy1oPaSXabvxIr7865dWja2ny7YDP1rRxB5VfKkO2fHUu8vBoKJodSKPCooZF
	 D/ZcIWx3Ti6x7FaW2UBebUHW4n+H9vyNiOHWYCZQ28g1/GrOto9pWHBJsoJ3u1zBtVXPR
	 ulCdIpForvuDtj6MhM1TaZZ+qe7Q0kBVSWqT8+dnnrzxWmUZhUeVFfUyRGC82bLaGHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EMofIhkXpaZ8+oSY685djaeZJDUF5sw2CncgWG8cpWg=;
	b=fw2Edv8p1w4IvdOkTYGmOsQaWF07Hjc8q4fZXxcQeOFsi7LL3ldFl8i9OgtR86RglgK8
	 WlUbXZHH1fXdzeqnMeVtOJ2dYXMUcLQfLGt56d22Pxn6ad2gGVdvLO4SMT7oI7VmkMXcE
	 /aDt0ndEgD2kUXOLyUVKxp2hTLMgZFJDavKXylZ9MvfychAmd9wopkkrk7YEjdINv7Feo
	 FBYeZqtfNGjNT6ds0is9qyRRfDAQPsc2TrlsKHwV0EPu1B6uZCeUZDEI0eofKfQWrQTsM
	 THzFxgX8KvLMkDrOkZtciOTTzL4IqpYobfEznp+evJA2ee/NZlVAAULHm6FVAPgw8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="guB//sRj";
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8FB606A88B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8FB606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=guB//sRj
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4e2fcc300so23081477b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937447; x=1795542247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMofIhkXpaZ8+oSY685djaeZJDUF5sw2CncgWG8cpWg=;
        b=guB//sRjt70QIbjGzWxaOsU/kRL2jjxWF8eZOmmRUaXg80EghYUblSszMmddhgFX+3
         ODmgzjlSuUr/XRdSXxPCkS7IsSOGhYJsbPyquNPQ0UG+7ak++tgXuo6eWCbEzxph4Mnp
         AXh0kHwiGJUeGwEM4PaXTTHmKBvR+WXsSLXA5BKjBTFwM44ApXg6Qggxf9yAMceT5Uix
         sPnM+Y6h+bfDoWbUGgjZ7SuSsXLw5/nRCY9H5uXWgRBuXoCSRdAlm646Qk0VM42x8YHJ
         WH1nRXIXu8M5DID+iM7qNl/RL++4z3W0pDz1pTJvJW8a4QXZMEUoDbEjXIGL2gepD5a9
         f3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937447; x=1795542247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMofIhkXpaZ8+oSY685djaeZJDUF5sw2CncgWG8cpWg=;
        b=bg2liA8SEwJlc/4sTNUcl+MxYRMg6ocabqEeeCbX3M15tGfYqXISm7+KmgH9f8CLx/
         VtN7qjjx7yxw6arMEiZeqQTtIleAxXZKiazQ71Ym2BC4fIRbC9zPCPFroYYXEo1RUF5e
         0apq3cKFxsKgsCNrieGJAQ5qGE73Dk9/v9uUv91dtbfKxH3FWttCTEYXNghCVNSQlkDp
         NcphAPfun5/pbIUswpGsWNa9UFcP7WgcwQ9MpLAloqbkx8TlBE06VbFwBTlv9T7tJ9Su
         8ddAVL4i2mwO5Bc1z2s0ea6FBUpjbO2fAzPHVdWdSBZl4IvYDcRL8bcc+R3bH6fV56Dw
         uAIQ==
X-Forwarded-Encrypted: i=1; AL+hErG1xcFmddnF950t+W7Zj4S4IcR/wpYQeOBj7nSRMRiCmMXs+62m9dRmws+hWcUUs9SquNc22LPfn1oRxiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ydmgia3k4fkP9z50QJpXnbVFSCfU7SHE0OIVt1HAyBaWV7okh
	MRovpWMP+jh9AIaS8DCm26z3K8kLY2ZadNrZJC0CfuJYMVTWEjVXxDjaOS1GzjUspZ0=
X-Gm-Gg: AZFdTZfPAAkBbQmR9lj5Aq8l32rDO6LizfMUn6H+u+hM+7jk432NW5SxGJNU8FmF9jw
	/4Xa3Y6QOXsUzKlZ+XVjKhTUjFEvX45xSutv/ytKgy1qr48TrSuOPBQFIY8hDkXRFD3706P3Los
	PLvIDaOsJGNVfR05oQIl4YnPHmrUGIFvKl1mO3iNN4UyTHyxOaaJCOTKl/75OVrKgmlnPC++Pez
	f/LZrffVxEzzPwMA94AUDa9ZlUCd2HLVUE5ALM4B0q53+2iBtgijvCHpIfXO8Pj7DPEnjQqYL4l
	jl1qTtNO5kCusSSfbXolw0scckfIo3X5QZh0dL0g4zAg+lLbU653xrRI92A257NSJ2GZpC5GK5U
	c6JTwWClJ//VMWQTo53fMwxdVh/d8m05SQSSaWCQDuVxCISicv4RHeLno0614v2Wb7O1+iQY83F
	OiAUtxmpv/Q+bF3AnDZ5CxQa5+bK1Yh7lykb615NJrnqwnvAnJ+nzesdUJ53hkbZm/YuhsAHL6C
	6CRL8Bu0nguH2Ti3EtsyCnI4eO5pddUSuRI2lxGBwCrLFYGY5zXGjH5xZWblz17HxOGOwh/WEQm
	JPbDqmeCrMwSVn74smw4vJXufH6ZnrzM2/axkDDNOxqF02ktRGutVlpqiV6IgpB/JZvkToYAWuC
	/xHPx0lbxP8NFX4FNLDJHIoJKeCFAT22Q3rmecF2RRNsDNZbAxZRBBjnVbTyDBIxkiaQQU+Weiz
	84krc2zbA2X0xFWt2pUA==
X-Received: by 2002:a05:690c:30a:b0:8b4:e3f7:9edb with SMTP id 00721157ae682-8b4e3f7a668mr28160497b3.97.1794937447362;
        Tue, 17 Nov 2026 09:44:07 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe07408esm2161937b3.22.2026.11.17.09.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:44:06 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:43:58 -0500
Subject: [PATCH v2 7/8] powerpc/perf: Use SIAR for sample addresses on
 32-bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-ppc32-perf-v2-7-2072e9b90009@gmail.com>
References: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
In-Reply-To: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=sQH/oeX/+nbUx0BbEEHc52r/vsgK7BzhKRKCWM0N8VA=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIo0NGUxEJC7tOo634SlwSv/KV89fO+6YNCBVxly+
 Wt7+Gy8Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaSEeG/zE930sb7r
 vyP2d/pfxslRGv58b6oycvLvTXOvbmkwiPTD3D/5CrHFGFs0QXmy2zyFE/+O5B6iem/ScONDO/4
 7rlIr/2BAMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

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
just after the rfi at the end of a system call. SIAR also holds a real
address while translation is off, such as 0xc00 in the system call
vector. Recording a loop that alternates user work with getppid() with
perf record -g -c 1000000, 3022 of 16953 samples had SIAR in a
different mode from the interrupted PC. The callchain is walked from
regs, so taking its first entry from SIAR there starts a user
callchain with a kernel address, or reports a kernel sample as a user
sample at 0xc00.

siar_valid() already returns true on 32-bit. Use SIAR for PMU
exceptions when it is in the same mode as the interrupted context, and
the interrupted PC otherwise. With that, the same test has no samples
with mixed modes.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/core-book3s.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 10ded865583c..4c9c9ff1073e 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -112,9 +112,25 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 {
 	return 0;
 }
+
+/*
+ * The MPC7450 family's SIAR holds the address of the last instruction to
+ * complete before the performance monitor exception was generated, so for
+ * a PMU exception it is closer to the event than the interrupted PC.
+ *
+ * The exception is held off while MSR[EE] is clear, so it can be taken on
+ * the other side of a user/kernel transition from the instruction in SIAR,
+ * e.g. just after the rfi at the end of a system call. SIAR also holds a
+ * real address for code running with translation off, such as the start
+ * of an exception vector. Use SIAR only when it is in the same mode as
+ * the interrupted context, so the sample's mode and the callchain built
+ * from regs stay consistent with it.
+ */
 static inline void perf_read_regs(struct pt_regs *regs)
 {
-	regs->result = 0;
+	unsigned long siar = mfspr(SPRN_SIAR);
+
+	regs->result = siar && is_kernel_addr(siar) == !user_mode(regs);
 }
 
 static inline int siar_valid(struct pt_regs *regs)

-- 
2.56.1

