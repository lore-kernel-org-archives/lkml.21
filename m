Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183569;
	b=4z2ORRkr2kzdVgrGvvX0RS7jPJOIH1MIHWUvQPd+UuXQaRB0PoqVIYlWIVro/eli/XIP
	 GgqgpeV9sSVwgB8/qAbvEouDE2s63ydgdT+1SxlcoGY4uk1yuwl2//6Od6GyKMua2smlu
	 LykESP9YugEou3PZ8F713ydpIHaFP63oTkt3e5isPbEfkYOh9vj+U4zK1fDKk7SH05biy
	 mZYWnT3jZLZOPodAuQgkeRUVHcfukUI0VIMgOW9uc1pytDJGOMn3YwVfH4397nOBJ0QnN
	 1MqzVYMc8WXfMth7JPGaqczth6is7l5TVXbgchWxLQkTSukGb55TZt+jK1xXM/psXwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=el8AgDiIhYuS9gvOIIjYF21nBvQahKMjOTotFy671xs=;
	b=V/AKATy1yOfoO+Cm0sZ4NzAD2+SDXc/Ogu3Dya3LyPUn+O1U5IoYFexQJCfT84qngs8E
	 SZuenqmGstXr32JJuGDZzy4c8dy9aK9WereXOOassgY8QodCYZARgktQXhw/avbwqNRRz
	 wyv0mOrrxFsI0mVBSJU/Ky25Cr5pobQTgbSCHbpolSbH/fqQ6qdmY2fXTT/c3sZ+V1h5i
	 eTTkUOYBOHY9ZjCI8Yor9NpTDx6cmz8QJlMqfL6VycNeatPfEgoZPpYj1c/05S5gR2RZs
	 Q49l22WvdaWwoWKpkHWaBeTzHCxx/RCqqK2knNAaIvd3dajnvOjqrJNo9XnshC8YxQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ottLvP5O;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C0606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836C0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ottLvP5O
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98301b325c4so280775241.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183568; x=1795788368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el8AgDiIhYuS9gvOIIjYF21nBvQahKMjOTotFy671xs=;
        b=ottLvP5OB4M6YzuggN61jHSHJKLdzUIJ6y75d6/5xy+0AaLgS39nzJmIKh2Wll9rUF
         p36J27dubIjTFrWg9OMSdQ3fMT/N3AvLkZ1NaPgsrr+IPAe+EkgT8DKnT/SJoEmA9YYJ
         W3sj3JVWOcGMgiJu+gy9Ro6VR1RzF/uSaB2GIGped4Fk/tcEq4ijB7Q4fniRNwrwOn0T
         yGcjHYux0/gA5236aZiGR4vRxK8hhoopGicsT1zwOOvyJJnn3MPlVt1H8CTDuO+b90QN
         z/202DzebyrCkrYZDmsTUrtEeKJ1qLvaLd+WGlFivEs3BHuWL/vXR/0KwRzsscuFlMeh
         oSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183568; x=1795788368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el8AgDiIhYuS9gvOIIjYF21nBvQahKMjOTotFy671xs=;
        b=LAZHawbumeDzXyGQxf8MD0tk7Efq/PHCNKnjXibI/MmExsdrRMBB0wWzLAfBaeHcfF
         T6iwdMXAJXRojKndmr6dHxV2m6xlV2OvbN1Hq811bassfknjlSQFKrB4SuJL+17S0UPL
         3rdjpUxv4I0uBJNuTBjNYDNdYuk7zwT9pN4Qa/GK4AndMw0juWC+dREjLGaDMYNWQQQc
         cRNsWRZdN8xjWnWbiajiJ25CXO4KxNsoUiTA0JnmhC79C0J/fZtF6KobQmiWOCqCJK2n
         SKVwj815TABZuF8yDTgAo6rRfahJM4MxvtTMZXmW3FLigIqnlpitIQJYCw/mwD3A7TKx
         mElA==
