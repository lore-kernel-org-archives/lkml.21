Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795442205;
	b=GHlYgLv5TbITGtrUmPeUsPwTfI9RVp5SirGO+qnXsTZUDAybYFPuV8wcmedSll1wLEnu
	 ZiBCh6xbFBlEyVWreqIZtWpPkJjJ+hFL6b2XDfXKrohJGN9Pko0j5LVzHYDZKIF8AKmcg
	 orecmrQBg6WgvsItmXBMGhyTGUyHiXe3+MzU92t5nPwhzdz1CzAbcRCnEWWS4nQEVcGj4
	 gbdC/ghwiW+1aw5hkrpd1MMHSBJYMkaqAxTAu3445mDLU5w/QCu0UBd0hUBUtyYDNFsq4
	 FLj6Dsz3dna2wgE4yukAWqdboZqSKkL/ZoqaqSm8ItfepJg2NutuDI2KpvFIskAgW7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=B57sPxPIPVjsjDHQj6Icpe8hDfL+4AlWPDMZGCnEF9M=;
	b=uXGwFNxJLGc/lhpcTL2YYAB7HgDKSEvdlrs1fJKPqThn7grZE67KcLpiF+V1KwntjclL
	 uohbk6bbVjFxux781okIqxdnQ7kARGBIgxGS74Qq/5J0kkwj95zJOc3oNdJ/kRv6HB25j
	 tC6CZTTBAa23ANM6ZmVhjwZbITnHDuYE22VqWLPA8LhRGookzoR4LGpcF7cKnbu4U6a7J
	 UoZN56oxDMTZY7DDFJGV1xqVmPUWYsjLfUz7Bw+q6ThJKmn4XE+wQzWUnHPlFrk3dN0Ge
	 jcmA/iz/HDToyM5cYcNbZU21cTF4G9Wx2CLY6lKNOUo/PX+VtMiw+35/7pzOe/zQdBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N05ndNkH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA0606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DA0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N05ndNkH
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67da7d18f2fso3653432d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795442204; cv=none;
        d=google.com; s=arc-20260327;
        b=cqOFvBh3oa1Xwp9CnO2kViPqH7o7iwsG1bv7HpLvcqZYWs8014Na9lBgVOUo2SEhX2
         bG3kODerH5M+yOPXRdvuqalpsABBkIpztESEC0vZgfsmGRq76ZavPFAeZlkQVPoPPGX+
         H1FfbxlrQjg4vNgsmxxHQMn/+c+RDb98CjCvdQXdgaQIZieGC79ocfozyTq6gLzTP6MO
         tEo0SXvwzwBDQecm9ZVuV+xEc50eKCIpeXoPRpXgeqebcCoS8AhS+MDSY/QrSfd7O9xd
         ep9s5Ydz2XPhwknGmGHZO79W7Tmf35hX/smwECpmVYdkK/Go3gp4p6ikLQKEghInD1/G
         XtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=B57sPxPIPVjsjDHQj6Icpe8hDfL+4AlWPDMZGCnEF9M=;
        fh=CuRqwbgI/PQZ53jSMyQQojuqjbZ8dLFO/9LcvPBaem8=;
        b=Q4+uicXvhKIhaOMfoOkvYa4qseoQfZRGuhyChUIoz1wmrkdP6fg6IE/f40sIpWgLx9
         Tp+BN6IMf7B71u9PJWcdpywtw08ylq1P7Lv+sUY73tpZ1r9k3jN4nXaNB8sLnzswqsqm
         scqVoPUpHwIYLKRiTAMFfbwWvGP090nVN3FJ6TBjpEe5eo0FVNbb9neax0bcQUlwndXG
         HHBI6EMsgt34CTYft52TzHkzTj1J0bdP6+vwGl5KGVyeXLjKMctJC98XqnI9A+SeDk/d
         QRJOTCQv/jtQq3LfY8oRMRzxInA42uLe31H3uxlJnPS9WXk1ZmELmhucUX5oAs+1Y+hX
         ImBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442204; x=1796047004; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B57sPxPIPVjsjDHQj6Icpe8hDfL+4AlWPDMZGCnEF9M=;
        b=N05ndNkHQknyOMHIsNDSQqDEHwWvBE34ol5L+NvHcll/S/4WXaj++2GoPLo1p0IC8z
         gX/I3PJUYDJrIBjomKK5he6tDcr+7qNfzTw/fVNK6iyw7MXQHR+h9Lu0yzCnVSjbFqTX
         vT1RZlgf8szD33EB47X817ciOpxJuCTCUyTPbW6oS820UTQzA35wsGhglddcxYJMPaum
         cl03V+nb6AAHXAaSOWdd1M0KIH/jBpnDLiyY2KhsPK02Y/3kSKsrWoU+xGzuuLNoyb8B
         +PPPLQCj+/5OLf25/GpHP22dca45YRXd+cHd6qmSOgxOBJJW0GdT4HuEbz1UWoAlgVBz
         Qe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442204; x=1796047004;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B57sPxPIPVjsjDHQj6Icpe8hDfL+4AlWPDMZGCnEF9M=;
        b=rtOLg5Ek4boZ9kc5Qxhgtd81Of1Bw7cu6QPpS0aKbuZEaVxFXYEnRkHOpYz+YbB9Ik
         nUSe+ZSm2ANeU6k88aiENcFwZMC8zS8ih0RpaakltOgXLr5KoXrDaZRM4huuQhPv9zOU
         /YFMFABoTQEP5X6fleCXq5n6Etcup8qsUDK9ak1jLcZcdp2OPtASqDUPKl3bH1vDJYQb
         V/TnwMPqsdKY0jX6Muy+9LmvxLkBybDRmnLrct3MwfytmYJX2+37iEmY7gaYp53ZlrSY
         Nr/6Ri0vQI3hV3h0lDYYK4DTHkAMHDedfOmDnJFsb9emHDjphTp9tUAoIw93Q2CNSaMn
         iF4w==
