Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183560;
	b=DmoKctVz0d87H4WPxAUcXAkXFalAlFQYtE7sm4GtulrXizsdxek6PYUmeL1aQ1cTtzOs
	 /cAGIiL53B6BPQOW3OeSc9D/kSa6s/VASOiSm8tG4JixdIkde8FPJNTKN6XD4UPvJGixx
	 DFl9iUg/T1DW/zz3IebJ6Bc4mQL4HvKhVlwfmF8ZVkp3Q1vTaeWqzgDlRafZk7JqqeZc/
	 Sba6DttYnWlF6h6QPClrg5aeh9w6UA79yzsmV+NT6o4e0TmymEr77Cn/F2Az4B1Wg2B+P
	 LzyeNKJlcopJlE0elw8OKIkX60S/joRve8vj7cykmKMcpD2WRtIUWJIfdYdq+aM7GNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uOUcQ3a3xSsnKCTkREjD+EYCb46xsY+JcFYjpDmO1o8=;
	b=L7axaxKl6LjeUbn++nylEfr0JtPo5rXyoSBVEZOChKPTPOE6rYasYHDjS6kDsvqBZMTf
	 5h5S8i2FckMnDauJeDk6LsOyAyV1L2DA2vQwycn30G7nQKSFLuSTkJG2yOueIZ/kheVfw
	 SPAb1TPIGw6DKAyFEFubtQCBANQ3pCSg3LI38HpzJjjUruO75iDlfmmV6yDX01kF5t87W
	 jqmDxJe4fkEKr9IM8RDVpGKNgCZGC3kuq9JO69wDKPUFtB99pBP2zTIeCqLVHwmSfut2S
	 AQJjDzIAbJkpm9fbqUbXNUN2/vPOBv9g+eOtfJIBk0XgrxXJAKULD8BN5gFXFCijMWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yvwvH3jb;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E24606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E24606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yvwvH3jb
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso331710137.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183558; x=1795788358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOUcQ3a3xSsnKCTkREjD+EYCb46xsY+JcFYjpDmO1o8=;
        b=yvwvH3jb40gsI7rgbsjulPWym+fsR0b1+x2O2W/mNCCzTBEh6hmzaboQ8dck9u5R1L
         KYsOaK3gh+fTNfKJXKvjKRTEpzijNqXOnQRFpQ9eZ9Q7J52PajPBlna24iL3xIywhwNb
         R1627L8cfNVcGyDx+GBGQoUqjr9CFUU+NP9Dgg1EQ0P/iVblt9MJ9JONnsOZUXcJK9X7
         cg2W2k2HRP+M32XskamGiex1CfckOYUEtT5i0/8NqHo6rXjDYLwfkp01wmJdMKgQfSGg
         /KDM8nOKqKF4Vu2HA6aojgswKvOebH5/oLhg8WFew9OVhl/6sTiUtfn9z3Pr+/9VE1yB
         76kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183558; x=1795788358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOUcQ3a3xSsnKCTkREjD+EYCb46xsY+JcFYjpDmO1o8=;
        b=wD/W1gALL1LNaNyR//R+JHfsVA5QZ+1PDqNaogT/XCuFBd2Y0VDl575OxFrdWnIpja
         YuX5FhTPe7JP/47I16tUTkjA6UnqvY7Hi2Fdkw1x1X2o58Q+siM4qJV+Dq9YJ6rB4DqN
         TtZkwDf8JmvA12WMRo9iefMH9BYhJ2l7IwhpNwBKfMxNQqR1PcM/Pk+dejIjg2XhZew5
         q6MwWzTu3S02om/8urqZx13ay9ev6cxecd11vItGgbshxjNlTCl+rdhLaU4kKfyQ7KEI
         bBtOeaAoNF3U6fPF0QVN0eOCtPliYacBfY2Svm3K32dQNN1JNwnDSTAfHHLfRAYCceGi
         tfNg==
X-Forwarded-Encrypted: i=1; AL+hErE9m9A2r3FJBBRGuRpC2QlHclVrNOpC/l1Q7GulHhjcEJxVcIRtoNIZwURCvSrqGkhYE7VvcyzHPKozYLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vwiaKIP6tjEYnJcyWS5oGig98a0mT4AJVatsRc2YG4iuvBCmE
	3zZxJ2KMVqX+tVt/kUQsuCaTQBowCOJli2sMAN2mBWmN8YXv40eicKIhvm8vPKUWqkY=
