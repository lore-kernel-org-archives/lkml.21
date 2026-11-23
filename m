Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405263;
	b=4b5i1rxam/QyN5EB0QkhA6YbNJD2OZ4hFS+vs0Yg6dr29zlVKSeBjnolBiglW//GmPDa
	 MHYnebhV5PS8+QOQwwrLdQilviyPihnYUNTAb0pW4a0Ewji8s/ZNtIbGe8thNhV/qKI7A
	 ArkAA/gRBmoXRxsJlKzsP+ddeOcIA8N3G9ctOiajrEX1qbqthfLPWUudU/eugkLEya75e
	 etZJUwyva6zdH5/FdtwRcASNT+q+DbXH7Bp8OVbIUmrtdbN5/QaB/rFZZhbaCzR8tgZuh
	 i/PmJmimff05Cii91TSM/2g+TTrRc7jDuQ+mBAX6hNOhEUzxGWw6G9GW4YKZk4D2/UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I/uN54xQrauXi+R0dUK9MCordJLorId2BIMzOW5ancw=;
	b=XdlOUdrJ3dTVi1E5JXtdbU/IDwTKdLPHVVOpf7DvR/vbV4hS7ZWkU7VBQDIrFVj6kU9u
	 YIbAA5M56ezdyrdBPgDRKb/0zFKDWhXAVydPYJjMs5a74FRWV1ZpvFMijsd9XH+XLrd/D
	 W/0Q8WZ8cuzifhZyt62Wr8Hm9aT1Ww7aewvCqDxMIjkL7V1U2kaVC+AgIJLXDJyiRXJEt
	 83fV/xwYHW9+3vC58ktMVr8s0ir/bg2g0a7bLBZNpJh81PAC2UbGAPEf5OnIWJjGw2xTL
	 14N9u2a2OtT2Gh/7y0xBxfgrZ9FTl02LPF1uoBfu1m0MWprTiUwiVb/Diz8si2sS6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkFYhu3J;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3481606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3481606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkFYhu3J
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so1072511eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795405262; x=1796010062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/uN54xQrauXi+R0dUK9MCordJLorId2BIMzOW5ancw=;
        b=HkFYhu3JKk7jNNj5yTVp4C+Cx267EtXSd8XhUUOv5OTbbq04IivDtsdQwtW4gz1+Fe
         bBnMYaoFWLqpt4Mad0JrEC1GNLO7y+GZQ2Ns4ExH3BJjQ3wWk8Rvm1xlVDrDfaZTPzEG
         FwhDhRaNIE8BaXlCWjkxxiAXvB2oBnVSIMuqe/qdiOg31tLh/kTzgf7+zLQtcAV4ihvB
         SR3oSk73zyK034bj4NHABEdDTagN6R8vA/cAa0QN2nOrxoXXzPa0qE5W1/C/ejb6kYNJ
         v6K0Ks2yZ1mpuI8bF3pEha/03ZFsvQJCLR0a9lKl3vMrVDIBW0X5xzvNleJnqDP95SKg
         cogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795405262; x=1796010062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/uN54xQrauXi+R0dUK9MCordJLorId2BIMzOW5ancw=;
        b=AQ6/konwMtv8q1YdiqaXyy/L5OqutCva9WLSb8JdJjWDEkjDuiH5VEvgM8dYi3hW4l
         8CaAVnw1mwLi6APmtKxfN/QHo7jzBxx1AoTdfGIjyc635yUs40MTGfWHHlmlmRouIPfl
         aEWpOPKaho3r64cKzPE/afFCcQFRb6xbayQP3hmKPZtys3ud+tONPMOufgd7pYd62kLJ
         UR5hkaF0LQ/rxHIba/RcuAzQYy2t6b2fFNncgVVZD2dxd6gp4h6ZUrw/tv9ftxkRvI8k
         7g9E6X8edG7r9ikpWMffcaCgl4oP2Onghng8uw3L7VAgci2g1bXnWMxhaV3VNVptw9TY
         hvlA==
