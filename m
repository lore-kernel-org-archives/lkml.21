Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603585;
	b=NMcjrx5KnwScGSGUpv/smvdgE3Ed9eg9rjg7bOz7SFSMYucDlmMqd15EAhtTJViTaSUg
	 j7mYXqazvqBJnG0GQKldyGmddnsWYITEOQlTk42bzIW2MaBwAk6KJwWD03/tk3nPPEc8m
	 8cl328sqCiVYMdeCwb0OfDnvuRYYj3m6oeFBtCppqDVPA5GTRfFUdgqCqunFCgr5KDeXP
	 lbvjLKUuzIt/64rvg/dwF76Ii7I8dVVgO/D1xiCweEJ2I3xR7rshuPJ1xjpBDHx3BDyBB
	 9w1BDLTSIoawD6NY+js4HWfAZddHHb8QJBbE+pGxDBeqEeIjARZ9vfnmyfNvtcjwheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=75ck5Fj+CO5o/O7K369aVkulZ3SEZBEXUvPGoP4of14=;
	b=jbPgfGMNqwUTlO/EmorBsw+trnisWixbAQJKVH2dEajBqKDS4FKZIGTeFYiFW2UqzWAq
	 d/iYiY2EfkM5iBcBcMdsHb7t0hsDafs+zADAutHcpcxwTCB43DhZDETXWvnedBK2KT37o
	 ZLQJm6tMFCYjWL4jPQbQR1Z7z1LISmwiFSraXiMqWpQYJhOCL4JZJk0vdooDeWzbsDggf
	 QePjuPbslhq/v9gV2VlVNJ/nJ4ZPYHaeqIZG/0R5UDZMLTbQtRss3Q4bVqPWzoBO1Xvt3
	 naxmud+YN9ccQ1AQNnQw6BtxtJoo2RAXultdNmVg4M4srPG1lFXxNhskw/82Qh63JhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=THgzfaNh;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B34606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B34606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=THgzfaNh
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so14266558eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603584; x=1796208384; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=75ck5Fj+CO5o/O7K369aVkulZ3SEZBEXUvPGoP4of14=;
        b=THgzfaNhKvHiE7nCcWeM2XJm99zLhiEzN8T+3FjFzB5BR7H5J/+TAMgGZS8wTRMOZl
         AkK9sN/QR6O3tpchGnNUTg6RUEi+uJp9pc8ukJiD3Kp5Vj3BBKcfXDWbHLBBlFIUYDiL
         AfHNupsOQnIcomE2UsW1/nD3OgidAzKScMGHaddXzWgcJ+hXAq6j/jTPpEyZ4YtfiBUt
         Z2L2M0EX7gHtTJv3dnMeDLowVZ86LfS0ak8nYXE/0XCO4K0IhrACHV9QzD4eW36oqA8L
         5XYM7ELPbX3BZwTpnHB1k2bo7xnwo7BUTG3MlNmBLYxQJMge17tRV9yHbyXXGAxcvh8n
         h/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603584; x=1796208384;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75ck5Fj+CO5o/O7K369aVkulZ3SEZBEXUvPGoP4of14=;
        b=O8pYcbLzSdMjzfohV9RAGCZFuRRH3GvX7eL186xMLVEoq1UqDIqnrG1wbdV9Z4h1kW
         59f6nlgutPkzmo/uLp5/n55Phms/SV1iC0Kz+5pNEOjHwxzrP8OabXmReZTEVDrrm1TB
         UHMJvwOcz2tUzqlAHKGNHHeZOPFcJMtb9ESCpR99N+5NDGMhamrvAV3fy5UHedA2KV0E
         8fU9KEJlR1BAl2nZw+QPj5Zh5I5b8Gw8pDITB5SnF1Fleieai//p045xzBLMNDTcMbJ7
         xdVrqzvYRycgqEg/FKgd5LuuuzruhakXbeyEnYAXc44Amj1nHhWHWWVFuuC1Mkj0zhuu
         Pcnw==
X-Forwarded-Encrypted: i=1; AL+hErFoauNjh62t7hcQTn+SJxLieP7BUE4PfanQrmEI9Bm9dkG9M3mynOj9U8rAyrSNT2GytVUVTf1O/M7fZBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gb+m9qrjvybFjTo6VyCgF59C7BdyayoIoWFxMAIsJJg18nqPx
	V444Fwvnrnq5IUng6DI59fZ8i2yhOAqy4LRFRK2N00rgPbawA4JA0voY
X-Gm-Gg: AZFdTZdUtbGDHMbY+MgtM0HjvQR7SPZFFGf0DXnqmipwipN+pSY0upAYMQgCH+Z9ClI
	UUpRuKC1QA18javWYIptkn7E7XTMXTWFryckpOhKCg4XYaE0VJauWQeRyvOUHefdm1R//gTKwEu
	138/rC+S5ja4SyTjzZoO5WSc42G/YJVgLlwxpw41RUUNYdrxcK83jcuN7769GRN9XIF8OsYHEGT
	2BCNoYR7OX+piKClGuO2JMiBkl53YkhM3Yv00627eNwAoYwxA6lIDyDazuWNkg733m1ZsBsg6j4
	R4XAsjkiPinSD399U8ZGmf6P0jX2oV4rhhxEcDwd6y655MGeztbQX4U2Sz8JpI8I9thpHqeohL9
	W811BgVP2AjC19m5x7GS8VrzHsxXtkmKD0vdPtgNTJT1gEwcWZqEz7nFi8OZCPv90ePdzKEqZxQ
	tIIZO9+L7HbYhDbIhaISKc4DTRJV4bS5twXgGNv9b3Wbt35TuzDbqGumCaw3hue0ImyYST9upJL
	N+Wsui30zJNw6Sa+44ZIjF03Bj5uTLE/VdnPZlL/mYoXkIBcIsYoO1Ffy5UhumkpnDWi8FzRw24
	+Fl2Jq5xnPO+NTSX22Zhg2TW6JQ=
