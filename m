Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795871498;
	b=0Rmd5/L0u8TwojtfRBR5q05nRbx/DkhgUCSezvkASwQYzPNBCC8bk+R87a2oXQL/3My2
	 WRyLHy+QU4Klm01EwH+04uUR8T7nZoSB34eqveU4lGBd1JXw7Ni+hrXOXax+7rQrdMoDf
	 U1YUl5zVNRytMdyUec9NWyFGtvXCyvnU+yXZNYxAgB07aqKApYCWk45lRopMkhFu3DhxH
	 n7mW0UPYTcNhcB2uIO9xI4y2NubHqxTUFj0cmWiyQZtID39+7IG9R3zzE/2/FB2QoJWcS
	 Vg4JoWnMRcBZtJD7W36GuYmvYQ7bNr7zqe9ep9i3/HUtTvOm4RXBQltf5LG2sSMRdSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795871498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=Znno/6cdjeGyh4QHR1BzUSwOFxc0tW9FZcWjMXNlod8=;
	b=2L/pDOPR9rHdhbGPsdXXWwNkms9LJZDO76vP0qrvBe1FdWhfH7Ur8XOC/xjK4utXBxjc
	 +eGiNOhjI17UdTTCqvUvDKQrhJrHUF2ZEw5ajJegvwWegSZ5dcZ/Tv1CRb/UQIGbXxrBE
	 w0IMfx/Q9oPE4HMDnQ2PnXQ1LBCjj+fNEGfrfTEs9+HT2arWQ6rx3uPUuUWRLOw6Yyq6o
	 0W0LMUJ1RlI2C+E1mzX6JcQYDnBzTlNay9xlm8V6Fn29RaGOrFfqpS/U6HyABbBAnjRVh
	 9rbAc8qkq+VMvU+GYaVMHi2linMQdIQgLMr3fUukbDr9sY7J3Ylky9erE8HuAgZ9MOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UdxDblNc;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B38F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B38F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UdxDblNc
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386bd881d39so71406eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795871497; x=1796476297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Znno/6cdjeGyh4QHR1BzUSwOFxc0tW9FZcWjMXNlod8=;
        b=UdxDblNczEsg6WXfIEEEl2cK+cbtUyZn/pGAKpHrkx7yY+hVH4Y99cmI4F0eUn+2L9
         daLAcCZjGFUTHAkPM1ltahKiaXxp6e9Oh2l11p4+vaMguHjdpeI/Q65+zMoA9lh+cd8z
         wQiKxiXPX8hTem/bWZIPXFqghFw3R3dRq/nW3iIt9+ITtOrZQNNE2ClQLL0OrVeB+YNQ
         29w4LCadpjtPKqT4hmrsoNjeV4qfuRSsSslgVzoZo7IWzqPtHE/JTzmmhDGHnWfOP9BB
         c6rwHKjj5G2Du+y02lmS8eAb+EiX8NfnDHOcrF7g5rWChENqzK4a55DsHsNN6AKY7yqf
         rX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795871497; x=1796476297;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Znno/6cdjeGyh4QHR1BzUSwOFxc0tW9FZcWjMXNlod8=;
        b=0kWNPqZeohICmvHiTmZ9Nmww7kcoisEsUp0CfUl/5YMcND8eVM8IOlmKm/2srLurrm
         wDG6n4M8YgKBaWCKFkWZSoeDbD9+Op5QlcYBZHQv92ueYbg8OE+NqHkT6w6AErYka5/j
         ctbqDfC5Ew0hPIYfH+twtbrxHGXGgi8IaWK+7BQImq4xOj8UiCp+OsoBjA9whRMemNep
         G/oHWzm9JeGrwo3Cwq0jxQQzBNtR18cdA5OUC+hUZhG8g9SipFcr0inCV+5p15GBst9p
         1rNwduZZdVm1ehxpQMnfwC/4UkhuXRrXfWKwr7lQq2ULvmuV4v6twIkxTwuAlWm1gfKz
         X29Q==