X-Gm-Message-State: APuU4Z+mvYRl/uQ6Qlb4zaR9plQGcZA9AnSNd6TDhMA9pfN/EuCVqS6d
	aZDEDKZ7z/5duD6IRxUC8ao1ufGp3ChUXEcF3WgpXwcfBge/jywu8D0kpMoRjRRItsTexMtprq4
	sBNzQttEF5zD2Z2EMYZgsuTzPdeO6Dmzr8Ex/ek8=
X-Gm-Gg: AZFdTZfPD+MJIuUa9+ySfO5tfeFiOLiUecrJvgEfWOU1JJA0XOyjDzjbZBlxzrFcqeO
	OslVR8jEjHDQTHtgPlrIe1dZpeJdEslmavxGQFSHP1dbM24qUjbQdeQkoa8iKSAZbS+ijgApQf5
	I1jzeqMxwEGKlwa1+ffrgboEGAoLTYJj42opxPpdTdWF0CWsJnza4WWWywFEMomCpomGpVCwnlK
	ntngmtNWIdg5hCtwIEra1tPxopUcdu6f71fZeHFHJ65OIMzzTvos6R3O+O/qPdl4NPcsed+KXOO
	ze1j/VXDofjdhipaZZxHAVuC3SEKwviyn2jz1rWzh/obXTnfXrmpw6xlG1Ia5ABIVgH80vmqC1a
	/+B6Trh1tTSnvBQ7uDN0BKSqwLviH++zIXaWN
X-Received: by 2002:a05:690e:4009:b0:67d:c045:d0bb with SMTP id
 956f58d0204a3-67dec2bb682mr5299099d50.5.1795442203710; Mon, 23 Nov 2026
 05:56:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Topaz Tatiana <topaz.tatiana@gmail.com>
Date: Mon, 23 Nov 2026 16:56:32 +0300
X-Gm-Features: Aa3M54oaOANjxm60lcXKWTf95uEoy0bGNPmQx6GVjt7EoZcN70llMH67uYSpuw8
Message-ID: <CAOhmvYWzq8MOg2C=kkKU5oXSquxXOjCxQNd=ZS0rEt92HxKZgg@mail.gmail.com>
Subject: [REGRESSION] 6.12.117: soft lockup in sched_balance_softirq /
 _nohz_idle_balance on KVM guest without NUMA
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all, after upgrading to kernel 6.12.117+deb12-amd64 (Debian), we
are observing
massive soft lockups in the scheduler on a KVM guest. The previous kernel
version worked without any issues.

