Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795442405;
	b=EUrM3e6O3HI+1EQxWsV+JJFR+Td/4k74EHVWzM7xO9FReAT91KTzvFYE6SEqHWYlzMKD
	 hb4XBrn0RJ191KkJ03ghWyhWg70JddMnjWQhH5Fds6oxJRz2WqCcgTOEg2VGBRunia9Ct
	 oTN36gK/knmzTHoeRW6fFUTVbvXOL4/cM3TTeTW+sSIAk9xU0xiGaMvTesugjW5vUhWc3
	 cPj2dZheuCAunuXJ8E8jotO9uoP8ZzIlqVATH2yH/5+fMK8FgVsiqBpOFwomrb6RihIo+
	 s+hGjIyC4d44z2sotZ3R8s38vcp+OV1zQv99krCP4p5q4fyP84kOIldymGIIglzfzPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=3IpLvh4knGxdnTnNg11otR5B3EwtnVVM6LJJNpQ7l8c=;
	b=uecaatVU8N7uBI3dIZqC2j5PCvGWoRqlX3mDLm/dF18ecrVKRvzFB0jgFJPobC4e5fyV
	 l+6ZLHFjU8QH/ebIuw+x0Hn3KFzjDMv70I4oBKv6ky+FHoyQgg5qzC43z2SFmRorfBHbS
	 R9waW5PeLbDKF2bhFLK2nI9ZKbKlh/fe8o/JsjTJXumX13PfUHoBzFJ/fy6z9AeXlXrEp
	 fbGB8pnjnhubJ9BPZZND/zVOx6aO4tNnTK+Nk+q0Y7vobE1snkkfvFWW+RM9corwXpvlS
	 XVktpgzI7d7yF+YhJOojoKnKfCqBR0TILLS3Sj9u0v4FzL86Xlt8p3a1FLFu/Jnm+Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wf63b0a8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A3606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 142A3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wf63b0a8
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3990504a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795442403; cv=none;
        d=google.com; s=arc-20260327;
        b=m+ct3qVx4jZxZWk2loJpjnyGa3db/t52q3JLMxg15o8HNXpH7Vzw/vBkqsDrSDHsiB
         2eVoE9OGtdo9z8DajWADPsff8wBCSIEMOsgS9KjhpmfFNLId3MEReFlHzPslA98dHZSh
         EFWl7Z/BaY43p5e98tEt9bFR1Vupnm9qTwx4BzOExC2j69unxNzvK3Qjy43Oawvv7Nw+
         oATYomhr2pN/zYKUYS9salpI//XdDEKIGGjPBC5N7xmhmMNFQ0Kk7tH6kr1I/et/ZF41
         AJcvo3UX+y0ZH9soBG7OeslmRQrYDSms1zYFq+feZXkbXpC96YxngQmaRvv4dKBKP7Ux
         fnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3IpLvh4knGxdnTnNg11otR5B3EwtnVVM6LJJNpQ7l8c=;
        fh=bcMfO/5L9fwofWUNWyi2EKAkpSgVtHnC8MbB4nPcqs8=;
        b=Dvar4j9cqIj1aDR9hIaoUxbXhLyjbvLZMX/vLjIeFFc+K4lPNWhAmrVj3nBngJr0HI
         m/ZBIC4xvbW1YuQbkqB748KXL18zDH3jnvQzu1pF3w2/TdOQd7MdreHh+rPYj3h3Js2M
         FX+z6n2m6rOndTr72DOEQtwj4ruM1U48XPzi9ruyKrPtDBOC/o3nTN5/zAUEd2oey0/C
         EJ6oPdo43kPGK2K5/Orfsg2HrMvAeO+v8Olby5nNjmt4Es4VpU/DaJt24wJ+7o6RwB5q
         Vv+0tPAMNL+ViKFFa9JUDhotTpAE4Tz+BnBis1rBY81pRGtHZ5c1+0XGPIzkjRzeWcoM
         m6JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795442403; x=1796047203; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IpLvh4knGxdnTnNg11otR5B3EwtnVVM6LJJNpQ7l8c=;
        b=wf63b0a8GVLvvuQKkSgnPHGDrXY493PPEWNsx+UBUG/zrKff5ciz+jAsCALpqS6dHq
         CVwd98uoKLQKBOwgmG5xxN8ml/h1NIN9JT7l692om9S5tUv2dfeQOnUkKmdy65G3K/I2
         ZZlkR5cAiHVsWGrB5PVBqDArCrkMmKa08uZ2OfxdTFhBU4cOrL8O6yf5VFza8IOuMBGC
         zLjfUIjVJ/8HkpcuKVrylEkqCf5kO7cXPXvQAGNifIyla7GJ5VFA+Dy0d1as0kCt2AL1
         SyOjGcsgaM3T6tYzN3uzb8YBucZ9cyA4guFUcO4G1uR9O9EHb4QnB3S61RWh+UuUXQjP
         9tGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442403; x=1796047203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3IpLvh4knGxdnTnNg11otR5B3EwtnVVM6LJJNpQ7l8c=;
        b=0Bp4X6Ai5NBqn0PLbb4efdr2jqADnHHyKTSz2k0bwNeO4d1Y6tkyDXTuvRfWB3Su88
         B3okwtWpemH8fDctBgMidRxWJ7Oc2qIr5BKst5hoSN7cs8O8DfVrOzU+I3BveqKB2682
         slkaAx8bj7XSDHwbb1g8acgMe2iLdeyHOad+dklx8gDD3UrFJELaQFSyijB3AwwtUtMW
         TBO0mSVIVDRdVgxdiGwJpimmLCPrdRURmVLPmxwqIlxuif2W47UzRsbLo4vJRw9GYMxV
         pZONYRaF0bd2QKLXOKy/W5kP5YTTi+YRcTXr91xnavqQWWuCNMYYeSBgZLCyZkWXOh6g
         LKlA==