X-Forwarded-Encrypted: i=1; AL+hErHPKY4+rY1dgi0+0pH1mMu4zL0p7aQAt9iPT3CtXr/o3c6trDJldxAYCoNtn+nnx5F+KBp/vSuIJCr3mmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zxKdi4lOJ1Cm1qj16izuIC8gq1TcNP1d2HOjpKTieV2xWq+oT
	53Lui93zU5lXSJS3jGdrhzUojUC0gKuW9U9iZB/t/SwCVlgAbyzFJj9d
X-Gm-Gg: AZFdTZfioArcIKJ9y5yh6AqBY7/Mk+yIkY2ZYxb8T4isIPDdAxF56ferFWYz9RchMuv
	4fKdW7iBY/TDZesdDdImQv6SgekZeWmF7vUHFgJlhb/TQcTnGpwPlLZVQIQRuupihWb5Vutyt9b
	VIHIlpC+1ZlXFKsbPEfqX8iZ/CT95Hy9Lw5DEJWs8g1yak1DB7X2vGSmjRvNPHzRrHqSC0Eyifs
	qdRX1N+mmlrbiNoGX6S8Ujj4yjVK2wrqekYwq3StSn/pMtoakd0CdMlxY//j0CGgnS8VqXmTqvG
	ewJk5ScUpKC5FmAjRTS1wsQTi5saMrxXWhzCELR94nJQwb+1/JvpVJQvTnLXjeUZLCDJk0LjElR
	/7+0kY/v/D0R0ysgfhA5WfpaBYCvbVsqedETn5rsWcqBQORJDyRgLXNbbbafO0h1a8YGxievYcB
	MbZ1Wng/REAFxQC98jjfwSoBOgCtlwnNVNpsyoqs6izh733r6WbVOEfUm7Pf6haoKK2G9105F0B
	zzFG/Kn9+vEN6tWCVtsuDTALhz7PHlI+S5okeP17u4LWuUmcegqAxHcQd/zm1md9ravx6trdX9X
	FAdj824OLw5jW0BNQxfTSvhokRA=
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr29171697eec.31.1795871497156;
        Sat, 28 Nov 2026 05:11:37 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm49634928eec.9.2026.11.28.05.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:11:36 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv3 2/4] powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
In-Reply-To: <jylzkbvr.ritesh.list@gmail.com>
Date: Sat, 28 Nov 2026 18:37:29 +0530
Message-ID: <33slw1da.ritesh.list@gmail.com>
References: <cover.1795441238.git.ritesh.list@gmail.com> <8a70fa42449a63a73b8340d3296974cc519b5826.1795441238.git.ritesh.list@gmail.com> <awZ2qXSxXPO3XUUb@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com> <o6bdjkq1.ritesh.list@gmail.com> <76a1d48f-7425-4cd9-a88b-dbb453c6f95c@kernel.org> <jylzkbvr.ritesh.list@gmail.com>
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


