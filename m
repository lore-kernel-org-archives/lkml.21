Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776573;
	b=qglsDfA+uY3ccwhjJZUJ5I28gWAsO5SP9T7ZMsTUXoIFdw1MYFpERM2Pwqp3hlp05pY0
	 bU6z2x6eBskLvPfQyK9uW75HzmHewcrUBPrAv6SDsWwpDnc+GcCazWVKzTaMUPcnnnG8N
	 ZVEynd5CHDUS7kVys05vC5RrZBUnamOsG63sXOSZKIn/PTljGXoRfRgYWv8xhMZrndlxZ
	 BPtjiLt0Fft8bbuBEUncs/+4w8KW5Df5OfNr+99DG3FeNIyr12r4XCTAqg+LqsnNqHTB+
	 xsq0Ny7Wb/b+0GPaR4m2sTfAvdEZHJzlUFtk+yoKVPZ3yCMnSVrWH7KJr7/qafyJk+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3af5WiESHTdm82IJrxuMeiAb7fk1ROO5VIoOEPm1r7o=;
	b=5gtL8j6dGRcet4EvdlvQ1mAIljBMzOs5OgVxuxV7pyU7wMQsp03cJmNGj+C5v9STjLJO
	 40Kxzubqmhlas2pCcmmmFVv2mjEWC+SptgW+mYGLYzyjW04QtTsxYxVUV6nRUS0a/Opsm
	 eJZTvlS8ne8pLZQ0bvlJh7N1XUwQY0qcwvScEpJNiRKqHZwWoCjHh+gWopY1Yl2pbv+ek
	 o+CZivHTd/L3A6AeSA3wREFD4OoARyQRQcJR1hWYYNjZINjnl5kk7taaMw52IwIXMZGCz
	 wTEI4BTqM+JiOtWzmxd/tBUjvFgqRrIm7q0bEhOxab7JYzPmQe81mgwnBH1bzVid2CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n09vu0NR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E05606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n09vu0NR
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so13028247c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795776572; cv=none;
        d=google.com; s=arc-20260327;
        b=TiQAFhocJm9UM6jhm0TfI3KH2Jx7Bnr0Cdy+bqSIp14A7WEtXP/35j/JHJDybwIqPX
         +GlVpJip/8vBbFNyV0ZMR5O9/pg25R8xO27HME5Yux8oBK1B9xYFNV+XcNbA5ZZrs0KL
         7PKJudNiEerdcbfp75SW7SEUPmKVILUkr1lD3xWxNOUXdmuKgztiH50x6G+mmHNdBfdE
         qHEV265txAU4wjedI6pqfZk/e0D1DkNDDENm/e3WJYVKcrp8u6LAa8UehhhTR44cUc+Y
         Z0EfxbjhfSAtyrWGGHVAYaN4VaMdyP3wFr/BglwO178wCzYdfjwblJp1y8lPnwWzXn6q
         OwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3af5WiESHTdm82IJrxuMeiAb7fk1ROO5VIoOEPm1r7o=;
        fh=dtM7zGdl7pfkpXFfZQJQ/Ib+uUWSmkqYAjuYnsekQFk=;
        b=JSafTyb3XJx2SCor29nAkJVze1lnxG8Nhi9L+cmsh/Y/2L19L1qVCAlOOdS5k046lE
         q3jlNHzMnnWWtaI2zHeF57yX/UU/SAf3cvrwL37mrEktIDr3HNy4M34qSUhY9Ua5Cn3P
         /ScegFRbQ57H53iKX0QCnKgOD1b8kLf3e4doERu2VxHja2xArDEM7jRlJBvmuiiDQnuU
         Yq5aO+Jv7lcxOrTHM3BkYpcypMvzG835BIK/yfm4khbp1F1Qtz6VII+icsS4J1lG2Mnm
         8VCyL7UDEqp5u8OJOGULnclcaV0m4RZj8Zz3KJUznPZRE3PnsaT2Fj/u+LFPHoii+8os
         pF2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795776572; x=1796381372; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3af5WiESHTdm82IJrxuMeiAb7fk1ROO5VIoOEPm1r7o=;
        b=n09vu0NRSNlvp5/rBKiYtHf38sfWpvwz8+jdGnuZZzgyXFsqNJw8M1p3hal2NAQCuL
         AleCcTfGxLu3ksbmi+vsu3ef8fQvSZWjc5BshDIvpRw2hcbLMmK0TLyQPXPvltOvG7sv
         Va6bP6+kx3Z624jhg5XKqohel+r1PKUt3k6Wruui7kRboBSGg5+7V5GbJEJkyDoF3OWp
         f1JelGgoGadBIzlzXmOwtauh2X8rEArjP3E4CnjXDYeE96fQbVWX8/Yw+1lkz0X7Kefm
         9kv/kfVqHCHk1yLdOzGiVLTX846q0oKCBSvTtiDAigQe9OnEdkrlHVaNkDOSJ7L6Jvkb
         Dy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776572; x=1796381372;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3af5WiESHTdm82IJrxuMeiAb7fk1ROO5VIoOEPm1r7o=;
        b=Ju3fjn/6TlUzn/opYP6oo/8n/rzUV1NJp+JPhpdcnGKSI0duL6YPNaHsGpHgV+77kF
         XHDy2fNKXTgXlsGA34MUXNe5MladwJukG1E0dn2kGKAgnZ+HTRKH4WWccNlr72m77bnr
         qImMb35mruG8zfnUf5taRa4k+EPtlZYvG+xGe4bEvO+JUqzoo2t0Y8DqzCvaCjmliOSo
         4iuPTzjnGUWmszUAQltmRc0PBicgRWcNAgTYvNXkK/3vE+EoG9/pXH2cLI5wd/3DPXK0
         KYqWLieWHZ/utAMypDrkKIylZivyVwOl3AXJGTTp6vCChJU0koHv+Mp2nXecLNVw2DhM
         UW9g==