Environment:
- Virtualization: kvm (QEMU Standard PC)
- NUMA: No NUMA configuration found (Faking a node)
- CPU: 200 vCPUs, 4 sockets, 1 thread per core (see lscpu below)
- uname: Linux dev-kulet2 6.12.117+deb12-amd64 #1 SMP PREEMPT_DYNAMIC
Debian 6.12.117-1~deb12u1 (2026-11-14) x86_64 GNU/Linux
- Cmdline: BOOT_IMAGE=/vmlinuz-6.12.117+deb12-amd64
root=/dev/mapper/vg1-lv--root ro ipv6.disable=1 quiet
- watchdog_thresh: 10
- nohz_full: (null) (NOHZ_FULL is not used)

Symptoms:
CPUs are 99% idle, memory is free (419 GiB free), and load average is low.
However, the kernel watchdog triggers on swapper/N and kworker/N with delays
of 60-97 seconds. The stack traces point directly to the scheduler functions:
sched_balance_softirq, sched_balance_update_blocked_averages, and
_nohz_idle_balance.

Trace 1 (_nohz_idle_balance):
[Mon Nov 23 11:48:17 2026]  _nohz_idle_balance.isra.0+0x31a/0x3c0
[Mon Nov 23 11:48:17 2026]  do_idle+0x31/0x2a0
[Mon Nov 23 11:48:17 2026]  cpu_startup_entry+0x29/0x30
[Mon Nov 23 11:48:17 2026]  start_secondary+0x11e/0x140
[Mon Nov 23 11:48:17 2026]  common_startup_64+0x13e/0x141
[Mon Nov 23 11:48:17 2026]  </TASK>
[Mon Nov 23 11:48:17 2026] watchdog: BUG: soft lockup - CPU#6 stuck
for 50s! [swapper/6:0]
[Mon Nov 23 11:48:17 2026] CPU: 6 UID: 0 PID: 0 Comm: swapper/6
Tainted: G             L     6.12.117+deb12-amd64 #1  Debian
6.12.117-1~deb12u1
[Mon Nov 23 11:48:17 2026] Tainted: [L]=SOFTLOCKUP
[Mon Nov 23 11:48:17 2026] Hardware name: QEMU Standard PC (i440FX +
PIIX, 1996), BIOS rel-1.16.2-0-gea1b7a073390-prebuilt.qemu.org
04/01/2014
[Mon Nov 23 11:48:17 2026] RIP:
0010:sched_balance_update_blocked_averages+0x62b/0x7b0
[Mon Nov 23 11:48:17 2026] Code: 74 07 c7 41 20 00 00 00 00 45 84 f6
0f 85 b9 00 00 00 48 89 cf e8 65 3b ff ff 48 f7 04 24 00 02 00 00 74
06 fb 0f 1f 44 00 00 <48> 83 c4 48 5b 41 5c 41 5d 41 5e 41 5f 5d e9 7d
28 de 00 80 3d 6d
[Mon Nov 23 11:48:17 2026] RSP: 0018:ff7601b9c00f3df8 EFLAGS: 00000206
[Mon Nov 23 11:48:17 2026] RAX: 0000000000000001 RBX: 0000000000000000
RCX: ff26d7d979bb6040
[Mon Nov 23 11:48:17 2026] RDX: 0000000000000007 RSI: 0000000000000000
RDI: ff26d7d979bb6040
[Mon Nov 23 11:48:17 2026] RBP: ff7601b9c00f3e68 R08: 0000000000000434
R09: 0000000000000003
[Mon Nov 23 11:48:17 2026] R10: 000000000000000a R11: 0000000000000000
R12: 0000000000000000
[Mon Nov 23 11:48:17 2026] R13: ff26d7d979bb6950 R14: 0000000000000001
R15: ff26d7d979bb6a98
[Mon Nov 23 11:48:17 2026] FS:  0000000000000000(0000)
GS:ff26d7d979b00000(0000) knlGS:0000000000000000
[Mon Nov 23 11:48:17 2026] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Nov 23 11:48:17 2026] CR2: 00007f32c305ce00 CR3: 0000000106884004
CR4: 0000000000771ef0
[Mon Nov 23 11:48:17 2026] PKRU: 55555554
[Mon Nov 23 11:48:17 2026] Call Trace:
[Mon Nov 23 11:48:17 2026]  <TASK>

