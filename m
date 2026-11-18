Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003271;
	b=BefaL3qSy+tGZx/7ioTS+n2STQ0D9rHAnvzplsUbRO/L5D4AH7tG/KFmExHw2zh5Egez
	 ZsagOPatT5BYXfm/pHJHgRv7ccUK5Ey92tX5xiLtKBks98OanuFzrJ7KBKsFpFOI4p9Df
	 CaFZ//u36ErJnKjKqdHt8sJXYiitjglCz0wNd9rlA2gPaY+ZsWHRERVif9bvr04XR3g6B
	 iSI+LL7Y8eFgK1+2JVlZvBSz7bRW1qKwz7QcjkOTEh7ZH/rtyB1apD3ciGgBKNJ+Emwp8
	 tm+9sl2sHspNVqPmpbTAbXNlmC21uwnXF1ygiHbIPW5mYoP6u8Flmpbtlv+IBVEvPkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1c90KFVvzpFDqnGvEd8sXMtLzVt9oSB8UiZ61ce5p98=;
	b=wtUrae5CC+S5OLLzXq4wycNSYFHacN+EWOmgFYrpxdiHzo1Z03hM521CGuXs1bgUHlYw
	 jd/f3e23rB5okexUH3X29Kz775m/mGL5YDeyPZypCOlfNnyPVBehpuFwOkH0EWeA/4Pdk
	 lCe1ZEFc/P2E2+7aLvg3l77AUgaXYEEsuC0ocerRtdFtRpDLz7Bir7KCyfqTAZi5c81r3
	 CCvLJ8N91zSpg+T6i18OTgCPam5FuWcCi1Zio1N87fXYT/EGOsmkENOpOAsmoALDZUhDn
	 n450Ur+Zg38lhKmztWfzXT74EtujhREAhULAxmkPiBFdJbGbKxQ+36xRGUmdQR43wpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7nPcD0M;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32A2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7nPcD0M
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b271e573adso387876b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003270; x=1795608070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1c90KFVvzpFDqnGvEd8sXMtLzVt9oSB8UiZ61ce5p98=;
        b=m7nPcD0MsmFjwaSi0bTu3XZBB4Bvzdi8UzkKfUfnAjo0PAp7SxyrOh555DMvwuQlrQ
         a3SDjgg9/bmEuDfxcQP6k4IA3ny/wYt5w+1FGTVrnWmWQilwYeGKALWG8kOLlCFJ3Hk4
         1+72ZTgoynsRxhN+fUpy/MnCRU7W325ASLYiNAJrWG/4eqGM4fRpk6dRStVypWmAVJ5C
         u9j1JwL9N8dws6FTEb3AiwX4SSUKI7lw7l/orjml7n4SsQEkDYWQz3tkWCTLOKy7VOp5
         XKamIegSpU+xhBI16DbBwZ3AC1HYS8uh0fVjJc2gj5lGiJdFNiQIr2dkLKdbmB4pl8+P
         SmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003270; x=1795608070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1c90KFVvzpFDqnGvEd8sXMtLzVt9oSB8UiZ61ce5p98=;
        b=Y23RsgxG50IqsXIGC+8Q/nEAi5mF56tAvg6WqhDj7rgsllRh4ox9rMnRJLUWboXcVY
         PMRedKRnRjsTr45piD7e+qoj4yrDHXpPRfJcExIsRvQFb8G0Nch42Eo2dHWCRjSEei3K
         rIANFi/cq5NyEwJu/yLJApXa1JvaXFEerPngXHHyAhlCMw3XDvwy2jH+STPAgM37Xnqc
         23bvM87nX34D9cp3N5AhtvJFVFO0O9uSEIutigRAbLJZRXetzRBex5RhbZ2hn074NBAb
         79rzs2kZqL3j+jBIl76v6XYJhHWCJXOamu/g74mfGrN5Xn4cU9ac6sySIu4KtimglpYV
         PH5g==
X-Forwarded-Encrypted: i=1; AL+hErE5/YmW9XzQGb0ezHJsyHmn6KXI7l6UfAjBx2FyK9rCK7hnfdTeRjJefQIprrdVJV8jBqKuMJJvu+nF7/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CesdxK3QeVbZ0uyceqyfWQaMnqhRXFA8aftW7AxOCvFgFU8RO
	FzPeVaTz3KkIgBIe7dDryxCnoZBf2LqB/dUGq8e6HVz5Qp9w2BynvgX2
