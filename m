Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417174;
	b=hEavHH561dAkcSMmE9v8o+Pkw1d6TU9IoSl3LGxQ69+RApRNYV4/00tnmMJ+icRHdZyo
	 CqKr0bT0CtY0ARwU9A8crKE2OHFQLh4oefyBjujVjgMqsIAke/DwEkclDRayY6wixPPq/
	 ctt1zvInLV31+N0QbNaiixkcTVmOYSvwpFxea72xIr1vF5xgiWLEjnTaK1I8KdSjmgxoG
	 Iiek/cvXXLed0ROq/5U7P+azQA1RanHos5QJ/4Q13RdgvLxLp7fp7hGYCMGvTiNvy8wki
	 6rMelzwwUxts3KsfpE6DIao2++PHhIsuAAu4DgL1paE+PygcjfblqB3yXTIp3fzZKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-Id:From:Date:Subject:To:Cc;
	bh=ITNEBQ5K9jrLwJ0lzsPTcMQ84D5JQ6hqp/46Yjer+kM=;
	b=JPzwaFGZLmHLmbdVTpkP2WEUGGRt8Xm12SPZ77F7m6XHXvafdvcjTrguhLFV7q+BSBRP
	 FzoF+diJ9J8qe8GS9XlvwNDKXpF+E4hFxdDToq9YbkKdlQiw/c7UeKPKSM6d+HHON4QDt
	 6JoihS/CLvqH7lcfvky+YxbQ/UOMOoQyg2KEI+dNyR/J43u8PFiHZ6YbMK+6DPkL2q4X7
	 XnpC69PC17GjA/T0DoQlBCs+gP7k9M09wlk6kvpxaDOpmqxOi2YzVpSDiXwJx4o4utR4Y
	 Fwjd69ZLQIdNyDSQLQXDsMt8e75y84mJBAjw4DH6lGvXnmwNkca0SYMjOiXF1qcZ0wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+f21Eqw;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB48606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB48606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+f21Eqw
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3b468d0dbf2so236642a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417173; x=1796021973; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITNEBQ5K9jrLwJ0lzsPTcMQ84D5JQ6hqp/46Yjer+kM=;
        b=i+f21EqwB8uSp6aBu/6vaZvpSnavvNOonlPB7hOqmvJCGdzNTo1VMJ5zLCE2Gq9d0/
         oHy3ycLfs1+0m9RKQyQaf5aUlbafF4wWqchVGTcL5GXYTeGzCYRbF/ho685lS2fkdV5F
         LBkS3mzOUKygReddlZZPhK3S3/B5VS2ndrq4J5FCYft3/6JCOwuqBNZDc40OfPX/dkp8
         boOTltPQ43m4TIsSwqNCXf+YQqZWkpoB9z4u0tPJLyiTGVkgtd8/WeM00pOB1Kib8FMr
         F9UEtm8iO/+EtgaRxxpU9thRxUm9c8xrksApKCFEXtK8unsAIK2kxiQ3+EK7xKO0AwBZ
         egNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417173; x=1796021973;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITNEBQ5K9jrLwJ0lzsPTcMQ84D5JQ6hqp/46Yjer+kM=;
        b=ojrWDvLAdXUv7MXRO7p4C80EMih3568eAUxjYk4NqVEyZtf7iMB79xhomGsUOIvEmN
         3+K+RfEAspG5hYvafhZJIjuWAeLq0vXeF3Mu+nbqxyOGURNRLegV0U3smrfUzwYJTRQ2
         ZjiDjBQmptj1XPw2COcmnSaB/QFB5/oNJEftmPrmW3A21aGs+Zfh1PJf2s8CVvSZ+m47
         N9bxCpSPJoACG//ZqqydEnpFI6lhO7u/e5uDViCvhEQr5svr2jDSWA7MwZB7i89HVfV1
         54fhY2O99se/FDpd+wPezTUKeRSJ5dTDnmlDFmQAQb5xU0w2AdkumUyNPilXFS7PR5K3
         zs/A==
