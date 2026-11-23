Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417095;
	b=WO9wZ8jHe/1H7eS8MWvXocIzlDCLv+yWVNrKLQAX+hLRhCNbVr0lUz76341XzZJbYzeQ
	 tbASHXLlGUryxfMkZMpBcK3OQ274j7N7SvDrEWQ4fJ00YtXpWbo6KUK0vq+wGUOObSCrS
	 V9iSBr5MfnF1BOSnRFa4kgEKOCT37XTiqBynSG8pyMKZV0+UvbLQv0H8u/1crEMTtEZfh
	 aqXAtNG0+U2a4gb0aZY0kbXOcmWskUSCy1L/BPO5KTgBhVl7TiVDuM7RsQyanvJcfVt2t
	 wP1aPzyBlA270HEJSmoCcZWRzmokoZITtGFLZmXnBSttu2dfdDt8uDXLl10tjOGXbvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=jRq81+OU1jcNW3QFiLfuhhBTEnv6dBf2fhUpIK5Uj6U=;
	b=y91qpLKjdxhyC0F8f7JFMiuipNMOTPoz6x3alYydyGvvk+4QK2eYiJ+Ynsc9r3RMKwAv
	 nXfRVhM21xKEAqVk0/JzCUUjmIhgJztfB5hHg9dGRR2FpEMKnOABiq7caC1n81SFBJT84
	 Sofk2atZz5Cm033ukK0sU6GDiJJFsoP1J8oyyjjf33DcNY/xU5fiqOUbbj2mgZL5CXcel
	 D3Hg2CRfj6/xI3Br7axKJG2+e51MpRIFn3C29hji4jxyAiHyyXbVK5OC4p2fVAyn6etGA
	 kN1szTb/bCZ3DZPkx5B0AsBmHD+URmdj7CFdFgtnwmAHzWgbnioER8Il+uPpV0ID+Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XNbOmbCq;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E25F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XNbOmbCq
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b2382bf051so1413010b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417095; x=1796021895; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jRq81+OU1jcNW3QFiLfuhhBTEnv6dBf2fhUpIK5Uj6U=;
        b=XNbOmbCqkAF+hYMweAKFcFLcBVdACFhf0hQIGU2zoHp7NC0s5YNLPZdVniUmih4u2M
         s2xkTdVMmMjYSMMubg6LXJRtY22AN9Ng+00EkzOKdbIQE438mVdN2cJ0JVG7DdISDtA2
         4NnkLSg7l/F7qaXNqla6T+s3zCt2h7lT1zuOarCUTl0PV6Q+VA7/wUuiuHlJ9zWiks0B
         l0yMxSxZ/fS5s2G2tRlhGCDnmKXY8OCaZFBLKP5Ol1VYHVsIjPnS0TpSnexCLpKGpmnc
         s7Xv1iqDoWExOuvgdVEhnIjuuOTl63Y4Uqmh3G5hQ6jHJLUpYbcHkMJTk6/vwYD/C1sB
         xRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417095; x=1796021895;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRq81+OU1jcNW3QFiLfuhhBTEnv6dBf2fhUpIK5Uj6U=;
        b=z3gtB8axjmj76f4Gkh1rTwjL/KrBvCZ/bEdKxf4J+DjmwiR4ljp8DoAAfpT6sHD5XN
         8dWKfnHX8/pE+Dq9Fg2zfqsD9iSZMGMcJrtFhhsfIZNN8claPh2nf9L90ptSg26UTUCp
         gclDwz5QITcrLbzH+RPWO/yONlimuq603L2tXhD3tlkGWW8LgA8PeYve4dBTIXgeIy5S
         KbjX/qnsrGteX19PrNJv6/OU0BpXl/VH4UCJv4p0QnRmOhudbfTIwp91WsUbS08GjDPR
         KHyVa2ltRs/0h494dUaq3pUvEOeysS0Xg3pOkzFxu0afHjEh6wbvnCYm3IWhxONV/QVO
         OsAQ==
X-Forwarded-Encrypted: i=1; AL+hErHZvY84CNh0DQM/t8BuF9L5tU9WUSDG1GZGzSW06a4PG1qMdJwoPut5cABVBAD9uAiYyAETAdBqQ595+AY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mPRuxyea6GnZnkwAfH99IVIJhxfM4FKu9IZdJAeneGTNI1eBk
	UZuqX2A5O9pM8t7R3mXv2xGW2bNXdyazj2nLrtXYI1P0SEQhzRS2adIy