X-Forwarded-Encrypted: i=1; AL+hErHZs2utEwCaeSkFFOnUPeAs12sxuANxeqOZBuG0VEkUb45dYRAQNsYBxDJbb3kx/LihAowAw46ScHtoifY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YcfPrb68Zct1fillWo5e4M8NKYa7JUkfz84aCMne+g1/sOVrS
	cofzlIN+/iF4l4Dt+ejMjbubx6EgY4fC1BssTGI/ocGf1YFbrjQFEvmK
X-Gm-Gg: AZFdTZefOSw9qzombcWrjo2yKHnbRNHQoAhljFGIYpMXi5APjdkrpXtuvhu4i0+sfbB
	NrdcY04bW7g17cbxoes6NIRp25hJLfyiJbmjfY4NHuKnH8q27LTIXBaUdq2fpUDXWPnG6hjQyMP
	dQdmvnnPkhJIl5mG0pncslxdvgTmFMRCWnCyyYh/zLxndyHNLp93RSm0wV2auEPDIYTi8aa8xJ2
	c22UYWM7cXITwU3ASRercMx9zY+CL9dEDq4SiVh20vy+YXaDzD4GWnDfmNGx9AbiDdJqpxYB3PN
	Gx5yUlHXUXsJaQYuiWbrwLJC2QC0+jJ15xtdSrt9XaNh702XHq6Be7x9hc99f68LKxa1HV88TH3
	mguxAYBNfuQgSgpd2CN+2hYEUCMECup6siIqedaWHvVhmE643k09KoQeoBOXWxMIoJ5bP5kGi/F
	zZaDt7ykXrFNuOa8ALe/IBSHX/crl4sUoGnIfOrGO7J+pDIFSm/ndCs262ybJ8fGyrjQprmGOjZ
	U01Gknx81+KKeNB9fFhr5tHR/6kzgIFAO+UJj1F91JiKIXNkFcrIPGAQsZrCAXbqyiTWXVno/eO
	xiiSuk4MfdObaEAWc0nrjOo+gVdfYYnBAQiWeFGClk6Sp8XtIUEESMAZCEVQqABvn5urZ+zWQe6
	ISpq4jWON1qSK1gph2AMl/y35RhuoxoQ6prXY6DjPk7cAoz/eW3NEmByK6pA=
X-Received: by 2002:a05:7300:bf11:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-3856fe59b16mr10742137eec.10.1795405261632;
        Sun, 22 Nov 2026 19:41:01 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm29489364eec.7.2026.11.22.19.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:41:01 -0800 (PST)
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
Subject: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments on IPv6 listeners
Date: Mon, 23 Nov 2026 03:40:47 +0000
Message-ID: <20261123034047.56745-1-dennylin0707@gmail.com>
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

Take the family and the address from the protocol of the segment
instead of the family of the socket.

Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
 - Take the family from skb->protocol only, do not read sk->sk_family
   (Kuniyuki).
v1: https://lore.kernel.org/all/20261117215554.68071-1-dennylin0707@gmail.com/

 net/ipv4/tcp_ao.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index bb7bbc20ba3f..857b8684e01d 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -799,8 +799,8 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 		return -ENOTCONN;
 
 	if ((1 << sk->sk_state) & (TCPF_LISTEN | TCPF_NEW_SYN_RECV)) {
-		unsigned int family = READ_ONCE(sk->sk_family);
 		union tcp_ao_addr *addr;
+		unsigned int family;
 		__be32 disn, sisn;
 
 		if (sk->sk_state == TCP_NEW_SYN_RECV) {
@@ -813,14 +813,14 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 			sisn = th->seq;
 			disn = 0;
 		}
-		if (IS_ENABLED(CONFIG_IPV6) && family == AF_INET6)
+		if (IS_ENABLED(CONFIG_IPV6) &&
+		    skb->protocol == htons(ETH_P_IPV6)) {
+			family = AF_INET6;
 			addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
-		else
-			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
-#if IS_ENABLED(CONFIG_IPV6)
-		if (family == AF_INET6 && ipv6_addr_v4mapped(&sk->sk_v6_daddr))
+		} else {
 			family = AF_INET;
-#endif
+			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
+		}
 
 		sk = sk_const_to_full_sk(sk);
 		ao_info = rcu_dereference(tcp_sk(sk)->ao_info);
-- 
2.43.0

