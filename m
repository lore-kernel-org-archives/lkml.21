Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972979;
	b=c6nmYX3PY1hZa0W0AdkF3Zb/uJAxKogqz8X5OBvZl8KG058R1KdAX27hDYkaS04RFyu+
	 I686kHxHrq3HgCyHUGldxGquEFAw5jQeHMI44s9hydopvPAPVI/Wr4M5axrCzs5V22NSF
	 W/koits4/vyY34Ck74vKc9EH9HsuiSENG2tg8R1Taz27Z4CqluUH1nDMLmghsWVp8owh1
	 0stx292GaMUBCRnmtQIzYJU6PGSjCQZe6AeZypADnFVZMBi98g9du64D6C/Ilr2wSivtp
	 sWyqL/vc6dhDg2qQapoG4PV270C66jYz9Z34300w2lP3ZrjwQEMkhm+yO3XCymlUGOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=11RTZk9ANOdZGuwayk1pIL4zWdN4kr7W2Yo5uEDiGwk=;
	b=RYpXmJULxocMtYdjsL2wEha2OVF0sEE5+1r+agdMCdEAkrp3zJY7Ih2C1bK1c6ZR3WF0
	 q/zzLYoX1PqHmHOzmbT5Rc8fm4m+FW5BZjI8fDUrrNAa8mM8rEffGjmkoYYMHNwW8rlvN
	 Cf700e1/0+mlV/ybZlJFSsr1celXWlHxfrGj9jKlqMyf19+ozmhVP4O0uw8K6QS957gZ7
	 KVbcapX4yiiHgK41EZenSFnZHdUNKiEonVvyIXTMPB9DJQg2I2g1KgPaFZVkFSBIM9w3H
	 bP7tKIZjKtr0N2opFL44ExFYUXyLb1v7x+7I0uk4rU56/HlU+bOrOni8SaNjYoDsXoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMFFC3se;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMFFC3se
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso710969c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794972977; x=1795577777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11RTZk9ANOdZGuwayk1pIL4zWdN4kr7W2Yo5uEDiGwk=;
        b=aMFFC3sec5IgSpqPbJppU4xZtV0uS9sBmq6dVF5Cz0RQbak+Xx6Nnmy9e+3o2M73La
         Sy5VQBToAkF10Ri9+BMrzkso5HE/XWpyldvsWOR4wumlCmFupLKOzTCao1sqWpyHCRE4
         1V59zoVooLZaLXqxX3wyF1QCMTOoTplRhFMJFsiybr1SfYrEUNV3DyFZu3emdiPZpzpJ
         cnaIdlr4st/QNSo2poPMFiwykUjetQgEmWWExK9VTgP7Dt4l1EIvQDJO0nauhVgvdCyE
         8FMkQyHIGsCD0PW+lFjZ9A109Q9IdITqaVeDeQuGNgPVuf1sy6kcxBZz54dIEvgHhodd
         avNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972977; x=1795577777;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11RTZk9ANOdZGuwayk1pIL4zWdN4kr7W2Yo5uEDiGwk=;
        b=HPZBGD0A3TcxDD+fgiQ1cj+cYSI9fIgGK/+tmp+fD665UtLKA54meilUDlGkpDA2ch
         zbvYd75UXY3JgHTt1cF2m57kAqHCfzVsWo/gnvci5dv6zOdiDDUNuVLpagsZvDNO3URd
         9mg9aF7+dKqWoHf41JCqRgeb/XU7LQfz8sBSGSSzg3AoI8+9W4gQ9e02k2Wf5dLBbBZU
         LuszWJW2dNWvaPvsKNd2ABsXQKvO0VRhMufte8lMlovkqczU4ZC76Dwx16OsaLrKMdO0
         z3Twzm4IL/jRf5BolX7rAKnJJNy2mH8+2XKNES4NdCIYxS9Henk4FykD74154l4ItH+r
         XM7Q==
X-Forwarded-Encrypted: i=1; AL+hErEtfOIgzlGQMglhMQYiR6AUE+huX4o9w5L+4MzAzUPJL9h4zkPV0BbZGISwsBt9LLqDkikc93DPxeXC3Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q5IfT8zO3U8WCeBTpT/j2dp20VscmDVkg2T2dCCoYJsFV5At2
	YYBEwouXJ1rLdNUe/IKtqFKfZzgmhigvAY9Cmno8qI23eHzm5P11Ghuy
