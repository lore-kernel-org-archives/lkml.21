Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952567;
	b=rzc+IXaJhz0g1QsWGb4tEw3GTctLbLknnn1JmyS3tNrjWaej5XVaUXzbbQDMoNnmWOs5
	 nLpsEqdHJcR2e9WvPXi/U/MCyOq99KgrGpXJOgcOALeW50hMPh2ilmHn579WnvDy0O7t5
	 n+K4bJuZNOqHKbtDzJuveSVNyyuPW7hLzzd8VGnRwHWtBn5yLDu4WuOwzOfR013v8tlM4
	 hJVgoi7nDMdiagZulqW5lXhfi5/nN55k5Rd6a9/B5HVkb8GFbb9H+ztRYBfzEKIB5Hgje
	 ciu1a8UhKz/CHhJnTuS2GWB8LF7EvVOWQRveL3q/T/FDYbw+0ko+ONoFnxkCHJiogtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DSjrH7EnnuVI6DIehpVdsnek9CpkzZq1NaBOFJ/JCTk=;
	b=seIEXo0KjISZnQ7HcMsR8kp5dItcqKMqSMUsuYilgk1DmOU/tEoJDy9PuhRqp73p17WE
	 3ztHWN4pW6n1IN3dzWnM2pK4PFhx9iS+5dz0O4CzAoDHHHc4XLehe2q3xXyvqSHQ3qLQz
	 Xzw2i/FuBc6Z00yIvbxN7ulccc3h6VnmV5ohwlg4O7HYs3eSoWffgtDi/G+FadCYnv3Rs
	 l9awdHV5+1G9W26No6T9o+8JSLh3Z14t/qh/HjsvwW6AvNdLSQTE9n8DR7nO8s/esPG/p
	 F4F2N/JUfPSUraNXMp553EyuwbAynORicEoV6r50k6OX6z9Jg7OiJWU7QJ0vrS9vWFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g2/nqwqx";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCCF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2/nqwqx
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so16637eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952565; x=1795557365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSjrH7EnnuVI6DIehpVdsnek9CpkzZq1NaBOFJ/JCTk=;
        b=g2/nqwqx07e0tdK4DVJHIslgFnzAaRUxAAi5stbTk5pgexoRPdIoPYLuE6Qg0R9zBd
         4QvujGZdubMPFGPgZTKNz/EfuvBTgFRWHzS5CkcNqkRsA/LGBiW0kLBtDsNaitT1siDb
         mf17xXp5d/FR2SlhosXgz96l1fCaRRpjpbwXVe4HYJVIr2yJgnACE4HdZmlEKvqUHgcU
         WXJxNDTxRg3Lk7tD5CtDDtW2tjjqle4ZM9LJhqimuPA3E3YeIJl6xWlrunHDHYPiavFV
         VsISdeUccAe+wZp9hoRaLBkZeefll2L9+txv3Jj/Razygsk95O0yVwZeKGGgyGp4nK5Q
         1MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952565; x=1795557365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSjrH7EnnuVI6DIehpVdsnek9CpkzZq1NaBOFJ/JCTk=;
        b=17q7tP72L8qMKqwzE3z72Xz5TxmjyBfYsCNpkhvc849aVYVmKapSv3eV9/3WT7pbOV
         5Ysv+JZNkMGwIlclLZda8SLSwJtn1uO16Z7zLPJ1Yg1HmhcsS0eP3on6MObmhIsyjits
         diDFCWQYVDlccLg2CXvVDnIY1EIIKQ8k9UYwS6V5WK2Dt4vIg3f2DpKTnDLmxK7CLGYL
         2e1xyXFEuZD7uWyW/61iCUXmGQExaNB6LQ+XU7sc52upvK6cPTV5j6n4VIgBgQt1E6mV
         Km88W/R7LUpWp4sB+b+jt9uCMP3aAsoIv9cg4pxlk2zTzTjfe9oEjuIhccmgBHdpah6F
         pzkA==
