Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090897;
	b=dSsviQzg+4UirbTVzUGSC+UICqYTnkfxWt6XujPJDpULiJJS/cvsN6HjtpLnu0eRjijj
	 AcNAoJbn2hf/qBCnMDDaH4vKoPOA+7XzB7AQfSDQlMKBc0v0u7rhEazhdUX5Eloinh7rI
	 kC7KuEdfw3yFNAAOzeaIRtU0IjVChJSEsHwfyHhQWpuYk1ymnSuPVFLiYXKmfwPWGUdUn
	 FlXIISzK8cA09PSqw9aESJyznb3RKx246i43FPOg0gw36udiM/GoQxZO9yEFKBmmsGeUk
	 nEVxshahIvMqMEOXExo4cbwAkSQre+NFeFl621lNOE4v/QCmIxkEZ1W5z0TCa9aTcYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mj1McuRNTzXxQ0Vi1QpFi73wKse6XG0UJPSQ6IAq1dA=;
	b=SF5Uw3nmU2hXJ9yMuCmZz3syt8b42wz4JEFMpj3xIbsq71Jfb2XyKz++VVl6MyLbM2PA
	 7kamO34nlrP7zGeiKTUcmyYwpQFSwtZySupacdYbIQne2wwd+dI7k/lamyz0gA9w1Y7mk
	 bO55pTlX86lLsvWzByQLjVJjUwcJypQOAafPDvMgaKWDnr1HyFBQ6O1HQowOPAYqa0075
	 hfmfdlSa1L57sY6oVRuqHmstXLXcMa2Gs4Yicq3aaKd0UwVoW45lzUXyW0IPNXJQqUIYT
	 smAzDBj9f+uIvpKxcPjQc3+qNDBaHL0TDbSX+85C8iyKgeHtlXQAznP7EpsbeXutgQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Ew2Fc1IF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF3D606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF3D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Ew2Fc1IF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so10614465e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795090895; x=1795695695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj1McuRNTzXxQ0Vi1QpFi73wKse6XG0UJPSQ6IAq1dA=;
        b=Ew2Fc1IFAkcgGD88Y0f1zgQZPaLC8hbgijX3nUk8nAuxsY0UJVAWZCZ9Oupiu+vtoq
         wxlNdGrUJ0E6XDoo+0DFCLWmDOGm0rfeuAbo1YChy/9BdCuD0gJ6Kv4FOgns7AWvrFKH
         sS5uL+7JydSvONlaPpaWIIAXq8KzYEzouh32AvkdxAuH96aHJ/GPSRRyYBWSwguHVumF
         1hoOOCjmzHNeor+R/KARgWBr7f2+rX5E317wegmi6HneMeDgnM50XmYuuHHhOif5N169
         KKTPGFzwF4XAQsE1taqFESqsHMvc9yr3rWlpTZSPD0Pgq1oIxHuPlVlH+Ji5l1S6TMKa
         3Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090895; x=1795695695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj1McuRNTzXxQ0Vi1QpFi73wKse6XG0UJPSQ6IAq1dA=;
        b=HvYoGD7tlun4M8/zsa21krrhw9zT46Vp7sRQUrLKunes0NueOf2dfjJAg/09+oiyz/
         g4rJ4ihQqJowWC5tEQ1RTBakljHDrKFgzxOiYtxYK7wDgBSiiUscc2VY9MvnDJ/ZzRsC
         TxAs8NJM6pzXmR5RxknW7TG0zIWxQ486KuOOrSoIAMaqShrOUeOU0fAAACzJ9Vm6l68V
         FYbUwUf7IjdyQtY50+U5LSYw2+De4dRdShAqujfFb+FXPOVZruI2LRZqH4ev6M4igD+H
         9/i4NwGNuESPDD4PEmWo8K1czKkMdhaD7QJST9asdC8OjCnmSLRWykvD2xZBIxU9bwOX
         kajw==
X-Forwarded-Encrypted: i=1; AL+hErET1iFpeD8l7M5L6CtfrPK8YAQkVTPmvL5SzbN3Z4NWUa+IO3ueob76hks8WA64W9fSUQtsOnepJkeNg6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u9f1GeLIDvRrQCmZGHRgjbF+dbXbLvvB0RcXrqc5wucA1MA2c
	cNVZ4psb8i6c2m/x9yuoANSrwofOO6+ufgdEkytcTMmxAyEaYsRvcUqOq4Qgxs0qyws=
