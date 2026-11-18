Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.195
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795005439;
	b=TideL2xBxdCIAzXjByrrhFRouTbLxxgIP0RjLkxzz4Xd87GNBL3k8g4c0NpOsy7tXckV
	 IEZbhNT5Js0IzSUHMKjnV7jLBTkavQqyw3jgWWX4gpNtrRJ5sJkx+6wsKfZa5zKAzP32e
	 7EnzeV9hWeNE3mxz98CSotroofvZCdH6m79lhOWNAtkj8od8H5o9n9qdo4zZdlgIbKJ4E
	 ispUhuVGZumaaeNqaCX1QFOHCqBe5BApQN9t9X/f3X/0AoeuN/1DYW9oKuopd63H+k9l6
	 YPC0CVzoAE+pRXVtSC+N4TbX/+0MrOp60/e0vOcCjefIxXDlvS4sDCPGKt5LPxye8ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
	b=dIUa5XRx+JTeKFP4rZRCi5SKxI3uYVH2Qk5wlRCpEKxKzob+5kr8Ad+dhgVsLAJTI/oq
	 z6HKfCEfdgdT9YhDKjQNnFy0ZCeoS+2tTylJmk0RU5lM+v9HiuywSm+Oiat/q2Z21jHgW
	 gS5zBsbnZUd2hi8UUrj8oxnbfWXtX8g0/CjYULtwS9gU/XklU76ulCfLWAI+rN+83YW7k
	 v34B/L5kHUzcgIIzQm1Ps2zUFIttygNDyI7FJZWASOzB26z8NGu0w1Le7HJP/vO+8mVKZ
	 7MLj0q7svqWXEkFzxC5hs+comBClMx3K3Ez9eZa318Q7H7FBCZ3V5iWWu+xDyQgoYew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVJtkTPx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.195
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6C606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE6C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVJtkTPx
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-3ada7d53082so8637101fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795005437; cv=none;
        d=google.com; s=arc-20260327;
        b=gr9oZn6DUVbM6SzdatxHptoJvJrnWrw8Y+iWfl6cV1AlGWpCf65/K/GVESSehxqsoB
         u3KGoBiXZElEJirLWTQaU7e/8mbkKbWprW0GfmI6FTXJlqxvQsSr7HTpqkakzNshauX/
         f/5q9ls9B6vV2FFX7BKpncPsIZ1HNUK0iEI43zA4Zi4eEAuvc4pymGf4V/FWpQpUT9pq
         XIbikS56K8n8tDFrQ63xQyEsEDZEu5/Ody3OK9WhoKBYcQ88Qb7sZr5IiNgUxSMG0cRf
         94Oa/7N6An4MvFCMaqteTFLFQ+ANAAvSxW+meMe0io8XUeEhwm9HZO6Lng63TkCIUvN2
         mkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
        fh=aTVHGZ9TLnktBNb5NBUV/C6Qwux33ZHEwlDHbSe6tPw=;
        b=o1Lrv/DP5gzvnBXyd6O1e/CqQqT3auk9vNtzup1Cbb0S65OP9/qptXXv5Waer2+ZMB
         S6UUixIZOQN6EU/MAWB4FBwGlRD6JqNQcrod8OWyFrEqVvGKLJULz8h/tpuvtk5vcx1x
         VjI49ElO8Ed04cVAwOHQGW2nu5Lgy9TP7Y0ze+Du9uSnNaHbOYRDVMt/RP3WVLbKonjI
         3FhhNcFRZU69iOeGs8nDf3jwtWLJfLpekYrwdR1v5W9WicQTuuREMbtTa49vVaRoGio7
         v5cuRouvrZ8MZ2QPUhpavn8nWYhRL4cpbfdEoo61At0axOmZrBji26lbdkMdZXfy0+tP
         vLwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005437; x=1795610237; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
        b=dVJtkTPx7SFaGLYaTzOJgPTPGvqndDUB7dzBI93C6wfJ7/MnKUPhLC8M37JUzYEdrv
         hhG8X9S2FUfxbEswDSEua4qpBHz4DzNwbvV4CrDaMw4uJ+D8DGQihtN8BwBQ91jXzgEr
         D4eJu4rBohLdR2VF0z3EnGSe6OyX+2PvoY06CGRQXzQyOalttjtAahTExs5a6D7Uw38K
         O6OFflqCjejEiqlwjP1h/rw10gNwHO1ZyuKlMyLWn83sRWMI6r/RnAUn2WOU+vWyeXQ6
         MLx4ScAI/8OeRb4bthsSfkHWsJJnpvCLdZBeQ9VHC6PAOU92/3gI7fpobLMH0HOppzuo
         PugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005437; x=1795610237;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
        b=bEs21JZRgZMBar2MglfwExcod0WurtBK2fd+D+vLIzWWJ4J1RkubNTDfLNaF1Fz4gD
         r38YEWFQ712j7ob/yobdxClRiysWNdTVE0pA6rUq+oXrGGPCY1LY8beq5vkL1+JQDt6f
         8WqtNfAmRWGevR496rJ9BzlTqnz8LJr6TCysZn7vRCqFDFbED2gBJt9duE6nDXazJ+/e
         45MJI+ub9FofobMEQiyBlNfG5a+fkvnZemTMyFXUITpXva3QCY9sbWEzehKQQAxly0FL
         UtyD+dofqAWz4ZpXC375mHMHGLMGrS/WB27pFDhiTuFuPiNNNNf5D2QrUbUETB6v0Cwf
         9kbw==
