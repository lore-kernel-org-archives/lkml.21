Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424567;
	b=TCjxZdLlZvJl7dIs1/HsIohBPE5Q9vFL/I763OJTINhqiS5Pb9Gkf9YlrbAbWUBFcMQN
	 l9k40yb0SgjE/SWWT0kLejAZkc29xp8Dnz4UTeTfiOdEI6pujyw4qnUvah1nziZiQlwVY
	 KGPaR+hzJoLdPt3J5Hh/4p39FhMOZGorkrtkSadNbyCU4kTeCdY/NwJJEX4hGaUtrVfVz
	 IjVafasobYy7ic0OLACFCiWlee9/nLjSqyLnPuSrnHBRK3jlwZGhllEj3+h0H3iW7CE/I
	 kN3uHUmHFFiul06vpw1QeSa8vrKIaG7fyWXtLYFGRHE37toiXZUU2ur8XAK0QPsAvGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
	b=oRazyNOVgxAuPfbJMAB2k8sAUW+hWY3csgb7cYPb1R5thw6tZv9FMAV5/FAj1dExNO3F
	 QfpDudOupTpOuqhwt/7HLELdWca1k1+C/F0dsXSFqYHTu6+hpdP8LD1WlPgZXSMhGKKaP
	 eHqPXSCb0OndbL77RpLNK5N4rwOxkOvzMhgTBmYV1KWhQR+P++dWUZ/kCpMQDDxFzYZ14
	 x0B6tgYQi8JgrFbChvVQYkAC2M/qkowBQa2RX0aA9fHenTnVKwL/1lEN1jwRF51gG44pK
	 RYaOBb5ToHY8ddavmwKddxn00EOIV5H6+tW4s56L1foWtDij6Rf3Vni8taeOPCUxe1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=haFZeWPE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F128606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F128606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=haFZeWPE
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40312e2so7376732eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:02:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795424566; cv=none;
        d=google.com; s=arc-20260327;
        b=crF5tyIZ4OyFQ9XwZEPaxSItwdBMf6YpU4RlSQaLohozg9cKaoHcc60kTlOaS09Yj2
         Y9oIWZjLH6PymnH1hxaDyE3nB+Jhdyev2loo8Mfnc4Ty4e32a74bMTQlnReagCvuDGDX
         9EyfGTHFaSZaqwGURTgASui4vmpS/mcJzSt2/3qcAI6Rj2bLFi/ftCW/wjogTd9fA7Mz
         zCkcFmQQ8/EOCsD385aVcvk+k65vn4sIx00YbCHwgkEqrl1r0l/P/zGtT0d14QN9NxtK
         IRPMi8OWARSkL2uvaftgVD075RLfvXh4A0ct40R+aFIxSp1/7vE6nOM79qcsLXWVkq9T
         kInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
        fh=oIHnbc4N7VywgJIcj/vqXIl+lwVaJanXgE0XshX1abI=;
        b=p5z41lJTFpE9zCw7zlRvrOaOMQAAHjXP2X8NYw16hx/874cDRLQXjj3ItIKSRL6TgT
         yArGZC5MttuPAL2kb2JS76rQGLZqeOwHqv5F2yPgr1FsSS0N0upCu/hUa05ZGX3B9xAO
         Tb0YlBJrBUimaWuFhgkKE3BLGN2ATH44lCH221KMVMjfBmjioGDAMKaCcBB8FcFOgGvI
         E50/r3b+Sm1L6GU7amC93yfJls7L0u2wnMC02Bd7G+SyeAygE2X+BTbNEv/cXUhVr4iT
         sj1OMA/D6ynQHjskbKY8E9Y6qZXFGKtvezCGM17OnHD4ATv62UUjqFZswJyX9jX1r+zV
         IB8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795424566; x=1796029366; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
        b=haFZeWPEpW+w0I5PD6ToXFKJJ8pe+QM3mmiik1oc+HNHPSgO1jMB+7YAAid6Dtf/pX
         7XcY8gAhR9ISZpYAQK6uzbpEbntXD4bVkikpMpwaBFuxQPmTD07Zgc2mdVEkSPCFEA0Z
         2BQWwpcGYUHXB0mu+A9Hr+SnRvvdOd8m5CMuKHWwgiMvKadHGWwXptCJwyUXWVzVKKqx
         zo4BGGbxDV1PDHZ+qp9PK65SvqIxXrO/tymZWgmxcZ5KhqhqVkINA6AnZyNKj9SgjaRp
         K2RcZZ3JO7Ur5xatAzFOtFQTqF3A0eY3oy3tGJY3NvoHbVCai/BItwwQ8olHPl8hPidn
         mW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424566; x=1796029366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
        b=Ul7HDneNxJbW+U16ZnR5Iq16ZnqPZr2doDHAM5Q2oDpX/qV56RMrYIO+un3YjjJoEz
         RcnW3VMLQzgxCG14ZAGgS5yH19pv8XDro0yd39tz2dZ7dCvfGbN3x3VFzN1dnCvpJ16L
         WysxuBOmtQsfbhEMMwO4xmF4lGrLgq5kNxx0Oj6MG4xBUUCmguiW6Jwm8vjdnJ69k7ST
         FXu8lP5YOiGT2I9fs+dEDYxSsurpT9CJyDxVtYP+cXKRrM7smb5BonnhEBQZSBU4VQct
         Q4iHdkofFeDa88YeLgkzAkE+ZrU/iuOMhLZIC56MQAWkM5Nja58xhk7BP/NWfF1yzbXZ
         phkQ==
