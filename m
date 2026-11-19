Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795121670;
	b=mg53KJTtUZdBC/Ivhj8uMT0INT06r+qusrBojmRSC67CbWKlwYa5bcNha7GgCkR4MFMy
	 BYzbD4xbUBnVk0q/jgyJhsStmt1DKnM1iqJlZgHUwdCIZ04dP0lqeL6KfbUw/unFMy8M5
	 lNtSc/B33sGRBCPbP1CGePnTbWxE36VM/A3HybeE98pXEQgRH8q/rS/p7fGuHszsQn6SS
	 l/RwnjaLTtybpfjinHHinvkpXcjHhnXX5FUBFsPdOp8415H9C4p+ZqQhl3I2XpdMYHXTe
	 ujsnKB8MSh5IHqse9+mACUSjjrTvX02vBUcvrQZNYchvyARUanV0VDd2xycw8Yjrz9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vOYczVGOCVXLnGWwcxZhsrCNfy5FWMMbqNNeEl1BRcQ=;
	b=xAPTQpkLJo9I4VBK+31eo2VXqKdL25liJyXTeuB4wWLxOyxdgaqcMRaXJlOeH7iVl8vd
	 fKXxfHQ1pC6LzAaa6ErUH9u3IMTwq4JScNN22z6+LSKj2qivjcesDYGef18SRmHBREVp3
	 iAgpCNgJHjtJVPM84E1XZ1OQeffbjIU2jRO8mdvtf2iDGoEly4QMD2fPHm0eQxc9h21Eb
	 pPzJmZ3bJNwUIJWoebL37EiBtA/mFwiuHIZi2XvrENFvGS5mltt67QdMkv7/3ZkIFr2Hm
	 Fukfn9K/YWnJtmnFa4EObbhVwwd8RweI/47E5gY94+9/7wfn1F3BEbloWlGEllUhHxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gzy98tQV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B53606A904
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B53606A904
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gzy98tQV
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so380185c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795121669; cv=none;
        d=google.com; s=arc-20260327;
        b=Bbqkyu1VcYEArznTe9k4YHGmbndi9OxKblyuC2/8x8JeunKbzE+A8mYFHQSNH4NQTo
         yEWKwNGdkm9DbrNfarwke0Y4xXXU2sHUCHQAqipcn8yUI5I8bEe0jMA+UVmNV9M5Q+WJ
         DTJocacMAEpbgRIel4SFPQbTCfu9UpJocLBB9FLh9Ks6BKMx/02zK1JeX4PgF71TbZNF
         Gr92cWNcceA/+R668FOgOahDcebGho4t6aEWoe1LG42KEshB9URnJ67US2GmftgomTh+
         QQb2vHu/kNBOpsS6IXjEHYzRaU8TLC/vR3jG46dwwZgBBvP7cG3Bg60VcIbf2FelZw8l
         hIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vOYczVGOCVXLnGWwcxZhsrCNfy5FWMMbqNNeEl1BRcQ=;
        fh=OmUBpDkRv3+5wv1FZNt2dxFAkQ64MjcpxeOjngFU0TI=;
        b=lOTS9Ua5yfyRK/giTjJd6vlj9Q5IUVnmUeY9qs/JdvxQ9sIFpC60YDxoR4oP1oXtUF
         aDfbquSy5R2XnREBzIyLOYS0w06AvX2r0/sAKol62/TC0UmWWqngJPPIQv4YGb/tTi3t
         GZJCUueVUeiIfIiCzXUTmFNDtrDRf8/LrEu20is0XtLRzsI69IVLbTCu6lCB7e5nPsb4
         KzSJzJMBos6UvqzHmvcyg6+KBSgKAu+Jq5NEg9uE81+gAHAZcV7GWITmfX9DYuvJi/hX
         zzLfqrkCR2r1/S79jvXPGB7CyuqnIc6V85qP9RUluzPf9743JAE7zeAiiXrpN0P+bZkv
         CC8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795121669; x=1795726469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOYczVGOCVXLnGWwcxZhsrCNfy5FWMMbqNNeEl1BRcQ=;
        b=gzy98tQVnpV8eFwK3yeasZdus+SlweBuiLUWxnQfcgZTeygmWC1iyBtcYDz7pZomnm
         nQnrN6uoU+6OPJqDqxvQ2Kba3puL6kbEwch9ONNFa+m7jlnnP3boT9rd52FoTXuPfvd2
         DYVL9x64zGqpUJqW3vyQmDk+Jf9xMTpetOQQYYfJE6/eoyF1gOOpUMCazgOY6KSno7cl
         z3BOx7mups6LCZ30KtUEZ6HQtFo4y31+a5Ss9zklV2uX5Pfm9sj6emrkLJDahaOI2XM0
         0Y6WjPSzRHS9dWrCvN7IE0uIHkROr7PpCLEFt27keUX66wXcfEHtWvsjztHWYlCTc3iM
         mibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121669; x=1795726469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vOYczVGOCVXLnGWwcxZhsrCNfy5FWMMbqNNeEl1BRcQ=;
        b=Yg6taaLQScMIscbAo3M3lQ0/G6gsEo6FSJkFS2pimuhpTLjChDvQ8lx4bn6Vi5m3ZG
         TgZxoUcaVpqZS0yPnQ8PsyUiuhDqWZwhMS9wgkga6RK45tENJtlNwMxfE7Ia7I6kt3tb
         BNA0pAS5AMxe3Pr9r3x2/PxyyDEmzZYR/G2PBPsDD8wgGD+8llhhKL9KVj7S2qJrCVzj
         OBoXHGrPHkap6mgsAnLjcP2S6xNkwK2VXTk47V76pyLoteky+W6XQU1pHiNrQ9CYTpNg
         8shkC5W3R/ZRvih2UkZs6OcwXsDz5pjTjg7cEkjGluaF5+9X6YAKa36Bk22LndMfM92Q
         9UZw==