X-Gm-Gg: AZFdTZcHE6sb3KFQlts2LfNO2us40cIKnMmB1HktcPChzkAdg+XU+DGIvuBR2pk1KWl
	aNpnRPj5aMfdcguVOToG4gZh5a4aye2UXed40dk2qXNrsel5EJNAGMWnUdwfvE3uL/4TdxgeVDG
	nitmNw0+cQrp/JXsJa53XE1Syq2BM57bt1onEw2P3VMQCkPpLixrTTSIC4M6zDYf/aEKz2PiC/f
	bknowDi3NaMnUpsEIPWb8zm2hrx2hfm/6EQffV5vLrmli8kfcCLsJNmZHKEIag+DqHBwZLhd10L
	4d3Yvu/IeNM+QlJ+SWEwpl5/Nv5O8yAt4M7s/W7vwCTOrLWYN45e2pFjpv0MA3g/U+eCXxgHRNm
	PvbMOn7jOqAs5uKicaq7rzdTAdowWR45jM4Ds3K8mMJbL2PHCXwHgZFDX/pL07pFQkmnmrSeWaP
	iIHqGVH0Ul8NMMZUTj+639SoffwPH1ImpEtBvzRMp5qPALO11fla/bYO/DlK6wkBgwyPS/9tRhW
	nC1NE4thmtVwpICm6TslJMnXdC3FZUWAVjFYsqSd2KJ50feWfKGKyIlntpN/ZAAz0SJ/iRHyT9Z
	BgQHx/QfWH1GID2JgDXTofCRJvY=
X-Received: by 2002:a05:7300:7314:b0:381:1580:cb4c with SMTP id 5a478bee46e88-38281023cfemr1749374eec.24.1794972977304;
        Tue, 17 Nov 2026 19:36:17 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm2677074eec.22.2026.11.17.19.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:36:16 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv2 1/4] powerpc/64: Leave lockdep hardirq context around replayed interrupts
In-Reply-To: <07b9bd2b-19da-4e3c-9b01-552364a82269@kernel.org>
Date: Wed, 18 Nov 2026 08:39:23 +0530
Message-ID: <se0y7s4c.ritesh.list@gmail.com>
References: <cover.1794924821.git.ritesh.list@gmail.com> <cfdac7c3508cf0eb1cbf063e7f6331dccb128796.1794924821.git.ritesh.list@gmail.com> <07b9bd2b-19da-4e3c-9b01-552364a82269@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 17/11/2026 à 15:25, Ritesh Harjani (IBM) a écrit :
>> With PROVE_LOCKING, boot warns once and lockdep turns itself off:
>>    DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context())
>>    WARNING: kernel/locking/lockdep.c:4448 at lockdep_hardirqs_on_prepare+0x22c/0x2d4, CPU#0: swapper/0/0
>>    CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc2-00027-g074831f06e18-dirty #123 PREEMPT
>>    NIP:  c0000000002b2f2c LR: c0000000002b2f28 CTR: c000000002426f90
>>    REGS: c000000004f075c0 TRAP: 0700   Not tainted  (7.4.0-rc2-00027-g074831f06e18-dirty)
>>    MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 48022221  XER: 20040000
>>    NIP [c0000000002b2f2c] lockdep_hardirqs_on_prepare+0x22c/0x2d4
>>    LR [c0000000002b2f28] lockdep_hardirqs_on_prepare+0x228/0x2d4
>>    Call Trace:
>>      lockdep_hardirqs_on_prepare+0x228/0x2d4 (unreliable)
>>      trace_hardirqs_on+0x98/0x11c
>>      irqentry_exit+0x64c/0x1064
>>      timer_interrupt+0x274/0x6bc
>>      __replay_soft_interrupts+0x158/0x380
>>      arch_local_irq_restore+0x1cc/0x244
>>      console_flush_one_record+0x438/0x654
>>      console_unlock+0xb8/0x1e0
>>      vprintk_emit+0x300/0x56c
>>      vprintk+0x20/0x34
>>      _printk+0x40/0x54
>>      lockdep_init+0xdc/0x104
>>      start_kernel+0xa24/0xc68
>>      start_here_common+0x1c/0x20
>> 
>> Since commit bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature") a
>> replayed handler always returns via irqentry_exit(), which traces hardirqs
>> on while the replay is still inside irq_enter():
>>    arch_local_irq_restore()
>>      irq_enter()                        hardirq_context = 1
>>      __replay_soft_interrupts()
>>        timer_interrupt(&regs)
>>          irq_enter_rcu()                hardirq_context = 2
>>          irq_exit_rcu()                 hardirq_context = 1
>>          irqentry_exit()
>>            trace_hardirqs_on()          hardirq_context != 0 -> WARN
>>        next_interrupt()
>>          lockdep_hardirq_exit()         too late
>> 
>> Leave the hardirq context before each replayed handler instead of
>> after it:
>>    arch_local_irq_restore()
>>      irq_enter()                        hardirq_context = 1
>>      __replay_soft_interrupts()
>>        lockdep_hardirq_exit()           hardirq_context = 0 // fix
>>        timer_interrupt(&regs)
>>          irq_enter_rcu()                hardirq_context = 1
>>          irq_exit_rcu()                 hardirq_context = 0
>>          irqentry_exit()
>>            trace_hardirqs_on()          ok
>>        next_interrupt()
>>          trace_hardirqs_off()
>>          lockdep_hardirq_enter()        hardirq_context = 1
>>      irq_exit()                         hardirq_context = 0
>> 
>> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/kernel/irq_64.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
>> index d5c48d1b0a31..b189e796eb34 100644
>> --- a/arch/powerpc/kernel/irq_64.c
>> +++ b/arch/powerpc/kernel/irq_64.c
>> @@ -75,12 +75,6 @@ static inline void next_interrupt(struct pt_regs *regs)
>>   		WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
>>   	}
>> 
>> -	/*
>> -	 * We are responding to the next interrupt, so interrupt-off
>> -	 * latencies should be reset here.
>> -	 */
>> -	lockdep_hardirq_exit();
>> -	trace_hardirqs_on();
>>   	trace_hardirqs_off();
>>   	lockdep_hardirq_enter();
>>   }
>> @@ -137,18 +131,21 @@ static __no_kcsan void __replay_soft_interrupts(void)
>>   	if (IS_ENABLED(CONFIG_PPC_BOOK3S) &&
>>   	    irq_happened_test_and_clear(PACA_IRQ_HMI)) {
>>   		regs.trap = INTERRUPT_HMI;
>> +		lockdep_hardirq_exit();
>
> Can we include that in irq_happened_test_and_clear() instead of 
> duplicating it 5 times ?
>

Thanks for the suggestion. We can actually simplify this if we move this
into the caller itself i.e. __replay_soft_interrupts(). I think we could
change it to this diff then:

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index d5c48d1b0a31..e2f1e5b7a3a7 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -76,13 +76,11 @@ static inline void next_interrupt(struct pt_regs *regs)
        }

        /*
-        * We are responding to the next interrupt, so interrupt-off
-        * latencies should be reset here.
+        * We are responding to the next interrupt. The irqentry_exit() of the
+        * replayed handler has traced hardirqs on, which also reset the
+        * interrupt-off latencies. Trace them off again.
         */
