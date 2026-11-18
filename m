Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963296;
	b=qP12zMvNKu6IaSBTCySW8h4vG7Y6ii9GRhGK/dOW6UuuYDpppJK0byocbcZUOlp67dtb
	 Q8yfcgtNWxh3XOjedyvqtkfX1DY+UzRPoyXKgYK2kkHrKNsz2aWWK4LogLryQONGgYqKc
	 7Z3Y7lAsZp7Smr4rggOi22XXOP3qy9OC5Agx3OYV98QyXC/JWzAXS7lNNyM2hnIi4oKGZ
	 lnXZ8JMYctnmE4IAYOCdEoYr74v4bAuozZtLxn66kCLOdShCgMImxLMu9CJruskbLIg5b
	 XFagabVQKF/x9IECu+wso+3fGddXb/uheztlxKOaLFATA+sY50rNzwVcMmGQ4kGAmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TSRfCfMrcfSVfOakdV+bbOGPK6RBMEyUrMS5MmfFhmU=;
	b=I8m5gk07W8Z0SiSgUJVGyzehOvoOYRO7+l3uk8xpL5UTqJfBx1YfWy3OvhulPPewdVwv
	 2Pw625AmvIlZqqcDofZoQnTpaZrFvD9cOOca9DM64CHk+s16CvkMPtd5VMoFtij2cRB9g
	 pKJ3HS/ILr1Quw2nLROctCx+m4Ago36tFz5YBib8P3YPH6Hvc7JgUDih0+wwb4QrS0M3U
	 wG38wyK+tvdF0RsFmoOSJYS6XvIzrEOhSyk/ypMYIwvWaPdbaN8kM9tOUjq7YQYLvSGFL
	 1VmchseC1Ke89B8R6l2IFwTzdTdqgKJaeKWR+7E/bjrtAp7zHp1n2jg+WN/UMyCMTuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=Mi7yz7PB;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA4606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61BA4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=Mi7yz7PB
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso208395a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1794963294; x=1795568094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSRfCfMrcfSVfOakdV+bbOGPK6RBMEyUrMS5MmfFhmU=;
        b=Mi7yz7PBNZo6tzGY7yIeC+n+fIVEEX8ekLDRx0ntjaoXRCi3GHVp+6PFSjFeKhI23r
         o8oOY8SPalcCIJ4oarck/zJoaFpOMz0BBSdv2jmr1ok/2viRNPyrODNRcp43YNdpqzIp
         Ra3Wcyjw4/Q+TJAmEpLCeKnrqaC/Yk4JDikiE0g6qUFYbMf+4nCrjTHV0VdBJeMF1X8F
         Omd4C8Sd5n1JSRbvkMRrD51BdrHFHZnNg8PTjkHQXPsfDDH8my0tAeT9n8R298FjprAx
         WuY3JqfJEts8lVtByavEwZGwPPdn3SsxLydRqwvvWLjNGEpDzpCuaK/yoaXBgzqfoj5X
         Jy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794963294; x=1795568094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSRfCfMrcfSVfOakdV+bbOGPK6RBMEyUrMS5MmfFhmU=;
        b=EhuPesMm13UCt9BJt1GQdXjOlIOk9Dc3secyo2sU7d1MO0siYndtpNKY76cMRzcKGt
         +3e7T7DP2yxzCRhxdvB6EKkQiAQ3cDRZwXSTmn3xJs2rrz+YXk01dpd8M0I+QrV3bUFX
         XmroZhEV5RLodKgi1qxyAWwgzxwNnIIfuhu1KcaBYCGuqtKo8XDfnBE7620ZYVgENST0
         KiOoKAN4HfhJhRwJT2DNfEY8B1gkVuH2C5QjtuMU1uwxgdbqxK9mIyN8fTw5N6ZTTqQ/
         S8C1OoYHEZxi3T6Xna062h7lud38UH85kF/cLp4sPoPLokux903c2Y/rt86RpwfbY8aA
         0CTg==