X-Forwarded-Encrypted: i=1; AL+hErG9yTZBuzfNXop1IJkjtKOv9GqlnCUH9FI2WgcZ9TvtNa+Tckce/sPlFdorXRUHylnQKIzmuuH0ltHSbnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sbPhKKg0bfXiyoiKBrMTp3t7Ey1eEG5cm1zjyYJzPFM7pM0Cr
	dOKg+rMthXWLPN4rCfJ2i1foXpiePoEjxHYDC9PpBYayiVcj9B4FQxQ5fLsVnJKFdlcXswmRCh/
	xhOW170vB6cBmXrn33MudEISDSs59ueXvu1fjpOq7
X-Gm-Gg: AYBFou3cPy4PAgSPVhafz8h8spligWWaziqMF+HOAm0rcDSh2j9Q3jItFa8ZLLxfpjF
	KBnisVwEynsrS0taU6SCavE3G1szi708Jcp38jlec0n9PvnLkC6ouQrtO/Bq2HiXph9UATWWmNM
	bTdcKwOxGc0YZXvqloFODgYivlA5ThgUIu1yVmSloUrra4wWEB70FqrUp2qStrLHKm1rOglPoAD
	aV5lPN6zfLmxEIHBXI385B/S5rhqe4Mu7zLkvAZ3VkCHHvwHhaeh5J3+Tr3Rg1V6KgTK/TNHxES
	kDnZT74AblsdA4//7FDrvsnSprEOTc1O9otxlmBywOUOFuBOl+FlZ3c0ilOAzt/1Tl0TroFhV2t
	BNjqkT55vKic7m5ouB+X3FR8NSPCAUTVm00NNss+lOoqVFUikf6wSyDzZySMVFt1GWHI7
X-Received: by 2002:a05:701b:4512:10b0:1a6:7a2:cfc3 with SMTP id
 a92af1059eb24-1b558384c4fmr258924c88.13.1795121668410; Thu, 19 Nov 2026
 12:54:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6aff5b8e.4ea6388a.d0c9.0001.GAE@google.com>
In-Reply-To: <6aff5b8e.4ea6388a.d0c9.0001.GAE@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 19 Nov 2026 21:53:51 +0100
X-Gm-Features: AclHuK_wNC7EV222WDiKYVhLrNqRIyl8T99FPHgfeUBm85ZPWsdZj48SRALMNaE
Message-ID: <CANpmjNOBWLCJZsyc2WZoOaF8QOj8a+yE0Puf6skiLNbjUrANjA@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] KCSAN: data-race in fpu_flush_thread / skb_copy_bits
To: syzbot <syzbot+b07ec23d35be305855be@syzkaller.appspotmail.com>
Cc: arnd@arndb.de, binbin.wu@linux.intel.com, bp@alien8.de, chao.gao@intel.com, 
	dapeng1.mi@linux.intel.com, dave.hansen@linux.intel.com, ebiggers@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	seanjc@google.com, syzkaller-bugs@googlegroups.com, tglx@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 21:26, syzbot