X-Forwarded-Encrypted: i=1; AL+hErGYUfk+xk6n26v9RsA2GHxLhJH9i7nUptAsSOPMnbwr9AQAzC+IzTUC6MxOyGd2+dcz9QdWwLs787Utgxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cqlp7Daj76jti6zibRG3LyO65918FsG/8DevUt/47/xjPm9Hl
	36H1Q4fOxiNGKr9p0LFxXCNUYztIoILp2pevLYrGx8gpwXyevucv3QgoazLRrEjfAjWvIPdzq/0
	z8b+OtELxAffCt81R3sZSpZ0iffUYymjTrQLJN2rN
X-Gm-Gg: AZFdTZezfTkc26+3En8613e60VyCO4L4aPcucbA9kYiSV4hysKz+Hc77dnSxa3ghyFP
	TgaVhgf7DN2bKIv79VG8xUE1ndX22QlegS79xl81fBDfGfvRxPk0HhL91HFJKKAy/6qkVn7+3R+
	1aNH76bKY05SnMGOM82i7mVisBg/LNKcSpQK10yVO0BAbQemeIxa2L1fWxf1Vu9+BUdybLsJ/Hm
	Cb+uMDVzF6PLBkQAzG1B5pbF82g2ku9vKBF7m/dRv7J+suIpZtnDT0VtJz9eR4p9MQUEzsMviYX
	gETDj3IbhS09gLkQmemP2NYbwDkSELDk70+ZeHF2Ynh8AB4BTSVRiYbrUGrYJgwbli82cNFkJRs
	QEdhfQPWY56fdO86dyfdmWDyj+BkdcwD7A4qSKJXSqop/OlKRa3IZ+Yw41ErcGCtk4h31
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id
 a92af1059eb24-1b55687ea53mr19822602c88.10.1795776571011; Fri, 27 Nov 2026
 02:49:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6b094feb.b83081fb.4cb0e.0020.GAE@google.com>
In-Reply-To: <6b094feb.b83081fb.4cb0e.0020.GAE@google.com>
From: Marco Elver <elver@google.com>
Date: Fri, 27 Nov 2026 11:48:53 +0100
X-Gm-Features: Aa3M54oAqY7TUkt9YncRsXOTU2R-n1BpRctf5k5GVh_lkKgkzC8o_ogVftgZbBk
Message-ID: <CANpmjNNVk47zjvMwfUA5sRVSw38wU7i6RRkEGjMBSQys5miHYQ@mail.gmail.com>
Subject: Re: [syzbot] [net?] KCSAN: data-race in xa_set_mark / xas_find_marked
To: syzbot <syzbot+cc64b6bdf649b54047e0@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, 
	jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Nov 2026 at 10:39, syzbot
