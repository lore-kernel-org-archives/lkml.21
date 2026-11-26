Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664663;
	b=JGEIHsLp8qVg4YfiZoAFNTNUVix0fgy5A0zNWZ9sz+UCDha9bZuaOKuQbMF1MaU+fNNF
	 zXjNnThDPLdNWOAIOIg78DFDRVS4rIGNabvSYWm6mnUgtWcye4UWyaPBINjuem+qSQ2oA
	 iaeBBLuDD3H7WnZc8nTUib+Xa95l+5AidzOmysB+q4tOiqQcpbSfBPVEL0GeqQgMe6F9g
	 aIe18dZBkoV/bVS94BzvCW8cZmd9CQF3N1Au90KmsZAY7q+NsVWdfjX+i+sivKjhF/ndF
	 Mu2YVhPQQahdmuzJr7ust5ylHeqWUUmZcD9t1M80pKvMEQ6wDoTfnK/ezIzb1tjn/4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tIBO2BUTqLnTN0WSYteEPUPQWOKHzyHrEAfQKEoCCvQ=;
	b=ao7sCh6GRJL9my3VgMqpxvMpx8rM0VFKAL38IP+0hkYPc9Qsjb3bSHiCgiXdZCe7y4Ke
	 CdHDu2ihbs3wi9ILd1ikp2hdzvxyyiYfCc09v2lBcMVUHzqnw/3g4YM0RidNaxhpD0rxP
	 mLLZZ+kvEZD+EzOI3Ym+tTdJprNj8fAjPvAwqyR7tzlkXVBa5DgIsmjK7yJveXwPkdoA5
	 lesj7+b2FmVqumgZ+Gm5dYylL09Xsz4SYYCWL2oUnyJ0e47UKx2kR9ZwbVEsG3d+1XMUh
	 IX2JHrLfj27JfAx6x2XFhT/q4q7tlzFvLnH+vrlmQJp1HJSarytadvLhrEZm0k3f6OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rDvPnH5Q;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A446606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A446606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rDvPnH5Q
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-89d6bd67045so3081968b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795664663; x=1796269463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tIBO2BUTqLnTN0WSYteEPUPQWOKHzyHrEAfQKEoCCvQ=;
        b=rDvPnH5QZMdTGsxXLFq6yBa7Rae/o6kaBkovnkvKsXmGe+R1gObeMRg9eJ7DZextSf
         v0pu4vnn4mRlgoU6jghwZTDX/RLN9uOmFdfbzO7uliWdv7xYcGwvN5etlimmXZZirZB8
         VSK+kvmQqw9Fs3zaKw2sBgpALl3gkmhzcStG7rxn4TIqeQzGSsPQyVAij4fuVfiSsrRq
         uHsA8uzDtnWEAmTB7EY28Uw2aVHQdQxmY1yEh+11WwiXJgufemNN2GGobDz3O3QvFRYm
         4juINxCbiQueqb7MEW/H+wfN8zw+K5AgwAwYHdZi/tQ61cBAGTFCRMwdVtyU9vG1Tos8
         eIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795664663; x=1796269463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIBO2BUTqLnTN0WSYteEPUPQWOKHzyHrEAfQKEoCCvQ=;
        b=Dd4eG6nLYqS20nMOyHnSLdPHosIsDNu9XI7EmjW0ucuVds3xJhHfl7XApnA5Z9G6gw
         X6S2q6uCXh6pHnsQwj0F+RgQX1JTfvKtVAHve7a2IgNoINqz+Edm2tPhSdvhtvuEO/UI
         rULhsXrVcJOy2ykl/1GHGoKA24ZcnMQUWCGUd1uOM7jgblCm/HbPT8dyV9p0hkrigzjq
         hrNtTmTF6POLWQdUHYWFZG6zH/XXRcnUaHdDze6q1THnChqkjOQe6w5MHeKS+WiGwQKm
         VY1vnw1WOfQdthzABMIl61M+NR7leGUPfJZZn2p/STlFlZwixKJybWO3/E0lcvV9SkWn
         BBdg==
X-Forwarded-Encrypted: i=1; AL+hErEuDznsdIL0kFcuaMIMrgBmrmmZy06M83DjzGgmjGnZJNW/VT6DduGacXCiEj7Z/JH7rTZvhyroEyH1Jm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hlso0VF1U1DP5clj/BiU/BtbnMzAg6rS3dnnCIvf+tHf0+Kh9
	2ptoPbm+Qb/efJf6Jg7Z8lSRsv6mdcY0wvj2Bpa1EkJdV2pFgAGFMgAa