X-Forwarded-Encrypted: i=1; AL+hErGWdYt4YhdClVWUjJxtw4i+RorO+ZbHOIcdcRREQuKR5mh600UAuMoxdONbL7FaSsdiIpLCRFR2X6H13iU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kBx2rHuOhctBiYrkCd3WT0JeRy2rmNciyjCN5Vhh3o5Oxyfwy
	P9fjokwaHUr6ZuLo4nJW4h9WOHpY6nDFKZYDAwBQZPaXr89ItxRh4KVc
X-Gm-Gg: AZFdTZfFB4n+V6fCykED8olXKcW/2qubWLY84h0sAwKAaC9mna3JWEAVamaXFsnyTHT
	2B44n1bDJtlyWfEQqRpG36qOy+zoDBaglEt62hugW+EZ+N02saQQI/Fd+8p9HqpsDfrrHWsXe9+
	n87+He3KuLErTNaEAol+DG+JlZlSgZH/uUqslYNhVO7zhtzOUUdxRKs4jcLyOTj1W+Jgx/khvon
	kAtpj4D8bG0YNTxztZiaSfNsPLVDzfYOC9YSyCuMrc8XqnivoJQafyDSbZc3VssqOxIQ0rLGqiG
	lvhGMi9/CQ5IdE+9PjMwftE9iP1zgfvsVKtGdKIpqTxf3tuTppHIg7Tkm+/35lAQwESAhGhBMJJ
	G9BMaVwvQZYLldxFwhnupfBwG+/7T8XXmIzsf/YQuiqBXksvakEKFGxCX7a5wuoTJaZfvV8ZDUU
	r82jfike28ktsZ1Ab35fowFYExKHtt0El3SUk3uhCsxZosIUPkm7cWQ9qA+O0Ms2C7YEQxYZAIa
	SL5JcbHZb8FTzslU99nJfdGubGO6H6IvoNPEFo/fZfGWMokBnkX4rOyO8le/p6bn5wiiiZ0FqE0
	HUughat7YXpt/YBHBaCn1pEy00VOAE1Zod1kkak+aCUH97vdoglm6U2khWfT4/BgjOzU1v3i2iB
	DE4fU2ut8MAj+6BuzVF3amgoyn9WWbGVR5SS2bCcdQk7+T/0OWoI3l8pFl7KrlDeEVtAzBp5iBy
	GTdZ6RQaVMAhBGLoJzWSqn4GVkAt8=
X-Received: by 2002:a05:6122:421c:b0:5d6:7f46:b8dc with SMTP id 71dfb90a1353d-5ee8af5f40dmr1423602e0c.21.1795183568236;
        Fri, 20 Nov 2026 06:06:08 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4d9:d040:5fad:8738])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349eae11sm26195616d6.25.2026.11.20.06.06.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 06:06:07 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Bernard Metzler <bernard.metzler@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc v2] RDMA/siw: Reject opcodes a user send queue may not use
Date: Fri, 20 Nov 2026 09:06:05 -0500
Message-ID: <20261120140605.62810-1-astellman@stellman-greene.com>
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

A user QP's send queue is mapped into the process, and
siw_activate_tx_from_sq() only checks that an SQE's opcode is below
SIW_NUM_OPCODES. siw-abi.h marks SIW_OP_INVAL_STAG and SIW_OP_REG_MR as
valid for in-kernel clients only, but a user process can still post
them. For SIW_OP_REG_MR, siw_fastreg_mr() then uses the user supplied
base_mr value as a kernel pointer to a struct ib_mr.

