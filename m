Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167980;
	b=z/9HWezkQ8JszdMQPqqnJOFxUT9Jz/TzT0VxToCL8q0m2237TOC5iU8ZS266a5z6Avwd
	 oXnhypHs0PkVnf90KUufrLvSRf3JHZRtI0KKh7IRuqzFX6J1i+94EKmG8Y80xVgbEoaow
	 87On2dwSYwvGzRm4ljHYfZuT1dIQng/waH+bf8QoTF4F64EEReIBssrRd9yZmUdpEtflu
	 kRWWEov/+tMvcPj6+jpVmxv4Jo83KeMPnAn4qMMG+13evVVT947USHjX3FtEv6kW1zblr
	 VjX8kAK66Z4ghWnNH2+gSw4xse77X0MkxEcmeNnnunfdPuWfKNXrv1KEOxOK/UXsNhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167980;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fYKQuselP0oJEFJdmNo7nvi44b9E+BV7pZCm6PPHzwE=;
	b=Pmzs3mAuZN94yRMOFy2DdK0TUACRe/sBgDqLyzum9+MTzvsDpMPOStzwCocoO/zvvL31
	 3MerAZ3zEBkaYMSMUUigoUyD0HjpYU5Efv+asyVoq6DU5ifsPyu/I9oGlL42FC8ChWpic
	 QOTX8mNi40bWUBqCRaNlQGBbchdJ1MOAezP+tIXKZZoDwiYYwIoG4C+4rS1vcYRbmMI2t
	 FMnhs7aoXbuPOge6xcM2Hv9v/OOsh2EPkizmA1/y8E/jfA/kBsIDQytqd50w1YrWIWyxz
	 rYGgqJkNcMNlUBGTdoWE/5AbCE8lUs2Bchep01n8ivi5Wwl+2jHFn1x5mRuRG9Gocbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QrOQnYPn;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93760A3833
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F93760A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QrOQnYPn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+/3e1eU4flllBS5rjftBbAf9n/zBesoBn8Ux0dXFa5M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795167978; v=1; x=1795772778;
 b=QrOQnYPnUYWDlf+aWnWONjX7zdkULekT4w2902eogD8XDkM/dL42Y+fq1dUgChC50xG367/3
 IJ4x8bL61UEcDJ2t7dFJIhmV8dhEJaiE3i45MRyYh4yd/NYy2Lw0C/xddHe2TVQbQ9pHAEmz//+
 9TN6BEK/XIB4hg39bW9WFXVk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 998279c357709f93;
	Fri, 20 Nov 2026 09:46:18 +0000
X-Mizu-Trace-ID: 998279c357709f93
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Soheil Hassas Yeganeh <soheil@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Wei Wang <weiwan@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append
Date: Fri, 20 Nov 2026 17:46:04 +0800
Message-ID: <20261120094605.46063-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

Our local syzbot reported the following warning:

  WARNING: ./include/linux/ucopysize.h:57 at tcp_sendmsg_locked+0x1e13/0x1f20
  Modules linked in:
  CPU: 3 UID: 0 PID: 377 Comm: syz.2.2248 Not tainted 7.4.0-rc2+ #398 PREEMPT
  RIP: 0010:tcp_sendmsg_locked+0x1e13/0x1f20
  Call Trace:
   <TASK>
   tcp_sendmsg+0x2c/0x50
   inet_sendmsg+0x62/0xb0
   __sys_sendto+0x2fe/0x350
   __x64_sys_sendto+0x7f/0xb0
   x64_sys_call+0x1375/0x27e0
   do_syscall_64+0xe4/0x470
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

The problem is here:

  if (!skb_zcopy_pure(skb)) {
          copy = tcp_wmem_schedule(sk, copy);
          if (!copy)
                  goto wait_for_space;
  }

When MSG_ZEROCOPY data is appended to a skb that already holds copied
data, only the user length is scheduled, but the pinned pages are then
charged by their truesize:

 skb_zerocopy_iter_stream
   __zerocopy_sg_from_iter
    zerocopy_fill_skb_from_iter  //truesize += PAGE_ALIGN(copied + start)
    sk_mem_charge(sk, truesize)  //sk_forward_alloc goes negative

For example, sending 8 iovecs of 1 byte each schedules 8 bytes and
charges 32768 with 4K pages.

On a later sendmsg() without MSG_ZEROCOPY, if sk_wmem_schedule() fails
(e.g. tcp_mem hard limit is reached), tcp_wmem_schedule() returns
min(copy, sk->sk_forward_alloc), which is negative. The negative copy
is passed to skb_copy_to_page_nocache() and triggers the warning, and
sendmsg() fails with -EFAULT.

A few options were considered:

1) Schedule the truesize up front. It is not known before the pages
   are pinned, it depends on the iovec layout.
2) Do not append zerocopy data to a non pure skb. This splits a small
   header and its zerocopy payload into two skbs.
3) Schedule the missing part right after the pages are charged. They
   are already in the skb at this point, so this can not fail.

Go with 3).

Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pressure")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v1: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen@linux.dev/

Changes in v2:
- Only call sk_forced_mem_schedule() for non pure zerocopy skbs (Eric)
---
 net/ipv4/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d510e982dcea..343f6d61b408 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1359,6 +1359,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 			if (err < 0)
 				goto do_error;
 			copy = err;
+			if (!skb_zcopy_pure(skb))
+				sk_forced_mem_schedule(sk, 0);
 		} else if (zc == MSG_SPLICE_PAGES) {
 			/* Splice in data if we can; copy if we can't. */
 			if (tcp_downgrade_zcopy_pure(sk, skb))
-- 
2.43.0

