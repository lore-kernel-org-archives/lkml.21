Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202621;
	b=QqRANOalwmrzs/wZRF4aQiujFnfzy+ST8dfSZXu61SzgwGNaMDzxvd4hYtYHBCVytPdK
	 jRapAh9CfipJRSXGlElpY7lzhdvSLCSTQ2vwsFkhVg5Hu0z77zN54kUyPG2khZidMdFUw
	 3omqn4FblDYLKO3kZAhd9tjuHgoR7niG09aTm02IiGCzvH6ZnE74Gk5MTTXggW5jOVWc5
	 bRnHVoAmewTzcGO2/0JOHMfJD1Bo2/GrA+lDrhKeQ4YD3ZtEzhFaRewiNlFM42BqeY3WC
	 T38cguuIjzaie0IIYfKnK9HI+HySuZYsq7VAjtNWhkseKjWuHk97NcKOK7uW45NgkgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WA5kH6g2rHXaT3SqVp79TdqL6vsLj+rBSzEJqsx/Hwc=;
	b=j1m7psfh1geyCl+JE/16OQO/gpdf11sTVGy6ERwf1jzGUIwYZeqsDpahI8tpPBbuHtn9
	 v9lP2bjGPz/gvqtHdL4N2XqwHbaudzM8t2Oi5IZr3il4Ltzx7d5HV8/FhVzElyAy90wOS
	 KVSqH/5bF5yX+i2NxD8a5iY0Ezj2u9RokMnDnUoq0SbfUeGg39nynOBxBSyk1H3h8NcWD
	 19I59BDf+PGiRYG/ylGzv3PbVXM8Sd7GFHDOWZKsZXJ91Wyry263ln361+n/dRqB7HH5U
	 lA1MpwpPCafcIM37IqpQDr5G0UNklky21zsUWnAE3bDg6dv4Etwac7fBr97ZG9brETw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=TIUK28Kr;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D4C606A6E4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D4C606A6E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=TIUK28Kr
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8629ef48703so729096a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795202618; x=1795807418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WA5kH6g2rHXaT3SqVp79TdqL6vsLj+rBSzEJqsx/Hwc=;
        b=TIUK28KrHHS/jEIHaRwd4V3J2bTkqF68AyeJA7kxAxFkCrDgrzR0UWEsPIpj2OLGnF
         wnMAFZO0ockNTR/JIsRZw23QC4Jqil0LamS8z1CgD8Sc04RBrwMS91VYsq0h6YV1zFHx
         uGq0Epykbl00jRMqwPJTZUoP7R6mG5B19s8fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202618; x=1795807418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WA5kH6g2rHXaT3SqVp79TdqL6vsLj+rBSzEJqsx/Hwc=;
        b=cXOkn4W+mA85J6abJYVjZoUjGlrH8Z2f11BaiIy5OuNRSoK25lJTnBAwZi1RtpRqF2
         j0arbVofTlwKxZNEWz5sF5eeNLhEwEh8b0L0e//xUExdT42so8HKGlTswXU8UkklajlU
         w6aRlvBjKpwOHq9Qb2leQn7g8oqwjW/+1MHoZHmTleARfrbTTU7C8qfkQCG2fBU9WzsP
         WDC2FWnL+1OiEVvpOeBocqA98CEjx7Uk6rKpi59ccNJYNWOs9P8tcSgFXULqNyBrSJGr
         9YJZuE15684dHizji+x51FtUjHAp4vt/hCkUewqrDPqRrp3WKEsRY7m051ttzjF/tMze
         3edQ==
X-Forwarded-Encrypted: i=1; AL+hErEo5JCtvJZDgAwHEMfEWEc2s4z0PVBGwQAdaCU9JxJiT2fRTKfC0pwFx51OGYl+vhma1k0BDFop46AK7rI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yUwTwQbX3o3ugdGx9897OcdZuvvy7bOGAUCUbbequInxdXnbq
	mghHENPe4m+AnFzc1dW92+gPsvp3REcjCxc38FGrB5EHabZ1PqNxLTQ0KhicoMneB30=
