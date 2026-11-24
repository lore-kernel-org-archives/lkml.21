Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561356;
	b=ppc8D+Bqc8Jv9idUuo61cf2V7fGb2fRdnN1f10sm1RJvT3U8Wd9hqOZhAoNeWpe1WmQq
	 XfVkf/rmF4g/4KrKH+Fqwb6e/698q/Vc2g2P86Su44P3MejjS/E0IjihEbfoK2ZDYskZy
	 m93uYDl08DRkt4Dx2xWSgcb0s4AKyLWQVS8AdXwA6SIm8at0gosBUvZ/eO7P22VdBdDbp
	 Bs53izLSokGmpJAxqpKkMza9614mnEpO5zNV/gYTOFqxyf8Y4IgQeiQI5IKzp+UO9BsWl
	 Yv3KpEHA3EmeYgc304fWkxXVGYGrcadHXrT7zX5jG7S51KOEA2xVusr+NSUxYQa1YQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D5BPfe091LT3dmDUExK7fHms4x6j0arLEPQECwd2AVo=;
	b=zML0ZBp7YSglbHg79Ad95+jc1UTLo4dlOXPOJAEOuBMI9KtcH34tN1E4AluZ0wDT6s4+
	 UwJH5Svy0ZU9LmKRHg8DwYdJyp070Ns+e6Hm8f4YJeAY+Yoxr9izbss7GoWhyQupJF/CC
	 4q8sUDjXaXV597NkHb/NUx77PljZHvb5ujmqq/RZ8KSMgMZfplG+N+i+Kx23DYKcW0XUD
	 FpaS2RdKjc2hR8N2nqMpddBztXcsXS8zn7a+N1VQzAbIGlu7VfN5cvc3SecTRX8Exg9UQ
	 4OE960BpRktL4JB0uANPdPTJnSMRpxb0+3FhVKprIOGG4xlCcdR3f/5J4pZ1Mmv+haw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xyip/I4C";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470AE606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470AE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xyip/I4C
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38644aedba1so7830774eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561355; x=1796166155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5BPfe091LT3dmDUExK7fHms4x6j0arLEPQECwd2AVo=;
        b=Xyip/I4CJjOX79oknp9xnxqH8tk7ypjlRD+iGVEGJhXc1Q78Z0uyTgA7aine8/XIdk
         u4cGGtKJxpG5CHBu0FUISUpWRuMSTxqFwiGqnMOgB0J5J282mZWz3MYJpKm6Ui2AnnZn
         QsHovNmRZs6jMvcBr9BQ+uyJ2GWtF1yryusczyPgenGxiO/SScygAAcq0Dq0imjZ7Jce
         wx/x5AVqjyhbNuFwTTKv0J3MYajKHMAo1Z513kotdbsU7rnQX2upFbTYZ+IbRdyVeVMM
         DNDwT1z0nSrpBU9SnaVwzwXSaQNTHxkD/TNtoQvDCWXB1oogCnpD0WKIvTp1zLBPyvYL
         4WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561355; x=1796166155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5BPfe091LT3dmDUExK7fHms4x6j0arLEPQECwd2AVo=;
        b=12EnxIVCsIR2HUdqKio2DhNwVONWtU5wuNWYyJO7W/LJPWjusACcKWJgtaS+3eV4IZ
         Fwqf5MuRgPc9zJtO1vwKLarDjHXWE8LN5XSrlP+HN0Gl+KbuF1KUcOJVOaC4VkqLaG0w
         sRMHXva97GwH+jTqn5qOYGcf245I67v54fiI/blP2nwKySH2FP0I8jHdAPzgQptcFuz5
         5WoPieUzkQoYN+dOV39tGLOGkKzGiWh3ycM6sBZ7Qs98aLHMz4/Sdn7xzXq/4vnxyn8o
         PKwovvveQcF34ppQdeMAP2UDuQ28AtHjXeVn9tQzF5t3V4wWi4jB9HOdrzX8ShatnuIJ
         oPcw==
X-Forwarded-Encrypted: i=1; AL+hErGdrew4PJcuzdIaJ8I9K1XMT8t43Voa+hpV4v58pAnpggV/eTiqwq3EiOLdwx0jjKxmIxWjAmGyaTxFKk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l1tcPqjOF29GiTOXIdbrYFRkZw15PRycanxBfFwwIRip4h5ML
	C1pV6L/5iDrvWZn9dE7Cz2V6dZt01sAC0/sLyTGKIpMfJ/TlETgqdcUW
