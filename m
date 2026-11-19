Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091398;
	b=n8bMighsjzEyLeIhYyrx8TWaPPzofLkTo+AL3wL+hZNNuk5t4XqGBYWx5D+6sX3Sw6Vy
	 3TsYctmUumYIlxAeerNSj5fTeiCYglrBM/mFQSND18T/hfNTJ0iTwyPjsAJJwa4H3ydTe
	 snzjqFte9XWc0HJr9t99CoDgOP5ajtzhJnWmGgCPOC4IeazhxeqBCtGAZ3H2Z9Lr+q1Jd
	 3i4E7Y84i3XPum9i7raBS7juHsuyhkQDJo2n0efBps27HE4VtfSRsjCzxmhJBuUP6rnFp
	 mgzE5Tt20gA3wg8kCIsWcHbQZk59pUrK8dBpVaWdVvRhg9deh+SPFvE/wIvt+Krn4oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qpWp7RKQvxLSpEEh7A+u1LSSChiWS6u79l4SciL15T0=;
	b=HSURkFgwwAYI2eLJS4q7UIzuMQpUwXp2OGqCNgO0vCx2UN46BmtQDQ6dtuLSE0w+R6V9
	 gN09FVPi3qjRSRWy1rEFUAy72P9gbSSCbXyAhrdmoehrqEJg6qN3uR/Q30s5vaevyU3Oy
	 SCAGQLcMp9LyzkP0CWzqhJF/Cw9yxoSGZHEsqhHHLs9GRkwVibbSQ/4h/QT2R5AhIFgOw
	 zOAh1O+ZdZPba60fYOYFSUTF0GlBMLDb3go9PQrGCS55tauCh/ejMe0ZoEePklNE+3KI+
	 GG6FaFfqcC4qfTMSo6dfBnU2Ev7dNAJtBKsjX0dIT3Mu4QjIBjNF8s8ucjYLj5/mbnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=F2jafbBE;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3FA606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=F2jafbBE
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1261196f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795091396; x=1795696196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpWp7RKQvxLSpEEh7A+u1LSSChiWS6u79l4SciL15T0=;
        b=F2jafbBEseeHmbwhUrufqlP+n3L341gWcgPmpaQJkNSCV8j8dOtPMoyZagdKBQTqmh
         wTBJJV9L0zmsva/fUOpqz6j1arWAGXeDHADc1+7JDdE8YD7RopYmycbpWfa0BUVq2iWp
         y8p1E387kqh0MnVVTrheCCVJc9zIUJnO2bypTUVGPAzBv94FFinyh4JquBQIWlRodBmS
         CgR5Uv5/EqR4Ap8Ii6LqQZYPAk4VlyzPIkYIH/vaY5nSpttxKA8EYQe0x43SHeizOIo9
         5lQrddiEGqXUPkhNREgn9shXoRKp4GBXVHP5BkQ3GcUPJSTbT1Bsgz0GFy+lPOX/ykqU
         VhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091396; x=1795696196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpWp7RKQvxLSpEEh7A+u1LSSChiWS6u79l4SciL15T0=;
        b=DI3vzN+t4R2kEiNQYDbWGvxrzyXzutLeBuaSsl7JvkPAzLO80BtWBY9wURsNjP+SP0
         jdZt2YYlKqNsJ/h6zcTHP43QflbicuLNL26jP4SJMhGR7O34prhUrIShWjPQURFv39+2
         P9hwfOHLZFZ+54er+bYm+x899S1s5o90HdsHhAG38NGgp4NsjbgzApObtKR+fsNiNfLI
         VSXaObrr9ETo9SuhjsF7iY71NKIjHnRDBY6fJDC2oSZDvpj/0pr2+fRqjuDJ8DOUmjnz
         QnFaypD8X4Mj+BUue/M/Caj7PDxeWSMm/ARGuhcjfSqlGLcz9YAquVleQdojcUe7e09x
         DoWQ==
X-Forwarded-Encrypted: i=1; AL+hErFlRqBqeLo6uzg9gr3r7sz3KeeeE29blVciZEkt9CbRiQy2LmF1eVWIk9oAZpI1MTgliaKOB/5ub/6j96Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xERFiDqXGgzu+Ajp11QcNqT119tke4VOk/gNr0zBo6BZMY2n4
	OBiuasjQU+Qj5YkGL0uo9yznq2zJaONK3MQRrLUqDphsSSt6i8nqqAVuFica/EQTrm4=
