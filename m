Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417192;
	b=Ubkxr4gXt3LLWpSULlkOANAwOZ4AgMj8lLI77LlryC5gM1Ki9uDs4r1LDqyhd7kf76bO
	 Wq6ZSbkU6ZMFTLUgO+hGWjDy+t7obkXeE6nR9mizERg0B0ytqoIA6SueH3vvCAA7cLpyf
	 18ZYPDpyFEa9nuzO/r0+bt5zCcIw45UnPkOieHb+XnJ81/t86IS/Yu9OouM//aE2mPDv4
	 OlaKIW7xsrC7tDBpmq2ws3gAZDp1S4e2Tic09Th8xGdgtrOt+6u09NQbS2lbUBQI65nKu
	 Nd0VMQDNGiWE3jntmOnovDZYK2XbAGVO63+wbBo6dyzXNKOhKyMg4yvBsAwQmg3lMLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-Id:From:Date:Subject:To:Cc;
	bh=aNd/5TXn62wrV59NoqvHzu/qryqHBGcK3pYA9bcd7eI=;
	b=5Aqa16bWXqzO/MGQhYvBKifiVxySrtUpDkFNCIW6sU35XmOKF7ezS0zdAgv96zY5aJoB
	 3hJa8P3qnzY5Z6LiNFoaEUkfRIN7sVT4gkj7+tm4S5Y8wZd5WiSM+HcbBnajLKycc0m0Z
	 Qibdp6S3nKGpySo/TDPcW0asE1wa1Hp9nxsakB/bDPkZOQP9xa/60xQEx6qCi4wuWRELw
	 +ZuoCP0BLbe2KNRfc+LZlxEjabhyfD8sFcSlNXGDbDzUzL9hRqG0VThI9AvjvEAIrdljo
	 TcP0so+z24N2p6byy8T6CERpevx1+qh8T3g5dcFDM/C9eIvl8JR4zt9b7psH3mZsfZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HotC2N/X";
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F010606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F010606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HotC2N/X
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3b3fa8df5c4so1539907a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417192; x=1796021992; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNd/5TXn62wrV59NoqvHzu/qryqHBGcK3pYA9bcd7eI=;
        b=HotC2N/XG+D3mj16YQNFOhwxtbfKCnLRBN1zKLKoaDiFWFHAQIwtTOVHikgpglJbx4
         tlw5EmtA76XCqZJy521d0QrmtenTNrChPHA6tw9f2cB4fJAol3tkt9KpwKyfOuhTFLIJ
         AbbhaPFKsz8+5llK4UfgxsCx7Lr/QdsY2yOQ00U93bu5aiP/IsW6NLfMNQsrtW/cuik2
         DzOApedhVZiejQjr8rQ6s4OGUi6mXbLJg70DD3Lhf2YuB4nMNkn+bsVl0oBUEn85xm+1
         i8iR7e+vyOBKqUUHwRj1ZWQy0bZYlerkXNZ6Pirqcy8IsBUgx4iLhC1HcbV8z9StwB5F
         AAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417192; x=1796021992;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNd/5TXn62wrV59NoqvHzu/qryqHBGcK3pYA9bcd7eI=;
        b=OIwZ7Z2eACitrs+cClniEce04/0fGBnnbDrCPxBSHd4knPa2cFbCiJT1EcvWHosZBn
         SyhM8ms112vhFs1Lh17QOeRgL62L1wruCRgf6Tw7l/Kj7r8L9UKZpcFZEyoQ3do6LYA9
         /oN8evnZ4o34TbUWY+GCT8HNQxAliWGnR6RhkVB0blAkCl8tGwyO4W4dvTan/z3TOFMO
         mbxTvRk6GRUfaFhHYzeohn7bz2FUO9znIjk8AQGRLFqyLPiP/+YWiq3B+OCnNkkg/YVF
         Ukxw7Mk9i0prld1yfamiwRxIoiC75TdqD+JKJT3j5ZsYJ0RdYPYEejs216JzsGPcSyEc
         9GYg==
X-Forwarded-Encrypted: i=1; AL+hErEzWfP5QWKTYCbpv91sP/e0u2pUm+ptfEkUY0SDeXilXVCn3fAE4JsinUgMdS0bCARo5IFrNfsvuj87MMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SWxfDuv7hMAWvm87zqYqLhlu2kt5b5SniKMUPZC16W8X6sBzy
	IAaX4ziErRV3+X+QbgetEtKvUOOq0rbWk0a7p4MG2+8+oTt2ZnY/hJSk
