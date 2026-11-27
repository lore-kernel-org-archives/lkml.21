Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749904;
	b=dwRQBcRtVSH7DC7D79gQUmBS02LhnRgRdrYEIdZcNx5lNFJ/aaNMq06meyGt4BdgROeQ
	 B3CnCnk46O+7WWLrb8cRHjTVNMmKJvkCwQLWAAgVudBUC66eBZraEHYMeOpgchhmOckf2
	 nNcdbp0qSI+EKzUgyaLGb10Ui6fD1Lr4ENVB3ao4agY9xCrxFCGcH05GlLEdttqq4PM8Z
	 38eD30ZvR5Ef8Q00C4/jzji+4LmtsqQXyfrtR+BKcclu5jyVWv+/d84t2ftJBXfLcOaG1
	 fdRsJy0d+DlZ+WJfEkoSGOlgBga37XiAV5RFXkwGhuamfNZv64t86PVa7cvfaYXAKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=52am0+RGOkzPAIjdsmAaqktJxCKhWTpn1uKgbfEsWmg=;
	b=lIBK7B3f7evNfXH6hd7GGTGIfTGTo2eSSnCTZ7CM6PODujMgUAXQ/7DQr3ykR2sGrb3G
	 KnZ5RNVpIl5cu4g5BBrlcp88YZPExlcQUWDhsrIPh9Qxn7AN5DALenXrq0QCLW52zxzVC
	 zkKBgakhB0IkLPbEwFY8VynboSioc82SAYU3+HCWWhgbnkGufYxqbO+tgX7W0lEN9teDO
	 9ebqvTqIyZ2ULGqFLPM9bPtlMpVkuT6pFfa0mbqBXF3kebzT+A+4h7AXcfU2//ppwkXQK
	 nIM4DUkqWj72vGlLx3sbl88hzEwHXslv6wc4LjCERj0hi6PYwEt2NbRaX+BLuXgPliw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=(null) smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VBplC0tr;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF6606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FF6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VBplC0tr
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso3457422a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795749894; x=1796354694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=52am0+RGOkzPAIjdsmAaqktJxCKhWTpn1uKgbfEsWmg=;
        b=VBplC0trq5gc/oMI9ml+w8lfea3+OGihGigPqvVdBDIeBZX6KKDeyAYX2Q3+sksY5j
         DyOfaqj1sbFvBPd0lnYPLH7TjaSnfGBYLMF7gGF0B33mlMOkf9r9Px6FmS3PhrU6u7xO
         T67urYUqrKu9/33loMpXtc/ZAwH+c5IHeQu8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749894; x=1796354694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52am0+RGOkzPAIjdsmAaqktJxCKhWTpn1uKgbfEsWmg=;
        b=IASoIIl/oh2kO4U9cqk8UQ9OdFSHBuIJ0G7vizkt+R7qT9TSeC54L28oE1fgBFz/q9
         D8SvRcLSsIGxITLjdr/X9sChkjJcF5m3G5JD40Eot/OPBfF0FpPgUni+miE8UANXbG2f
         ZyRTS5K1WxS514ZuHoVB924XutRaYBRJ5Z8RyFkZOD10ZY0zG87EE/OjOXQk+/GgOzrF
         hjFFEzDakls+gPQEpKomy7tx+pV5eTjyUpHh5gICXEPxRggpu8F8EzxzraG5gPfYPb/S
         Mu0EwKNb2CTg6hXJmYaXh4zOj24RX4n/kGLKWEdr1Myeo7rxBnoejTnKfISwIRpKqQGn
         OzmA==
X-Forwarded-Encrypted: i=1; AL+hErH0fKZl0yxsF9+4NEJhePOsTJUVp2huzNL2PaweVi+IzL1FFhO1u0CmT61UC8/5wuak+adV36bdkieXb3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vM59Xus56tLfVfari07MWKRjCpWhg9dVKX9E7zP+t1fNSEQVy
	Li8uxMsg+UZUosBW3AJm+glYJbriDpVHGFYmgqSHIgOCb3Q4qxHPZCB1sxMuDqaOycZNKUcReDW
	Z1vCf/LDg2g==