X-Forwarded-Encrypted: i=1; AL+hErHFQUc6qc8du9geUnab0jfSzEQDKSTnGs8n65EYxhF6UoGIYppB/yJw4u1jqwVS7uJ2Zj0T4B0o/oIqoeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ofON1ys4mDNGdwq7X++UCY3BEg/HsnsNmU+zulH8hmevJHdxW
	/sXDkyg86uuS2/YsBbAvBKeohbou+g7NJVuVjOCZJLSmTCBhCb/TVqTh9VeKSfUZgC8vqKIJAWL
	YX0q+lebkg7xmyGsmqIpyop3lFYc7Aob3iCJBU2DEWjq5nIdBKGTK
X-Gm-Gg: AZFdTZcILwxEFcfKo52xaZFiKvIrQ/PX9Sky5zYzUeq4Kaw3MSh4grHj+hg1dsppVXN
	mBDnkanPXb1aufC1Naa5UB/pOHLX8zSdaC23j2NQ2El6vEC1Jt9NBWfYkxGUWM82kyIB5DMvmbq
	5hYk2jH+FyoQGTUsP92g+fbVEiJUoebM5lGVZ/yAYTWIZbQTYHeORjJmwsPOyc9Jtjd3axsgB1O
	qzPDCGI9jNl00LSP2FWAUx3y+FgFNNUd1ZDi+8KwhtZoRrome8BSrxwKHUuPd1ROMvOW32lqZHG
	wQXl1PdIQidUyGJw3CJCm4zipIVZRp3D4x7TCyV0120/jfjbxmiqcVQ/cdbihYyVqbfKrglzNmj
	9M2tx5FFZQmYtEadK9uFL4yK2GSM=
X-Received: by 2002:a17:90b:3a50:b0:3b3:b71b:b01e with SMTP id 98e67ed59e1d1-3b3d0850f5fmr1030047a91.64.1794963294328;
        Tue, 17 Nov 2026 16:54:54 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4914caasm161524a91.2.2026.11.17.16.54.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 16:54:54 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>
Subject: [PATCH ipsec 0/2] xfrm: iptfs: fix a panic and a use-after-free on output
Date: Tue, 17 Nov 2026 16:54:47 -0800
Message-ID: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

TCP that a host sends through its own IP-TFS SA can panic the kernel.

The bugs are in the IP-TFS output path, net/xfrm/xfrm_iptfs.c. They
exist since v6.14 and reproduce on mainline v7.4-rc3, commit
aebb72744764 ("Linux 7.4-rc3"). Ordinary TCP retransmissions trigger
them; no crafted packet is involved. The kernel either panics with
skb_over_panic in the ESP output path, or the IP-TFS delay timer
reads a dst that was already freed. Where unprivileged user
namespaces are allowed, a user without capabilities can set up such
an SA in its own namespaces and panic the kernel. This series fixes
both bugs.

Details:

The panic: iptfs_output_queued() appends inner packets to
skb_shinfo(skb)->frag_list of the first skb of an aggregate without
owning that shared info. For local TCP the first skb is a clone of the
skb TCP keeps for retransmission, so the original gets a frag_list
that its len and data_len do not count. When TCP retransmits it and
the new clone is aggregated behind another skb,
iptfs_rehome_fraglist() subtracts the stale list's length and len goes
negative. ESP then copies the skb and skb_put() panics:

  skbuff: skb_over_panic: ... len:-340 put:-340 ... end:0x180
  kernel BUG at net/core/skbuff.c:215!
  Call Trace:
   skb_put
   skb_copy
   skb_cow_data
   esp_output_head
   esp_output
   xfrm_output_resume
   iptfs_delay_timer

The use-after-free: iptfs_output_collect() queues the skb for the
delay timer without taking a reference on its dst. Local TCP attaches
its dst with skb_dst_set_noref(), and RCU can free it while the skb
waits:

  BUG: KASAN: slab-use-after-free in iptfs_delay_timer
  The buggy address belongs to the cache xfrm_dst of size 296