X-Gm-Gg: AZFdTZfjCQ6YCxugVJDYM4aQr/dJvP6EIWDTUzQjzr795Yq01h085pNeynjCieKNCdY
	vGTJkhoQDzRlm+FXWwgu3jrbVDGZgLKk5eCt+eQI+7Ios50d/9bIQcYP5jVMzDPV2IDx3oEk3Mm
	mNwBHxmvOgWVH2C0duM7afjOczjFGnt/2BPh/4DHAfD0TVkKJA86V8ekS14bIXdzqRTN6uVgQb0
	+63Qe7vCkKK0q5OLRPUrG6MHxfFJ9CZXPl5Myi/398N3XeH+tBV7gcItRVyBRn3cG5Y6X1yMiji
	w+UgYSQWddHJQ8rztet2HHe8Sjr/LItnAknewdpWPAO+I3KTi+fuiftSNktH0b/IJDqTtv5d6+O
	GQZWtvIq/M6PparG882nFTICAduwEWDT5Y61uOLeI36+PPPo+oFY6SLRlggL6RRrPde9b/4OwdE
	IpEsR1Wl6Q5r0d/PfEAI/qv0EkcqpiqTDy8S2/UUuriSVhilx5bK97+9skA7qhOe3/WGMJ+Pzo9
	KNtoS+j26UOE5yT1UpUA+SiQvRHeg3eWGa7gAj0yoxILPUzRqlUzwlS1bHmXwKZiZvEs+32Mg/V
	I4seREjJaiCk2ayvqna3mAIBE4AVmjqQJ/tVTItE0qovDb7UD6HqNlhyhtiLe8H5umVjUfaM/VP
	a9vnoW6+0bWhbXNBaCOYkM48DSHaquAnV/stQwvxZZeR1JaskrcT7laY3dwjAxkpGbNTcGPo1PS
	IFWvzTDTF9kiDB42qveyx15pW6J1Q=
X-Received: by 2002:a05:6102:4245:b0:7d2:d45e:5c9d with SMTP id ada2fe7eead31-7d7393581c9mr1145115137.13.1795183558136;
        Fri, 20 Nov 2026 06:05:58 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4d9:d040:5fad:8738])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347966desm26185216d6.3.2026.11.20.06.05.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 06:05:57 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Bernard Metzler <bernard.metzler@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc v2] RDMA/siw: Reject a zero length WRITE segment that announces more segments
Date: Fri, 20 Nov 2026 09:05:52 -0500
Message-ID: <20261120140552.62784-1-astellman@stellman-greene.com>
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