X-Gm-Gg: AZFdTZdXAqT9kFjxq4Vsaa7dz9GTZGR2fKzAT4xUUUrXyQHdyOX8YYf4KZ4BTPmVMos
	D4RJHiAgMFM1AX5KfbCRpVHPqZn2t9lAWeFuKdYBvyyOialaDEaGwSZiNwAvE/76ID3OQPZsyX0
	YmRyqMi2YoS8RS9pCqpk0RCJ3ZfDv+sJ0uzsBq1lUkPLGK68vw/omAxZrmy5vr0LtcGXagv8T6S
	gLy5aqFVvd8fpS4QyDDfS47a6eBK/eNoyNXlrTb67WL8Or0xnESuLs46n1ER6Xyk66H5tu4CCLQ
	AFZhabUcS4/EzAa3ZoHbbXGe9HR1e9rak/nlhYTXapP2dpGn1MCDoFWXw5XsnPM4cbEltnl2tug
	z82G6kYVSHQLcOaNHcwc17tCK5RtLn89VjN9+Tg36ryTNquIbFAh6JROxj1uyPM8MNovLbQ+/ct
	QhRCUW99aF2qnbzOvHCO8wwMeDMym6HI3mCb9dWzSU7lEYJ35/TDFmThc3u1SkqTBcXfJOpUT+Q
	7viN4TstTvz6jIv3StjZIO0/golUhzdyNEgic37qSb/C33N+OOGP/36VQJKWMw71BTqCsJuSRWp
	gMK4y3OSup+ibochaZ8SF2U6+2Jf7XRIlsOrxUcqZhnp+4ld3virk62pvvvnNbSawPdok5LyFhu
	UePHegHQdJ39kYOevAQKSdsvAFR9+9Jjvxw==
X-Received: by 2002:a05:6a20:b40a:b0:3eb:b31f:3558 with SMTP id adf61e73a8af0-4014bc4a481mr9510489637.32.1795417094602;
        Sun, 22 Nov 2026 22:58:14 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm4327684b3a.23.2026.11.22.22.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:58:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 06:58:13 +0000
Message-Id: <DN2E8Q9V38IF.3O738M7NGLSAL@gmail.com>
Cc: <bpf@vger.kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, <kkd@meta.com>,
 <kernel-team@meta.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Borislav Petkov"
 <bp@alien8.de>
In-Reply-To: <CAP01T75Qps8bKFZAU2gN-3UJTB1aWw46NG5c-sm6K028rSc9sA@mail.gmail.com>
References: <20261009024925.3169077-1-memxor@gmail.com> <20261009024925.3169077-2-memxor@gmail.com> <20261009041346.GHashp-hYpLl-o-l3M@fat_crate.local> <DM0ESVBT9553.2S1RWK1W7M8WW@gmail.com> <20261122200848.GBawNL0FcQoK918YDI@fat_crate.local> <CAP01T746W=8FFiJJUM3H-Qv09uRO6-XEi9B-8pjSgtpAPBx4EA@mail.gmail.com> <20261123003036.GCawOJLKK1iX47XTDm@fat_crate.local> <CAP01T77EgbuyhP=zU9L1hwYL6rHaSbrqQZGJR_+9AQgSWLe7Nw@mail.gmail.com> <20261123025529.GDawOrIQcDOPhgWwF6@fat_crate.local> <CAP01T75Qps8bKFZAU2gN-3UJTB1aWw46NG5c-sm6K028rSc9sA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 07:56 PM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
> On Mon, 23 Nov 2026 at 03:55, Borislav Petkov <bp@alien8.de> wrote:

>> "the only line of defense is for is_bpf_text_address() to really DTRT."

Boris,
SMAP stays on. The SMAP branch in do_user_addr_fault() runs only with
AC clear, after the CPU refused the load.
A wrong answer from is_bpf_text_address() can hide an oops,
but it cannot expose user memory, so your concerns are unsound.

> In fact, for kernel address faults, we already invoke it for exception
> handling. This change would simply extend that to user address faults,
> optionally for BPF code; otherwise, we panic as usual.

Not quite. See:

  fixup_exception(regs)
    search_exception_tables(regs->ip)
      search_bpf_extables(ip)
        bpf_prog_ksym_find(ip)    progs only, no trampolines
        search_extable(ip)        exact match of the insn

Here is the alternative

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index aa88370..9fe8705 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1263,7 +1263,16 @@ void do_user_addr_fault(struct pt_regs *regs,
 		     !(error_code & X86_PF_USER) &&
 		     !(regs->flags & X86_EFLAGS_AC))) {
 		/*
-		 * No extable entry here.  This was a kernel access to an
+		 * The CPU refused the access. If the BPF JIT marked this load
+		 * as one that may fault, skip it and zero the destination.
+		 */
+		if (!user_mode(regs) && !(error_code & X86_PF_WRITE) &&
+		    ex_get_fixup_type(regs->ip) == EX_TYPE_BPF &&
+		    fixup_exception(regs, X86_TRAP_PF, error_code, address))
+			return;
+
+		/*
+		 * No other fixups here.  This was a kernel access to an
 		 * invalid pointer.  get_kernel_nofault() will not get here.
 		 */
 		page_fault_oops(regs, error_code, address);

