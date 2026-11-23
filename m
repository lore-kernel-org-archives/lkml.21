Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406825;
	b=Z2+wXpnfDt45RxL2my3ygwHUoIOl7kts0QuIMSvmcOMQBqeY2XINt7lpslYe7N+SE2St
	 ChLkoLxB6cdVbvwaKSMvUBm0B2G3AtFEAuw6/rTtBi4JZLlflbM+w1NcgGcXPjZ0ZXvMg
	 fVe3le86K6tniBC/IWRDK0oEKnKOlKgfpGbgoFxHK0R046LxsPAX/AjSrXRzBr4WM6Z+N
	 TtkfKmM5FITOn5qVTc6qKHQ3RZRdxd7MsBLdl1CB7ROcrVAq+/amx83F1QlMiQ6eQMdeS
	 TbW+0lAPKS+ONUGBeKzwtpwMUW0E1bVg6ReOGPTm4ozIKTtJFE6wrmGkNjJ2WFXvy4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=LLWUQJfbd+q8VyoErsrKDBDgdA9nzb7m7pgg7/PG2U4=;
	b=NSL3i0uE3oRSvC9AmZlkY/6a5DBvkWUFxl+CkXxDzyK12k13rhuxDgRMIJOEaM9w+pGo
	 2D22afVKT/O/51cMazRz8iuju9FI4ouIa+ImHuQjTHJvSxi3YvC5RCzEN5Gk8eyJTo3Nk
	 nhtHMdJYvwgFIuNY2pp2NsGwAaElBOPPYNodCWAS3qkZFzRIafoATNwFmzQ7Ywlz/WTGX
	 8Kr3MZpCF7hWZ6iFmpctYIibkaQrAEy/0yNAstkii1nffKUhUit3sapuE+sVb3bQu69Lw
	 Q2l0WtoX0KJRmhS1LZ7FUKrSpJ1D55tcTXph4Xed2SRedeb60AqRHhU/rxbFDROoq+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrkVMVM8;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBF606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDCBF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrkVMVM8
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1040937a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406824; x=1796011624; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLWUQJfbd+q8VyoErsrKDBDgdA9nzb7m7pgg7/PG2U4=;
        b=zrkVMVM8fiHIA2UIO1Um5i49tmxW5eAK/JbbSxShAL8W/6EY0z524g/bRIpvKqlMDo
         6aKIXn27f6nZ/hN1j3RBtpx3nDs//cfaPPVaWZR6AvCdt+HOKLsKNZvWbsjXNtuO+SN9
         /aI/c9/i1dEUrMglw2IFAf3wpR5tBymGIoQFag5KJ+JqP29kvrOa8hCq6xBemxljADkW
         tzXv0bBUBqcFmUpbcirQeDeWwn9tD2B/2MUi9/4BtsfklBJX/0KFxHRZZrRkHs/zfdEe
         Zma8doDyTSAzPcxB2PShBO+k9yTHKjjM7rRECrAgOvOz2+Za8g3vZm0zubw0SFWmzqwk
         YNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406824; x=1796011624;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLWUQJfbd+q8VyoErsrKDBDgdA9nzb7m7pgg7/PG2U4=;
        b=umhZ0bqjxY6N4Sybjre3wPSFkzxcNxuEEqiUTW9mKPFT8hAnr0kqfXebnkwDwZ3G2o
         iCULFkPhFwXBW+o6QWZlpudlpvSKY+c2IBk4yZgmYF+V8Euu9zj0GyyiKTOO12A54PMv
         0+nuo46uNgdTVc1ObVYiuQQviSwFIFsresq4wUNk5LiKz8zlnFdi/lmf0ESoyjdBV0os
         Q1aWnUmwD0Da4tu9jTy+rHteExLhEyCge/jpZ+JVb39VPUqHL5+BGmFOWCl2imeoJTNA
         P/ysehL6XDjhyszRMlgKfvp9CjJj5JwjUVCfV7npIBraS1AO4IVTodWcBFjArX2TRnde
         FTEQ==
X-Forwarded-Encrypted: i=1; AL+hErESsQSBSEDAGm95gLNnqhm/oufyUEy/ypLJFud6RRdNJ4QfyW2ZBxNLWKUYaKelM3w2CcIHELJjx8aDM8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HEjnDeOK77dW47NGu2/Ka6vipahjbSg1Y5QGQk1j4qnwv7OHD
	HW5/g+2JOJBWnV6QMKte68DHjnMI2MdmmYMS+TvNWDCqocrp0D2VBBYa