X-Gm-Gg: AZFdTZd88FqyuChMaSgoTDty2fmpU9xLeplhxKWLqFjBDQsGHnu8Ohtmi4mKMsrysLO
	jjTROpl0cdOCI+B+X3am+FHwH4ehl4TixXfTSgy8q8yr86uV2kZAW7dv3P4r7b/xqyufvUYUHJu
	7diy5wMV4pMdmZ5DCr9b6hLNjb6mlLlW3HcIgsCZi7gW5R7/LW7pZ0P+SRWU/b5dh8/zmHlBLkT
	CVtI07bJiddp4a1cq9pfQhlIqp1r2DK54BzNZlEQ0Tt1fWXIChyf+PHPwju1u/pirV3M3CuKw6+
	ZuhdEuicc5ARPbYD/21cU4gub0DyYLER11f3CH0WpJcf5wx7vBRKomHrQhQKtlD80s6UTzbCZji
	adVKY7jUhTma3ga75DKBSwlIxA8qpkWYiEwT6yIPXQppJWhBui/jodUWEeJR68ojf/reQRqzUNp
	HTWqfDurHTV5Lh0azul2rsK+15cvCtK2D4PMkcsalQreb2Jo7Afy1OVsSvW14JHufpAacvhvQR6
	eAOD7UDbL2ftPxpOL4A033eKveGYKSS70si8B47nngsZIzt4qHwNCbr27HD42OSWChjuz9IYBul
	UqeA9gMfbpv/6PDhTfo62+s5boNUW1ln/el37VzIfSY6T0W1e+dkyuBA
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr11290934a91.60.1795417191648;
        Sun, 22 Nov 2026 22:59:51 -0800 (PST)