X-Gm-Message-State: APuU4Z/gOKVwUFRnE+vXW77JWNZnfclRLc0LooHKAtu0GWkSghcgbm/R
	xZ3BXFPmK2x84V0BD80srI/xX6OxAAjmxCmiiBxi/GP0I+sr4tIAb+/7NTcmk7yNTNKhxKAvmvN
	qFhTJBaeJhpGM0Zndw3HRfvXq4n7fItxRKjQVUfDB+g==
X-Gm-Gg: AZFdTZeLmR20dA1RRCUSwG6JR5cuaL/PwOGh3N351J4rrEZFugxXdu8dSSIprrXIe+e
	ZvnQEnAi17I/gcbTOK7fg+dKMAnjaO2fLjqOH9lc5PJhmRcPZXR5KYz55IQ+PxDA1IhOPd/Ve6D
	EiICB04wahglA/0LBk9/iEp0hdQOO7e24VM/UyGaMMgwzsegeJ8fnFk/O748d39vRXkwEV42vC6
	8A3b7V8zNIGNomJWkEIHWVipQoD5udMkqmVZmbcDKZgNEQCgs8fZfaHC+yeVopdQ0ciiuC6vvMe
	2KJrEUN/RJpqVR6UZeD+WJTTs1uUg+MTSmZBsp14fMEEmUnNYwMnot5md0WdIik3eLfB6WYA3kp
	p9Jg/HRWEyMw44WlqfODSrd4Bd3WgWVnUm5bQWnzBbGJrfoyKH4WPMV7cGbUaRAASR4hFVA==
X-Received: by 2002:a05:6402:23d0:b0:6b1:b97b:744 with SMTP id
 4fb4d7f45d1cf-6ba37ec18e4mr6897993a12.32.1795442403354; Mon, 23 Nov 2026
 06:00:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAOhmvYXVox0HKyvf4ypMXnojfSbMmiD43meSvVrhTpDqRjzfGg@mail.gmail.com>
In-Reply-To: <CAOhmvYXVox0HKyvf4ypMXnojfSbMmiD43meSvVrhTpDqRjzfGg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 23 Nov 2026 14:59:51 +0100
X-Gm-Features: Aa3M54rulPBFjNk7d7jfr43FoAu_vY3FFS1QCD_7Uqbba4dRH8AU-GilPmwPFiU
Message-ID: <CAKfTPtCgYYV0vopSHbWWsW1EJKDAjnuiivoVPxJWagM24RggaQ@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.117: soft lockup in sched_balance_softirq /
 _nohz_idle_balance on KVM guest without NUMA
To: Topaz Tatiana <topaz.tatiana@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sched@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 12:22, Topaz Tatiana <topaz.tatiana@gmail.com> wrote:
>
> Hi all, after upgrading to kernel 6.12.117+deb12-amd64 (Debian), we
> are observing
> massive soft lockups in the scheduler on a KVM guest. The previous kernel
> version worked without any issues.

What do you mean by previous version?

6.11 ? 6.12.116 ? 6.12.115+deb12-amd64 ?

