Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401330;
	b=t/6CFpNP3dqWcGDrNKWUg8lbcyS/xGs2v+O0le7UOOHLGEORzRQ+5WFVxdsPFJvaOkl5
	 utoe0cQ4Jkk0TQlR7HXeZjztiYsMyDQrfAYuSYM7pFr28jLBv5Px63QLvgG84XDV97IDn
	 9FhG6kw0wJ0KXezOjkUPZJ53vw7xxGUypbKnZZ0nj9LQdE7lprVxIQE74+vNdsfXPt57/
	 6J1ebmBc9o7AbhinEnxqAw17qYa+vjlklBbgyVr87j3NXMnrWlUi8f8TNeOhz0pO/6tOk
	 KXfnpqbtO4BmX1daqECEo+uCaMoBugxgUWHTb3V2yKrCapYYZRr+FVQCN95nPZNtkMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
	b=cM4rBIDSAxVCYhwJBdicsA85hR6CNaTQLPHawOPCmcnFC6EXg06yiODIJG8fPpiFDXx2
	 qGvV4L3qlnbbMtIwWom+YR0w4btTkFJApTjOOkKtECn/+kLXkfyN4E+LAK5GWN5nVA8Zj
	 rHD+I8MXFYneuJKYxPe25iFYiSCvCoCQaC9inSOSP3bry3iTA7KpL6rW+tTnjUIez9oHV
	 FuhRvtnsM1VX5KjXFpQXYmzWvdq0cnvc5GTDZrKu3zj4RbtzOrX7Zx7KKLqQUhT+hj/qD
	 eL5NtUtoQ1bQwt0+TqlwWim+5RoBZwdus00xQmWAbGLEvmjpOEazDOps5h6j78tbMeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="VvB/gHVf";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7DD606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7DD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VvB/gHVf
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0464dd6b6so14777545ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401328; x=1796006128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
        b=VvB/gHVfJLWn6n5wEIFsFijRGKd7mKTFlb2ToYtj8fFMD51k7tp2A48f3VANoQ07mZ
         qkdVQuiIdId4E/jI9cpMSUeTbqqsxUpcRscDfxi1b8GbGBsheFytaVRYCqPNTCzAUSiH
         PzLCLsWBU7/Um0FX04qV7WyQl/abRPSo3MzGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401328; x=1796006128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
        b=WCSV6sr2QPDjrhy9MDhoOuMucIX7b3Urxkp+47Cr2kiDnncJnVzcUtxAnR9H5lRrLe
         FzLdA8bprSvswABV7yFp7VBAFcY+3ZfvI+PYzkvDAXn772QFdQ6+1CVrB7q8gg6bZLVG
         ChMnyJjhtJN1DAto6Kw96OQqXKI0KrD0dW/CQlLCA+NCIzagBBbcxnB794egElHVcUle
         R0fd5O2YKGJGj30/LaJUMHFlLdSN33FpRo+HffG+TRaWIrSEyyxQ7x2+I/CBfOtfMAjO
         WP+P1Mjb2kSGCRCvcIuwS+efXnwxTP8GyKu6aiyrnT9vXU0+Q2jzxyeuS7vJh67iKlxP
         0SKg==
X-Forwarded-Encrypted: i=1; AL+hErHIcY2Q20vavUpsqmcGL4pjVhFF1jJ/GzjBpG5k/Z2p7rqfRGlFRUD4V/J3l/uuje9PQyN0STxNz4tzLZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dE9wOiQjk6JqpxSNe3hd391UC8NC7tFcOjEFftw+VxHLdN7L2
	36aF8G5C+/xPLPeO11nf7hQUr0MfX8cb+ltN2Y41W92fS4FgVtmfc+V4tdF4X7/ks4WuXCXwV1G
	vqFda
X-Gm-Gg: AZFdTZeRPty3Qc/mnzMx7Fy2AdlHcaT97HF0eDJUxo/q7LlIFGHR2v/k/5UAeP+MRep
	H/1ccSvq4bsuX63pm7OE1xzmopZHah5b9/MV2VPRqZR8qVF/UqCzfQnzJuFBqL+BbL7OE/SnQHt
	JUPJ6WiBLjK71WVoDmTIR1XbXESelt0Q4tc15o5dxsKlc/kurO+o/b0c23FjohcpFlVew2Dl7E9
	iWi38XY3r2t0Xfp9Rkb3Mm7iV6D6UX+nbOnEXgcMkgPf+gm5rCcE7iK5Id18/5cnqWvegvQtNMn
	Q3GT4RsWEfOrQHbmM2fobbLpU0zp3FPu1XaLwxzGPemiEoW9XZEfFFl8ymRGvFF0sbyFB8DDu4U
	aTIZ6Y/bLEsoz4wRIamOe0LnNR8SVQ8aLRLUneNY0pZUH+Tx+0zNxj9XnIz8i4BRFnU/aI41CHz
	NqLmwpcneOyf9DT7qkWJODhwxYJ+VeJnJbDSSAf9eacErW3JDdb+SzBuO9qfH6bp6/cPGwWUeM6
	/O+/A5FiqKr8L/Q8bVjo8lnjokwD2zXJN3ebO2wDvm/EWRuIKtlZos9aYnef4O+Fe3bQkrBi4Fr
	yrHliZXY05deQo4mcvTMIMBq6b/o2uJGWccjBY2e65sgCGjfF7KFeXisSsH4CP9GHw9l563z74I
	UtstzYih0BXQbo924AkALGO3gbU6+ztDla6/f5BnDKbylqiSS10ZjB/YQNAkv84BfpqPhVKdueP
	eXLmNVsAZ5FQ==