X-Forwarded-Encrypted: i=1; AL+hErHYrd2Ly4dIekCRh0tEjd0BbLbtHNawefqwNojyrvUvYwQnxWnDHofryWs58OeKUOiLi4QH5q7PhZYmvTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z90WKYvuAiJmfEnKPu9+7RfszPsuKToMw5CfetNa+oUDff0vw8K
	nkMrHhTTC1SxhJDWIHVIrU6ED+cg4dBmyk1d5GGIKbHVS/9iB8I4LzLsNX1eTELFwghskIGavdc
	JNQL0H4cL9dSar/S6yT874OJEt49H7gHvE3wu0TDgfj6k
X-Gm-Gg: AYBFou2RR6FhDuHQXkUb7op5FiDiNMINgSokrPF9GnCe8mUnRBIMKkfi3v7k4SoB1zk
	4tWSf1n7+hoEKyrz3hbTZtmDgOr4CYS6QDnG7VhlkNIt+dLeWzgs68nGB3+tOmqAQfYt7UDVgGw
	84hn4NfdrSyrhT+qp6EZlF9G5fBqyKFLp1+4qyAX3xXSkjYOM2AAVfBPiD53GRRMTNtJiJtpCnB
	te1J3ht9MpB0/uVf5MNVkNALak+2X34N1VfQ2jllNQVojZ+Od+2i7RF8LEKqWk5O2cTgIjwDgRC
	J9SxAykXeIXVcaghkPmsBQYzma4/921gIE8KjopyRqA0cXoFnmAEJCPh012sH/0MrATHJmfcP2C
	JxfpoYXJ9ylabMK00XTLgdfIY1q3Ew8BgN1hD55nfGWIZo6MuJFVcl0Exwp7xb0pWi2klNH7xkd
	LdKtnFsiGOWojyhNM=
X-Received: by 2002:a05:651c:a14c:b0:3ae:c43:d892 with SMTP id
 38308e7fff4ca-3ae5c91dd47mr17035981fa.1.1795005437159; Wed, 18 Nov 2026
 04:37:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Wed, 18 Nov 2026 20:37:03 +0800
X-Gm-Features: AclHuK882m7RkIPXulNkPGmJF5W6vqJWzBXr7PYXZHgIM8IyUvzbKABo3YeYs70
Message-ID: <CAO-4RZ1DiPS2+=3WPxRGSEajO=dnsfYi4zDyjcVp3LBy2670AQ@mail.gmail.com>
Subject: [BUG] WARNING in kernfs_remove_by_name_ns (fs/kernfs/dir.c:1784, v7.4-rc3)
To: dsterba@suse.com, mason@kernel.org
Cc: gregkh@linuxfoundation.org, tj@kernel.org, linux-btrfs@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi David, Chris, Greg, Tejun,

We found a reproducible WARNING in the kernfs/sysfs removal path on
v7.4-rc3 with syzkaller. It is triggered while enabling Btrfs quotas and is
stable on fresh VMs.

The archive and reproducer are here:

  https://github.com/Zheng-zheng-codes/kernfs-remove-by-name-ns-warning
  commit 1d8c9a81d3f812c9ea320afba737bb4be8643ed4

Warning
-------

The warning is preceded by a kobject allocation failure for the Btrfs
`qgroups` sysfs kobject:

  kobject: kobject_add_internal failed for qgroups (error: -12 parent:
d1a4d035-71e5-4764-8138-3b7234c5bdf5)
  ------------[ cut here ]------------
  kernfs: can not remove 'enabled', no directory
  WARNING: fs/kernfs/dir.c:1784 at