a quick check between 6.12.116 and 6.12.116 shows 3 commits in
kernel/sched which are unrelated to your desciption
2bd4d21066ef cpufreq: schedutil: Serialize sugov_start() against rate
limit updates
521afd30851c sched/fair: Reset NUMA fault locality after scan period update
48d34dc062eb sched_ext: Fix exit_task leak on fork failure during enable

>
> Environment:
> - Virtualization: kvm (QEMU Standard PC)
> - NUMA: No NUMA configuration found (Faking a node)
> - CPU: 200 vCPUs, 4 sockets, 1 thread per core (see lscpu below)
> - uname: Linux dev-kulet2 6.12.117+deb12-amd64 #1 SMP PREEMPT_DYNAMIC
> Debian 6.12.117-1~deb12u1 (2026-11-14) x86_64 GNU/Linux
> - Cmdline: BOOT_IMAGE=/vmlinuz-6.12.117+deb12-amd64
> root=/dev/mapper/vg1-lv--root ro ipv6.disable=1 quiet
> - watchdog_thresh: 10
> - nohz_full: (null) (NOHZ_FULL is not used)
>
> Symptoms:
> CPUs are 99% idle, memory is free (419 GiB free), and load average is low.
> However, the kernel watchdog triggers on swapper/N and kworker/N with delays
> of 60-97 seconds. The stack traces point directly to the scheduler functions:
> sched_balance_softirq, sched_balance_update_blocked_averages, and
> _nohz_idle_balance.
>
> Trace 1 (_nohz_idle_balance):
> [Mon Nov 23 11:48:17 2026]  _nohz_idle_balance.isra.0+0x31a/0x3c0
> [Mon Nov 23 11:48:17 2026]  do_idle+0x31/0x2a0
> [Mon Nov 23 11:48:17 2026]  cpu_startup_entry+0x29/0x30
> [Mon Nov 23 11:48:17 2026]  start_secondary+0x11e/0x140
> [Mon Nov 23 11:48:17 2026]  common_startup_64+0x13e/0x141
> [Mon Nov 23 11:48:17 2026]  </TASK>
> [Mon Nov 23 11:48:17 2026] watchdog: BUG: soft lockup - CPU#6 stuck
> for 50s! [swapper/6:0]
> [Mon Nov 23 11:48:17 2026] CPU: 6 UID: 0 PID: 0 Comm: swapper/6
> Tainted: G             L     6.12.117+deb12-amd64 #1  Debian
> 6.12.117-1~deb12u1
> [Mon Nov 23 11:48:17 2026] Tainted: [L]=SOFTLOCKUP
> [Mon Nov 23 11:48:17 2026] Hardware name: QEMU Standard PC (i440FX +
> PIIX, 1996), BIOS rel-1.16.2-0-gea1b7a073390-prebuilt.qemu.org
> 04/01/2014
> [Mon Nov 23 11:48:17 2026] RIP:
> 0010:sched_balance_update_blocked_averages+0x62b/0x7b0
> [Mon Nov 23 11:48:17 2026] Code: 74 07 c7 41 20 00 00 00 00 45 84 f6
> 0f 85 b9 00 00 00 48 89 cf e8 65 3b ff ff 48 f7 04 24 00 02 00 00 74
> 06 fb 0f 1f 44 00 00 <48> 83 c4 48 5b 41 5c 41 5d 41 5e 41 5f 5d e9 7d
> 28 de 00 80 3d 6d
> [Mon Nov 23 11:48:17 2026] RSP: 0018:ff7601b9c00f3df8 EFLAGS: 00000206
> [Mon Nov 23 11:48:17 2026] RAX: 0000000000000001 RBX: 0000000000000000
> RCX: ff26d7d979bb6040
> [Mon Nov 23 11:48:17 2026] RDX: 0000000000000007 RSI: 0000000000000000
> RDI: ff26d7d979bb6040
> [Mon Nov 23 11:48:17 2026] RBP: ff7601b9c00f3e68 R08: 0000000000000434
> R09: 0000000000000003
> [Mon Nov 23 11:48:17 2026] R10: 000000000000000a R11: 0000000000000000
> R12: 0000000000000000
> [Mon Nov 23 11:48:17 2026] R13: ff26d7d979bb6950 R14: 0000000000000001
> R15: ff26d7d979bb6a98
> [Mon Nov 23 11:48:17 2026] FS:  0000000000000000(0000)
> GS:ff26d7d979b00000(0000) knlGS:0000000000000000
> [Mon Nov 23 11:48:17 2026] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [Mon Nov 23 11:48:17 2026] CR2: 00007f32c305ce00 CR3: 0000000106884004
> CR4: 0000000000771ef0
> [Mon Nov 23 11:48:17 2026] PKRU: 55555554
> [Mon Nov 23 11:48:17 2026] Call Trace:
> [Mon Nov 23 11:48:17 2026]  <TASK>
>
> Trace 2 (sched_balance_update_blocked_averages):
> [Mon Nov 23 11:48:17 2026] RIP:
> 0010:sched_balance_update_blocked_averages+0x62b/0x7b0
> [Mon Nov 23 11:48:17 2026] Code: 74 07 c7 41 20 00 00 00 00 45 84 f6
> 0f 85 b9 00 00 00 48 89 cf e8 65 3b ff ff 48 f7 04 24 00 02 00 00 74
> 06 fb 0f 1f 44 00 00 <48> 83 c4 48 5b 41 5c 41 5d 41 5e 41 5f 5d e9 7d
> 28 de 00 80 3d 6d
> [Mon Nov 23 11:48:17 2026] RSP: 0018:ff7601b9c0663df8 EFLAGS: 00000206
> [Mon Nov 23 11:48:17 2026] RAX: 0000000000000001 RBX: 0000000000000000
> RCX: ff26d7d97f2b6040
> [Mon Nov 23 11:48:17 2026] RDX: 00000000000000b5 RSI: 0000000000000000
> RDI: ff26d7d97f2b6040
> [Mon Nov 23 11:48:17 2026] RBP: ff7601b9c0663e68 R08: 0000000000000015
> R09: 0000000000000001
> [Mon Nov 23 11:48:17 2026] R10: 000000000000b944 R11: 000000000000cef5
> R12: 0000000000000000
> [Mon Nov 23 11:48:17 2026] R13: ff26d7d97f2b6950 R14: 0000000000000001
> R15: ff26d7d97f2b6a98
> [Mon Nov 23 11:48:17 2026] FS:  0000000000000000(0000)
> GS:ff26d7d97f200000(0000) knlGS:0000000000000000
> [Mon Nov 23 11:48:17 2026] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [Mon Nov 23 11:48:17 2026] CR2: 00007f2fca0ccccc CR3: 00000001a8058002
> CR4: 0000000000771ef0
> [Mon Nov 23 11:48:17 2026] PKRU: 55555554
> [Mon Nov 23 11:48:17 2026] Call Trace:
> [Mon Nov 23 11:48:17 2026]  <TASK>
> [Mon Nov 23 11:48:17 2026]  ? srso_alias_return_thunk+0x5/0xfbef5
> [Mon Nov 23 11:48:17 2026]  ? srso_alias_return_thunk+0x5/0xfbef5
> [Mon Nov 23 11:48:17 2026]  ? finish_task_switch.isra.0+0x97/0x2f0
> [Mon Nov 23 11:48:17 2026]  _nohz_idle_balance.isra.0+0x31a/0x3c0
> [Mon Nov 23 11:48:17 2026]  do_idle+0x31/0x2a0
> [Mon Nov 23 11:48:17 2026]  cpu_startup_entry+0x29/0x30
> [Mon Nov 23 11:48:17 2026]  start_secondary+0x11e/0x140
> [Mon Nov 23 11:48:17 2026]  common_startup_64+0x13e/0x141
> [Mon Nov 23 11:48:17 2026]  </TASK>
> [Mon Nov 23 11:48:17 2026] watchdog: BUG: soft lockup - CPU#6 stuck
> for 50s! [swapper/6:0]
>
> CPU Topology (lscpu -e, first 30 lines out of 200):
> CPU NODE SOCKET CORE L1d:L1i:L2:L3   ONLINE
>   0    0      0    0 0:0:0:0            yes
>   1    0      0    1 1:1:1:0            yes
>   2    0      0    2 2:2:2:0            yes
>   3    0      0    3 3:3:3:0            yes
>   4    0      0    4 4:4:4:0            yes
>   5    0      0    5 5:5:5:0            yes
>   6    0      0    6 6:6:6:0            yes
>   7    0      0    7 7:7:7:0            yes
>   8    0      0    8 8:8:8:0            yes
>   9    0      0    9 9:9:9:0            yes
>  10    0      0   10 10:10:10:0         yes
> ...
> 149    0      2  149 177:177:177:128    yes
> 150    0      3  150 192:192:192:192    yes
> ...
> 199    0      3  199 241:241:241:192    yes
>
> This looks like a regression in NOHZ idle balancing for large KVM systems
> without NUMA. Are there any known fixes for this in the 6.12 stable branch
> or mainline?
>
> Best regards, Tatiana Topaz