X-Gm-Gg: AYBFou3rZKFFZTfoH7Ije2rsNC+t9S7NhD8zT7jR+VJy90voZoJObta4JLKT7O3A/KW
	tdZphezKxl/g47yTYVScWyjSXJRx0Xnk2ObGJuAqPb3OLNPY5D4xg2MNhVl5irASGUW0fWhq/m6
	xYE4H3OBPvDNZwb/vnBrFvHDghOwHSUTzdE2ENvlMC/IzUgekQbgE2pm4CLcFl8BN5Rk5EziJA2
	NF0yZbl/7COozpAfB7+/xapmEMqY377SOX5CNfWtonhOuMN42BZ1D7f7d5jIpSIt1/AjPTalB2d
	Omkq8LTDyyj2v4SyuPrkMOpeo+SO8jJHKhueOG8AYiB2CHoejnNFwMpCfJJGyd74SkgTZ3RfNL7
	IGVz3ixhJB+tmxs8Gh+/Xk8HmWaPQGIcxISlEQhThUP8NxJ98Uy/bLOmYVODOK6Te0QwqQ8kzd7
	PZFWJ7+ZsyU++kBDKPhzvDxkvXr1nrm6X8pWiu8DWeMV0rwvHYAJgJtb5RdHBTE7lY/P11bV/Xd
	SHrlWmM3Jy1fYHR2e7UON0ANMJWiHV1YiFeSJX1cK8DwMSM+jtyyF3hWjwXj0QrDHEMxlFK+GyG
	/RMarRgbK9+CvWhFQ7ujIKoy
X-Received: by 2002:a05:600c:5020:b0:4ba:2bfc:c8ab with SMTP id 5b1f17b1804b1-4bb7da12dbcmr107839415e9.15.1795090895473;
        Thu, 19 Nov 2026 04:21:35 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535741esm52370925e9.11.2026.11.19.04.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:21:35 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <courmisch@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Morduan Zang <zhangdandan@uniontech.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH net] phonet: do not autobind a socket to port 0
Date: Thu, 19 Nov 2026 13:21:27 +0100
Message-ID: <20261119122127.1708071-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

pn_sock_get_port() walks the local port range to pick a free port for an
autobinding socket. net.phonet.local_port_range may start at 0 because the
sysctl lower bound is 0, so the very first candidate can be port 0.

For port 0 pn_find_sock_by_sa() falls back to matching by resource and
usually returns NULL, so port 0 is accepted. The socket then gets
pn->sobject = pn_object(0, 0) == 0 and is hashed into bucket 0. The next
lookup that walks bucket 0 -- another autobind, the same socket's next
sendmsg, or an incoming packet to an object whose low nibble is 0 -- hits
BUG_ON(!pn->sobject) in pn_find_sock_by_sa():

  kernel BUG at net/phonet/socket.c:77!
  Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN
  CPU: 1 PID: 6883 Comm: phonet_bug
  RIP: 0010:pn_find_sock_by_sa+0x3a9/0x590 [phonet]
  Call Trace:
   pn_sock_get_port+0x1da/0x4b0 [phonet]
   pn_socket_bind+0x312/0x580 [phonet]
   pn_socket_autobind+0xaf/0x160 [phonet]
   pn_socket_sendmsg+0x4b/0xe0 [phonet]
   __sock_sendmsg+0x1ab/0x200
   __sys_sendto+0x1eb/0x300
   __x64_sys_sendto+0xe8/0x1d0
   do_syscall_64+0x102/0x2d0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

It is deterministic and triggerable by an unprivileged socket. Skip port 0
when searching for a free port; 0 is reserved for the unbound state and must
never be handed out.

Fixes: 5b0c911bcdbd ("net: phonet: do not BUG_ON() in pn_socket_autobind() on failed bind")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a review of the CVE-2026-53292 backport.

Reproduced on debian13 6.12.88 (CONFIG_PHONET):
set net.phonet.local_port_range to "0 0", then send on an unbound AF_PHONET
SOCK_DGRAM socket so it autobinds -> the port-0 BUG above. With this patch
the same sequence no longer crashes.

 net/phonet/socket.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/phonet/socket.c b/net/phonet/socket.c
--- a/net/phonet/socket.c
+++ b/net/phonet/socket.c
@@ -490,6 +490,8 @@
 			port_cur++;
 			if (port_cur < pmin || port_cur > pmax)
 				port_cur = pmin;
+			if (!port_cur)
+				continue;
 
 			pn_sockaddr_set_port(&try_sa, port_cur);
 			tmpsk = pn_find_sock_by_sa(net, &try_sa);
