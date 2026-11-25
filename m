Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593762;
	b=4f9D2vbx1/HhoudYncCtgn8dFEVNGXV2d5FcEGoUpo5pWqFq00+MvfEfDsL0XD45fuOJ
	 OxozIrzlsb7jYvQGHILUhHCatFGGzfoTXZskvMSOMXz06xrOERyIvemDiQ2XU+JnrRQzN
	 lqR44q6GTkaEwTR4fzuPmT7DSPZzFKV3u8eSVAMwWRJlqFtdLgAm4IU/Ti6068xAB9IHC
	 87Q6wjTp2rRLjZ2QW5khEasAT5KPT23ndqk6D9BHRNo9aY+GJr8Dxh71hQLScWugxefFj
	 yGisqz8VpogHS+H3zdh5Q5YY5/RYkrBb9BpzjjDCzXynGgJS66s9mliEyu3+j6gK1XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RTm26lprGFhpmR06wBJ8rVSJmCkblFzNUvHx8SA0YVE=;
	b=jbrsP2n5PELQjgG6XnmIXAFQun41hEUwTwKwP1WnbVF89pzQx/nsVPHlV2CMYyj4SCid
	 ZmtA85vA5QWJw6P9MM5BImdtAEDNE0lfMYmH+jXZfZBQEcExWC0BQKF2URT3f7XuLoqqu
	 0RNPGwSQTX0O15TJAk6WPA8Gg5oHfyVoN/0QFvVTWhUMQLi6/o9w+/rL624PYg4PQc6dV
	 FxeIGcNU1AoGvsdbJX/2WObYR2lqBDOOwXVC2H6r7Ywg1Px1VGMbIWcdk9V7yn3qZi4AF
	 yi5RcyZT3SuQr9J+UuNzUy1xjAAk+K8RGVY4CQND4WCPNTx4jIPVCPsFWprszdM2c3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SmJ1T5mU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714AD606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714AD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SmJ1T5mU
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so7084586a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593761; cv=none;
        d=google.com; s=arc-20260327;
        b=ih4v/qeTU1lYG2IiKGmiqRzgJNDkxmRQ+v8oZqjTZzWzwLFrHbS1CA0brWKxL4PGUB
         p7s8/WlUB1ciT+hLGicNALwkeWckTfrGJvV9uI0xQoKhkxbVAl6UXI6dIO3Rk2/gKiXn
         puyLF9GMAK/wP5MuxvbuxhsBW/wVK86DkfJVLRvMftIGp9jnFRDUijNL0DzAda73uSYz
         doR//A0w8Tt7dZMHjW3NIAleg/px3a4ANqx+T5lr8nz90+L8XJHVRaTUYv5YeIawG67Z
         USpz3qFshcPMblZa1aMkVyIG/L+pez3XETc6yHxfcVPox+aDu4/OriOMEJMN6NLMZFd+
         L6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RTm26lprGFhpmR06wBJ8rVSJmCkblFzNUvHx8SA0YVE=;
        fh=2wUSpbu4Lje10IctvgbMCDu7uaj1KtgRO+S4xbzz9WE=;
        b=XUCVgWF+28o7s2jNEmOXv3iKNX//FbIoxuy+fEjWnnfRAn4lmL15iPmtliALiG7VFN
         dDh19/OZA2Hadp11JZgWK3ZrLbcGsIzkJGdSNYI+fF8jCIXgr5PE89TjvnF0lEzO3+2V
         G4lSrRJRIndc3/kOdbSaFb97VqA+sC/j0UIvWPgsg9I7LRRAeVJnQ8F1QZaIcxDHnK/o
         e0pp/uzN1WjosKOlnOHYstddnIxliIp1pwR+x2z/XRsek51xHkn/mxEdFUKuAec4cO+9
         QDJMpQqfvzI2aH2SnIsPDz6mVCqLtkx0ntaOOeIBsoNvIDLd9nCHynHbSNQfLlvh9K4E
         SR3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795593761; x=1796198561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTm26lprGFhpmR06wBJ8rVSJmCkblFzNUvHx8SA0YVE=;
        b=SmJ1T5mUCJZ7qmnVz3llyaGmDmRs7jJaQENMAMMMJQqDsN+yLxK82zRXl8PfoEJvCG
         Tf9Iy7pd3eZEnC41y4bXMG+GzWZRMIK+98Ncr0MhNlkt+/NZOy/yeghVvZzug8GjmT99
         kVk7ObdXg9/hPv8joc8oiX6hA4ZdJEAjlFnzWbGEWo6LDrAsapnZYH9el8aAUjwtitBR
         1ISMjiDCRV3ggM6Qd1f0OrKCCKI8TpwM370HHphJwJo4anxWGzYVCVGCw0OazxpSkDRv
         SCZHYHqTppcS9EgZomI6m6OX6aYOwNi5kREqS6b1u/BdHrEnVhnQyTcXQfgWPXuVDKDt
         vUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593761; x=1796198561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RTm26lprGFhpmR06wBJ8rVSJmCkblFzNUvHx8SA0YVE=;
        b=dVAfORoHBW4XVzcm5pYvb2NNPhstKBDkCqWqQaGEYP/48l8eV38TV6xbUPUcuKQW/c
         MiJ7vLuzRiGOVCjxRH5GWdZYWckD0RDXPRVx0m8+zAzE/wcZbrjaQ+1kJRU+FT/h/xai
         nk2a+XmfL9jFYWDAaX760cIkUqzNz7tI7YRlTD9XvQNTJWAVoLwMGPWIawWWuLnLQNJE
         d0UapAwqmLiAlrA2pnauY03s7ZyIcQDlrZ9ZTwOSfMDOhUN/hAuD6k7qFmCNGqoMMlCC
         YiyIjU6P0P9WKE0YRok8TReZkRG72dwm5aegYckNTZ5z7aSDJ9PEtoClNpQ1JylXXxOc
         jOBg==