<syzbot+b07ec23d35be305855be@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    666539eecdf4 Merge tag 'assoc-array-fixes-v2'
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14b3c5be580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b949a9d3c1d44ceb
> dashboard link: https://syzkaller.appspot.com/bug?extid=b07ec23d35be305855be
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/a943b9915869/disk-666539ee.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9bfd839d7ea5/vmlinux-666539ee.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/0f20b9720a71/bzImage-666539ee.xz
>
> AI-generated root cause summary:
> In arch/x86/kernel/fpu/core.c, fpu_flush_thread() calls
> fpstate_reset(x86_task_fpu(current)) before fpu_reset_fpstate_regs() without
> holding fpregs_lock() and while TIF_NEED_FPU_LOAD may still be clear. Because
> preemption and softirqs remain enabled, a context switch into __switch_to() ->
> switch_fpu() (or a softirq using kernel_fpu_begin()) can observe
> !TIF_NEED_FPU_LOAD and invoke save_fpregs_to_fpstate() -> os_xsave(), reading
> fpstate->xfd (via xfd_validate_state()) and fpstate->xfeatures concurrently with
> __fpstate_reset() modifying them. KCSAN reported the same task/CPU with an empty
> read stack and a stale "skb_copy_bits" frame because preemption occurred inside
> KCSAN's delay_tsc(), and __switch_to_asm switches %rsp to the next task's stack
> before __switch_to() calls switch_fpu() while `current` still points to the
> outgoing task, causing arch_stack_walk() to fail and return 0 frames.

The above analysis is confusing. There's a better analysis it did
(https://syzkaller.appspot.com/ai_job?id=45f623b0-666c-486c-a73c-ede5e8eb0ba4):

>  CPU0 (task in execve)                    CPU0 (preempt / softirq)
>
>  // Task previously enabled dynamic xfeature:
>  // xfd_state == 0, TIF_NEED_FPU_LOAD == 0
>  fpu_flush_thread()
>    fpstate_reset(fpu) // NO fpregs_lock()!
>      fpu->fpstate = &fpu->__fpstate
>      __fpstate_reset(fpu->fpstate)
>        fpstate->xfeatures = default_features
>        fpstate->xfd = init_fpstate.xfd // != 0
>
>  <PREEMPT or SOFTIRQ>
>                                            __switch_to() -> switch_fpu()
>                                            (or kernel_fpu_begin_mask())
>                                              // !TIF_NEED_FPU_LOAD is true
>                                              update_fpu_state_and_flag(fpu, current)
>                                                save_fpregs_to_fpstate(fpu)
>                                                  os_xsave(fpu->fpstate)
>                                                    xfd_validate_state(fpstate, mask, false)
>                                                      xstate_op_valid():
>                                                        fpstate->xfd != xfd_state (0)
>                                                        fpstate->xfd == current->fpu->fpstate->xfd
>                                                          -> returns false!
>                                                      WARN_ON_ONCE(1) // Kernel warning

> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=b07ec23d35be305855be
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b07ec23d35be305855be@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KCSAN: data-race in fpu_flush_thread / skb_copy_bits
>
> read to 0xffff888103fc3058 of 8 bytes by task 15366 on cpu 0:
>
> write to 0xffff888103fc3058 of 8 bytes by task 15366 on cpu 0:
>  __fpstate_reset arch/x86/kernel/fpu/core.c:-1 [inline]
>  fpstate_reset arch/x86/kernel/fpu/core.c:620 [inline]
>  fpu_flush_thread+0x128/0x360 arch/x86/kernel/fpu/core.c:882
>  flush_thread+0x40/0x80 arch/x86/kernel/process.c:291
>  begin_new_exec+0xcd0/0x1260 fs/exec.c:1235
>  load_elf_binary+0x5ee/0x1a00 fs/binfmt_elf.c:1010
>  search_binary_handler fs/exec.c:1777 [inline]
>  exec_binprm fs/exec.c:1809 [inline]
>  bprm_execve+0x480/0xaa0 fs/exec.c:1865
>  do_execveat_common+0x6ba/0x720 fs/exec.c:1963
>  __do_sys_execve fs/exec.c:2036 [inline]
>  __se_sys_execve fs/exec.c:2030 [inline]
>  __x64_sys_execve+0x5f/0x80 fs/exec.c:2030
>  x64_sys_call+0x1cd2/0x2550 arch/x86/include/generated/asm/syscalls_64.h:60
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 15366 Comm: dhcpcd-run-hook Not tainted syzkaller #0 PREEMPT(lazy)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> ==================================================================