X-Gm-Gg: AZFdTZdbHKfbBfyzbxvSmnSHuw7Cx8G4fIqIAJAYhCizRazlgld1hmugNsCC4mm0hEg
	+SoDcBP0aFTyc2GvOQvv2DN/m0qa7MXti5krOW6+/NRzCnBtr4Fkp04o4s/8TWqfAtS7s7tUW27
	oux2Ox0gQL53vTMdo/+Z7fb/ti9JDVcub8CGu9uVB+F2jcOa2qQVtJwtqqKeFSAkt1BgUoerLsR
	UWhUYzMQH0W0oEpQgYcWeoOriqclYuYFzhQ8eJkirI/aQ5dlZdiE32u8uWfuVSelzZgOEQPkPoo
	mMKm3uClH88gXKKQfZSWnPuNqw8lGo2vcDb8PwShqmqlyMY7Y+lqaunVvOn8vTsj+y2iFtryRTp
	ORwnJRI7b/oUkIJtaSCTikeIm+lCvDcp2ZPo3CVisz2W8qDfiPg88eFzdUUWgBpWFxiEVa6nIkn
	9OcSjwfcF8+bZNj1LybULTN93tpyjD07y4Ho8dToMNa0EcsKkxPQDqEgMVO70sxZ0juq2a+3KHg
	uBQYVEFkZg1Sz3rFWLCUR18DK+/g8QP/0IQJSCXymTFsELi+Xw4POBlGqktgz72mAjdlSH+3s0F
	UN4R2OxX89LIlV5L2P2q2WDA78ANVNFYCXAlZmNvZN97euqhn7+8UT/QqtOSUvv6G6EIdOkHt80
	YAyd7J5+4+G3wMNVVqN+6XCEJjPk3IMd4Lczpf4kREbNWjEBy6eUcnHvHtOEGu+NmKhvHLBQiia
	fzO37iIfjVjg==
X-Received: by 2002:a17:90b:4c4c:b0:3b3:ab74:cc9a with SMTP id 98e67ed59e1d1-3b41c55a3f1mr22245299a91.0.1795749893896;
        Thu, 26 Nov 2026 19:24:53 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm35791634a91.8.2026.11.26.19.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:24:52 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai
Subject: [PATCH net] rxrpc: fix the test for a sequence number being in a Tx queue
Date: Fri, 27 Nov 2026 08:54:48 +0530
Message-Id: <20261127032448.2631400-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

rxrpc_seq_in_txq() masks the sequence number down to the queue size and
compares the result with tq->qbase, but qbase is a whole sequence number,
not an index.  A new queue is only allocated when send_top + 1 is a
multiple of RXRPC_NR_TXQUEUE, so qbase is 0, 64, 128 and so on.  That makes
the test wrong in both directions: for the first queue it is true for every
sequence that is a multiple of 64, and for every later queue it can never
be true at all.

rxrpc_input_soft_ack_tq() uses it to decide whether the tail loss probe is
in the queue it is looking at:

	if (call->tlp_serial &&
	    rxrpc_seq_in_txq(tq, call->tlp_seq) &&
	    test_bit(call->tlp_seq - tq->qbase, &new_acks))

new_acks is a single unsigned long, so when the probe is at sequence 64 and
qbase is 0 the test_bit() reads the word past it.  A peer that soft-acks
without ever advancing firstPacket keeps the first queue alive while the
call goes past sequence 64, and KASAN then reports:

  BUG: KASAN: stack-out-of-bounds in rxrpc_input_soft_ack_tq+0x467/0x530
  Read of size 8 at addr ffffc9001363f848 by task krxrpcio/0/9662
   rxrpc_input_soft_ack_tq+0x467/0x530 net/rxrpc/input.c:959
   rxrpc_input_soft_acks+0x2f0/0x4d0 net/rxrpc/input.c:1014
   rxrpc_input_ack+0x6c5/0x910 net/rxrpc/input.c:1199
   rxrpc_input_call_packet+0x1db/0x250 net/rxrpc/input.c:1290
   rxrpc_input_call_event+0x16d/0xc30 net/rxrpc/call_event.c:338
   rxrpc_io_thread+0x534/0x860 net/rxrpc/io_thread.c:531
  The buggy address belongs to stack of task krxrpcio/0/9662
   and is located at offset 40 in frame:
   rxrpc_input_soft_ack_tq+0x0/0x530
  This frame has 1 object:
   [32, 40) 'new_acks'

Compare the base of the queue instead of a masked sequence.  The probe
detection also starts working for queues other than the first.

We found this with a syzkaller-based fuzzing harness driven by an AI tool.

Fixes: 7c482665931b ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
Tested on 7.4.0-rc1 (63fe746a609a) with KASAN, same config and image before
and after, with only net/rxrpc rebuilt between the two.  The fault needs the
tail loss probe to land on a multiple of 64, so the reproducer walks the
transfer size until it does and the rxrpc_tlp_probe tracepoint says where it
landed:

  before   pq=0x40 (sequence 64)   KASAN: stack-out-of-bounds
  after    pq=0x40                 no report

 net/rxrpc/ar-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..cdf5736d88a4 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -1580,7 +1580,7 @@
 
 static inline bool rxrpc_seq_in_txq(const struct rxrpc_txqueue *tq, rxrpc_seq_t seq)
 {
-	return (seq & (RXRPC_NR_TXQUEUE - 1)) == tq->qbase;
+	return (seq & ~(rxrpc_seq_t)RXRPC_TXQ_MASK) == tq->qbase;
 }
 
 static inline void rxrpc_queue_rx_call_packet(struct rxrpc_call *call, struct sk_buff *skb)
-- 
2.43.0