kernfs_remove_by_name_ns+0x10b/0x120 fs/kernfs/dir.c:1784, CPU#1:
syz.7.1656/40887
  Modules linked in: crc32c_cryptoapi(E) cifs(E) smbdirect(E)
rdma_cm(E) iw_cm(E) ib_cm(E) nbd(E) ext2(E) smc(E) ib_core(E)
dm_multipath(E)
  CPU: 1 UID: 0 PID: 40887 Comm: syz.7.1656 Tainted: G            EL
   7.4.0-rc3-kernsight-kasan #1 PREEMPT(full)
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1
04/01/2014
  RIP: 0010:kernfs_remove_by_name_ns+0x10e/0x120 fs/kernfs/dir.c:1784
  RSP: 0018:ffa00000064479c0 EFLAGS: 00010293
  Call Trace:
   <TASK>
   kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
   remove_files+0x9b/0x1c0 fs/sysfs/group.c:28
   sysfs_remove_group+0x90/0x1b0 fs/sysfs/group.c:328
   sysfs_remove_groups fs/sysfs/group.c:352 [inline]
   sysfs_remove_groups+0x65/0xb0 fs/sysfs/group.c:344
   __kobject_del+0x89/0x220 lib/kobject.c:595
   kobject_del lib/kobject.c:627 [inline]
   kobject_del+0x40/0x60 lib/kobject.c:619
   btrfs_sysfs_del_qgroups+0x156/0x230 fs/btrfs/sysfs.c:2463
   btrfs_sysfs_add_qgroups+0x1c2/0x230 fs/btrfs/sysfs.c:2502
   btrfs_quota_enable+0x2e7/0x1ce0 fs/btrfs/qgroup.c:1034
   btrfs_ioctl_quota_ctl fs/btrfs/ioctl.c:3605 [inline]
   btrfs_ioctl+0x46d4/0x5e10 fs/btrfs/ioctl.c:5663
   __x64_sys_ioctl+0x194/0x210 fs/ioctl.c:584
   do_syscall_64+0x132/0x7c0 arch/x86/entry/syscall_64.c:89
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

Important annotations
--------------------

- The first line is the Btrfs qgroups kobject add failure with `-ENOMEM`
  (`error: -12`). This `-ENOMEM` is triggered by the reproducer's `failslab`
  fault injection, not by a real memory shortage. The warning is then emitted
  from the cleanup path trying to remove the `enabled` file from a sysfs group
  that was never fully created.
- The call path is:
  `BTRFS_IOC_QUOTA_CTL` -> `btrfs_quota_enable()` ->
  `btrfs_sysfs_add_qgroups()` -> `btrfs_sysfs_del_qgroups()` ->
  `sysfs_remove_groups()` -> `remove_files()` -> `kernfs_remove_by_name()`.
- `kernfs_remove_by_name_ns()` warns when the target node cannot be found;
  here it cannot find `enabled` under the qgroups directory.
- The warning becomes a panic because the test kernel boots with
  `panic_on_warn=1`. This may be a cleanup-path warning after an injected
  allocation failure rather than memory corruption; we have not confirmed a
  root cause or a fix.
- The warning is user-triggerable through Btrfs quota control, but we are not
  claiming it is a security issue.

How to reproduce
----------------

The recipe reproduces on a fresh, unmodified VM; no state snapshot is needed.

  git clone https://github.com/Zheng-zheng-codes/kernfs-remove-by-name-ns-warning
  cd kernfs-remove-by-name-ns-warning

  # boot the v7.4-rc3 kernel with the supplied config and guest image

  # in the guest, as root:
  syz-execprog -procs=8 -threaded -repeat=0 \
      -executor ./syz-executor reproducer/repro.kernsight.prog

`-repeat=0` repeats until the warning fires; the external runs hit in 43 s
and 45 s. The recipe has 76 entries (75 replay programs followed by the
testcase).

Verification:

- Main Kernsight pipeline: `confirmed=true`, `status=verified`,
  2026-11-18T05:11:34Z, 75 replay programs, fresh-VM 2/2.
- Independent external fresh-VM verification: 2/2, target hit after 43 s and
  45 s; serial logs are in `external-verify/serial-1.log` and
  `external-verify/serial-2.log`.
- C reproducer: not generated; the syzkaller recipe is the primary
  reproducer.

Kernel/guest details:

  kernel: v7.4-rc3, bzImage sha256
    0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
  guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
  boot: oops=panic panic_on_warn=1
  config: CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y, CONFIG_BTRFS_FS=y

Thanks,
Zheng