siw_proc_write() returns early for a zero length tagged segment, before
it looks up the sink STag. If that first segment has the L bit clear,
the next segment is handled as a continuation of the same message and
siw reads mem->stag through rx_mem, which was never set. A remote peer
on an established siw connection can trigger this, and it panics the
host:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
  CPU: 1 UID: 65534 PID: 119 Comm: siw001peer Not tainted 7.4.0-rc3-gaebb72744764 #16 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  RIP: 0010:siw_proc_write+0x175/0x9c0
  Code: 48 c1 ea 03 80 3c 02 00 0f 85 c3 07 00 00 48 8b ab 80 04 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7d 20 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 31 07 00 00 39 75 20 0f 85 4f
  RSP: 0018:ff1100006cf08318 EFLAGS: 00000202
  RAX: dffffc0000000000 RBX: ff11000005880000 RCX: 0000000000000000
  RDX: 0000000000000004 RSI: 0000000000000000 RDI: 0000000000000020
  RBP: 0000000000000000 R08: ff11000005880408 R09: ff1100000588039a
  R10: 0000000000000010 R11: ff11000005880398 R12: 0000000000000010
  R13: ff110000058803fc R14: 0000000000000000 R15: ff110000058803dc
  FS:  00007f9054dd1740(0000) GS:ff110000da92e000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: dffffc0000000004 CR3: 0000000005703000 CR4: 0000000000751ef0
  PKRU: 55555554
  Call Trace:
   <IRQ>
   ? irqentry_exit+0x31b/0x6a0
   siw_tcp_rx_data+0x20e/0x2040
   ? __pfx_selinux_netlbl_sock_rcv_skb+0x10/0x10
   __tcp_read_sock+0x1ab/0x810
   ? __pfx_siw_tcp_rx_data+0x10/0x10
   ? __pfx___tcp_read_sock+0x10/0x10
   siw_qp_llp_data_ready+0x185/0x2e0
   ? __pfx_siw_qp_llp_data_ready+0x10/0x10
   ? tcp_try_rmem_schedule+0x17f/0x1390
   ? tcp_event_data_recv+0x36a/0x7b0
   tcp_data_queue+0x1f2d/0x4b70
   ? __pfx___mod_timer+0x10/0x10
   ? __pfx_tcp_data_queue+0x10/0x10
   ? tcp_try_undo_loss+0x6d0/0x730
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   tcp_rcv_established+0x8a8/0x3990
   ? security_sock_rcv_skb+0x2b/0x40
   ? sk_filter_trim_cap+0x400/0x980
   ? __pfx_tcp_inbound_hash+0x10/0x10
   ? __pfx_tcp_rcv_established+0x10/0x10
   ? __pfx_sk_filter_trim_cap+0x10/0x10
   ? _raw_spin_lock+0x80/0xe0
   tcp_v4_do_rcv+0x45b/0x970
   ? tcp_v4_fill_cb+0x26/0x400
   tcp_v4_rcv+0x223d/0x3b90
   ? __pfx_tcp_v4_rcv+0x10/0x10
   ? __pfx_raw_local_deliver+0x10/0x10
   ? stack_access_ok+0xd9/0x200
   ip_protocol_deliver_rcu+0x61/0x2e0
   ip_local_deliver_finish+0x329/0x4b0
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ip_local_deliver+0x18f/0x2d0
   ? __pfx_ip_local_deliver+0x10/0x10
   ? __pfx___netif_receive_skb_core.constprop.0+0x10/0x10
   ? try_to_wake_up+0x239/0x17a0
   ? __asan_memset+0x23/0x50
   ? ip_rcv_core+0x4e9/0xce0
   ip_rcv+0x21a/0x270
   ? __pfx_ip_rcv+0x10/0x10
   ? __pfx_call_function_single_prep_ipi+0x10/0x10
   ? select_task_rq_fair+0xb29/0x4110
   ? __pfx_ip_rcv+0x10/0x10
   __netif_receive_skb_one_core+0x161/0x1b0
   ? __pfx___netif_receive_skb_one_core+0x10/0x10
   ? _raw_spin_lock_irq+0x81/0xe0
   ? ttwu_queue_wakelist+0x2a5/0x390
   process_backlog+0x1e5/0x5e0
   __napi_poll+0x9c/0x520
   net_rx_action+0x8d0/0xe70
   ? __pfx_net_rx_action+0x10/0x10
   ? rcu_core+0x250/0x1830
   ? clockevents_program_event+0x2ba/0x860
   handle_softirqs+0x1b3/0x600
   ? __pfx_handle_softirqs+0x10/0x10
   ? __hrtimer_rearm_deferred+0x156/0x450
   do_softirq+0x3d/0x60
   </IRQ>
   <TASK>
   __local_bh_enable_ip+0x6a/0x70
   __dev_queue_xmit+0x89e/0x3170
   ? __pfx___dev_queue_xmit+0x10/0x10
   ? __pfx_selinux_ip_postroute_compat+0x10/0x10
   ? __pfx_clockevents_program_event+0x10/0x10
   ? _raw_spin_lock+0x80/0xe0
   ? irqentry_exit+0x31b/0x6a0
   ? selinux_ip_postroute+0x3e9/0x9d0
   ip_finish_output2+0x765/0x1b80
   ? __pfx_ip_finish_output2+0x10/0x10
   __ip_finish_output.part.0+0x46e/0x950
   ? selinux_ip_output+0x19/0x210
   ? __pfx___ip_finish_output.part.0+0x10/0x10
   ? nf_hook_slow+0xa7/0x1e0
   ip_output+0x260/0x4c0
   ? __pfx_ip_output+0x10/0x10
   ? __pfx_ip_finish_output+0x10/0x10
   __ip_queue_xmit+0x6f8/0x1dd0
   __tcp_transmit_skb+0x2ec9/0x4720
   ? __pfx___tcp_transmit_skb+0x10/0x10
   ? kasan_save_track+0x14/0x30
   ? __kasan_slab_alloc+0x6e/0x70
   tcp_write_xmit+0x11c9/0x78d0
   ? __pfx__copy_from_iter+0x10/0x10
   ? skb_page_frag_refill+0x55/0x390
   __tcp_push_pending_frames+0x8f/0x2f0
   tcp_sendmsg_locked+0x1741/0x3fc0
   ? __pfx_tcp_sendmsg_locked+0x10/0x10
   ? up_read+0x1f/0x1c0
   ? __pfx_lock_sock_nested+0x10/0x10
   tcp_sendmsg+0x26/0x40
   sock_write_iter+0x3ef/0x4c0
   ? __pfx_sock_write_iter+0x10/0x10
   vfs_write+0xa37/0xcd0
   ? do_sys_openat2+0xd1/0x170
   ? kmem_cache_free+0xba/0x3a0
   ? __pfx_vfs_write+0x10/0x10
   ? __pfx_do_sys_openat2+0x10/0x10
   ? fdget_pos+0x53/0x4b0
   ksys_write+0x17c/0x1c0
   ? __pfx_ksys_write+0x10/0x10
   do_syscall_64+0xdf/0x4c0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  RIP: 0033:0x7f9054ef0574
  Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
  RSP: 002b:00007fff4bb4ce88 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
  RAX: ffffffffffffffda RBX: 0000000000000024 RCX: 00007f9054ef0574
  RDX: 0000000000000024 RSI: 00007fff4bb4cea0 RDI: 0000000000000003
  RBP: 0000000000000010 R08: 0000000000000073 R09: 0000000000000000
  R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000001
  R13: 0000000000000000 R14: 0000000000000000 R15: 00007fff4bb4cea0
   </TASK>
  Modules linked in:
  ---[ end trace 0000000000000000 ]---
  RIP: 0010:siw_proc_write+0x175/0x9c0
  Code: 48 c1 ea 03 80 3c 02 00 0f 85 c3 07 00 00 48 8b ab 80 04 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7d 20 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 31 07 00 00 39 75 20 0f 85 4f
  RSP: 0018:ff1100006cf08318 EFLAGS: 00000202
  RAX: dffffc0000000000 RBX: ff11000005880000 RCX: 0000000000000000
  RDX: 0000000000000004 RSI: 0000000000000000 RDI: 0000000000000020
  RBP: 0000000000000000 R08: ff11000005880408 R09: ff1100000588039a
  R10: 0000000000000010 R11: ff11000005880398 R12: 0000000000000010
  R13: ff110000058803fc R14: 0000000000000000 R15: ff110000058803dc
  FS:  00007f9054dd1740(0000) GS:ff110000da92e000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: dffffc0000000004 CR3: 0000000005703000 CR4: 0000000000751ef0
  PKRU: 55555554
  Kernel panic - not syncing: Fatal exception in interrupt
  Kernel Offset: 0xb200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