X-Forwarded-Encrypted: i=1; AL+hErHVFbTfHLO566fpP4b0EB5PpdngqUpG95sJiBwQyRNp8vOx4NuprkB7Nlb05o9MxXH3dHGQePtq8PwlEFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6RPMLunovSshAWNQhD1Amst9yGoXLJrN4sSfh8q79ZKptA+70
	cEk84cvkqVFI3Np8ao54XwR+sq5pOLRYmWk8g8/gFt9b8Z61cVVf+Fhk
X-Gm-Gg: AZFdTZeoSkA35558Sxr+xWaJ6tv/P0LzPGE+6JxqWm3b4qOb9Yk/78fdVl0KS2K7hi+
	pOW0SNW4Y1gqreaKXXRFcmcyZKcIaGu4MzLa+FYuaW3bGg2fVTgHGmDJJkRRVTHM9pI37JRJ9Zi
	7ndHOWaTP46WzE0JGJLJS3LUbJVtzJ887MrwaClTj/m7qVnGrsRHvvED2mmAzP1EAwsyMpEXAta
	U6LJ/pCYpwPywWcUjYoQGE8M6TrcNhsve3KdsRNDFs4xjSEHUkYqZ+BlbTZh07Pt4cVw0zFuhyu
	2DcqSZR10RwpjWg6Sv/r83tj9mTPUbjf6mE+Ldf+cuztxDtZHmAi20Rhix8eC69kDSz/K0mxnOl
	qOZENgN03UluWtgqjpIVjFauq106ZFZKH6wuWRTmn0gXmuH+//P84gcmwfbbZHdMNjK6ch1g2oJ
	NWLcAkARJmFSbGgRZnfrt6FO7nXzQuvIYk2uBmGP0KAUspYTThkEASXp8whHtuj8yY6Ox1eKQv9
	77RSEz90iMN92LzB9xYETTkvP5EL7PoSocw1GXoYqoKpkjI6t2rDdnRZkyadHXD+QfzvQ6vJQ0P
	6AUbUKTU+jmUxvOmexp5KcnITnOnkrlwv6BmPtLbRH9Ipwo3b29bPkCA
X-Received: by 2002:a17:90b:390b:b0:3b4:1336:4f6c with SMTP id 98e67ed59e1d1-3b41c7b6994mr9227969a91.2.1795417173293;
        Sun, 22 Nov 2026 22:59:33 -0800 (PST)