X-Forwarded-Encrypted: i=1; AL+hErEbFHfyPHzTA7A6T2eWOrm1Nn5kOMf2ot61T3rLKSoubCGw9dIeQErXs1uijQKfQRA8YaSlFcofuOIG0e8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RdJPJ0e+yAnP9GAAnupHGDf9mEbU8dfLwXwfD5y+so/NOw9m2
	iWBmjOTSVi5m5W2LsnmPsY2N/1PYODtVX14w9H5s1j0zZ595VQ6Y03gZ
X-Gm-Gg: AYBFou1F3imFcYSygJf7FFx8V/4bwFfSLxE3rR+qpM9KZrUEzh0wbMPOGmDKJlQROPL
	MvDy/xAV5e4OGm8JcdZRyNRv/jXxFywjUbo7PTaVshcbqZQ2Hb2GWYuJmVToYEl3+UacMmIGnrb
	mR/J2HePa9jcKRGBpbXamF27VRytTfHxZXW7+5/bmKptcRvGRMY9M6dk41CqjgPBMBX97hLYmU5
	heCYG9U2YZ3s0GdT7+9INOxUINZVRkwkMdzkLqgnZdNJI+v4p4kTNuiwFrd/nWeXtBKRWYmDU0u
	pTeNrdW9oohxvWI+7Jm6bCDmy8hwU+ZfXuerWpaMG/mIrf/SS0/FQXAketO+yifzNVc5DW+ErD4
	ERAS7zrhNWOqDV4Os5EzAT+O2y/0+tzG91Tpj3ruL/nAS2SD1mC9rEbsn7L1/wu2mhfVLXY2hBg
	PLU+ZsTHBw2JNCS4SF87UuPXwjVkuAxsHjIWW9OSNAkE4Pu9DyQ9j2QCtsqeFsm/3RlDMFBDUsd
	ZahX2FEavY8C0nRuNAMA95bFtzM5VCF+HTKc4/GQavflXHC8jelAbt7ptFYI9F7sIMa1C2jiORa
	atteTd8b7MaMIfszKaN//IIxwkUcsBtXD+3eMDcWHYudSgIOLsMIAe+57r6QsSJdRo34ljv1Tvf
	Qdffs9LeRCpyXwExGkYTzqQd1lJGhh9BIW3FV4A==
X-Received: by 2002:a05:7300:dd03:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-3828120efe5mr619582eec.28.1794952565407;
        Tue, 17 Nov 2026 13:56:05 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bbf0d6sm726796eec.25.2026.11.17.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:56:05 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: edumazet@kernel.org,
	ncardwell@google.com
Cc: kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	0x7f454c46@gmail.com,
	fruggeri@arista.com,
	noureddine@arista.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH net] net/tcp-ao: fix reset key lookup for IPv4 segments on IPv6 listeners
Date: Tue, 17 Nov 2026 21:55:54 +0000
Message-ID: <20261117215554.68071-1-dennylin0707@gmail.com>
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

tcp_ao_prepare_reset() looks up the key for a reset that is sent on
behalf of a listener by the address of the peer. It takes that address
from the IPv6 header whenever the listener is an AF_INET6 socket, also
when the segment is an IPv4 one that arrived on a dual-stack listener.
The address is then read from the middle of the IPv4 header, the key of
the peer is not found and the reset is not sent.

The v4-mapped check that follows does not help: it looks at
sk->sk_v6_daddr, which is the unspecified address for a listener, and
it runs after the address has been picked.

Use the protocol of the segment to tell the family, like
tcp_v6_do_rcv() does.

Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 net/ipv4/tcp_ao.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index bb7bbc20ba3f..656dbf805cfc 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -813,14 +813,12 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 			sisn = th->seq;
 			disn = 0;
 		}
+		if (skb->protocol == htons(ETH_P_IP))
+			family = AF_INET;
 		if (IS_ENABLED(CONFIG_IPV6) && family == AF_INET6)
 			addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
 		else
 			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
-#if IS_ENABLED(CONFIG_IPV6)
-		if (family == AF_INET6 && ipv6_addr_v4mapped(&sk->sk_v6_daddr))
-			family = AF_INET;
-#endif
 
 		sk = sk_const_to_full_sk(sk);
 		ao_info = rcu_dereference(tcp_sk(sk)->ao_info);
-- 
2.43.0