-       lockdep_hardirq_exit();
-       trace_hardirqs_on();
        trace_hardirqs_off();
-       lockdep_hardirq_enter();
 }

 static inline bool irq_happened_test_and_clear(u8 irq)
@@ -116,6 +114,15 @@ static __no_kcsan void __replay_soft_interrupts(void)
         */
        local_paca->irq_happened |= PACA_IRQ_REPLAYING;

+       /*
+        * The irq_enter() of our callers is there to hold off softirqs. Each
+        * replayed handler enters and leaves the hardirq context itself and
+        * returns through irqentry_exit(), which again traces hardirqs on.
+        * Since lockdep only allows that outside of hardirq context, so leave
+        * it for the duration of the replay.
+        */
+       lockdep_hardirq_exit();
+
        ppc_save_regs(&regs);
        regs.softe = IRQS_ENABLED;
        regs.msr |= MSR_EE;
@@ -168,6 +175,8 @@ static __no_kcsan void __replay_soft_interrupts(void)
                next_interrupt(&regs);
        }

+       lockdep_hardirq_enter();
+
        local_paca->irq_happened &= ~PACA_IRQ_REPLAYING;
 }

The above simplifies it a lot, and the new state machine with
hardirq_context and hardirqs_enabled which lockdep cares about, will
look like this:
                                           hardirq_context  hardirqs_enabled
arch_local_irq_restore()
  trace_hardirqs_off()                     0             1 -> 0
  irq_enter()                           0 -> 1           0          (softirqs held off)
  __replay_soft_interrupts()
    lockdep_hardirq_exit()              1 -> 0           0          patch: the loop is not a handler
    timer_interrupt(&regs)
      irq_enter_rcu()                   0 -> 1           0          handler starts
      irq_exit_rcu()                    1 -> 0           0          handler done
      irqentry_exit()
        trace_hardirqs_on()                0             0 -> 1     legal: context is 0
    next_interrupt()
      trace_hardirqs_off()                 0             1 -> 0     still replaying: back to off
    ...                                 same for each pending interrupt
    lockdep_hardirq_enter()             0 -> 1           0          patch: restore for the caller
  irq_exit()                            1 -> 0           0          softirqs may run now
  trace_hardirqs_on()                      0             0 -> 1     IRQs really enabled


Let me know if this looks good, then I can re-spin the next revision
with the above changes.

-ritesh

