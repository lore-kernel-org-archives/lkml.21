Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789558;
	b=0VO7dP4BkxmweVJvD+4CjV7x8lIQUnefgeJT/LhADbqvD33tNkYzQ7fKMJUsHHxlD8su
	 7Vs98Bvr2ohs//AQa4MTr5Tsg3bMdCv3i7A4/39WGaGw41CgeJfy+nTvdnnMSzg7X+r+P
	 glrdxgf7n+eImpgfwa6XG7Ii0P8dXVMR0PvA0ac7sdlsoVjRoKTtEq83svNxzaTDKDUMU
	 YRR0uvev3jDzJ35bn2wxI0IVDb9RyUtiXWHL7OmrZYMjDaGdS3EiGMvH4qf5dsLoIPIsS
	 0voSAkUpmbGsR8tnP7IrHLrtjf8tFnmEEY+pwZgXTDMmCQTwccVah/XvMoZWwIBhv+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
	b=P1e+ZS1dramSAxiuiEdrmwajOg1klr2xaQjtSgF8XRTAtvLlMmRyoM9zAbFmUYhlmlJ7
	 eg+68RgbIKVay3wAwf9y0HFcPgKy2k+nRJ7Z5JRa5rzHCiKtFgX4tLECb7FDAote2zXY0
	 3LE9TIOyfJq4DTtcMDQD6ThX+MkYZVNbuFGVj+8ssmjV+nqi+IR082G0JO3kpBE7uDc1c
	 oPVg1BHxs90WtxNU33J/ez31Hi/AjYAlibUbVVNK9+xrDq3snVb0Dl3e36ysPpyKEmIFF
	 NR2gD7+mHgh1tcNKCPbQPv6v/IJ6D2moqU8rXl6G0kONcAccrYaBopJJs8JoWaI46Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=PNoPGUYd;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A69606E13A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A69606E13A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=PNoPGUYd
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cde1479f76fso4357852a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795789557; x=1796394357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
        b=PNoPGUYd72bdVRNz6j5xAK9fj1N/kgvqWgnVi+dggqk/FcbIEE3jmb3pEonFHHWsQI
         7TjQT8NVt2gY+sd52p5CjR07Wt8Mw7WRm5WiIUoT3i9eLTw5wYHp8ZxvOxbDJkBwi/8d
         cF/urv3guhCw71osZosrgSwWuTHFwLD8s9sqb404M+SqyeGfnPfShOlb1XHsskrjbCAZ
         xTE94+issUodeM8Ea44WxzBe8LFNVXPIqZxL6zyUP4BoIYW2Mom7a3rdjVDtjpcCo4Eu
         OWovmwPB/T1z3kVlKyWj0BGfl9hYXgekn3omCY8LR3ZM7tJ1dRq/OO2v4mtrXma8jfel
         Rh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789557; x=1796394357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
        b=BQURMdbNze60lJMbyD6bhpy5Pp6lDwMmSubfPGtDEP+/b+QURr+r+c9DC6YPPohyWE
         +4DA9H8Vb5X1CegsdBFso7W2M90ydLzOqjvjILPMEzKTbC8MxwDAqZnP8oGlHu++e7yv
         jlf71R1BVOlznlSqeRmnhhuiwf3tkfzCLaH3e6b5bbofy4gAGvecZtSIx0Yz96OCz2dt
         qNz/Klk1qudUPNMC7W81JLSKRFx6eTofW0JeEpRtDtHzBHo2z/yLftS0epRFl8LpXmPi
         OORhl6k8HNewKNyjWWkmrcr2dBSV0aEzM005P8Fx/QZ6A6TD1Kk2zQU+dPzjGmz4SuOr
         2a/Q==
X-Forwarded-Encrypted: i=1; AL+hErGwAgQnfL3Oz5b0AIqKlas7O3fdGK5VzKpScRbuLiZWVM+0d/KsSOfra6GSzbTNzUnaWuyHrQ2hVpqZ2Jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OTWbmUgwNp88XGdBsaMnSMhSSxPnFFayQCeYB/EedXwmRlzYO
	Wn9kCuu3P7klGjuEu1GWG4roGOnUd2AFROgBoMqtHaz3uyyysrGgv60wr2MWDdRbVP8=