Received: from smtp.n0ps1edzz.local ([120.253.139.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm16915461a91.12.2026.11.22.22.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:59:51 -0800 (PST)
Message-Id: <20261123133000.3.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Mon, 23 Nov 2026 13:30:00 +0800
Subject: [PATCH net] ipv4: ip_output: fix use-after-free in ip_mc_output()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Hangbin Liu <hangbin.liu@linux.dev>,
    linux-kernel@vger.kernel.org,
    stable@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


ip_mc_output() loads rt->dst.dev without RCU, stores it in skb->dev, and
passes that pointer to the POST_ROUTING netfilter hooks.  The stale
pointer is carried across the hook call, so the device can be
unregistered and freed before the hook dereferences it.

When the interface is unregistered, the route is torn down and the
net_device reference held by the dst is dropped.  A legacy iptables hook
then reads the freed dev->name through ifname_compare_aligned().  The
hook is a normal netfilter configuration inside the network namespace.

Use the same pattern as ip_output(): take rcu_read_lock(), load the device
with skb_dst_dev_rcu(), and hold the section until the final
NF_HOOK_COND() returns.  Drop the lock before freeing the skb on the
TTL-zero path.

KASAN reports (trimmed to the relevant frames):

 BUG: KASAN: slab-use-after-free in ipt_do_table+0xf88/0x1060
 Read of size 8 at addr ffff888105348120 by task mc_race/116

 Call Trace:
  <TASK>
  dump_stack_lvl+0x55/0x70
  print_report+0xcb/0x5d0
  kasan_report+0xb8/0xf0
  ipt_do_table+0xf88/0x1060
  nf_hook_slow+0xb8/0x1f0
  ip_mc_output+0x71e/0x9d0
  ip_send_skb+0x11e/0x150
  udp_send_skb+0x637/0xd60
  udp_sendmsg+0x12d5/0x1dd0
  __x64_sys_sendto+0xdb/0x1b0
  do_syscall_64+0xee/0x500
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 Allocated by task 122:
  __kasan_kmalloc+0xaa/0xb0
  __kvmalloc_node_noprof+0x216/0x5d0
  alloc_netdev_mqs+0x7e/0x11c0
  rtnl_create_link+0xaa6/0xe30
  rtnl_newlink+0xd31/0x1e50
  rtnetlink_rcv_msg+0x697/0xa00

 Freed by task 122:
  __kasan_slab_free+0x61/0x80
  kfree+0x201/0x440
  device_release+0xc8/0x240
  kobject_put+0x101/0x1e0
  netdev_run_todo+0x611/0xe70
  rtnl_dellink+0x343/0xa50
  rtnetlink_rcv_msg+0x697/0xa00

 The buggy address is located 288 bytes inside of
  freed 4096-byte region [ffff888105348000, ffff888105349000)

The faulting address is object offset 288, the dev->name read in
ifname_compare_aligned().

The lifetime bug comes from the v4.13 series that removed the dst gc
list.  Commit 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly") made
route teardown release the net_device reference held by the dst, so
dst->dev no longer pins the device for the lifetime of the dst.
Later commits changed the replacement target to blackhole_netdev and
added dev_rcu, but did not add RCU protection to this reader.

The lifetime change is present from v4.13 onward.  Kernels that reach
this output path are affected, including current mainline, net-next, and
the 5.4.y, 5.10.y, 5.15.y, 6.1.y, 6.6.y and 6.12.y stable branches.
dst_dev_rcu() is available in current 5.15.y and newer; 5.10.y and
older need the equivalent rcu_dereference(dst->dev) backport.

Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
Window amplification: none in the kernel.  The KASAN report was produced
without any instrumentation; the race is widened entirely from userspace:

 - one veth pair veth0/veth1, veth0 10.0.0.1/24, veth1 10.0.0.2/24
 - multicast route 239.0.0.0/8 via veth0
 - 4 sender threads, each paired with a blocker pinned to the same CPU,
   both SCHED_IDLE; the blocker stops the sender inside sendto() for a
   random 30-4000 us
 - a deleter thread at SCHED_FIFO issues RTM_DELLINK veth0, waits 45 ms,
   then recreates the pair
 - a legacy iptables mangle table with a POST_ROUTING hook is installed
   via IPT_SO_SET_REPLACE; the rule reads outdev->name on every entry

Three independent boots hit.  The report below is from run 3
(mc-natural-run3.log).  Run 2 (mc-natural-run2.log) hit during the first
delete cycle with zero successful sends (every send returned ENETUNREACH),
which shows that only reaching ip_mc_output() matters.

Report context: 7.4.0-rc2 #38, CONFIG_KASAN=y, PREEMPT(full),
kasan.fault=panic.  Full log: evidence/dyn-mc/mc-natural-run3.log.

Object detail from the report:

 The buggy address belongs to the object at ffff888105348000
  which belongs to the cache kmalloc-4k of size 4096

Base tree: netdev/net.git main at af6737b90668.  The pre-image blob in
this patch matches that tip exactly.  The same hunk also applies to
netdev/net-next.git main at eb6d6c80d354; the target function is
unchanged there.

 net/ipv4/ip_output.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index d42d776..7e10339 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -367,7 +367,11 @@ static int ip_mc_finish_output(struct net *net, struct sock *sk,
 int ip_mc_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 {
 	struct rtable *rt = skb_rtable(skb);
-	struct net_device *dev = rt->dst.dev;
+	struct net_device *dev;
+	int ret;
+
+	rcu_read_lock();
+	dev = skb_dst_dev_rcu(skb);
 
 	/*
 	 *	If the indicated interface is up and running, send the packet.
@@ -405,6 +409,7 @@ int ip_mc_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 		/* Multicasts with ttl 0 must not go beyond the host */
 
 		if (ip_hdr(skb)->ttl == 0) {
+			rcu_read_unlock();
 			kfree_skb(skb);
 			return 0;
 		}
@@ -418,10 +423,12 @@ int ip_mc_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 				ip_mc_finish_output);
 	}
 
-	return NF_HOOK_COND(NFPROTO_IPV4, NF_INET_POST_ROUTING,
-			    net, sk, skb, NULL, skb->dev,
-			    ip_finish_output,
-			    !(IPCB(skb)->flags & IPSKB_REROUTED));
+	ret = NF_HOOK_COND(NFPROTO_IPV4, NF_INET_POST_ROUTING,
+			   net, sk, skb, NULL, skb->dev,
+			   ip_finish_output,
+			   !(IPCB(skb)->flags & IPSKB_REROUTED));
+	rcu_read_unlock();
+	return ret;
 }
 
 int ip_output(struct net *net, struct sock *sk, struct sk_buff *skb)

base-commit: af6737b9066832a2017c281159950ba92385ce00
-- 
2.34.1


