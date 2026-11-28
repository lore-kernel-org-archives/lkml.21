Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837415;
	b=5s/lOjKKlDuxFHzN1iUNHzxGh5w/2f0/E0dm+27m6+wpOttcm4ArtrddAzIKV18HGzA1
	 0qe+Xnpi/jInXphSi5ffOe7yjNFHLc4MAAObKCiQQESglOEuxHZihoRUIMJh2W5wpUpdQ
	 QHumTiZg+lsaRIg0MeWEI5T8zf4H441vZaJTKs4eMR+fCopj4qpfbUAav0bC0VQXrj/iG
	 t7MnUTFJc1GevZC+U4aXh/i2JuukzL7m+b4K1I6F0n0QiBRAbulvzB9rzlE8SuEklPDp+
	 iU+wLDRua13GeV3OAwuUkt+twRa/+89ZFAYFpaPs95HzOqa/eT221Hjdk+eiVz+IvtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837415;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=9YkEKVRMdYWD6c/49e8C95E9nDfqgN+hTEj+xU6faeI=;
	b=Zc6AnXJHVTcClFiifb13rR36CHHvN4ZjPRgKSy3GdKnbVOEJxtvgaODy7rVUrSDjXIxl
	 GLqmnch3AWsueANsXhGqEw16+AtiDhDreEtHdPQ0VCYC4ApTtI+cSlY5Xakg3+55ROrDf
	 tr0Lu23LTWkDlecOs9nkGhj6NkkV6Z6CyQfKdUenWhYaFM7uGGMGEwsjgrqwSpemv0W+J
	 VjGdZKxlUhDpytrAFRl4YhUz/DbgCy9fQV42vY7ARfflhobkGY1p791SENnXsH6Uhkg2a
	 DzfnCrWU9iw0fb+XGu0n8kPTxZd5K9/yRFvBiezJ+Y8V3ztCGxxPj9vlZ3jXV16U0JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A9606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-464fb819ac5so6983437fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837413; x=1796442213;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YkEKVRMdYWD6c/49e8C95E9nDfqgN+hTEj+xU6faeI=;
        b=YV47oQkqJiEgO7POzOUhFBrjir94p1GVBjlfZ9V9MLedm2GSwcTPYcBOrnUxrO9TU5
         /kQfbR85s+WXNy1EsziRnMUyFKiRgvypS9q0DCNXbiO7WubKQl0ByWIodKDIx+kL5fDT
         jhhszgB5uZNRc4xeJOyD3YM58BrkeZ9pc7fOSvdd4wIPq7LbvYvZ+85i6y4ulE3cDK6y
         TW96TgGxrgovKQTRQ6M1fz5xP26BUACIl72OlVWfK+O+ko0GC3q/WUMlz/QFrIl0nwTi
         lzJVgmBtE61dtqOWim1L8dcXGOLDeDJBwxtz+SetA+JCv40BtqUO9ZLkk2s7WSPqVCke
         U6+Q==
X-Forwarded-Encrypted: i=1; AL+hErGnzfqAKe0bqTNpKTN7Ukd3B0KiiSijzHERwTvJmsEUXBXnHkAovHUFd4zvzLUnb6OJVz/ESNK4YTd/iXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ITRVNKA/k5G3BrYeBj557fBKBWMe035H3h+TLS+kzlNFOrLHE
	o6J04ormLtZoB7TlWn4RSBEtF4ohXaGtL7FW8XP8Er73ksu9zvmFcfJSLYaFOLbL4huV6F/wO24
	pLLry6AK5Wrbto+FI1wuCtilhOwtaU00v833YNowFlSmRO8YW+eyT7X9oG5Q=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1785:b0:543:50ad:baae with SMTP id
 5614622812f47-57a0d817ea9mr31916497b6e.63.1795837413719; Fri, 27 Nov 2026
 19:43:33 -0800 (PST)