X-Received: by 2002:a05:7022:1711:b0:1b3:aee5:20c5 with SMTP id a92af1059eb24-1b5568ac791mr15438030c88.22.1795603584073;
        Wed, 25 Nov 2026 02:46:24 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm40526601c88.15.2026.11.25.02.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:46:23 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv3 2/4] powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
In-Reply-To: <awZ2qXSxXPO3XUUb@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Date: Wed, 25 Nov 2026 15:28:46 +0530
Message-ID: <o6bdjkq1.ritesh.list@gmail.com>
References: <cover.1795441238.git.ritesh.list@gmail.com> <8a70fa42449a63a73b8340d3296974cc519b5826.1795441238.git.ritesh.list@gmail.com> <awZ2qXSxXPO3XUUb@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Mukesh Kumar Chaurasiya <mkchauras@gmail.com> writes:

> On Mon, Nov 23, 2026 at 07:21:51PM +0530, Ritesh Harjani (IBM) wrote:
>> touch_nmi_watchdog() can be called from preemptible context, e.g.
>> sysrq-w via /proc/sysrq-trigger. The powerpc implementation uses
>> smp_processor_id(), so with DEBUG_PREEMPT we get:
>> 
>>   root@buildroot:/# echo w > /proc/sysrq-trigger
>>   sysrq: Show Blocked State
>>   BUG: using smp_processor_id() in preemptible [00000000] code: bash/238
>>   caller is arch_touch_nmi_watchdog+0x3c/0xd4
>>   CPU: 0 UID: 0 PID: 238 Comm: bash Not tainted 7.4.0-rc2-00029-g7664547149ae-dirty #126 PREEMPT
>>   Call Trace:
>>    dump_stack_lvl+0x138/0x150 (unreliable)
>>    check_preemption_disabled+0x120/0x158
>>    arch_touch_nmi_watchdog+0x3c/0xd4
>>    show_state_filter+0xf0/0x338
>>    sysrq_handle_showstate_blocked+0x24/0x38
>>    __handle_sysrq+0x134/0x3a8
>>    write_sysrq_trigger+0x178/0x22c
>>    proc_reg_write+0xf4/0x150
>>    vfs_write+0xfc/0x71c
>>    ksys_write+0x8c/0x150
>>    system_call_exception+0x310/0x590
>>    system_call_vectored_common+0x15c/0x2ec
>>   ---- interrupt: 3000 at 0x7ffd01755b98
>> 
>> Unlike the generic version, which only sets a flag, we update the CPU's
>> timebase stamp and its SMP watchdog pending bit, so a migration in
>> between touches the state of a CPU we are no longer on.
>> 
>> Disable preemption across the update. While at it, let's also mark the
>> function as notrace (since we might be within a tracer when this
>> function gets called).
> Do we need to also mark wd_smp_clear_cpu_pending as notrace?
>

aah yes, I didn't see that there is another function which is not
inlined. Thanks for spotting that. The reason I added "notrace" was
mainly to have consistency with kernel/watchdog.c which is due to this
commit:

cb9d7fd51d9f ("watchdog: Mark watchdog touch functions as notrace")


However, after looking more closely now, I don't think we need notrace
here at all. To simply put, on powerpc, we don't use stop_machine() from
within arch_ftrace_update_code() like how arch/arm does and besides, I
think it is even safe for one cpu to be executing the instruction on
powerpc, while another cpu modifying that atomically.

For e.g. see this -

commit ee456bb346e75a9b6d941224b108250e6ee5f79f
Author: Steven Rostedt <srostedt@redhat.com>
Date:   Thu Apr 26 08:31:17 2012 +0000

    powerpc/ftrace: Have PPC skip updating with stop_machine()
    
    PowerPC does not have the synchronization issues that x86 has with
    modifying code on one CPU while another CPU is executing it.
    The other CPU will either see the old or new code without any
    issues, unlike x86 which may issue a GPF.
    
    Instead of calling the heavy stop_machine, just update the code.
 

And as I see it, this problem only exists on ARM with THUMB2
instruction, as can be seen from their implementation of
arch_ftrace_update_code(), which uses stop_machine().


So, let me drop the "notrace" as it is not really needed here and
re-spin a v4 with it being dropped.

-ritesh

>> Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>  arch/powerpc/kernel/watchdog.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
>> index 44f178e07531..32d4e716cb0a 100644
>> --- a/arch/powerpc/kernel/watchdog.c
>> +++ b/arch/powerpc/kernel/watchdog.c
>> @@ -456,12 +456,16 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>>  	return HRTIMER_RESTART;
>>  }
>>  
>> -void arch_touch_nmi_watchdog(void)
>> +notrace void arch_touch_nmi_watchdog(void)
>>  {
>>  	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
>> -	int cpu = smp_processor_id();
>> +	int cpu;
>>  	u64 tb;
>>  
>> +	/* Callers may be preemptible. Stay on this CPU for the update. */
>> +	guard(preempt_notrace)();
>> +	cpu = raw_smp_processor_id();
>> +
>>  	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
>>  		return;
>>  
>> -- 
>> 2.39.5
>> 