Hi Christophe,

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:
>
>> Le 25/11/2026 à 10:58, Ritesh Harjani a écrit :
>>> Mukesh Kumar Chaurasiya <mkchauras@gmail.com> writes:
>>> 
>>>> On Mon, Nov 23, 2026 at 07:21:51PM +0530, Ritesh Harjani (IBM) wrote:
>>>>> touch_nmi_watchdog() can be called from preemptible context, e.g.
>>>>> sysrq-w via /proc/sysrq-trigger. The powerpc implementation uses
>>>>> smp_processor_id(), so with DEBUG_PREEMPT we get:
>>>>>
>>>>>    root@buildroot:/# echo w > /proc/sysrq-trigger
>>>>>    sysrq: Show Blocked State
>>>>>    BUG: using smp_processor_id() in preemptible [00000000] code: bash/238
>>>>>    caller is arch_touch_nmi_watchdog+0x3c/0xd4
>>>>>    CPU: 0 UID: 0 PID: 238 Comm: bash Not tainted 7.4.0-rc2-00029-g7664547149ae-dirty #126 PREEMPT
>>>>>    Call Trace:
>>>>>     dump_stack_lvl+0x138/0x150 (unreliable)
>>>>>     check_preemption_disabled+0x120/0x158
>>>>>     arch_touch_nmi_watchdog+0x3c/0xd4
>>>>>     show_state_filter+0xf0/0x338
>>>>>     sysrq_handle_showstate_blocked+0x24/0x38
>>>>>     __handle_sysrq+0x134/0x3a8
>>>>>     write_sysrq_trigger+0x178/0x22c
>>>>>     proc_reg_write+0xf4/0x150
>>>>>     vfs_write+0xfc/0x71c
>>>>>     ksys_write+0x8c/0x150
>>>>>     system_call_exception+0x310/0x590
>>>>>     system_call_vectored_common+0x15c/0x2ec
>>>>>    ---- interrupt: 3000 at 0x7ffd01755b98
>>>>>
>>>>> Unlike the generic version, which only sets a flag, we update the CPU's
>>>>> timebase stamp and its SMP watchdog pending bit, so a migration in
>>>>> between touches the state of a CPU we are no longer on.
>>>>>
>>>>> Disable preemption across the update. While at it, let's also mark the
>>>>> function as notrace (since we might be within a tracer when this
>>>>> function gets called).
>>>> Do we need to also mark wd_smp_clear_cpu_pending as notrace?
>>>>
>>> 
>>> aah yes, I didn't see that there is another function which is not
>>> inlined. Thanks for spotting that. The reason I added "notrace" was
>>> mainly to have consistency with kernel/watchdog.c which is due to this
>>> commit:
>>> 
>>> cb9d7fd51d9f ("watchdog: Mark watchdog touch functions as notrace")
>>> 
>>> 
>>> However, after looking more closely now, I don't think we need notrace
>>> here at all. To simply put, on powerpc, we don't use stop_machine() from
>>> within arch_ftrace_update_code() like how arch/arm does and besides, I
>>> think it is even safe for one cpu to be executing the instruction on
>>> powerpc, while another cpu modifying that atomically.
>>
>> But haven't we identified in another discussion that it might be needed 
>> to use stop_machine() ? See 
>> https://lore.kernel.org/all/qzh06fxn.ritesh.list@gmail.com/
>>
>
> Yes, that is why I also quoted second reason too on why we don't need it
> on powerpc. But here is the detailed explaination of what I understood -
> while looking at the history of changes on why "notrace" was added to
> some arch (like arm or to the generic definition) in the first place.
>
> On ARM, ftrace call sites were patched under stop_machine() and the code
> used to rely on other CPUs not executing any call site meanwhile. (Note
> that this itself is not needed on PowerPC see commit ee456bb346e7).
> However, with a THUMB-2 instruction set on ARM, a 4byte instruction is
> only 2 byte aligned, so while patching the instruction it can result
> into a 2 x 16bit stores. Now after commit ce4f06dcbb5d ("stop_machine:
> Touch_nmi_watchdog() after MULTI_STOP_PREPARE"), stopped cpus started
> calling the watchdog touch functions (which were not marked notrace yet)
> from multi_cpu_stop(), so a stopped cpu could therefore execute the
> ftrace call site of those functions between the two stores. This
> resulted into kernel crashes as seen on ARM while enabling/disabling
> ftrace on ARM kernels built with THUMB-2 instruction set.
> Therefore commit cb9d7fd51d9f ("watchdog: Mark watchdog touch functions
> as notrace") was needed on ARM to fix these crashes.
>
> So I still think we don't need a "notrace" on arch_touch_nmi_watchdog()
> on powerpc, even if tomorrow, we extend the use of stop_machine() for
> patching usecase, as we discussed on that other thread.
>

Just wondering if this answer your concerns? I see that others have
provided their Tested-by on v4 of this patch series. If that looks ok to
you - I was hoping if we could get that series queued up in powerpc's
next. Thoughts?

-ritesh