The uverbs device is mode 0666, so once an administrator has created a
siw device any local user can trigger this. With an unmapped base_mr,
as an unprivileged user under KASAN:

  Oops: general protection fault, probably for non-canonical address 0xe000042828282002: 0000 [#1] SMP KASAN NOPTI
  KASAN: probably user-memory-access in range [0x0000414141410010-0x0000414141410017]
  CPU: 1 UID: 65534 PID: 116 Comm: siw003 Not tainted 7.4.0-rc3-gaebb72744764 #16 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  RIP: 0010:siw_qp_sq_process+0x38b/0x3c10
  Code: 0f 85 fe 36 00 00 8b b5 8c 02 00 00 48 85 db 0f 84 15 26 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7b 14 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 d9
  RSP: 0018:ff1100000559f860 EFLAGS: 00000203
  RAX: dffffc0000000000 RBX: 0000414141410000 RCX: ffffffff98233fb5
  RDX: 0000082828282002 RSI: 0000000093e50e00 RDI: 0000414141410014
  RBP: ff11000005786000 R08: 0000000000000001 R09: 000000000000000b
  R10: 0000000000000000 R11: 00000000c8f9259d R12: ff110000057df400
  R13: dffffc0000000000 R14: ff1100000565a000 R15: ff1100000578628c
  FS:  00007f1b60b7d740(0000) GS:ff110000caf2e000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: e000042828282002 CR3: 0000000005732000 CR4: 0000000000751ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   ? __pfx_siw_qp_sq_process+0x10/0x10
   ? siw_activate_tx_from_sq+0x865/0xc20
   siw_post_send+0xecf/0x20b0
   ? kasan_save_track+0x14/0x30
   ? uverbs_try_lock_object+0x51/0xa0
   ? rdma_lookup_get_uobject+0x1ea/0x360
   ? __pfx_siw_post_send+0x10/0x10
   ib_uverbs_post_send+0xf28/0x1610
   ? nbcon_get_cpu_emergency_nesting+0x5/0x30
   ? __pfx_ib_uverbs_post_send+0x10/0x10
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ib_uverbs_write+0x899/0xd30
   ? __pfx_ldsem_down_read+0x10/0x10
   ? __pfx_ib_uverbs_write+0x10/0x10
   ? _raw_spin_lock_irqsave+0x86/0xe0
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? mutex_unlock+0x7b/0xd0
   ? file_tty_write.isra.0+0x4f8/0x8f0
   ? selinux_file_permission+0x373/0x540
   vfs_write+0x227/0xcd0
   ? do_sys_openat2+0xd1/0x170
   ? kmem_cache_free+0xba/0x3a0
   ? __pfx_vfs_write+0x10/0x10
   ? __pfx_do_sys_openat2+0x10/0x10
   ? fdget_pos+0x53/0x4b0
   ksys_write+0x17c/0x1c0
   ? __pfx_ksys_write+0x10/0x10
   ? __hrtimer_rearm_deferred+0x156/0x450
   do_syscall_64+0xdf/0x4c0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  RIP: 0033:0x7f1b60d4f574
  Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
  RSP: 002b:00007fffd2b4e098 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
  RAX: ffffffffffffffda RBX: 000055859422a180 RCX: 00007f1b60d4f574
  RDX: 0000000000000020 RSI: 000055859422a238 RDI: 0000000000000004
  RBP: 000055856deca0d4 R08: 0000000000000078 R09: 0000000000000000
  R10: 0000000000000000 R11: 0000000000000202 R12: 000055859422a180
  R13: 00007f1b60b7d6b8 R14: 000055859422a000 R15: 000055859422a0c0
   </TASK>
  Modules linked in:
  ---[ end trace 0000000000000000 ]---
  RIP: 0010:siw_qp_sq_process+0x38b/0x3c10
  Code: 0f 85 fe 36 00 00 8b b5 8c 02 00 00 48 85 db 0f 84 15 26 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7b 14 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 d9
  RSP: 0018:ff1100000559f860 EFLAGS: 00000203
  RAX: dffffc0000000000 RBX: 0000414141410000 RCX: ffffffff98233fb5
  RDX: 0000082828282002 RSI: 0000000093e50e00 RDI: 0000414141410014
  RBP: ff11000005786000 R08: 0000000000000001 R09: 000000000000000b
  R10: 0000000000000000 R11: 00000000c8f9259d R12: ff110000057df400
  R13: dffffc0000000000 R14: ff1100000565a000 R15: ff1100000578628c
  FS:  00007f1b60b7d740(0000) GS:ff110000caf2e000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: e000042828282002 CR3: 0000000005732000 CR4: 0000000000751ef0
  PKRU: 55555554

The task is killed. When its files are closed on exit, uverbs warns:

  ------------[ cut here ]------------
  WARNING: drivers/infiniband/core/rdma_core.c:956 at __uverbs_cleanup_ufile+0x2cc/0x390, CPU#0: siw003/116
  Modules linked in:
  CPU: 0 UID: 65534 PID: 116 Comm: siw003 Tainted: G      D             7.4.0-rc3-gaebb72744764 #16 PREEMPT(lazy)
  Tainted: [D]=DIE
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  RIP: 0010:__uverbs_cleanup_ufile+0x2cc/0x390
  Code: 00 65 48 2b 05 3d a0 a0 03 0f 85 ca 00 00 00 8b 44 24 04 48 81 c4 f8 00 00 00 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 90 <0f> 0b 90 e9 3a ff ff ff 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48
  RSP: 0018:ff1100000559fb38 EFLAGS: 00000202
  RAX: 0000000000000001 RBX: ff1100000575b640 RCX: ffffffff981e7f19
  RDX: 00000000ffffffff RSI: 0000000000000004 RDI: ff1100000575b640
  RBP: dffffc0000000000 R08: 0000000000000001 R09: ffe21c0000aeb6c8
  R10: ff1100000575b643 R11: 00000000846d9113 R12: 0000000000000001
  R13: ff1100000575bd70 R14: ff1100000575b600 R15: ff1100000575b700
  FS:  0000000000000000(0000) GS:ff110000cae2e000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 000055859422a0b8 CR3: 0000000074c72000 CR4: 0000000000751ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   ? __pfx___uverbs_cleanup_ufile+0x10/0x10
   ? __pfx_down_write+0x10/0x10
   uverbs_destroy_ufile_hw+0x6d/0x260
   ib_uverbs_close+0x46/0x270
   __fput+0x2f8/0x9e0
   fput_close_sync+0xe2/0x190
   ? __pfx_fput_close_sync+0x10/0x10
   filp_close_sync+0x18/0x30
   put_files_struct+0x181/0x310
   do_exit+0x6ab/0x25f0
   ? ksys_write+0x17c/0x1c0
   ? __pfx_do_exit+0x10/0x10
   ? __hrtimer_rearm_deferred+0x156/0x450
   make_task_dead+0xf2/0x2a0
   rewind_stack_and_make_dead+0x16/0x20
  RIP: 0033:0x7f1b60d4f574
  Code: Unable to access opcode bytes at 0x7f1b60d4f54a.
  RSP: 002b:00007fffd2b4e098 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
  RAX: ffffffffffffffda RBX: 000055859422a180 RCX: 00007f1b60d4f574
  RDX: 0000000000000020 RSI: 000055859422a238 RDI: 0000000000000004
  RBP: 000055856deca0d4 R08: 0000000000000078 R09: 0000000000000000
  R10: 0000000000000000 R11: 0000000000000202 R12: 000055859422a180
  R13: 00007f1b60b7d6b8 R14: 000055859422a000 R15: 000055859422a0c0
   </TASK>
  ---[ end trace 0000000000000000 ]---

The exit never finishes. Thirty seconds later, sysrq-w shows the task
blocked in siw_destroy_qp():

  task:siw003          state:D stack:25848 pid:116   tgid:116   ppid:93     task_flags:0x40010c flags:0x00080801
  Call Trace:
   <TASK>
   __schedule+0x18da/0x4c00
   ? __pfx___schedule+0x10/0x10
   schedule+0x70/0x1f0
   schedule_preempt_disabled+0x11/0x20
   rwsem_down_write_slowpath+0x47c/0x13a0
   ? make_task_dead+0xf2/0x2a0
   ? __pfx_rwsem_down_write_slowpath+0x10/0x10
   down_write+0x10b/0x130
   ? __pfx_down_write+0x10/0x10
   ? siw_destroy_qp+0x1a3/0x410
   ? kfree+0x121/0x390
   siw_destroy_qp+0x1b2/0x410
   ? __pfx_siw_destroy_qp+0x10/0x10
   ? __pfx___wait_for_common+0x10/0x10
   ? complete+0x1d/0x230
   ib_destroy_qp_user+0x30f/0x4f0
   ? __pfx_ib_destroy_qp_user+0x10/0x10
   ? handle_bug+0x11c/0x2a0
   uverbs_free_qp+0x7c/0x150
   destroy_hw_idr_uobject+0x7e/0x130
   uverbs_destroy_uobject+0xdf/0x770
   __uverbs_cleanup_ufile+0x18b/0x390
   ? __pfx___uverbs_cleanup_ufile+0x10/0x10
   ? __pfx_down_write+0x10/0x10
   uverbs_destroy_ufile_hw+0x6d/0x260
   ib_uverbs_close+0x46/0x270
   __fput+0x2f8/0x9e0
   fput_close_sync+0xe2/0x190
   ? __pfx_fput_close_sync+0x10/0x10
   filp_close_sync+0x18/0x30
   put_files_struct+0x181/0x310
   do_exit+0x6ab/0x25f0
   ? ksys_write+0x17c/0x1c0
   ? __pfx_do_exit+0x10/0x10
   ? __hrtimer_rearm_deferred+0x156/0x450
   make_task_dead+0xf2/0x2a0
   rewind_stack_and_make_dead+0x16/0x20
  RIP: 0033:0x7f1b60d4f574
  RSP: 002b:00007fffd2b4e098 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
  RAX: ffffffffffffffda RBX: 000055859422a180 RCX: 00007f1b60d4f574
  RDX: 0000000000000020 RSI: 000055859422a238 RDI: 0000000000000004
  RBP: 000055856deca0d4 R08: 0000000000000078 R09: 0000000000000000
  R10: 0000000000000000 R11: 0000000000000202 R12: 000055859422a180
  R13: 00007f1b60b7d6b8 R14: 000055859422a000 R15: 000055859422a0c0
   </TASK>

Posting an unsupported atomic or SIW_OP_RECEIVE instead hits the
WARN(1, "undefined WQE type") in siw_qp_sq_process() and leaves the
memory region named in the SQE pinned after the process exits.

No opcode from SIW_OP_FETCH_AND_ADD up is valid on a user send queue,
so reject them all.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: f29dd55b0236 ("rdma/siw: queue pair methods")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
v2: Include the full dmesg trace, as Leon asked, with the uverbs warning
and the blocked task that follow the oops. No code change.
v1: https://lore.kernel.org/linux-rdma/20261120000211.63217-1-astellman@stellman-greene.com/

Tested in QEMU with KASAN on v7.4-rc3. The patch applies unchanged to
rdma for-rc. With this patch the post returns -EINVAL for REG_MR,
INVAL_STAG, FETCH_AND_ADD and RECEIVE from a user QP, user SEND and RDMA
WRITE still complete, and rping over siw works.
A reproducer is available on request.

 drivers/infiniband/sw/siw/siw_qp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/infiniband/sw/siw/siw_qp.c b/drivers/infiniband/sw/siw/siw_qp.c
index bb780e3904a2..10876cefc0bb 100644
--- a/drivers/infiniband/sw/siw/siw_qp.c
+++ b/drivers/infiniband/sw/siw/siw_qp.c
@@ -869,6 +869,12 @@ static int siw_activate_tx_from_sq(struct siw_qp *qp)
 		rv = -EINVAL;
 		goto out;
 	}
+	/* No opcode from FETCH_AND_ADD up is valid on a user SQ */
+	if (!rdma_is_kernel_res(&qp->base_qp.res) &&
+	    wqe->sqe.opcode >= SIW_OP_FETCH_AND_ADD) {
+		rv = -EINVAL;
+		goto out;
+	}
 	if (wqe->sqe.flags & SIW_WQE_INLINE) {
 		if (wqe->sqe.opcode != SIW_OP_SEND &&
 		    wqe->sqe.opcode != SIW_OP_WRITE) {

base-commit: e7732ec135b501e87ab060d992b3b5f2ec4396c9
-- 
2.43.0