Received: from smtp.n0ps1edzz.local ([120.253.139.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm16248962a91.4.2026.11.22.22.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:59:32 -0800 (PST)
Message-Id: <20261123133000.1.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Mon, 23 Nov 2026 13:30:00 +0800
Subject: [PATCH net] ipv6: route: fix use-after-free in ip6_confirm_neigh()
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


ip6_confirm_neigh() loads dst->dev with dst_dev() and dereferences the
resulting net_device without holding RCU.  The load is only a READ_ONCE();
it does not pin the device.  rawv6_sendmsg() and udpv6_sendmsg() reach
dst_confirm_neigh() when sendmsg() is issued with MSG_CONFIRM and
MSG_PROBE, without holding RCU or a net_device reference.

Route teardown drops the reference the dst held on the device:
dst_dev_put() does it for dsts removed from the fib tree, and the
uncached-route flush does it through netdev_ref_replace().  Both replace
dst->dev with blackhole_netdev, so a reader that loaded the old pointer
just before the replacement can dereference a freed net_device while
testing dev->flags.

Take rcu_read_lock(), load the device with dst_dev_rcu(), and keep the
section through the flags test and __ipv6_confirm_neigh().

KASAN reports (trimmed to the relevant frames):

 BUG: KASAN: slab-use-after-free in ip6_confirm_neigh+0x802/0x8c0
 Read of size 4 at addr ffff888104f960b0 by task confirm_race/121

 Call Trace:
  <TASK>
  dump_stack_lvl+0x55/0x70
  print_report+0xcb/0x5d0
  kasan_report+0xb8/0xf0
  ip6_confirm_neigh+0x802/0x8c0
  rawv6_sendmsg+0x116b/0x3780
  ____sys_sendmsg+0x7af/0x9b0
  ___sys_sendmsg+0x145/0x220
  __sys_sendmsg+0xf8/0x190
  do_syscall_64+0xee/0x500
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 Allocated by task 117:
  __kasan_kmalloc+0xaa/0xb0
  __kvmalloc_node_noprof+0x216/0x5d0
  alloc_netdev_mqs+0x7e/0x11c0
  rtnl_create_link+0xaa6/0xe30
  rtnl_newlink+0xd22/0x1de0
  rtnetlink_rcv_msg+0x697/0xa00

 Freed by task 117:
  __kasan_slab_free+0x61/0x80
  kfree+0x201/0x440
  device_release+0xc8/0x240
  kobject_put+0x101/0x1e0
  netdev_run_todo+0x611/0xe70
  rtnl_dellink+0x343/0xa50
  rtnetlink_rcv_msg+0x697/0xa00

 The buggy address is located 176 bytes inside of
  freed 4096-byte region [ffff888104f96000, ffff888104f97000)

The faulting address is object offset 176, the 4-byte dev->flags load.

The lifetime bug comes from the v4.13 series that removed the dst gc
list.  Commit 9514528d92d4 ("ipv6: call dst_dev_put() properly") made
route teardown release the net_device reference held by the dst, so
dst->dev no longer pins the device for the lifetime of the dst.
Later commits changed the replacement target to blackhole_netdev and
added dev_rcu, but did not add RCU protection to this reader.

The lifetime change is present from v4.13 onward.  Kernels that reach
this callback are affected, including current mainline, net-next, and
the 5.4.y, 5.10.y, 5.15.y, 6.1.y, 6.6.y and 6.12.y stable branches.
dst_dev_rcu() is available in current 5.15.y and newer; 5.10.y and
older need the equivalent rcu_dereference(dst->dev) backport.

Fixes: 9514528d92d4 ("ipv6: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
Window amplification for the KASAN run only:

 struct net_device *dev = dst_dev(dst);
+if (in_task())
+	msleep(500);

 daddr = choose_neigh_daddr(rt6_nexthop(rt, &in6addr_any), NULL, daddr);

The sleep runs in process context (rawv6_sendmsg), so RTM_DELLINK can
reach netdev_run_todo() and device_release() before dev->flags is read.
It is a verification aid, not part of the fix.

Report context: 7.4.0-rc2 #25, CONFIG_KASAN=y, PREEMPT(full),
kasan.fault=panic.  Full log: evidence/dyn-confirm/qemu-kasan-confirm.log.

Object detail from the report:

 The buggy address belongs to the object at ffff888104f96000
  which belongs to the cache kmalloc-4k of size 4096

Base tree: netdev/net.git main at af6737b90668.  The pre-image blob in
this patch matches that tip exactly.  The same hunk also applies to
netdev/net-next.git main at eb6d6c80d354; the target function is
unchanged there.

 net/ipv6/route.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 1b2dcc0..6bdd442 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -257,16 +257,21 @@ static struct neighbour *ip6_dst_neigh_lookup(const struct dst_entry *dst,
 static void ip6_confirm_neigh(const struct dst_entry *dst, const void *daddr)
 {
 	const struct rt6_info *rt = dst_rt6_info(dst);
-	struct net_device *dev = dst_dev(dst);
+	struct net_device *dev;
+
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst);
 
 	daddr = choose_neigh_daddr(rt6_nexthop(rt, &in6addr_any), NULL, daddr);
 	if (!daddr)
-		return;
+		goto out;
 	if (dev->flags & (IFF_NOARP | IFF_LOOPBACK))
-		return;
+		goto out;
 	if (ipv6_addr_is_multicast((const struct in6_addr *)daddr))
-		return;
+		goto out;
 	__ipv6_confirm_neigh(dev, daddr);
+out:
+	rcu_read_unlock();
 }
 
 static struct dst_ops ip6_dst_ops_template = {

base-commit: af6737b9066832a2017c281159950ba92385ce00
-- 
2.34.1