Trace 2 (sched_balance_update_blocked_averages):
[Mon Nov 23 11:48:17 2026] RIP:
0010:sched_balance_update_blocked_averages+0x62b/0x7b0
[Mon Nov 23 11:48:17 2026] Code: 74 07 c7 41 20 00 00 00 00 45 84 f6
0f 85 b9 00 00 00 48 89 cf e8 65 3b ff ff 48 f7 04 24 00 02 00 00 74
06 fb 0f 1f 44 00 00 <48> 83 c4 48 5b 41 5c 41 5d 41 5e 41 5f 5d e9 7d
28 de 00 80 3d 6d
[Mon Nov 23 11:48:17 2026] RSP: 0018:ff7601b9c0663df8 EFLAGS: 00000206
[Mon Nov 23 11:48:17 2026] RAX: 0000000000000001 RBX: 0000000000000000
RCX: ff26d7d97f2b6040
[Mon Nov 23 11:48:17 2026] RDX: 00000000000000b5 RSI: 0000000000000000
RDI: ff26d7d97f2b6040
[Mon Nov 23 11:48:17 2026] RBP: ff7601b9c0663e68 R08: 0000000000000015
R09: 0000000000000001
[Mon Nov 23 11:48:17 2026] R10: 000000000000b944 R11: 000000000000cef5
R12: 0000000000000000
[Mon Nov 23 11:48:17 2026] R13: ff26d7d97f2b6950 R14: 0000000000000001
R15: ff26d7d97f2b6a98
[Mon Nov 23 11:48:17 2026] FS:  0000000000000000(0000)
GS:ff26d7d97f200000(0000) knlGS:0000000000000000
[Mon Nov 23 11:48:17 2026] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Nov 23 11:48:17 2026] CR2: 00007f2fca0ccccc CR3: 00000001a8058002
CR4: 0000000000771ef0
[Mon Nov 23 11:48:17 2026] PKRU: 55555554
[Mon Nov 23 11:48:17 2026] Call Trace:
[Mon Nov 23 11:48:17 2026]  <TASK>
[Mon Nov 23 11:48:17 2026]  ? srso_alias_return_thunk+0x5/0xfbef5
[Mon Nov 23 11:48:17 2026]  ? srso_alias_return_thunk+0x5/0xfbef5
[Mon Nov 23 11:48:17 2026]  ? finish_task_switch.isra.0+0x97/0x2f0
[Mon Nov 23 11:48:17 2026]  _nohz_idle_balance.isra.0+0x31a/0x3c0
[Mon Nov 23 11:48:17 2026]  do_idle+0x31/0x2a0
[Mon Nov 23 11:48:17 2026]  cpu_startup_entry+0x29/0x30
[Mon Nov 23 11:48:17 2026]  start_secondary+0x11e/0x140
[Mon Nov 23 11:48:17 2026]  common_startup_64+0x13e/0x141
[Mon Nov 23 11:48:17 2026]  </TASK>
[Mon Nov 23 11:48:17 2026] watchdog: BUG: soft lockup - CPU#6 stuck
for 50s! [swapper/6:0]

CPU Topology (lscpu -e, first 30 lines out of 200):
CPU NODE SOCKET CORE L1d:L1i:L2:L3   ONLINE
  0    0      0    0 0:0:0:0            yes
  1    0      0    1 1:1:1:0            yes
  2    0      0    2 2:2:2:0            yes
  3    0      0    3 3:3:3:0            yes
  4    0      0    4 4:4:4:0            yes
  5    0      0    5 5:5:5:0            yes
  6    0      0    6 6:6:6:0            yes
  7    0      0    7 7:7:7:0            yes
  8    0      0    8 8:8:8:0            yes
  9    0      0    9 9:9:9:0            yes
 10    0      0   10 10:10:10:0         yes
...
149    0      2  149 177:177:177:128    yes
150    0      3  150 192:192:192:192    yes
...
199    0      3  199 241:241:241:192    yes

This looks like a regression in NOHZ idle balancing for large KVM systems
without NUMA. Are there any known fixes for this in the 6.12 stable branch
or mainline?

Best regards, Tatiana Topaz