X-Forwarded-Encrypted: i=1; AL+hErEPoewZE0WEvWMtzmPe+cVswkeh0fEMT6NtygvAyrc/gBlDCcx664hSUOGPIfX027pAJPpzyKCrlo6sbww=@vger.kernel.org
X-Gm-Message-State: APuU4Z//wPgLBMYnIhE7J9msM6SHBHoN1TUv078Ysl50avA4j/Kl3LHb
	wtnVru/qYFvuwX3nze1OX3w48x92ZoaHkHj/fEJRVIIJ+QFjazsloRIpGBVvt9zFu3bjeq6dpDg
	NEQ7OsdU3d6rtYqNbFbaKlz5oVr86+rVxuMAcm44y
X-Gm-Gg: AZFdTZdkc9LLmldRrSirZJtABD88aMapH9d7u7MpgWvnkGo5YlrK1jjYZk4RXgZZyJa
	DgUdRyfr//SB066JGDW7EHOT2JpS7+uR5xSmwMAz3pfjfkbKIn4BHIlaswbpWCTFuY+gfQnk0QW
	ehes3oq0AgSU/q8Drh6sVByxRQXa9hqc1ZvcM2ZpcymdaTptAYIEfcgY6LoNqzP81Fxo4NTEdV6
	yNdrl6nOZe4VJUtvXWZ9D8v34Yo0iUbbgYg6UyG2NuBcWBEP1XXj7mGcl54dXAUvx7QbKg00FsM
	p7XU2z4+8JV0wLnw02amsMiynzRvO3i7B1g0maf2Jreav1FlFsyL5nkXUmSO7pgv1Rmq7bN6Eei
	HDGCmnWPk8GmQio0HFhUDRCxL6ZBOjlPV2fQgXk8stvg4IZnyALtIO2ssv4AIZ7LJC2un
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id
 5a478bee46e88-3857180d3b2mr18589586eec.38.1795424565611; Mon, 23 Nov 2026
 01:02:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6b039d4a.a481e175.27cf24.0013.GAE@google.com>