X-Gm-Gg: AYBFou2YYK5JYrlCN32F4LlICjIChqmLCxslfzz9N95P1DbGH5snn4zx2lyxUd2U42k
	oXip/zbDsaJp+hyrdU3gkcWOSKXkG55gRrsmY0oWO5Q9i86/yvM1l2VJzyRTa1mvQXgmyYWc2vh
	hWDmMKlBHO3p/tn/mVYaW/Sgir8oD9CTRmMTs0YGEnE6dIMcFLMVpL3oTJ3j1uijuXyAjjOMM/V
	CN04Tjk6l+e+f+xaG0pig2Bhg3VZw61xIfLPjYQfqtvBYkapsJfgx83ZQTfHXFn70Hz77NCc2rx
	7So+/Z5ghgwG6cSxdPVPIhpI6uTV5y5uOL/U8K6SOUpULrj/U6HdmMlSTzpYo/2457kfVxNFU0c
	Ct1n+4NImjcqZOPWuodWRxXWPQb00vEoRLBWSDp+vW/YF2QMUP9cWui9lhj5/xJP9NVuA42ySEW
	T/g71dlZzC/jIpeq8u2P5oYJdYP5UyxiPNulKpIwkGVaBD5eU9bbdrOSMlY0G1riZlXHm9ou+Ig
	XtRe05PqfeXmrgCL/z+CvAHNhjT5kC/Pi+rFdzPRu/IiHt0yLHKgLqiHMjGHbqJV9bagkZBn6Dq
	nt0k50t+v0CoVkP6fdRzM0CRFBdyUIvkUBPxV1ZcvNUEiBq4VHLSDQyUGTnZaPtSpGl/0yk=
X-Received: by 2002:a05:6a00:1820:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-8c5d44e78a5mr2240369b3a.24.1795003269690;
        Wed, 18 Nov 2026 04:01:09 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb54e413sm1115220b3a.43.2026.11.18.04.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:01:08 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tap: clamp zero-copy copylen to remaining payload length
Date: Wed, 18 Nov 2026 21:01:00 +0900
Message-ID: <20261118120102.3717000-1-graypanda.inzag@gmail.com>
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

tap_get_user() derives the linear copy length for zero-copy TX from
hdr_len or GOODCOPY_LEN without bounding it to the payload remaining
after the virtio header. tap_alloc_skb() exposes that length in the skb,
but zerocopy_sg_from_iter() copies only the available payload bytes.
The unfilled tail is transmitted on the underlying link and can expose
stale kernel heap contents.

For example, a 246-byte padded virtio header and a 14-byte Ethernet
frame leave only 14 payload bytes, but a zero hdr_len makes copylen 128.
With a 512-byte virtio header, a guest-supplied hdr_len of 256 also
passes __tun_vnet_hdr_get(): it checks hdr_len before skipping the
padding. That makes copylen 256 for the same 14-byte frame.
Larger padded headers can raise copylen as far as good_linear.

Clamp copylen to the remaining payload length before allocating the
skb. The minimum Ethernet frame size has already been checked.

Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Replace the Fixes placeholder and add the co-developer trailers.
- Document and reproduce the guest hdr_len > GOODCOPY_LEN path.
- Shorten the code comment and keep the C reproducer separate.
- Link to v1: https://lore.kernel.org/netdev/20261113164903.785381-1-graypanda.inzag@gmail.com/

Tested on Linux 7.4.0-rc2 (067c5c24cef2) in x86-64 QEMU/KVM with
two vCPUs, CONFIG_MACVTAP=y, CONFIG_VHOST_NET=y, and CONFIG_VETH=y.
The guest used vhost_net.experimental_zcopytx=1 and init_on_alloc=0.
Each case ran in a fresh VM with TUNSETVNETLE enabled.

Before this patch, with a 14-byte Ethernet payload:

  [POC] case=A
  [POC] case_a_hdr0 received_len=128 expected_user_frame=14
  [POC] case_a_hdr0 tail_bytes=114 tail_nonzero=98
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=128 control=14
  POC_EXIT=0

  [POC] case=B
  [POC] case_b_hdr256 received_len=256 expected_user_frame=14
  [POC] case_b_hdr256 tail_bytes=242 tail_nonzero=82
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=256 control=14
  POC_EXIT=0

With this patch applied, using the same inputs:

  [POC] case=A
  [POC] case_a_hdr0 received_len=14 expected_user_frame=14
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=14 control=14
  POC_EXIT=0

  [POC] case=B
  [POC] case_b_hdr256 received_len=14 expected_user_frame=14
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=14 control=14
  POC_EXIT=0

Disclosure: An in-house LLM-based analysis tool developed by the authors
assisted in surfacing this bug candidate and drafting the initial notes.
All root-cause analysis, patch code, and QEMU/KVM reproducer results
were manually reviewed and independently verified by the authors.

 drivers/net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..f25c58d6e986 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		struct iov_iter i;
 
 		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
+		/* The remaining payload may be shorter than copylen. */
+		copylen = min_t(unsigned long, copylen, len);
 		linear = copylen;
 		i = *from;
 		iov_iter_advance(&i, copylen);

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