The input path needs no such fix: xfrm_input() calls skb_dst_force()
before the type and mode input handlers run.

The series:

  1/2  Unclone the first skb before appending to it. Send a cloned
       skb that has a frag_list on its own, and do not take page
       frags from a cloned skb.
  2/2  Take the dst reference with skb_dst_force() in
       iptfs_output_collect(), before the skb is queued.

Affected: since commit 0e4fbf013fa5 ("xfrm: iptfs: add user packet
(tunnel ingress) handling"), v6.14. iptfs_output_collect(),
iptfs_enqueue(), iptfs_rehome_fraglist() and iptfs_output_queued()
are unchanged from v6.14 to:

  mainline    aebb72744764 (v7.4-rc3)
  ipsec       f0e68014f4ac
  ipsec-next  7b6ab4dbc156

CONFIG_XFRM_IPTFS defaults to n. Current Ubuntu, Fedora, Arch and
openSUSE Tumbleweed kernels build it as a module.

Conditions: CONFIG_XFRM_IPTFS, an SA in iptfs mode that carries TCP
originated on the host itself, and retransmissions, which any path
loss causes. TCP that the host only forwards into the tunnel did not
trigger either bug in 8 runs. Creating the SA needs CAP_NET_ADMIN,
which a user has inside its own user and network namespaces: on
v7.4-rc3, uid 65534 set up the SAs that way and hit the panic. Only
the crash is verified. Whether the use-after-free can be exploited
further was not assessed.

Discovery: the panic was observed on a machine in real use during the
andrii.cloud (ARIN: AS402801) rollout. That was a distribution kernel
tainted by an out-of-tree video card module, so it was reproduced on
an untainted distribution kernel and then on mainline. The
use-after-free appeared under KASAN while reproducing the panic on
mainline.

Reproduction: v7.4-rc3 on x86_64, defconfig plus kvm_guest.config
with KASAN, IP-TFS built in, in a KVM guest, not tainted. No kernel
modification and no fault injection. Three network namespaces form a
client, an IP-TFS gateway and an HTTPS server that is the other
IP-TFS endpoint. Clients fetch a 50 KB page for 40 seconds while
netem drops 5% of the packets sent to the client, so the server
retransmits through its SA. init-delay is 20 ms. The kernel config
and full console logs are available on request.

Fix verification: most boots of the unpatched kernel crashed, with
the use-after-free or, in a few boots, the panic. No boot with the
series crashed, and KASAN reported no use-after-free in any boot that
had 2/2.

The series applies to ipsec f0e68014f4ac and builds there and on
v7.4-rc3 without W=1 warnings. The boots ran v7.4-rc3, where
net/xfrm/xfrm_iptfs.c is identical. Kernel selftests were not run;
none of them covers IP-TFS.

A reproducer is available to maintainers on request.

Mitigation: use tunnel mode instead of iptfs mode on SAs that carry
locally generated TCP.

Related work: this is not commit d042487dc118 ("xfrm: iptfs: fix stack
OOB read in iptfs_skb_reset_frag_walk()"), CVE-2026-98372, and not the
pending series "xfrm: iptfs: fix queued receive state lifetime".
Neither touches the output path.

Link: https://lore.kernel.org/20260930050307.1978654-1-roshaen09@gmail.com

The crash analysis, the patches, the reproducer and this text were
produced with an AI coding assistant (without CVP) and reviewed by 
the submitter.

Andrii Tereshchenko (2):
  xfrm: iptfs: don't modify the shared info of cloned skbs on output
  xfrm: iptfs: hold the dst while a packet waits on the output queue

 net/xfrm/xfrm_iptfs.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)


base-commit: f0e68014f4ac1653b2980ab76744f4dfdffdbac5
-- 
2.53.0