X-Forwarded-Encrypted: i=1; AL+hErHrFb47O18YhbcdaJfp7s5AptyXuVbtvjqG4XEKOxRzxlH90IhcbO848miiAEuHm0RH3UMuvF1yVKc/sQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ovh37ob6dy9x0pBcUzkMixcXGGUEPtFeUjQIFg2naUhYScRF3
	qfhgHKJ50WSjd6SxWrj2QqHc+B8clHHuUXnYMS4UVoAh1oAIO+WWHWQ8HkJaGuPs8tMGREHXCDz
	N/a5tWt/fIk0EZTPrvSomWi9m9mE7zqLfaR1RSgALqg==
X-Gm-Gg: AZFdTZcxbWxbIb7D2Z6qddowNv0sxafRSnQOJb6W+pbS8e+xRY/Oz7q4Zw8SXCsQU5E
	mlQ2lhmb3Nk4EJgzPjMY5hfJu4BskfLKF+RUpNSFlWyNgHmfx7Bkr9G5pBkjKJFMiOeTxck3vcc
	G6Xqp93u2+vSwTRs0wHzgMiYCUWhqnGOGpfOnhk5zn436aUi79lsXgXdC0xRmg/iDa2SBS5UGZ5
	Gip3ZJ4lODdlgwBla3ofV4sMyXtOugiH0VSpjyJ0erajUz/BUTSom7GiAo0JagcPssi6mifFWRK
	PlZsVpLbjNCgR8Ux0PI2YHKrWHcxxzIWD+kyyWLaRlNmZwAOueRDdhGQemCv4LqVVI+phoqZRL7
	2c+xGvG7Kn1QqM+WWu+/Aa444TP+emDteYKhFeuam/g48CDyLpVAXPONq8lONTZ53RLaycUVuUU
	RP4m8tWcpIiVx5