<syzbot+cc64b6bdf649b54047e0@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    ebb7a8dc1e74 Merge tag 'soc-fixes-7.4' of git://git.kernel..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=105ce153580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=dc99102739636b09
> dashboard link: https://syzkaller.appspot.com/bug?extid=cc64b6bdf649b54047e0
> compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/be1abd72bd4e/disk-ebb7a8dc.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/317ea0b3db13/vmlinux-ebb7a8dc.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4ec18c47ec34/bzImage-ebb7a8dc.xz
>
> AI-generated root cause summary:
> KCSAN reports a data race on `xa_node->marks` between `xa_set_mark()`
> (`lib/xarray.c`) and `xas_find_marked()` / `xas_find_chunk()`
> (`include/linux/xarray.h`). While writers hold `xa_lock` and update
> `node->marks` using the non-atomic bitop `__test_and_set_bit()` in
> `node_set_mark()`, lockless RCU readers in `xa_find()` -> `xas_find_marked()`
> call `xas_find_chunk()`, which performs an unmarked plain read (`*addr & (~0UL
> << offset)`) without `READ_ONCE()` or `data_race()`. Because
> `CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC` is disabled, KCSAN flags the
> concurrent unmarked read against the non-atomic read-modify-write bitop.

The above analysis summarizes what is happening, but not what the
failure scenario is:

>  CPU0 (xas_find_marked under RCU)         CPU1 (xa_set_mark / xas_store under xa_lock)
>
>  xas_find_marked()
>    offset = xas_find_chunk()
>      // plain load *addr cached in reg
>      // bit K is 1
>                                           xas_store(&xas, NULL) // or concurrent clear
>                                             xas_init_marks() -> node_clear_mark(K)
>                                             rcu_assign_pointer(*slot, NULL)
>    entry = xa_entry(..., K) // READ_ONCE -> NULL
>    if (!entry && ...)
>      continue;
>    // next iteration: node, offset=K, advance=false
>    offset = xas_find_chunk()
>      // compiler reuses cached reg (bit K still 1!)
>      // returns K
>    entry = xa_entry(..., K) // READ_ONCE -> NULL
>    continue; // -> Infinite livelock under rcu_read_lock()!

> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=cc64b6bdf649b54047e0
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+cc64b6bdf649b54047e0@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KCSAN: data-race in xa_set_mark / xas_find_marked
>
> read-write to 0xffff888106b77228 of 8 bytes by task 3329 on cpu 1:
>  instrument_read_write include/linux/instrumented.h:56 [inline]
>  __instrument_read_write_bitop include/asm-generic/bitops/instrumented-non-atomic.h:84 [inline]
>  ___test_and_set_bit include/asm-generic/bitops/instrumented-non-atomic.h:99 [inline]
>  node_set_mark lib/xarray.c:95 [inline]
>  xas_set_mark lib/xarray.c:894 [inline]
>  __xa_set_mark lib/xarray.c:2088 [inline]
>  xa_set_mark+0xda/0x1b0 lib/xarray.c:2155
>  devl_register+0x4c/0x70 net/devlink/core.c:413
>  nsim_drv_probe+0x1e1/0x7c0 drivers/net/netdevsim/dev.c:1607
>  nsim_bus_probe+0x15/0x20 drivers/net/netdevsim/bus.c:419
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x1ba/0x600 drivers/base/dd.c:707
>  __driver_probe_device+0x176/0x1e0 drivers/base/dd.c:869
>  driver_probe_device+0x63/0x380 drivers/base/dd.c:899
>  __device_attach_driver+0x24e/0x350 drivers/base/dd.c:1027
>  bus_for_each_drv+0x1c0/0x230 drivers/base/bus.c:500
>  __device_attach+0x1d1/0x2a0 drivers/base/dd.c:1131
>  device_initial_probe+0x6a/0xb0 drivers/base/dd.c:1190
>  __bus_probe_device+0xfd/0x1b0 drivers/base/bus.c:614
>  bus_probe_device+0x15/0x20 drivers/base/bus.c:632
>  device_add+0x601/0x7c0 drivers/base/core.c:3778
>  device_register+0x1d/0x30 drivers/base/core.c:3860
>  nsim_bus_dev_new drivers/net/netdevsim/bus.c:468 [inline]
>  new_device_store+0x2b0/0x460 drivers/net/netdevsim/bus.c:191
>  bus_attr_store+0x57/0x80 drivers/base/bus.c:172
>  sysfs_kf_write+0xfe/0x120 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x1d2/0x2e0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:575 [inline]
>  vfs_write+0x57a/0x9b0 fs/read_write.c:667
>  ksys_write+0xdc/0x1a0 fs/read_write.c:719
>  __do_sys_write fs/read_write.c:730 [inline]
>  __se_sys_write fs/read_write.c:727 [inline]
>  __x64_sys_write+0x40/0x50 fs/read_write.c:727
>  x64_sys_call+0x154e/0x2550 arch/x86/include/generated/asm/syscalls_64.h:2
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> read to 0xffff888106b77228 of 8 bytes by task 3324 on cpu 0:
>  xas_find_chunk include/linux/xarray.h:1752 [inline]
>  xas_find_marked+0x211/0x650 lib/xarray.c:1516
>  xa_find+0xa4/0x140 lib/xarray.c:2204
>  __devlinks_xa_find_get+0x99/0xe0 net/devlink/core.c:375
>  devlinks_xa_find_get+0x24/0x30 net/devlink/core.c:396
>  devlink_get_from_attrs_lock+0xd8/0x390 net/devlink/netlink.c:225
>  devlink_nl_inst_single_dumpit net/devlink/netlink.c:397 [inline]
>  devlink_nl_dumpit+0x26d/0x300 net/devlink/netlink.c:456
>  devlink_nl_port_get_dumpit+0x24/0x30 net/devlink/port.c:631
>  genl_dumpit+0xac/0x110 net/netlink/genetlink.c:1026
>  netlink_dump+0x46a/0x880 net/netlink/af_netlink.c:2360
>  __netlink_dump_start+0x483/0x570 net/netlink/af_netlink.c:2475
>  genl_family_rcv_msg_dumpit+0x1a5/0x210 net/netlink/genetlink.c:1075
>  genl_family_rcv_msg net/netlink/genetlink.c:1191 [inline]
>  genl_rcv_msg+0x3fd/0x470 net/netlink/genetlink.c:1209
>  netlink_rcv_skb+0x11e/0x220 net/netlink/af_netlink.c:2585
>  genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
>  netlink_unicast_kernel net/netlink/af_netlink.c:1336 [inline]
>  netlink_unicast+0x6fd/0x7e0 net/netlink/af_netlink.c:1362
>  netlink_sendmsg+0x605/0x760 net/netlink/af_netlink.c:1921
>  sock_sendmsg_nosec net/socket.c:800 [inline]
>  __sock_sendmsg net/socket.c:818 [inline]
>  __sys_sendto+0x429/0x480 net/socket.c:2283
>  __do_sys_sendto net/socket.c:2290 [inline]
>  __se_sys_sendto net/socket.c:2286 [inline]
>  __x64_sys_sendto+0x76/0x90 net/socket.c:2286
>  x64_sys_call+0x200c/0x2550 arch/x86/include/generated/asm/syscalls_64.h:45
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 3324 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(lazy)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> ==================================================================
> netdevsim netdevsim1 netdevsim0: renamed from eth0
> 8021q: adding VLAN 0 to HW filter on device netdevsim0
> netdevsim netdevsim1 netdevsim1: renamed from eth1
> 8021q: adding VLAN 0 to HW filter on device netdevsim1
> netdevsim netdevsim1 netdevsim2: renamed from eth2
> 8021q: adding VLAN 0 to HW filter on device netdevsim2
> netdevsim netdevsim1 netdevsim3: renamed from eth3
> 8021q: adding VLAN 0 to HW filter on device netdevsim3
> 8021q: adding VLAN 0 to HW filter on device bond0
> 8021q: adding VLAN 0 to HW filter on device team0
> hsr0: Slave A (hsr_slave_0) is not up; please bring it up to get a fully working HSR network
> hsr0: Slave B (hsr_slave_1) is not up; please bring it up to get a fully working HSR network
> 8021q: adding VLAN 0 to HW filter on device batadv0
> veth0_vlan: entered promiscuous mode
> veth1_vlan: entered promiscuous mode
> veth0_macvtap: entered promiscuous mode
> veth1_macvtap: entered promiscuous mode
> batman_adv: batadv0: Interface activated: batadv_slave_0
> batman_adv: batadv0: Interface activated: batadv_slave_1
> soft_limit_in_bytes is deprecated and will be removed. Writing any value to this file has no effect. Please report your usecase to linux-mm@kvack.org if you depend on this functionality.
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/6b094feb.b83081fb.4cb0e.0020.GAE%40google.com.