In-Reply-To: <6b039d4a.a481e175.27cf24.0013.GAE@google.com>
From: Marco Elver <elver@google.com>
Date: Mon, 23 Nov 2026 10:02:08 +0100
X-Gm-Features: Aa3M54ryWW6E5eniKyIB92OCNHEPzmjvoG_MICiuqBpgAvPnFl_YAqPfawxIrG8
Message-ID: <CANpmjNPn5BRZsm0KLgt6hyN-St-B5xsuwhN4CNgc7dbvxBxOvw@mail.gmail.com>
Subject: Re: [syzbot] [exfat?] KCSAN: data-race in copy_folio_from_iter_atomic
 / fat12_ent_put (6)
To: syzbot <syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com>
Cc: exfat@lists.linux.dev, hirofumi@mail.parknet.co.jp, linkinjeon@kernel.org, 
	linux-kernel@vger.kernel.org, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 02:56, syzbot
<syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    f802b6558eb8 Merge tag 'xfs-fixes-7.4-rc4' of git://git.ke..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17d97cd5580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
> dashboard link: https://syzkaller.appspot.com/bug?extid=c1b4f0f31099fb2324e2
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/2b34daaac71e/disk-f802b655.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1e58ec148c51/vmlinux-f802b655.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/465e72cdcb06/bzImage-f802b655.xz
>
> AI-generated root cause summary:
> fat12_ent_put() in fs/fat/fatent.c modifies FAT table buffer_head data
> (fatent->bhs[0]->b_data and, for block-spanning entries, fatent->bhs[1]->b_data)
> without acquiring lock_buffer(). Because block device writeback
> (blkdev_writepages() -> block_write_full_folio() / write_dirty_buffer()) relies
> on lock_buffer() to synchronize buffer modifications against in-flight write
> bios, fat12_ent_put() can overwrite bh->b_data concurrently while the block
> driver (here loop1 via lo_rw_aio() -> shmem_file_write_iter() ->
> copy_folio_from_iter_atomic()) is reading the buffer for an ongoing writeback
> I/O.

>  CPU 0 (vfs_write -> fat12_ent_put)       CPU 1 (writeback -> loop1 -> shmem)
>
>                                           __block_write_full_folio(folio)
>                                             lock_buffer(bh)
>                                             test_clear_buffer_dirty(bh)
>                                             __bh_submit(bh, REQ_OP_WRITE)
>                                               -> queued to loop1 (BH_Lock held)
>
>  __fat_alloc_clusters()
>    fat_ent_read_block() -> sb_bread()
>      // bh is already uptodate; returns bh without waiting on BH_Lock
>    fat12_ent_put(&fatent, FAT_ENT_EOF)
>      spin_lock(&fat12_entry_lock)
>      // bh->b_data[0x18] = 0xff (low 8 bits of new)
>      *ent12_p[0] = new & 0xff;
>                                           loop_workfn() -> lo_rw_aio()
>                                             shmem_file_write_iter()
>                                               copy_folio_from_iter_atomic()
>                                                 memcpy(dst, bh->b_data, 1024)
>                                                 // reads new ent12_p[0], old ent12_p[1]!
>      // bh->b_data[0x19] = (old & 0xf0) | 0x0f
>      *ent12_p[1] = (*ent12_p[1] & 0xf0) | (new >> 8);
>      spin_unlock(&fat12_entry_lock)
>      mmb_mark_buffer_dirty(bh, ...)
>                                           // Torn 12-bit FAT12 entry written to backing
>                                           // shmem file (or checksum mismatch if
>                                           // BLK_FEAT_STABLE_WRITES is enabled)

> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=c1b4f0f31099fb2324e2
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KCSAN: data-race in copy_folio_from_iter_atomic / fat12_ent_put
>
> write to 0xffff8881074bf418 of 1 bytes by task 4984 on cpu 0:
>  fat12_ent_put+0x74/0x180 fs/fat/fatent.c:168
>  __fat_alloc_clusters+0x571/0xdc0 fs/fat/fatent.c:542
>  fat_alloc_chain+0x25/0x30 fs/fat/fatent.c:610
>  fat_add_clusters fs/fat/inode.c:109 [inline]
>  __fat_get_block fs/fat/inode.c:156 [inline]
>  fat_get_block+0x276/0x650 fs/fat/inode.c:191
>  __block_write_begin_int+0x459/0x1070 fs/buffer.c:2043
>  block_write_begin fs/buffer.c:2157 [inline]
>  cont_write_begin+0x4af/0x6c0 fs/buffer.c:2519
>  fat_write_begin+0x52/0xf0 fs/fat/inode.c:233
>  generic_perform_write+0x198/0x510 mm/filemap.c:4407
>  __generic_file_write_iter+0x9e/0x120 mm/filemap.c:4524
>  generic_file_write_iter+0x77/0x1f0 mm/filemap.c:4550
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
> read to 0xffff8881074bf400 of 1024 bytes by task 33 on cpu 1:
>  memcpy_from_iter lib/iov_iter.c:85 [inline]
>  iterate_bvec include/linux/iov_iter.h:123 [inline]
>  iterate_and_advance2 include/linux/iov_iter.h:306 [inline]
>  iterate_and_advance include/linux/iov_iter.h:332 [inline]
>  __copy_from_iter lib/iov_iter.c:261 [inline]
>  copy_folio_from_iter_atomic+0x73a/0x1050 lib/iov_iter.c:491
>  generic_perform_write+0x34b/0x510 mm/filemap.c:4425
>  shmem_file_write_iter+0xc5/0xf0 mm/shmem.c:3701
>  lo_rw_aio+0x6e9/0x7a0 drivers/block/loop.c:-1
>  do_req_filebacked drivers/block/loop.c:-1 [inline]
>  loop_handle_cmd drivers/block/loop.c:1847 [inline]
>  loop_process_work+0x569/0xb00 drivers/block/loop.c:1882
>  loop_workfn+0x31/0x40 drivers/block/loop.c:1906
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
>  worker_thread+0x56c/0x770 kernel/workqueue.c:3659
>  kthread+0x248/0x2a0 kernel/kthread.c:436
>  ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 UID: 0 PID: 33 Comm: kworker/u8:1 Not tainted syzkaller #0 PREEMPT(lazy)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> Workqueue: loop1 loop_workfn
> ==================================================================
> netdevsim netdevsim1 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim1 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim1 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim1 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> bond0 (unregistering): Released all slaves
> hsr_slave_0: left promiscuous mode
> hsr_slave_1: left promiscuous mode
> veth1_macvtap: left promiscuous mode
> veth0_macvtap: left promiscuous mode
> veth1_vlan: left promiscuous mode
> veth0_vlan: left promiscuous mode
> netdevsim netdevsim4 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim4 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim4 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim4 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> bridge_slave_1: left allmulticast mode
> bridge_slave_1: left promiscuous mode
> bridge0: port 2(bridge_slave_1) entered disabled state
> bridge_slave_0: left allmulticast mode
> bridge_slave_0: left promiscuous mode
> bridge0: port 1(bridge_slave_0) entered disabled state
> bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
> bond_slave_0: left promiscuous mode
> bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
> bond_slave_1: left promiscuous mode
> bond0 (unregistering): Released all slaves
> hsr_slave_0: left promiscuous mode
> hsr_slave_1: left promiscuous mode
> batman_adv: batadv0: Interface deactivated: batadv_slave_0
> batman_adv: batadv0: Removing interface: batadv_slave_0
> batman_adv: batadv0: Interface deactivated: batadv_slave_1
> batman_adv: batadv0: Removing interface: batadv_slave_1
> veth1_macvtap: left promiscuous mode
> veth0_macvtap: left promiscuous mode
> veth1_vlan: left promiscuous mode
> veth0_vlan: left promiscuous mode
> team0 (unregistering): Port device team_slave_1 removed
> team0 (unregistering): Port device team_slave_0 removed
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
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/6b039d4a.a481e175.27cf24.0013.GAE%40google.com.