X-Received: by 2002:a17:902:d2c6:b0:2ef:f312:b842 with SMTP id d9443c01a7336-2f03f1b426emr100861095ad.46.1795401328203;
        Sun, 22 Nov 2026 18:35:28 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm44320685ad.63.2026.11.22.18.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:27 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 2/3] net/nfc: llcp: take the skb reference before queueing it to the socket
Date: Mon, 23 Nov 2026 08:05:19 +0530
Message-Id: <20261123023519.3350997-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023519.3350997-1-piyus@iiitd.ac.in>
References: <20261123023519.3350997-1-piyus@iiitd.ac.in>
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

nfc_llcp_recv_ui() and nfc_llcp_recv_hdlc() queue a received frame to an
LLCP socket and only then take the reference meant to keep it alive:

	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
		/*
		 * UI frames will be freed from the socket layer, so we
		 * need to keep them alive until someone receives them.
		 */
		skb_get(skb);
	} else {
		pr_err("Receive queue is full\n");
	}

sock_queue_rcv_skb() takes over the caller's reference and publishes the
skb on sk_receive_queue at refcount one, so a concurrent recvmsg() - or
the socket's own teardown - can dequeue and free it before the skb_get()
runs.
The increment then lands in freed memory:

  refcount_t: addition on 0; use-after-free.
   __refcount_add
   skb_get
   nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb
   nfc_llcp_recv_agf
   nfc_llcp_rx_skb
   nfc_llcp_rx_work

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb
  Write of size 4 at addr ffff888055abe5e4 by task kworker/1:2/56

Both handlers are reached from nfc_llcp_rx_skb(), and the aggregated-frame
path widens the window by dispatching sub-frames through it in a loop.

Take the reference before queueing and release it again when the queueing
fails.  That is the ownership rule the rest of the tree follows, including
the raw-socket copy in this same file:

	if (sock_queue_rcv_skb(sk, nskb))
		kfree_skb(nskb);

sock_queue_rcv_skb() does not free the skb on any of its failure paths, so
the explicit kfree_skb() balances only the reference taken here.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/llcp_core.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..e988c95cc 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -922,14 +922,16 @@ static void nfc_llcp_recv_ui(struct nfc_llcp_local *local,
 
 	/* There is no sequence with UI frames */
 	skb_pull(skb, LLCP_HEADER_SIZE);
-	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
-		/*
-		 * UI frames will be freed from the socket layer, so we
-		 * need to keep them alive until someone receives them.
-		 */
-		skb_get(skb);
-	} else {
+	/*
+	 * UI frames will be freed from the socket layer, so we need to keep
+	 * them alive until someone receives them.  Take the reference before
+	 * the skb is queued: once it is on the receive queue a concurrent
+	 * recvmsg() may already have freed it.
+	 */
+	skb_get(skb);
+	if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
 		pr_err("Receive queue is full\n");
+		kfree_skb(skb);
 	}
 
 	nfc_llcp_sock_put(llcp_sock);
@@ -1136,14 +1138,17 @@ static void nfc_llcp_recv_hdlc(struct nfc_llcp_local *local,
 			pr_err("Received out of sequence I PDU\n");
 
 		skb_pull(skb, LLCP_HEADER_SIZE + LLCP_SEQUENCE_SIZE);
-		if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
-			/*
-			 * I frames will be freed from the socket layer, so we
-			 * need to keep them alive until someone receives them.
-			 */
-			skb_get(skb);
-		} else {
+		/*
+		 * I frames will be freed from the socket layer, so we need to
+		 * keep them alive until someone receives them.  Take the
+		 * reference before the skb is queued: once it is on the
+		 * receive queue a concurrent recvmsg() may already have freed
+		 * it.
+		 */
+		skb_get(skb);
+		if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
 			pr_err("Receive queue is full\n");
+			kfree_skb(skb);
 		}
 	}
 
-- 
2.34.1