X-Received: by 2002:a05:6402:274d:b0:6ba:92c3:fef7 with SMTP id
 4fb4d7f45d1cf-6ba92c4088cmr8311901a12.19.1795593760640; Wed, 25 Nov 2026
 00:02:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org> <awWc4Ca5Jj7H_kzW@scheduler.schedules>
In-Reply-To: <awWc4Ca5Jj7H_kzW@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Nov 2026 09:02:28 +0100
X-Gm-Features: Aa3M54oTNnNdEEnsQ_CBu4B0M0I3ut-loJgP53b9w3dSVKKpeAFkjaDybJeaVBE
Message-ID: <CAKfTPtDmtVv6wK46NDhm2cQkT=_gX1Rdz2dzsHT6i_hwomqjfQ@mail.gmail.com>
Subject: Re: [PATCH 00/18 v3] Improving latency of short slice tasks
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Kayra,

On Tue, 24 Nov 2026 at 18:31, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Hi Vincent,
>
> On Fri, Nov 06, 2026 at 04:19:27PM +0100, Vincent Guittot wrote:
> > This is another round of scheduling latency improvements which fix
> > some remaining corner cases and start to fix somes cases when multi
> > short slice tasks are running simultaneously on the system.
>
> At first I wanted to just run some hackbench tests on this series.
> It was supposed to take like 10 minutes. It took me 2 days.
>
> I tried to apply it, b4 got crazy. So I tried to find the cause.
> After some little changes, I was finally able to apply the series.
>
> Then I tried to deploy the series, it didn't deploy. I thought my VM
> was going crazy. But everything was correct. Then I realised that I forgot to
> plug in my ethernet cable.
>
> Then I started gathering numbers for the base. I ran 5 tests 2 runs each.
> I thought it was finally over and I could sleep or
> start doing reviews that I was delaying.
>
> Well no. It crashed on the last test, while doing hackbench.
> I tried again, and it crashed again.
>
> My machine is a Zen 3, 8 cores 16 threads.
>
> Base: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
>
> Okay... Well here the logs:
>
> <4>[   73.401173] WARNING: kernel/sched/fair.c:10295 at fair_push_tasks+0x1a7/0x220, CPU#10: hackbench/1904
> <4>[   73.401182] Modules linked in:
> <4>[   73.401314] CPU: 10 UID: 0 PID: 1904 Comm: hackbench Not tainted 7.4.0-rc2+ #44 PREEMPT(lazy)
> <4>[   73.401318] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
> <4>[   73.401321] RIP: 0010:fair_push_tasks+0x1a7/0x220
> <4>[   73.401325] Code: c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f e9 1d cc c7 ff 0f 0b 41 0f b6 86 6d f6 ff ff 3c 01 0f 84 db fe ff ff 0f 0b e9 d4 fe ff ff <0f> 0b e9 af fe ff ff 0f 0b e9 9e fe ff ff 41 8b 84 24 e0 0f 00 00
> <4>[   73.401328] RSP: 0018:ffffd1a74b5db8c0 EFLAGS: 00010046
> <4>[   73.401332] RAX: 000000000000000a RBX: ffff8c0985518000 RCX: 0000000000000000
> <4>[   73.401335] RDX: ffff8c0c9ef1d510 RSI: ffff8c0c9ef36b60 RDI: ffff8c0c9ef36b00
> <4>[   73.401337] RBP: ffff8c0c9ef36d80 R08: 0000000000000001 R09: ffff8c0985518ff8
> <4>[   73.401340] R10: ffff8c0985518000 R11: 0000000000000000 R12: 0000000000000000
> <4>[   73.401342] R13: ffff8c0985518000 R14: ffff8c09855189c8 R15: ffff8c0c9ef36b00
> <4>[   73.401344] FS:  00007f54a42536c0(0000) GS:ffff8c0ce0f9a000(0000) knlGS:0000000000000000
> --
> <4>[   91.767339] WARNING: kernel/sched/sched.h:1722 at cpuacct_charge+0xbb/0x1a0, CPU#6: hackbench/1933
> <4>[   91.767347] Modules linked in:
> <4>[   91.767468]
> <4>[   91.767474] =============================
> <4>[   91.767476] [ BUG: Invalid wait context ]
> <4>[   91.767478] 7.4.0-rc2+ #44 Tainted: G        W
> <4>[   91.767481] -----------------------------
> <4>[   91.767483] hackbench/1929 is trying to lock:
> <4>[   91.767485] ffff8c09a59abe00 (&mm->mmap_lock){++++}-{4:4}, at: __might_fault+0x3e/0x80
> <4>[   91.767496] other info that might help us debug this:
> <4>[   91.767498] context-{5:5}
> <4>[   91.767500] locks held by hackbench/1929: 3, on CPU#1:
> <4>[   91.767503]  #0: ffff8c0c95e1c460 (&pipe->mutex){+.+.}-{4:4}, at: anon_pipe_prefill_and_lock+0x123/0x210
> <4>[   91.767512]  #1: ffff8c09859d0ec0 (&p->pi_lock){-.-.}-{2:2}, at: fair_push_tasks+0xae/0x220
> <4>[   91.767521]  #2: ffff8c0c9edb6b60 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x25/0xb0
> <4>[   91.767530] stack backtrace:
> <4>[   91.767533] CPU: 1 UID: 0 PID: 1929 Comm: hackbench Tainted: G        W           7.4.0-rc2+ #44 PREEMPT(lazy)
> <4>[   91.767536] Tainted: [W]=WARN
> <4>[   91.767537] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
> <4>[   91.767538] Call Trace:
> <4>[   91.767539]  <TASK>
> <4>[   91.767541]  dump_stack_lvl+0x6e/0xa0
> <4>[   91.767546]  __lock_acquire+0x8d9/0xc70
> <4>[   91.767558]  lock_acquire.part.0+0x8e/0x1e0
> <4>[   91.767566]  __might_fault+0x57/0x80
> <4>[   91.767571]  _copy_from_iter+0x4e/0x770
> <4>[   91.767587]  copy_page_from_iter+0x9a/0x130
> <4>[   91.767591]  anon_pipe_write+0x524/0x7b0
> <4>[   91.767602]  vfs_write+0x424/0x580
> <4>[   91.767610]  ksys_write+0xc8/0xf0
> <4>[   91.767613]  do_syscall_64+0xed/0x1560
> <4>[   91.767628] CPU: 6 UID: 0 PID: 1933 Comm: hackbench Tainted: G        W           7.4.0-rc2+ #44 PREEMPT(lazy)
> <4>[   91.767635] Tainted: [W]=WARN
> <4>[   91.767637] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
> <4>[   91.767641] RIP: 0010:cpuacct_charge+0xbb/0x1a0
> <4>[   91.767647] Code: 00 00 00 48 03 04 dd 60 a1 33 bc 48 01 28 4d 8b a4 24 08 01 00 00 4d 85 e4 75 d3 48 83 c4 08 5b 5d 41 5c 41 5d e9 60 e7 c4 ff <0f> 0b eb a6 e8 ec 1b 05 00 85 c0 75 ae be ff ff ff ff 48 c7 c7 c0
> <4>[   91.767653] RSP: 0018:ffffd1a74b6c3818 EFLAGS: 00010046
> <4>[   91.767656]
> <4>[   91.767659] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> <4>[   91.767661] RDX: 0000000000000000 RSI: ffff8c0c9eab6b60 RDI: ffff8c0985940fd0
> <4>[   91.767666] RBP: 0000000000000a41 R08: 0000000000000001 R09: ffff8c0985940fd0
> <4>[   91.767670] R10: 0000003b3993930c R11: 0000000000000000 R12: ffff8c09859d0000
> <4>[   91.767674] R13: ffff8c09859d0000 R14: 0000000000000001 R15: ffff8c09859ab600
> <4>[   91.767679] FS:  00007f54a41c26c0(0000) GS:ffff8c0ce0d9a000(0000) knlGS:0000000000000000
> <4>[   91.767681] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[   91.767685] CR2: 00007febee499a78 CR3: 000000010685f000 CR4: 0000000000f50ef0
> <4>[   91.767689] PKRU: 55555554
> <4>[   91.767693] Call Trace:
> <4>[   91.767696]  <TASK>
> <4>[   91.767703]  update_se+0x167/0x2d0
> <4>[   91.767715]  update_curr+0x2b/0x190
> <4>[   91.767727]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4>[   91.767729]  enqueue_task_fair+0x251/0x840
> <4>[   91.767729] RIP: 0033:0x7f54a4366332
> <4>[   91.767732] Code: 08 0f 85 91 41 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
> <4>[   91.767733] RSP: 002b:00007f54a41d5d68 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> <4>[   91.767735] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f54a4366332
> <4>[   91.767736] RDX: 0000000000000064 RSI: 00007f54a41d5da0 RDI: 0000000000000022
> <4>[   91.767737] RBP: 00007f54a41d5d90 R08: 0000000000000000 R09: 0000000000000000
> <4>[   91.767738] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000064
> <4>[   91.767739] R13: 00007f54a41d5da0 R14: 000000000000000d R15: 000000003c659170
> <4>[   91.767744]  enqueue_task+0x88/0x210
> <4>[   91.767747]  </TASK>
> <1>[   91.768009] BUG: kernel NULL pointer dereference, address: 0000000000000000
> <1>[   91.768013] #PF: supervisor instruction fetch in kernel mode
> <1>[   91.768016] #PF: error_code(0x0010) - not-present page
> <6>[   91.768019] PGD 12803e067 P4D 12803e067 PUD 10acf4067 PMD 0
> <4>[   91.768026] Oops: Oops: 0010 [#1] SMP NOPTI
> <4>[   91.768029] CPU: 7 UID: 0 PID: 1929 Comm: hackbench Tainted: G        W           7.4.0-rc2+ #44 PREEMPT(lazy)
> <4>[   91.768034] Tainted: [W]=WARN
> <4>[   91.768036] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
> <4>[   91.768039] RIP: 0010:0x0
> <4>[   91.768045] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> <4>[   91.768048] RSP: 0018:ffffd1a74b6a3740 EFLAGS: 00010046
> <4>[   91.768052] RAX: 0000000000000001 RBX: ffff8c0c9edb6b00 RCX: ffff8c0c9edb6b48
> <4>[   91.768055] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8c0c9edb6b48
> <4>[   91.768058] RBP: ffff8c0c9edb6d80 R08: ffff8c09859d1020 R09: ffff8c09859d1020
> <4>[   91.768060] R10: ffff8c09859d0000 R11: 0000000000000000 R12: ffff8c0c9eab6b00
> <4>[   91.768062] R13: ffff8c09859d0000 R14: ffff8c09859d09c8 R15: ffff8c0c9edb6b00
> <4>[   91.768065] FS:  00007f54a41d66c0(0000) GS:ffff8c0ce0e1a000(0000) knlGS:0000000000000000
> <4>[   91.768067] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[   91.768070] CR2: ffffffffffffffd6 CR3: 000000010685f000 CR4: 0000000000f50ef0
> <4>[   91.768072] PKRU: 55555554
> <4>[   91.768074] Call Trace:
> <4>[   91.768076]  <TASK>
> <4>[   91.768372]  </TASK>
>
> Without Proxy Exec, this just disappears.

Yes, I haven't looked in detail at the impact on proxy exec which is
not enabled by default on my systems.
That will be part of the next version that I'm working on

>
>
> I just wanted to run some hackbench, I wasn't ready for doing all of this :-(.
> And I had 4 hours of sleep yesterday. I need a break on this.

sorry for the burden

>
>
> Thanks,
>
> Kayra