X-Gm-Gg: AZFdTZd4iZAJXfU5Vi+kOJM5iURAEaAJfE7vQAZOOWMxiHqqdqEnFtlgCr2gXOjfWgR
	Im4Mse7pynoFsh0FHZk+9IXhUYYLV///mZuhbi54rC9R6/7sybIvcs1z2zEN5LIwF/S6fhJhsQ9
	uPM41D3ykgNPnTqPFWwz0ZOY+IFmAFyziJTUxEXy++SZ/AiLSW9gET8vKg2LjLztNAtYS65njLj
	bI/UMusc+ohofoG3cm1JNikhKX6qcsBKmUbvgX1MchL/X2wrh4X3MZKMr0itIHOsOdOE8lykdjc
	aGykMm78m5FcRpvKIuV0rmHJQkxYtnEGBviDqj6xq2zHS1Xe5TEpxp9wZXsNWdUeD7wedx17Nma
	CZBW0vKBRAI7RfJqDEoyotaI1RTLXLoCwzsGuLiFKQ14LuDCFN+WWrxDm/9r1/OBvW8jOvGE2Ui
	XnMi4XEcAi2VaVQRIAWQXi1xoE114gcAq5nH6IwDlapRcnDR0RPp1ks6mmEKRZg7EX/1wr7IFXW
	hInNvRGKf8/zGlpYv3WuW9SZkfWkQBKvxK0ZG3MLa2aY1EfHFz49aBKOoKSk9SeCXcKoJOFeA9Q
	cHGioCOkqn1xHnnl
X-Received: by 2002:a05:6a00:27aa:b0:89e:37b1:b820 with SMTP id d2e1a72fcca58-8c8792bebbcmr12357321b3a.2.1795664662746;
        Wed, 25 Nov 2026 19:44:22 -0800 (PST)
Received: from dell ([58.246.183.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm10018512b3a.39.2026.11.25.19.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:44:22 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] vxlan: fix out-of-bounds read in DF inherit path
Date: Thu, 26 Nov 2026 11:44:12 +0800
Message-ID: <20261126034412.2799912-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.53.0
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

vxlan_xmit_one() calls skb_vlan_inet_prepare() to pull the inner network
header into linear memory before assigning old_iph = ip_hdr(skb).  That
helper checks skb->protocol (skipping VLAN tags) and only pulls an IPv4 or
IPv6 header when the inner protocol is ETH_P_IP or ETH_P_IPV6.

However, the VXLAN_DF_INHERIT branch inspects eth_hdr(skb)->h_proto
before reading old_iph->frag_off.  With AF_PACKET/SOCK_RAW, eth->h_proto
and skb->protocol are independent: a 14-byte Ethernet frame with
h_proto set to ETH_P_IP and sll_protocol set to ETH_P_ARP passes
skb_vlan_inet_prepare() with only ETH_HLEN bytes pulled, leaving old_iph
pointing at skb->tail.  Reading old_iph->frag_off then accesses 6 bytes
past skb->tail in uninitialized tailroom and copies one bit into the
outer IPv4 DF bit.

Using eth_hdr(skb)->h_proto also fails to inherit DF for VLAN-tagged
packets and reads past the nonexistent Ethernet header on VXLAN-GPE
packets without Ethernet encapsulation.

Use skb_protocol(skb, true) to match skb_vlan_inet_prepare(), as the
TTL, DSCP and flowlabel inheritance helpers already do.

Discovered by manual code inspection following the sibling geneve
DF-inherit fix, with Gemini assisting in path verification and preparing
this patch and changelog.  Verified by static analysis and compile
testing only; the out-of-bounds read was not triggered or tested at
runtime.

Fixes: b4d3069783bc ("vxlan: Allow configuration of DF behaviour")
Cc: stable@vger.kernel.org
Signed-off-by: Yuansheng Yang <0xbeac@gmail.com>
---
Sibling geneve fix on netdev/lkml:
  https://lore.kernel.org/lkml/20261125235524.4139551-1-xmei5@asu.edu/

Testing: drivers/net/vxlan/vxlan_core.o compiled with W=1 on x86_64
(GCC 15.2.0, CONFIG_VXLAN=y, CONFIG_KASAN=y) with no warnings or errors;
git apply --check passes.  Not dynamically tested; no runtime reproducer
was executed.

Checked against net.git HEAD ef3e21c61baa (whose vxlan_core.c matches
the base-commit blob below).

 drivers/net/vxlan/vxlan_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37472..76a1828111ea 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -2551,10 +2551,10 @@ void vxlan_xmit_one(struct sk_buff *skb, struct net_device *dev,
 			if (cfg->df == VXLAN_DF_SET) {
 				df = htons(IP_DF);
 			} else if (cfg->df == VXLAN_DF_INHERIT) {
-				struct ethhdr *eth = eth_hdr(skb);
+				__be16 inner_proto = skb_protocol(skb, true);
 
-				if (ntohs(eth->h_proto) == ETH_P_IPV6 ||
-				    (ntohs(eth->h_proto) == ETH_P_IP &&
+				if (inner_proto == htons(ETH_P_IPV6) ||
+				    (inner_proto == htons(ETH_P_IP) &&
 				     old_iph->frag_off & htons(IP_DF)))
 					df = htons(IP_DF);
 			}
-- 
2.43.0

base-commit: c710c654b8a3c92b34e38740dc17c29daf5b222e