X-Gm-Gg: AYBFou1bHTrZSgUG8HB2xaEQD4QVRG/1nzp015vfaF2D2A6suwtVRYIJGmbnjo85QXG
	kPSCR8od06I5D+9QMdW+fyF7hSLttV0npLzWUy/NZNcuvHex78MwabAEyutV0SnXl95tp10iaE0
	67hJFj3zUkbOq6wuALLWNNTPGdswl3sJZpgOU5U+ETLJhKcwHTcHeSCLbBKM4QH6TGXcLkqWhSJ
	oyu5gz4LaHvfJR/EWyJSERHyYF30io41sDWvjtnyf09b0NiDr+9XIYZV0Nedgvo/my8PmA+FtU5
	adLD54J1g06mLVwaofCpsGWCCjR+E9A8df3Zokw7AtagQz9CXgfAZLlzhBjLLavbB3LCf1KmIWv
	SXNq7LNyqzcVsvAfC5rmLnunI9vQYhdok/hoe4BBSexMa77IO4ure16uZz372H+8dDEnfhu1mnJ
	xn0AcXCyQvIvpHHHbfrP/E5fFTUJqosD/le9bARTIEuclwHZtvazIq15fsTabJ2Y6zY/A/tYYm/
	PDZs5PhaSu9Zjhhe2cF6qQ1KbfxrcuJudziJZ4u7d2jTDg3h0RSroabZ7c/K0axwNLVhe6O7WAK
	gqVNprkFRefqR8f2yfLyCZUtXEEZG6Lm7OklviJj7rZ95FoXCj7ZG2RXLMIIG9p+083XKxx3KLG
	ZO44/S+NkjTfE25KkhvVwbe7dXke+Wg==
X-Received: by 2002:a05:6830:640b:b0:862:a000:c45c with SMTP id 46e09a7af769-86315963a10mr5573204a34.25.1795202618333;
        Fri, 20 Nov 2026 11:23:38 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f6d33sm2639106a34.18.2026.11.20.11.23.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 11:23:38 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH net v4] net: preserve skb header offsets during headroom changes
Date: Fri, 20 Nov 2026 11:23:30 -0800
Message-ID: <20261120192330.48965-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

An MPLS LWT route over a netkit device configured with large headroom
can make aligned skb expansion wrap the 16-bit network_header.
Neighbour output interprets the resulting negative skb_network_offset()
as a large unsigned pull length, causing eth_header() to write outside
the skb allocation.

Reject growth that cannot preserve the network, set MAC and transport,
recorded inner-network, or partial-checksum offsets. Do not relocate a
set MAC or transport header onto its unset value. Check the actual
post-pop positions in skb_mpls_pop(). In native MPLS, bound the post-pop
offset before decoding labels; reject excessive LWT headroom before
reading the IP header.

The issue was found by an LLM.

Fixes: 1a37e412a022 ("net: Use 16bits for *_headers fields of struct skbuff")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
Changes in v4:
- Move the native MPLS headroom check before label decoding and
  multipath selection.
Changes in v3:
- Check the actual post-pop MAC/network positions and reject the MAC
  unset value in skb_mpls_pop().
- Check a set outer MAC header and a recorded inner network header
  during positive relocation.
- Move the MPLS LWT entry check before reading the IP header.

v3: https://lore.kernel.org/netdev/20261113235019.74384-1-kylebot@openai.com/
v2: https://lore.kernel.org/netdev/20261110051258.64350-1-kylebot@openai.com/
v1: https://lore.kernel.org/netdev/20261030042246.74144-1-kylebot@openai.com/