X-Gm-Gg: AZFdTZdA/eWctrRctlnxdg0jBY0IcRBagV6JaDypaHLH2oxtqr/xZzv+g1rj8HXi/IM
	YnPwLDobtNzmLjQmZj4ZB59OEAIEkJS/xKLtTvFNLbYrVsOPTKsyZo6JrMKbDOvvI5VFaiNuSmM
	EyaPPR6f1R2VHCzqGpjdY1O1O7XCWzg3wkBrhe1d39BVHN6tfqxxlkUfR7Fro1UlN6WlSyopjm1
	p//bNOFwShAvkdqgwqW6/3HW2xVyvq+JHe7PI1oQ6Dc18igPhtO0nybT9f1E3PQlLMXFfsnrpu8
	9/K97+QGUF7dEI9zzy2sR7fE5lWD0/M1NBU4tBb8htooYGSQPoTblHreVQn9ATkLs/o2X9/wR5x
	/Y/G0ztyL8Ujs0jXeVtaw6nHB2a02Hg0hvyGHzQe651SfhTafIcfgvLw+J8kOwuqGcjMRXamftr
	Xz8uHA1zb96l2X2yf+JFi0AkssPMg+m7N/f/Q0g/Mfeo8pJ8ag+4pBlQZbtMDJ+OtccmbXEe0bD
	LnpWkPJOWAQfc/lAYWVFLox5VRTK8p30r/ncYtl6A6/+zTflFyBX2z5Cc7e/nx80Mibvf7sY1eQ
	P2wCuvyTUApUzSEB132LcCt2kRcxMPE+P4CjKyCUIGuTVZprAw==
X-Received: by 2002:a05:7300:7316:b0:386:c5d3:7300 with SMTP id 5a478bee46e88-386c5d37603mr3417710eec.12.1795561355161;
        Tue, 24 Nov 2026 15:02:35 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm59747187eec.5.2026.11.24.15.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:02:34 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive with sockmap
Date: Wed, 25 Nov 2026 08:02:27 +0900
Message-ID: <20261124230228.3868519-1-graypanda.inzag@gmail.com>
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

A sockmap SK_SKB verdict can remove receive skbs through tcp_read_skb()
without advancing tp->copied_seq. tcp_inq() then reports unread bytes
while sk_receive_queue is empty. Deleting the socket's sockmap entry
does not repair the sequence mismatch.

TCP_ZEROCOPY_RECEIVE uses tcp_inq() before inspecting the native receive
queue. A small request enters tcp_zc_handle_leftover(), where
tcp_recv_skb() can return NULL. A page-sized request can reach the
mapping loop with the same empty queue and dereference a NULL skb.

Check tcp_recv_skb() before using its result in both paths. Also stop
before advancing beyond the last skb in sk_receive_queue. Neither
check consumes data in the sockmap ingress queue.

A custom LLM agent developed by the author found this issue. The author
manually reviewed the root cause and tested the reproducer and fix.
On net/main with KASAN, a privileged SOCKMAP SK_PASS reproducer
triggered NULL dereferences with both small and page-sized requests.
A map-delete variant also triggered the small-request fault. All
completed without a KASAN report after this change. A non-sockmap TCP
baseline still copied one byte. An adapted tcp_mmap -z selftest, with
only its transfer size reduced from 32 GiB to 64 MiB, passed before
and after the fix.

Fixes: e5c6de5fa025 ("bpf, sockmap: Incorrectly handling copied_seq")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 net/ipv4/tcp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 418842a2dfd9..fa3b4bcbc726 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2072,6 +2072,8 @@ static int tcp_zc_handle_leftover(struct tcp_zerocopy_receive *zc,
 		offset = *seq - TCP_SKB_CB(skb)->seq;
 	} else {
 		skb = tcp_recv_skb(sk, *seq, &offset);
+		if (!skb)
+			return 0;
 		if (TCP_SKB_CB(skb)->has_rxtstamp) {
 			tcp_update_recv_tstamps(skb, tss);
 			zc->msg_flags |= TCP_CMSG_TS;
@@ -2274,10 +2276,14 @@ static int tcp_zerocopy_receive(struct sock *sk,
 			if (skb) {
 				if (zc->recv_skip_hint > 0)
 					break;
+				if (skb_queue_is_last(&sk->sk_receive_queue, skb))
+					break;
 				skb = skb->next;
 				offset = seq - TCP_SKB_CB(skb)->seq;
 			} else {
 				skb = tcp_recv_skb(sk, seq, &offset);
+				if (!skb)
+					break;
 			}
 
 			if (!skb_frags_readable(skb))

base-commit: 37fa509e43ba59d7c329025436e8ea64bdf089d7
-- 
2.43.0