Date: Fri, 27 Nov 2026 19:43:33 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0a4de5.ec6686d0.16faa.0148.GAE@google.com>
Subject: [syzbot] [wireguard?] possible deadlock in wg_socket_clear_peer_endpoint_src
From: syzbot <syzbot+fc3b1b923a16043b9d3c@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, jasowang@redhat.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    18817028301d arm64: fixmap: fix missing break-before-make .=
.
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it
console output: https://syzkaller.appspot.com/x/log.txt?x=3D159039bd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da611ef07a865057=
9
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dfc3b1b923a16043b9=
d3c
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8
userspace arch: arm64
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D139039bd580000

The issue was bisected by AI to:

commit 362899b8725b35e32802882c67f99cbf42bce2af
Author: Jason Wang <jasowang@redhat.com>
Date:   Fri Jul 15 07:46:31 2016 +0000

    macvtap: switch to use skb array

reasoning:      https://syzkaller.appspot.com/ai_job?id=3Dcae91c6b-bec8-431=
b-ad38-f9b2ab405640

AI-generated root cause summary:
In drivers/net/tap.c, tap_open() initializes struct tap_queue::ring via
ptr_ring_init() and assigns tap_sock_destruct() to sk_destruct. While
tap_poll(), tap_do_read(), tap_peek_len(), and vhost_net acquire
&q->ring.consumer_lock in process context with softirqs enabled (marking th=
at
ptr_ring lockdep class SOFTIRQ-unsafe), tap_sock_destruct() calls
ptr_ring_cleanup() -> ptr_ring_consume(), which acquires &q->ring.consumer_=
lock
without disabling BH. When the last outbound skb referencing a closed tap s=
ocket
is freed via sock_wfree() while holding a SOFTIRQ-safe lock=E2=80=94such as
read_lock_bh(&peer->endpoint_lock) in wg_socket_send_skb_to_peer()=E2=80=94=
lockdep
detects a SOFTIRQ-safe -> SOFTIRQ-unsafe lock order violation.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3Dfc3b1b923=
a16043b9d3c

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+fc3b1b923a16043b9d3c@syzkaller.appspotmail.com