X-Gm-Gg: AZFdTZdRXGAwTUJSDDsLkbRdvS8kxbesZHcYTvdlF71Dt7168QMMEPtf2nCVE/xUzH1
	OhcnToVX+4ahz6yzB2v4D9Nka3EcccAtRteK5DlrFfRrnmW6X3WxPhwn1cZF0tWVoSZ2zn2wXmK
	kj5Ut8oxeVRl48iI4FMI7Fa2deU0HD+Jne/PYbnEvitOzYDJfx4LTR2pVqHBMEJ8ZE4BoqLq6st
	9oYXZZqbc16bHZd05ImiGILbM3fE1R4L2nQiWUn5/kAmUrodMM4iLQUDNLr2BQI8OkzFKEglSaZ
	3D9ZDnIrIXRICU1Oy+dTDpfXkPe7vUrHAud56IE4WhJgKg0bXfsMRFa1FyaWXIOP6NmgtheCec4
	r0vSI79VMi5PFQ6xIwsHV9pJB6BUkkVI7Fs0mYih5/fLbMBfrr0KbIwgkCCdPzWjg/i1HIHWM1M
	QKAp6QFqxSUbpYPPY4Au+FtcmftXz76Sqg27pcQeEtib4qoRTi2HCIiy16FiQ07i+Rh3GvartsD
	Dz4bjqDj4RL6XEZEVsnnc2ZAPsL41qoLuEePzU7s2IDmO3U4t3I45MGzdYOHEEA7XRHwefYZezj
	Q62EeJy2dr3aAFT/q0UYDGp7dTTbo0Rv8HDyZ0Kdphbwg8dIi3w7NUAGd+Ys8PKBlJEP37dmA9/
	Xam+l1QJ8JC6JujN0sEMyOEPqAkFyj9oeOg==
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr9277361a91.51.1795406823840;
        Sun, 22 Nov 2026 20:07:03 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm15511490a91.4.2026.11.22.20.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 20:07:03 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 04:07:03 +0000
Message-Id: <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
References: <20261117172341.3152407-1-ryan.roberts@arm.com> <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com> <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com> <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
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

On Sun, Nov 22, 2026 at 12:58 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
> I view this patch as a fix to arm64, not as a fix to BPF. I haven't changed any
> BPF code - I've only removed an out of date comment in BPF code, which assumed
> the code path was for Spectre v4 only. But that's not true since Commit
> dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier").

Fair enough, but the arm64 part of that comment is stale.
The verifier relies on nospec for v1 since
commit d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1").

> arm64 was previously nop'ing barrier_nospec() despite seemingly needing it in
> the same situation as x86. I think this is orthogonal to whether or not the BPF
> interpreter permits speculation attacks in other places?

Not quite. In the interpreter the barrier sits behind an indirect branch:

  goto *jumptable[insn->code];

arm64 has no retpoline, and the prog can train this branch.
With a wrong target the CPU skips ST_NOSPEC and runs the next insn.
So the interpreter is still not safe.
Yet you're arguing that you're making bpf interpreter a viable option
on arm64. That's just not fair to users.
Say it in the commit log that you're fixing one tiny issue and leaving
giant security hole in place.
With that I'm no longer nacking it.

> Looking at bpf-next, it is still possible to deselect BPF_JIT when building. If
> this is such a security issue, shouldn't we disallow that on arm64, or at the
> every least make it an EXPERT option?

Yeah. Good point. Let's disallow it on arm64 and x86-64.

I'm thinking to push something like this

diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
index d705d7b..8b8688d 100644
--- a/kernel/bpf/Kconfig
+++ b/kernel/bpf/Kconfig
@@ -26,8 +26,8 @@ config HAVE_EBPF_JIT_KASAN
 config ARCH_WANT_DEFAULT_BPF_JIT
 	bool
 
-# Used by archs to tell that kernels that were compiled with BPF JIT support
-# have no BPF interpreter.
+# Used by archs to tell that kernels with the bpf() system call have the
+# BPF JIT compiler and no BPF interpreter.
 config ARCH_WANT_BPF_JIT_ALWAYS_ON
 	bool
 
@@ -36,6 +36,7 @@ menu "BPF subsystem"
 config BPF_SYSCALL
 	bool "Enable bpf() system call"
 	select BPF
+	select BPF_JIT if ARCH_WANT_BPF_JIT_ALWAYS_ON
 	select IRQ_WORK
 	select NEED_TASKS_RCU
 	select TASKS_TRACE_RCU