I have a reproducer for this issue and can share via DM.

 net/core/skbuff.c        | 35 +++++++++++++++++++++++++++++++++++
 net/mpls/af_mpls.c       |  3 +++
 net/mpls/mpls_iptunnel.c |  3 +++
 3 files changed, 41 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1ac1e327ac4c..bc836adafecd 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2130,6 +2130,28 @@ struct sk_buff *skb_clone(struct sk_buff *skb, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(skb_clone);
 
+static bool skb_header_offsets_fit(const struct sk_buff *skb,
+				   unsigned int nhead)
+{
+	if (!nhead)
+		return true;
+	if (nhead > U16_MAX - skb->network_header)
+		return false;
+	if (skb_transport_header_was_set(skb) &&
+	    nhead >= U16_MAX - skb->transport_header)
+		return false;
+	if (skb_mac_header_was_set(skb) &&
+	    nhead >= U16_MAX - skb->mac_header)
+		return false;
+	if (skb->ip_summed == CHECKSUM_PARTIAL &&
+	    nhead > U16_MAX - skb->csum_start)
+		return false;
+	if (skb_inner_network_header_was_set(skb) &&
+	    nhead > U16_MAX - skb->inner_network_header)
+		return false;
+	return true;
+}
+
 void skb_headers_offset_update(struct sk_buff *skb, int off)
 {
 	/* Only adjust this if it actually is csum_start rather than csum */
@@ -2317,6 +2339,9 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 		return -EINVAL;
 	}
 
+	if (unlikely(!skb_header_offsets_fit(skb, nhead)))
+		return -EINVAL;
+
 	if (unlikely(skb_shared(skb))) {
 		DEBUG_NET_WARN_ON_ONCE(1);
 		return -EINVAL;
@@ -2535,6 +2560,11 @@ struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
 		return NULL;
 
 	oldheadroom = skb_headroom(skb);
+	if (unlikely(newheadroom > oldheadroom &&
+		     !skb_header_offsets_fit(skb, (unsigned int)newheadroom -
+						  oldheadroom)))
+		return NULL;
+
 	n = __alloc_skb(newheadroom + skb->len + newtailroom,
 			gfp_mask, skb_alloc_rx_flag(skb),
 			NUMA_NO_NODE);
@@ -6804,11 +6834,16 @@ EXPORT_SYMBOL_GPL(skb_mpls_push);
 int skb_mpls_pop(struct sk_buff *skb, __be16 next_proto, int mac_len,
 		 bool ethernet)
 {
+	unsigned int headroom = skb_headroom(skb);
 	int err;
 
 	if (unlikely(!eth_p_mpls(skb->protocol)))
 		return 0;
 
+	if (unlikely(headroom >= U16_MAX - MPLS_HLEN ||
+		     (unsigned int)mac_len > U16_MAX - MPLS_HLEN - headroom))
+		return -EINVAL;
+
 	err = skb_ensure_writable(skb, mac_len + MPLS_HLEN);
 	if (unlikely(err))
 		return err;
diff --git a/net/mpls/af_mpls.c b/net/mpls/af_mpls.c
index ad4ad6f2001a..f6b77570ca48 100644
--- a/net/mpls/af_mpls.c
+++ b/net/mpls/af_mpls.c
@@ -403,6 +403,9 @@ static int mpls_forward(struct sk_buff *skb, struct net_device *dev,
 	if (!pskb_may_pull(skb, sizeof(*hdr)))
 		goto err;
 
+	if (unlikely(skb_headroom(skb) > U16_MAX - sizeof(*hdr)))
+		goto err;
+
 	skb_dst_drop(skb);
 
 	/* Read and decode the label */
diff --git a/net/mpls/mpls_iptunnel.c b/net/mpls/mpls_iptunnel.c
index 1a1a0eb5b787..5123394234cc 100644
--- a/net/mpls/mpls_iptunnel.c
+++ b/net/mpls/mpls_iptunnel.c
@@ -59,6 +59,9 @@ static int mpls_xmit(struct sk_buff *skb)
 	    !dst->lwtstate || skb_warn_if_lro(skb))
 		goto drop;
 
+	if (unlikely(skb_headroom(skb) > U16_MAX))
+		goto drop;
+
 	skb_forward_csum(skb);
 
 	tun_encap_info = mpls_lwtunnel_encap(dst->lwtstate);

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.55.0.openai.911.g06873a30d2f3