The bisection result may be wrong.
If you agree with it, please also add:
Fixes: 362899b8725b ("macvtap: switch to use skb array")

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
syzkaller #0 Not tainted
-----------------------------------------------------
kworker/1:4/4479 [HC0[0]:SC0[6]:HE1:SE0] is trying to acquire:
ffff0000d6d40720 (&r->consumer_lock#4){+.+.}-{3:3}, at: spin_lock include/l=
inux/spinlock.h:347 [inline]
ffff0000d6d40720 (&r->consumer_lock#4){+.+.}-{3:3}, at: ptr_ring_consume in=
clude/linux/ptr_ring.h:363 [inline]
ffff0000d6d40720 (&r->consumer_lock#4){+.+.}-{3:3}, at: ptr_ring_cleanup in=
clude/linux/ptr_ring.h:700 [inline]
ffff0000d6d40720 (&r->consumer_lock#4){+.+.}-{3:3}, at: tap_sock_destruct+0=
x40/0x3f8 drivers/net/tap.c:444

and this task is already holding:
ffff0000cdc16e70 (&peer->endpoint_lock){++-.}-{3:3}, at: wg_socket_send_skb=
_to_peer+0x5c/0x19c drivers/net/wireguard/socket.c:172
which would create a new lock dependency:
 (&peer->endpoint_lock){++-.}-{3:3} -> (&r->consumer_lock#4){+.+.}-{3:3}

but this new dependency connects a SOFTIRQ-irq-safe lock:
 (&peer->endpoint_lock){++-.}-{3:3}

... which became SOFTIRQ-irq-safe at:
  lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
  __raw_write_lock_bh include/linux/rwlock_api_smp.h:221 [inline]
  _raw_write_lock_bh+0x48/0x60 kernel/locking/spinlock.c:369
  wg_socket_clear_peer_endpoint_src+0x20/0x50 drivers/net/wireguard/socket.=
c:309
  wg_expired_retransmit_handshake+0xc8/0x2c0 drivers/net/wireguard/timers.c=
:73
  call_timer_fn+0x198/0x7f4 kernel/time/timer.c:1749
  expire_timers kernel/time/timer.c:1800 [inline]
  __run_timers kernel/time/timer.c:2375 [inline]
  __run_timer_base+0x530/0x744 kernel/time/timer.c:2387
  run_timer_base+0x84/0x1b8 kernel/time/timer.c:2396
  run_timer_softirq+0x20/0x48 kernel/time/timer.c:2406
  handle_softirqs+0x36c/0xce0 kernel/softirq.c:669
  __do_softirq+0x14/0x20 kernel/softirq.c:703
  ____do_softirq+0x10/0x1c arch/arm64/kernel/irq.c:78
  call_on_irq_stack+0x30/0x48 arch/arm64/kernel/entry.S:901
  do_softirq_own_stack+0x1c/0x28 arch/arm64/kernel/irq.c:83
  invoke_softirq kernel/softirq.c:549 [inline]
  __irq_exit_rcu+0x10c/0x324 kernel/softirq.c:786
  irq_exit_rcu+0x14/0x84 kernel/softirq.c:809
  __el1_irq arch/arm64/kernel/entry-common.c:570 [inline]
  el1_interrupt+0x40/0x60 arch/arm64/kernel/entry-common.c:582
  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:587
  el1h_64_irq+0x78/0x7c arch/arm64/kernel/entry.S:602
  __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline]
  arch_local_irq_enable arch/arm64/include/asm/irqflags.h:48 [inline]
  default_idle_call+0xa0/0xb8 kernel/sched/idle.c:129
  cpuidle_idle_call kernel/sched/idle.c:199 [inline]
  do_idle+0x1ec/0x450 kernel/sched/idle.c:355
  cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:458
  rest_init+0x390/0x3a8 init/main.c:789
  start_kernel+0x374/0x3c0 init/main.c:1247
  __primary_switched+0x8c/0x94 arch/arm64/kernel/head.S:245

to a SOFTIRQ-irq-unsafe lock:
 (&r->consumer_lock#4){+.+.}-{3:3}

... which became SOFTIRQ-irq-unsafe at:
...
  lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
  __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
  _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:173
  spin_lock include/linux/spinlock.h:347 [inline]
  ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
  ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
  tap_sock_destruct+0x40/0x3f8 drivers/net/tap.c:444
  __sk_destruct+0x80/0x89c net/core/sock.c:2386
  sk_destruct+0x8c/0xb8 net/core/sock.c:2448
  __sk_free+0x264/0x328 net/core/sock.c:2459
  sk_free+0x60/0xc4 net/core/sock.c:2470
  sock_put include/net/sock.h:2024 [inline]
  tap_put_queue drivers/net/tap.c:179 [inline]
  tap_release+0x2d4/0x3b4 drivers/net/tap.c:517
  __fput+0x338/0x74c fs/file_table.c:512
  fput_close_sync+0x10c/0x278 fs/file_table.c:618
  filp_close_sync+0x7c/0xb4 fs/open.c:1573
  __do_sys_close fs/open.c:1596 [inline]
  __se_sys_close fs/open.c:1583 [inline]
  __arm64_sys_close+0x74/0x108 fs/open.c:1583
  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
  invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
  el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
  el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
  el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

other info that might help us debug this:

 Possible interrupt unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&r->consumer_lock#4);
                               local_irq_disable();
                               lock(&peer->endpoint_lock);
                               lock(&r->consumer_lock#4);
  <Interrupt>
    lock(&peer->endpoint_lock);

 *** DEADLOCK ***

locks held by kworker/1:4/4479: 7, last CPU#1:
 #0: ffff0000d7ae6548 ((wq_completion)wg-crypt-wg0){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3470 [inline]
 #0: ffff0000d7ae6548 ((wq_completion)wg-crypt-wg0){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x8c8/0x1250 kernel/workqueue.c:3578
 #1: ffff800095277c20 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3470 [inline]
 #1: ffff800095277c20 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x8d0/0x1250 kernel/workqueue.c:3578
 #2: ffff0000cdc16e70 (&peer->endpoint_lock){++-.}-{3:3}, at: wg_socket_sen=
d_skb_to_peer+0x5c/0x19c drivers/net/wireguard/socket.c:172
 #3: ffff800089aa5780 (rcu_read_lock_bh){....}-{1:3}, at: rcu_lock_acquire =
include/linux/rcupdate.h:309 [inline]
 #3: ffff800089aa5780 (rcu_read_lock_bh){....}-{1:3}, at: rcu_read_lock_bh =
include/linux/rcupdate.h:905 [inline]
 #3: ffff800089aa5780 (rcu_read_lock_bh){....}-{1:3}, at: send4+0x1c0/0xcf4=
 drivers/net/wireguard/socket.c:38
 #4: ffff800089aa5720 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #4: ffff800089aa5720 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #4: ffff800089aa5720 (rcu_read_lock){....}-{1:3}, at: ip_output+0x74/0x400=
 net/ipv4/ip_output.c:432
 #5: ffff800089aa5720 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #5: ffff800089aa5720 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #5: ffff800089aa5720 (rcu_read_lock){....}-{1:3}, at: ip_finish_output2+0x=
410/0xee4 net/ipv4/ip_output.c:229
 #6: ffff800089aa5780 (rcu_read_lock_bh){....}-{1:3}, at: rcu_lock_acquire =
include/linux/rcupdate.h:309 [inline]
 #6: ffff800089aa5780 (rcu_read_lock_bh){....}-{1:3}, at: rcu_read_lock_bh =
include/linux/rcupdate.h:905 [inline]
 #6: ffff800089aa5780 (rcu_read_lock_bh){....}-{1:3}, at: __dev_queue_xmit+=
0x220/0x2a68 net/core/dev.c:5000

the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
-> (&peer->endpoint_lock){++-.}-{3:3} {
   HARDIRQ-ON-W at:
                    lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
                    __raw_write_lock_bh include/linux/rwlock_api_smp.h:221 =
[inline]
                    _raw_write_lock_bh+0x48/0x60 kernel/locking/spinlock.c:=
369
                    wg_socket_set_peer_endpoint+0x3e8/0x760 drivers/net/wir=
eguard/socket.c:282
                    set_peer drivers/net/wireguard/netlink.c:-1 [inline]
                    wg_set_device_doit+0xd8c/0x1a20 drivers/net/wireguard/n=
etlink.c:569
                    genl_family_rcv_msg_doit+0x1e4/0x2d4 net/netlink/genetl=
ink.c:1114
                    genl_family_rcv_msg net/netlink/genetlink.c:1194 [inlin=
e]
                    genl_rcv_msg+0x43c/0x620 net/netlink/genetlink.c:1209
                    netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:25=
84
                    genl_rcv+0x38/0x50 net/netlink/genetlink.c:1218
                    netlink_unicast_kernel net/netlink/af_netlink.c:1335 [i=
nline]
                    netlink_unicast+0x73c/0x934 net/netlink/af_netlink.c:13=
61
                    netlink_sendmsg+0x670/0x98c net/netlink/af_netlink.c:19=
20
                    sock_sendmsg_nosec net/socket.c:800 [inline]
                    __sock_sendmsg+0xc8/0x188 net/socket.c:818
                    __sys_sendto+0x250/0x328 net/socket.c:2283
                    __do_sys_sendto net/socket.c:2290 [inline]
                    __se_sys_sendto net/socket.c:2286 [inline]
                    __arm64_sys_sendto+0xec/0x10c net/socket.c:2286
                    __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline=
]
                    invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:4=
9
                    el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:1=
21
                    do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
                    el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
                    el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry=
-common.c:816
                    el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
   HARDIRQ-ON-R at:
                    lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
                    __raw_read_lock_bh include/linux/rwlock_api_smp.h:192 [=
inline]
                    _raw_read_lock_bh+0x54/0x6c kernel/locking/spinlock.c:2=
87
                    wg_socket_send_skb_to_peer+0x5c/0x19c drivers/net/wireg=
uard/socket.c:172
                    wg_socket_send_buffer_to_peer+0x108/0x174 drivers/net/w=
ireguard/socket.c:199
                    wg_packet_send_handshake_initiation drivers/net/wiregua=
rd/send.c:40 [inline]
                    wg_packet_handshake_send_worker+0x1c0/0x2d8 drivers/net=
/wireguard/send.c:51
                    process_one_work kernel/workqueue.c:3495 [inline]
                    process_scheduled_works+0x91c/0x1250 kernel/workqueue.c=
:3578
                    worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
                    kthread+0x304/0x3d4 kernel/kthread.c:436
                    ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
   IN-SOFTIRQ-W at:
                    lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
                    __raw_write_lock_bh include/linux/rwlock_api_smp.h:221 =
[inline]
                    _raw_write_lock_bh+0x48/0x60 kernel/locking/spinlock.c:=
369
                    wg_socket_clear_peer_endpoint_src+0x20/0x50 drivers/net=
/wireguard/socket.c:309
                    wg_expired_retransmit_handshake+0xc8/0x2c0 drivers/net/=
wireguard/timers.c:73
                    call_timer_fn+0x198/0x7f4 kernel/time/timer.c:1749
                    expire_timers kernel/time/timer.c:1800 [inline]
                    __run_timers kernel/time/timer.c:2375 [inline]
                    __run_timer_base+0x530/0x744 kernel/time/timer.c:2387
                    run_timer_base+0x84/0x1b8 kernel/time/timer.c:2396
                    run_timer_softirq+0x20/0x48 kernel/time/timer.c:2406
                    handle_softirqs+0x36c/0xce0 kernel/softirq.c:669
                    __do_softirq+0x14/0x20 kernel/softirq.c:703
                    ____do_softirq+0x10/0x1c arch/arm64/kernel/irq.c:78
                    call_on_irq_stack+0x30/0x48 arch/arm64/kernel/entry.S:9=
01
                    do_softirq_own_stack+0x1c/0x28 arch/arm64/kernel/irq.c:=
83
                    invoke_softirq kernel/softirq.c:549 [inline]
                    __irq_exit_rcu+0x10c/0x324 kernel/softirq.c:786
                    irq_exit_rcu+0x14/0x84 kernel/softirq.c:809
                    __el1_irq arch/arm64/kernel/entry-common.c:570 [inline]
                    el1_interrupt+0x40/0x60 arch/arm64/kernel/entry-common.=
c:582
                    el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-c=
ommon.c:587
                    el1h_64_irq+0x78/0x7c arch/arm64/kernel/entry.S:602
                    __daif_local_irq_enable arch/arm64/include/asm/irqflags=
.h:26 [inline]
                    arch_local_irq_enable arch/arm64/include/asm/irqflags.h=
:48 [inline]
                    default_idle_call+0xa0/0xb8 kernel/sched/idle.c:129
                    cpuidle_idle_call kernel/sched/idle.c:199 [inline]
                    do_idle+0x1ec/0x450 kernel/sched/idle.c:355
                    cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:458
                    rest_init+0x390/0x3a8 init/main.c:789
                    start_kernel+0x374/0x3c0 init/main.c:1247
                    __primary_switched+0x8c/0x94 arch/arm64/kernel/head.S:2=
45
   INITIAL USE at:
                   lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
                   __raw_write_lock_bh include/linux/rwlock_api_smp.h:221 [=
inline]
                   _raw_write_lock_bh+0x48/0x60 kernel/locking/spinlock.c:3=
69
                   wg_socket_set_peer_endpoint+0x3e8/0x760 drivers/net/wire=
guard/socket.c:282
                   set_peer drivers/net/wireguard/netlink.c:-1 [inline]
                   wg_set_device_doit+0xd8c/0x1a20 drivers/net/wireguard/ne=
tlink.c:569
                   genl_family_rcv_msg_doit+0x1e4/0x2d4 net/netlink/genetli=
nk.c:1114
                   genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline=
]
                   genl_rcv_msg+0x43c/0x620 net/netlink/genetlink.c:1209
                   netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:258=
4
                   genl_rcv+0x38/0x50 net/netlink/genetlink.c:1218
                   netlink_unicast_kernel net/netlink/af_netlink.c:1335 [in=
line]
                   netlink_unicast+0x73c/0x934 net/netlink/af_netlink.c:136=
1
                   netlink_sendmsg+0x670/0x98c net/netlink/af_netlink.c:192=
0
                   sock_sendmsg_nosec net/socket.c:800 [inline]
                   __sock_sendmsg+0xc8/0x188 net/socket.c:818
                   __sys_sendto+0x250/0x328 net/socket.c:2283
                   __do_sys_sendto net/socket.c:2290 [inline]
                   __se_sys_sendto net/socket.c:2286 [inline]
                   __arm64_sys_sendto+0xec/0x10c net/socket.c:2286
                   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
                   invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
                   el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:12=
1
                   do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
                   el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
                   el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-=
common.c:816
                   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
   INITIAL READ USE at:
                        lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5=
942
                        __raw_read_lock_bh include/linux/rwlock_api_smp.h:1=
92 [inline]
                        _raw_read_lock_bh+0x54/0x6c kernel/locking/spinlock=
.c:287
                        wg_socket_send_skb_to_peer+0x5c/0x19c drivers/net/w=
ireguard/socket.c:172
                        wg_socket_send_buffer_to_peer+0x108/0x174 drivers/n=
et/wireguard/socket.c:199
                        wg_packet_send_handshake_initiation drivers/net/wir=
eguard/send.c:40 [inline]
                        wg_packet_handshake_send_worker+0x1c0/0x2d8 drivers=
/net/wireguard/send.c:51
                        process_one_work kernel/workqueue.c:3495 [inline]
                        process_scheduled_works+0x91c/0x1250 kernel/workque=
ue.c:3578
                        worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
                        kthread+0x304/0x3d4 kernel/kthread.c:436
                        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:8=
54
 }
 ... key      at: [<ffff80008f85f240>] wg_peer_create.__key.5+0x0/0x20

the dependencies between the lock to be acquired
 and SOFTIRQ-irq-unsafe lock:
-> (&r->consumer_lock#4){+.+.}-{3:3} {
   HARDIRQ-ON-W at:
                    lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
                    __raw_spin_lock include/linux/spinlock_api_smp.h:190 [i=
nline]
                    _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:173
                    spin_lock include/linux/spinlock.h:347 [inline]
                    ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
                    ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
                    tap_sock_destruct+0x40/0x3f8 drivers/net/tap.c:444
                    __sk_destruct+0x80/0x89c net/core/sock.c:2386
                    sk_destruct+0x8c/0xb8 net/core/sock.c:2448
                    __sk_free+0x264/0x328 net/core/sock.c:2459
                    sk_free+0x60/0xc4 net/core/sock.c:2470
                    sock_put include/net/sock.h:2024 [inline]
                    tap_put_queue drivers/net/tap.c:179 [inline]
                    tap_release+0x2d4/0x3b4 drivers/net/tap.c:517
                    __fput+0x338/0x74c fs/file_table.c:512
                    fput_close_sync+0x10c/0x278 fs/file_table.c:618
                    filp_close_sync+0x7c/0xb4 fs/open.c:1573
                    __do_sys_close fs/open.c:1596 [inline]
                    __se_sys_close fs/open.c:1583 [inline]
                    __arm64_sys_close+0x74/0x108 fs/open.c:1583
                    __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline=
]
                    invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:4=
9
                    el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:1=
21
                    do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
                    el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
                    el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry=
-common.c:816
                    el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
   SOFTIRQ-ON-W at:
                    lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
                    __raw_spin_lock include/linux/spinlock_api_smp.h:190 [i=
nline]
                    _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:173
                    spin_lock include/linux/spinlock.h:347 [inline]
                    ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
                    ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
                    tap_sock_destruct+0x40/0x3f8 drivers/net/tap.c:444
                    __sk_destruct+0x80/0x89c net/core/sock.c:2386
                    sk_destruct+0x8c/0xb8 net/core/sock.c:2448
                    __sk_free+0x264/0x328 net/core/sock.c:2459
                    sk_free+0x60/0xc4 net/core/sock.c:2470
                    sock_put include/net/sock.h:2024 [inline]
                    tap_put_queue drivers/net/tap.c:179 [inline]
                    tap_release+0x2d4/0x3b4 drivers/net/tap.c:517
                    __fput+0x338/0x74c fs/file_table.c:512
                    fput_close_sync+0x10c/0x278 fs/file_table.c:618
                    filp_close_sync+0x7c/0xb4 fs/open.c:1573
                    __do_sys_close fs/open.c:1596 [inline]
                    __se_sys_close fs/open.c:1583 [inline]
                    __arm64_sys_close+0x74/0x108 fs/open.c:1583
                    __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline=
]
                    invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:4=
9
                    el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:1=
21
                    do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
                    el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
                    el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry=
-common.c:816
                    el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
   INITIAL USE at:
                   lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
                   __raw_spin_lock include/linux/spinlock_api_smp.h:190 [in=
line]
                   _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:173
                   spin_lock include/linux/spinlock.h:347 [inline]
                   ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
                   ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
                   tap_sock_destruct+0x40/0x3f8 drivers/net/tap.c:444
                   __sk_destruct+0x80/0x89c net/core/sock.c:2386
                   sk_destruct+0x8c/0xb8 net/core/sock.c:2448
                   __sk_free+0x264/0x328 net/core/sock.c:2459
                   sk_free+0x60/0xc4 net/core/sock.c:2470
                   sock_put include/net/sock.h:2024 [inline]
                   tap_put_queue drivers/net/tap.c:179 [inline]
                   tap_release+0x2d4/0x3b4 drivers/net/tap.c:517
                   __fput+0x338/0x74c fs/file_table.c:512
                   fput_close_sync+0x10c/0x278 fs/file_table.c:618
                   filp_close_sync+0x7c/0xb4 fs/open.c:1573
                   __do_sys_close fs/open.c:1596 [inline]
                   __se_sys_close fs/open.c:1583 [inline]
                   __arm64_sys_close+0x74/0x108 fs/open.c:1583
                   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
                   invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
                   el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:12=
1
                   do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
                   el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
                   el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-=
common.c:816
                   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
 }
 ... key      at: [<ffff80008f860080>] ptr_ring_init_noprof.__key.35+0x0/0x=
20
 ... acquired at:
   __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
   _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:173
   spin_lock include/linux/spinlock.h:347 [inline]
   ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
   ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
   tap_sock_destruct+0x40/0x3f8 drivers/net/tap.c:444
   __sk_destruct+0x80/0x89c net/core/sock.c:2386
   sk_destruct+0x8c/0xb8 net/core/sock.c:2448
   __sk_free+0x264/0x328 net/core/sock.c:2459
   sock_wfree+0x234/0x6fc net/core/sock.c:-1
   skb_orphan include/linux/skbuff.h:3413 [inline]
   loopback_xmit+0x144/0x6cc drivers/net/loopback.c:81
   __netdev_start_xmit include/linux/netdevice.h:5455 [inline]
   netdev_start_xmit include/linux/netdevice.h:5464 [inline]
   xmit_one net/core/dev.c:4068 [inline]
   dev_hard_start_xmit+0x1dc/0x794 net/core/dev.c:4084
   __dev_queue_xmit+0xed4/0x2a68 net/core/dev.c:5086
   dev_queue_xmit include/linux/netdevice.h:3483 [inline]
   neigh_hh_output include/net/neighbour.h:538 [inline]
   neigh_output include/net/neighbour.h:552 [inline]
   ip_finish_output2+0xa80/0xee4 net/ipv4/ip_output.c:236
   __ip_finish_output+0x198/0x424 net/ipv4/ip_output.c:-1
   ip_finish_output+0x44/0x2fc net/ipv4/ip_output.c:324
   NF_HOOK_COND include/linux/netfilter.h:314 [inline]
   ip_output+0x28c/0x400 net/ipv4/ip_output.c:437
   dst_output include/net/dst.h:471 [inline]
   ip_local_out+0x110/0x148 net/ipv4/ip_output.c:131
   iptunnel_xmit+0x50c/0xd38 net/ipv4/ip_tunnel_core.c:97
   udp_tunnel_xmit_skb+0x220/0x348 net/ipv4/udp_tunnel_core.c:187
   send4+0x8cc/0xcf4 drivers/net/wireguard/socket.c:85
   wg_socket_send_skb_to_peer+0xc0/0x19c drivers/net/wireguard/socket.c:174
   wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
   wg_packet_tx_worker+0x188/0x75c drivers/net/wireguard/send.c:276
   process_one_work kernel/workqueue.c:3495 [inline]
   process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
   worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
   kthread+0x304/0x3d4 kernel/kthread.c:436
   ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854


stack backtrace:
CPU: 1 UID: 0 PID: 4479 Comm: kworker/1:4 Not tainted syzkaller #0 PREEMPT=
=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 11/06/2026
Workqueue: wg-crypt-wg0 wg_packet_tx_worker
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 __lock_acquire+0x8f8/0x2b08 kernel/locking/lockdep.c:-1
 lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
 __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
 _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:173
 spin_lock include/linux/spinlock.h:347 [inline]
 ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
 ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
 tap_sock_destruct+0x40/0x3f8 drivers/net/tap.c:444
 __sk_destruct+0x80/0x89c net/core/sock.c:2386
 sk_destruct+0x8c/0xb8 net/core/sock.c:2448
 __sk_free+0x264/0x328 net/core/sock.c:2459
 sock_wfree+0x234/0x6fc net/core/sock.c:-1
 skb_orphan include/linux/skbuff.h:3413 [inline]
 loopback_xmit+0x144/0x6cc drivers/net/loopback.c:81
 __netdev_start_xmit include/linux/netdevice.h:5455 [inline]
 netdev_start_xmit include/linux/netdevice.h:5464 [inline]
 xmit_one net/core/dev.c:4068 [inline]
 dev_hard_start_xmit+0x1dc/0x794 net/core/dev.c:4084
 __dev_queue_xmit+0xed4/0x2a68 net/core/dev.c:5086
 dev_queue_xmit include/linux/netdevice.h:3483 [inline]
 neigh_hh_output include/net/neighbour.h:538 [inline]
 neigh_output include/net/neighbour.h:552 [inline]
 ip_finish_output2+0xa80/0xee4 net/ipv4/ip_output.c:236
 __ip_finish_output+0x198/0x424 net/ipv4/ip_output.c:-1
 ip_finish_output+0x44/0x2fc net/ipv4/ip_output.c:324
 NF_HOOK_COND include/linux/netfilter.h:314 [inline]
 ip_output+0x28c/0x400 net/ipv4/ip_output.c:437
 dst_output include/net/dst.h:471 [inline]
 ip_local_out+0x110/0x148 net/ipv4/ip_output.c:131
 iptunnel_xmit+0x50c/0xd38 net/ipv4/ip_tunnel_core.c:97
 udp_tunnel_xmit_skb+0x220/0x348 net/ipv4/udp_tunnel_core.c:187
 send4+0x8cc/0xcf4 drivers/net/wireguard/socket.c:85
 wg_socket_send_skb_to_peer+0xc0/0x19c drivers/net/wireguard/socket.c:174
 wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
 wg_packet_tx_worker+0x188/0x75c drivers/net/wireguard/send.c:276
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#ai-bisec=
tion

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