X-Gm-Gg: AZFdTZc4vCwWKNsXBCR5Nh6uJCXSo8WgMj8Ka9Db7gdpoa0or6Sc6id8/vyksDkZuoB
	65Qdt2CYtPHbcrwAW+YvjTdiwllgzY1ETwaw+0gRZqAWecdMHyUpOXDQqPD2xNLU+H35i5Tyvzt
	xVElFdIBC8511jZjiGOlKPN7SXCjQkyRP8iS28sh7PmajMrXVj8sAiVhH/AMm0WWptjLr5x+x3U
	HZFtaavlYUQljO17GfqrP5fxTLUuTsLp6UmcnnmReYbCHQAF5MnN0aKdUjitmCpUFD96xN0p4za
	0g4xku9UIVxkdXQkcdPSYAGQdYtL0rDH1dSbycBq7TG37vlMUpnN81AG0TYX6SVpSpUhMh9+xog
	GKG0ULnPOKQlGTthNwrQ4xezFUNLjpUyRZPcyGdcvr1cyVz3HVmSK+adeokMbrsGW9+tYm1IvEm
	IovQPiLqHM5ewDyS6BMsWNmAXvCECSsbfK4wBOWaROvzY0gfULPRDU+9HWNQ6VANDO/l8lNBI42
	kZnHqeklUnAvwcwgs/coMuj81+vgmh6YjC03FqmGYRYtBItIeHC568SEPXK9OxcH7l2vnveqUEt
	opq3RHP2v42PGEBfrBp3Rsfq
X-Received: by 2002:a05:6000:1a8d:b0:48e:d36:77 with SMTP id ffacd0b85a97d-4a633a63e82mr12936899f8f.4.1795091395668;
        Thu, 19 Nov 2026 04:29:55 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573bccb0sm10338670f8f.55.2026.11.19.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:29:55 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Wojciech Drewek <wojciech.drewek@intel.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH net] pfcp: drop packets until the device is initialised
Date: Thu, 19 Nov 2026 13:29:46 +0100
Message-ID: <20261119122946.1720693-1-amisiurov@cloudlinux.com>
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

pfcp_newlink() creates the PFCP UDP socket (port 8805) and publishes it
(sk_user_data = pfcp, encap_rcv = pfcp_encap_recv) before
register_netdevice() runs ndo_init, which is where pfcp->dev is set. A
datagram that arrives in that window passes the "pfcp != NULL" check in
pfcp_encap_recv() and then dereferences a NULL pfcp->dev:

  BUG: kernel NULL pointer dereference, address: 0000000000000108
  #PF: supervisor read access in kernel mode
  Oops: 0000 [#1] SMP PTI
  CPU: 0 PID: 26516 Comm: pfcp_race
  RIP: 0010:pfcp_encap_recv+0xeb/0x1d0 [pfcp]
  Call Trace:
   <IRQ>
   udp_queue_rcv_one_skb+0x24a/0x560
   udp_queue_rcv_skb+0x4f/0x80
   udp_unicast_rcv_skb+0x78/0xa0
   __udp4_lib_rcv+0x519/0x5f0
   udp_rcv+0x25/0x40
   ip_protocol_deliver_rcu+0xd4/0x210
   ip_local_deliver_finish+0x86/0x110
   ip_local_deliver+0x65/0x110
   ip_rcv+0x17d/0x190
   __netif_receive_skb_one_core+0x8d/0xa0

The window is wide when register_netdevice() fails before ndo_init (e.g. an
invalid name): the socket stays live until pfcp_del_sock() on the error
path. A narrower window also exists on the normal success path.

Drop the packet while pfcp->dev is not yet set or the device is not
running.

Fixes: 76c8764ef36a ("pfcp: add PFCP module")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a backport review.

Reproduced on ubuntu-resolute 7.0.0-42: flood UDP :8805 while creating a
pfcp link with an invalid name (register_netdevice() fails before ndo_init)
-> the NULL-deref above (kdump vmcore). With the fix the same run stays clean.

 drivers/net/pfcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pfcp.c b/drivers/net/pfcp.c
--- a/drivers/net/pfcp.c
+++ b/drivers/net/pfcp.c
@@ -61,7 +61,7 @@
 		goto drop;

 	pfcp = rcu_dereference_sk_user_data(sk);
-	if (unlikely(!pfcp))
+	if (unlikely(!pfcp || !pfcp->dev || !netif_running(pfcp->dev)))
 		goto drop;
 
 	unparsed = pfcp_hdr(skb);