A zero length DDP message consists of exactly one segment (RFC 5041,
section 5.2), so terminate the connection with a tagged buffer error
when a zero length first segment announces more segments.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: 8b6a361b8c48 ("rdma/siw: receive path")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
v2: Include the full dmesg trace, as Leon asked. No code change.
v1: https://lore.kernel.org/linux-rdma/20261120000829.64597-1-astellman@stellman-greene.com/

Tested in QEMU with KASAN on v7.4-rc3. The patch applies unchanged to
rdma for-rc. With this patch siw sends a TERMINATE and closes the
connection, a normal two segment WRITE is still placed, and rping over
siw works.
A reproducer is available on request.

 drivers/infiniband/sw/siw/siw_qp_rx.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/siw/siw_qp_rx.c b/drivers/infiniband/sw/siw/siw_qp_rx.c
index e5b641c8d694..9b7e52906764 100644
--- a/drivers/infiniband/sw/siw/siw_qp_rx.c
+++ b/drivers/infiniband/sw/siw/siw_qp_rx.c
@@ -550,8 +550,16 @@ int siw_proc_write(struct siw_qp *qp)
 	int bytes, rv;
 
 	if (srx->state == SIW_GET_DATA_START) {
-		if (!srx->fpdu_part_rem) /* zero length WRITE */
+		if (!srx->fpdu_part_rem) { /* zero length WRITE */
+			/* A zero length DDP message is a single segment. */
+			if (unlikely(frx->first_ddp_seg && frx->more_ddp_segs)) {
+				siw_init_terminate(qp, TERM_ERROR_LAYER_DDP,
+						   DDP_ETYPE_TAGGED_BUF,
+						   DDP_ECODE_T_INVALID_STAG, 0);
+				return -EINVAL;
+			}
 			return 0;
+		}
 
 		rv = siw_write_check_ntoh(srx, frx);
 		if (unlikely(rv)) {

base-commit: e7732ec135b501e87ab060d992b3b5f2ec4396c9
-- 
2.43.0