X-Gm-Gg: AZFdTZfWJfpjg9fb17IOJoFJoe9VT9ePyHY8C2q+OBEB5kBMtG1TxZOoZS73ogXW98u
	6TgZ+P83OCXHf10f7Qa7aX6Z6DsT4hY1xFTkjSUPlwNtwmN/VuT1whICFnVvg/nEDf84iZlFNBS
	RdbRWghUoj9UAJ8/CMUgPavSA+JffolVTBoBX9pyd7tcap8ZBPeXTVpdWCYrDCHL+U7Bo9U33rx
	M6SDHvkkyaOq0IyVOYxASQ/ygkSuCmeq3Tp3KvbQTVIo6DgLDeJjp+ZEP/FlNHTNGyeDjbZoRyf
	eMEw0bVcU5DzO5sxBIa7jxyYEJHWwwRdviUFeMC1CIvVMBPi57dm5PPsEOofVFH+L1ZBoEANc/V
	v/R5H3NY0Z2z5wv5D537ZYJ5cArSF/MmEmGZZZF9Ip+tB/Ns4+waTGXSK5ubr501H8tuUuQ6QJb
	6GtuvTmGrE8cdVrjb9WiajE25cjd5KLhNGrRbQSxtYdtht8Qlkn+xLplLRw/+Fdi29so88Gz7vq
	VD9vt3jt8iQnSZg2QoUK1r53K8vY3X2d7jod0ImY1UBLDEwXW+pgm2rzltwCDMU1/kRYQKp0Ot2
	GIHu3pAnwTLuAVc5AmsaGNDRsaXhV5bgc7qFFOe+T+u0bPmnFL6txQkvrg==
X-Received: by 2002:a17:90b:4b86:b0:3b5:35eb:5e94 with SMTP id 98e67ed59e1d1-3b535eb5ff2mr2981408a91.41.1795789556690;
        Fri, 27 Nov 2026 06:25:56 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm18324629a91.17.2026.11.27.06.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:25:56 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: report the too big error to the frame's own socket
Date: Fri, 27 Nov 2026 21:25:50 +0700
Message-ID: <20261127142550.66326-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

iptfs_is_too_big() calls xfrm_local_error() when its sk argument is set,
but xfrm_local_error() reports to skb->sk and dereferences it. vxlan
passes its tunnel socket as sk for a forwarded frame that has no
skb->sk, so an oversized forwarded frame on an IP-TFS SA with dont-frag
oopses:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:xfrm_local_error+0x92/0x190
  Call Trace:
   iptfs_output_collect+0x2c2/0x1170
   udp_tunnel6_xmit_skb+0x713/0xd90
   vxlan_xmit_one+0x1ebc/0x3490
   ip6_forward+0x1573/0x35c0

Check the frame's own full socket instead, as xfrm4_tunnel_check_size()
does, so a forwarded frame gets the ICMP error. Drop the now unused sk
argument.

Reproduced on a KASAN kernel with vxlan forwarding over an IP-TFS SA;
with the fix the oops is gone and an ICMPv6 Packet Too Big is sent. The
xfrm_state.sh, xfrm_policy.sh, xfrm_policy_add_speed.sh,
vrf-xfrm-tests.sh, pmtu.sh and ipsec selftests pass with and without the
fix.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/179551712630.3135.52212996809224784@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
Assisted by Claude Opus 5.5 (claude-opus-5-5).

A KASAN reproducer (single VM, vxlan forwarding over an IP-TFS SA) is
available on request.

 net/xfrm/xfrm_iptfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a9..ccdde630a825 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1813,7 +1813,7 @@ static int iptfs_get_cur_pmtu(struct xfrm_state *x, struct xfrm_iptfs_data *xtfs
 	return pmtu;
 }
 
-static int iptfs_is_too_big(struct sock *sk, struct sk_buff *skb, u32 pmtu)
+static int iptfs_is_too_big(struct sk_buff *skb, u32 pmtu)
 {
 	if (skb->len <= pmtu)
 		return 0;
@@ -1824,7 +1824,7 @@ static int iptfs_is_too_big(struct sock *sk, struct sk_buff *skb, u32 pmtu)
 	if (skb->dev)
 		XFRM_INC_STATS(dev_net(skb->dev), LINUX_MIB_XFRMOUTERROR);
 
-	if (sk)
+	if (skb_to_full_sk(skb))
 		xfrm_local_error(skb, pmtu);
 	else if (ip_hdr(skb)->version == 4)
 		icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED, htonl(pmtu));
@@ -1908,7 +1908,7 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 		/* If the user indicated no iptfs fragmenting check before
 		 * enqueue.
 		 */
-		if (xtfs->cfg.dont_frag && iptfs_is_too_big(sk, skb, pmtu)) {
+		if (xtfs->cfg.dont_frag && iptfs_is_too_big(skb, pmtu)) {
 			trace_iptfs_too_big(skb, xtfs, pmtu, was_gso);
 			kfree_skb_reason(skb, SKB_DROP_REASON_PKT_TOO_BIG);
 			continue;
-- 
2.52.0

