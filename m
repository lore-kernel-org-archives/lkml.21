Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401328;
	b=3v3J+dPxTXE8CfRRVWA3e8lfm0/f71iVBJY3fywZg7vhQZ7S6FBrye74KhIICpbwC5pa
	 Q0ekts21QKC+m5PNrELV2BzB7B0q/DgPWcmdNcZScdvpirOUWARcyTQ/BGJOQ7xE8JKtK
	 GOmqgl4OS02/GhGoxymiEw/GPhez8GiVvMMeKBMOifq/5+jFPoKK4iNKAY4iYKsMl9JxV
	 Z1JMK6eL0KM1UL5lSxUtugBURciE4MyUr10fq4QOTpNINDDc0vcIikfYcnq2ol3ZyrvnH
	 pf5gwcPpor0hQXa2gC+u5uTnMlIWATsQ9zp+26WjVkYI/p+6hffNjMhbPcB3pKLre1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
	b=hjECCEUa5l8frbpHnhBU/vlaO2cUqBlq32gO4kIFzbnFBq6UwhPk6pwK6ftQWz1i/S3o
	 L5hYdgYui2+RIskiedj2p6ApP1VBi45em0TqATBeMl6Xorz/TCHmm49CA2WS+d3sY/zai
	 3X7dA50z1FQnyVGjIn0SJAplDdCOmqwWJQfOxJi5BgRLDTgDS46VvhklN60eR+GMeQ97K
	 TCgdiy3ZpA7OmsLUsjKWIsv4zV8Ohs5zwYxl2/YFbRKyEdmVnKSAPtCTbrd2v1QBLJOxK
	 0CB3mX1WE7lUr2LcY4Ngdw6Bh4GhNydZ6t+ceXjww4fX5Cch5qvh9fo65ojM0efKOLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=JWyMJlAY;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E554606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E554606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=JWyMJlAY
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso18130365ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401325; x=1796006125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
        b=JWyMJlAYm2RXQzI4xBM89/ScssdzvaZgHDsbe065tXlq/WtmDm0W54RISKwsO2Iwqc
         +vAmBLHqIR7YbStgCfF5FS1dGVgee1kWiivbU2nPwVwPKTkgrocCoXJsU6elVVKhlAeu
         wxKMk+Zx7Qyv/gvjbSum8eBBmhLiTqxI4ashM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401325; x=1796006125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
        b=2NLF4WAPKDGQH47kSwZzwcy/dLtw1zDwKYlEMohdNm4D4106UfpFMZWfaDFxvySTJW
         lHoGsLE5IvvQ2FDYfd4mKhIFQl5++P34mBogOSVI15BXR2M9ah7PSqHYRoFYBzlJw+Ci
         eGXI0iOZP7VzGMQnQ32uKjwKNMNQjCAdBykb2VXBGNp+MrElNszbMOHEqEpLmKWpJFLs
         lU7CAdHibZ7eoCyRcrqNhJJApwr7jZirwtMf/yMc8Iw8dnmj4rM3bktem8/nYLG1ud4N
         0+GNuirxJV35Zvfs2796Z5IayNJ9iVgSTciadWiO28v4cT98D/B3zSrUIGqiv4aSswG9
         W7rA==
X-Forwarded-Encrypted: i=1; AL+hErHeAbM5cEhGuqEnkyqFLan7U5BtT8OrmY5uTNA8MwztB0kfzGB/iHrsA34YP/2JJ6J1enjLtA9RcejMHFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/80e8lnrlf4FR2x2WCIyYYmgGyeeA0rtUHgfn8ugxlL3wfJZOT
	6Z4ZjFK7kWMkqELGu3IDjWRkGKhZffDx7inOY7dt03mp1u+0Tp16n3G4vkB0oFt7PUo=
X-Gm-Gg: AZFdTZcHgedA6lR8kBozFwrAA5ovjTr5d+PhbNwKr5rkAttV3Uc8Wntu66SanFGodRF
	rpIMdHn+8PltzvOdbD1PW0Peh8MR9WdjgbrS98zTRCzfT2GxYg7y1mpM+xnuMUA4e0FGHV82qjM
	EtkvhElMkEjtZOPXOiLO0LeGWXf//qDRvqz5lek3W7cW35UmfbGvw8Oy3Ncbn0m1P5YtyGSMFoA
	Sa5f8xt3ULOesv1MbRpv3BIu26wXmAl2jEQke4pYTA/1maqXV5yNKIClEiJBXEVQIWSQqpu4eCO
	qf/YK8pTFssleC2/E/rbjeZmDi1k6LvjRRB2sTGYSTXc2b61mQyreIKhfvBlveNZzfQuZQen+nW
	VtQpknPz7uoRoChchBmC8pD9qPlWRgCJQkzY5ovIWTBXIsVvezVm343r7c74axEzBifUJ1ZbgJp
	HnYHL/BMZggKuXjcos5+BB/zGqPnQ6ZsEGybsvDWiJJ5HrKG5hF97/lFBRHkX5XR3i6vDsF+Yyd
	k4fq1GPpVcvKHGMkIygBWg0ttJZZO5P9lhBrJpwxAcdl+94P+4Wk53ZE3Py6rdyXKfXUnKVjfNy
	HBOlHWYiszwl7GcAyYT/tFUq6oZE2mJ92vEmbNCLgWQVkp46saGAJASPUC78/1opvIirMBXOrhQ
	fDo2NmTAoqORGk5qSh43EFJ3vAeovZJ9/IRzuZ3pN3PYh4XOe7jVjIeRVrhJAA0Ie
X-Received: by 2002:a17:902:e88b:b0:2e9:569a:214d with SMTP id d9443c01a7336-2f03f2533abmr67096005ad.43.1795401325369;
        Sun, 22 Nov 2026 18:35:25 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm44320685ad.63.2026.11.22.18.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:24 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/nfc: LLCP takes the skb reference after queueing it to the socket, so a concurrent recvmsg() frees it first
Date: Mon, 23 Nov 2026 08:05:18 +0530
Message-Id: <20261123023519.3350997-1-piyus@iiitd.ac.in>
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

Hello,

nfc_llcp_recv_ui() and nfc_llcp_recv_hdlc() queue a received frame to an
LLCP socket and only then call skb_get() on it.  Between those two steps the
skb is on sk_receive_queue at refcount one and a concurrent recvmsg() can
dequeue and free it, so the skb_get() increments freed memory.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN, at both sites.  A patch is in
the next mail of this thread.


1. Root cause

net/nfc/llcp_core.c, nfc_llcp_recv_ui() (and the same shape in
nfc_llcp_recv_hdlc()):

	/* There is no sequence with UI frames */
	skb_pull(skb, LLCP_HEADER_SIZE);
	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
		/*
		 * UI frames will be freed from the socket layer, so we
		 * need to keep them alive until someone receives them.
		 */
		skb_get(skb);
	} else {
		pr_err("Receive queue is full\n");
	}

sock_queue_rcv_skb() does not take a reference of its own: __sock_queue_rcv_skb()
calls skb_set_owner_r() and skb_queue_tail(), taking over the reference the
caller holds.  The moment it returns, the skb is visible on the receive
queue and whoever reads the socket owns it.  A reader that gets there first
dequeues and frees it, and the skb_get() that was meant to keep it alive
then operates on a freed object:

	refcount_t: addition on 0; use-after-free.

The comment above the call describes the intent correctly - the socket layer
will free it, so a reference is needed - but the reference has to exist
before the skb is published, not after.

The intended final state is unchanged by taking it earlier: the caller
(nfc_llcp_rx_skb(), via nfc_llcp_rx_work() or nfc_llcp_recv_agf()) drops its
own reference with kfree_skb() when the dispatch returns, leaving the socket
queue holding the last one.


2. Both sites, and why the aggregated-frame path finds it so easily

	nfc_llcp_recv_ui()    net/nfc/llcp_core.c:930   (SOCK_DGRAM, UI frames)
	nfc_llcp_recv_hdlc()  net/nfc/llcp_core.c:1144  (SOCK_STREAM, I frames)

Both are reached from nfc_llcp_rx_skb().  nfc_llcp_recv_agf() splits an
aggregated frame and dispatches each sub-PDU through nfc_llcp_rx_skb() in a
loop, freeing each one immediately afterwards:

		new_skb = nfc_alloc_recv_skb(pdu_len, GFP_KERNEL);
		...
		skb_put_data(new_skb, skb->data, pdu_len);

		nfc_llcp_rx_skb(local, new_skb);

		kfree_skb(new_skb);

so one AGF PDU delivers many frames to the socket back to back, which is
what makes the window easy to hit from userspace.

The same file already uses the correct ownership rule for the raw-socket
copy a few hundred lines above:

	if (sock_queue_rcv_skb(sk, nskb))
		kfree_skb(nskb);


3. KASAN reports

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN.

The I-frame site (kasan-nfc-llcp-hdlc-skb-uaf-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb+0x17b3/0x34a0
  Write of size 4 at addr ffff888055abe5e4 by task kworker/1:2/56
   kasan_check_range
   nfc_llcp_rx_skb            <-- __refcount_inc, skb_get, nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb            <-- the AGF loop's inner dispatch
   process_scheduled_works

  (rx_skb+0x17b3 resolves to skb_get at include/linux/skbuff.h:2004,
   inlined by nfc_llcp_recv_hdlc at net/nfc/llcp_core.c:1144.)

The UI-frame site (kasan-nfc-llcp-ui-skb-uaf-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb+0x3a5/0x34a0
  Write of size 4 at addr ffff888055973724 by task kworker/1:3/2203

  (rx_skb+0x3a5 resolves to skb_get at include/linux/skbuff.h:2004,
   inlined by nfc_llcp_recv_ui at net/nfc/llcp_core.c:930.)

On 7.3.1, where net/ is built without inlining, the same two reproducers
name the refcount helpers directly - once on the increment and once on the
matching decrement, depending on which side of the race loses:

  refcount_t: addition on 0; use-after-free.
   __refcount_add
   skb_get
   nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb
   nfc_llcp_recv_agf
   nfc_llcp_rx_skb
   nfc_llcp_rx_work

  BUG: KASAN: slab-use-after-free in __refcount_sub_and_test

(kasan-nfc-llcp-{hdlc,ui}-skb-uaf-7.3.1.txt.)


4. Impact

A four-byte increment on freed slab memory, with the value and the timing
controlled by an unprivileged reader of the LLCP socket: it is the same
primitive as any refcount-on-freed-object bug, and the freed skb can be
reallocated between the free and the increment.  The decrement side can also
land on a reallocated object, which is what the __refcount_sub_and_test
report above shows.

Reachable by whoever can deliver LLCP frames to the device (an NFC peer, or
a local process owning an NFC device) together with any local process able
to read the corresponding LLCP socket.


5. Reproducers

nfc_llcp_hdlc_skb_uaf.c and nfc_llcp_ui_skb_uaf.c in this directory (sent
off-list on request).  Each brings up a virtual NCI device, binds an LLCP
socket, and then races frame delivery against recvmsg().  Both fault within
a few seconds on both trees.


6. Suggested fix

Take the reference before the skb is published, and drop it again if the
queueing fails - sock_queue_rcv_skb() frees nothing on any of its failure
paths, so the extra kfree_skb() balances exactly the reference taken here:

	+	skb_get(skb);
	+	if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
	+		pr_err("Receive queue is full\n");
	+		kfree_skb(skb);
	+	}

at both sites.  The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: both sites fault on net.git main under KASAN; the patched kernel is
clean on both reproducers; the refcount accounting with the patch applied
ends in the same state as the original intent (socket queue holds the last
reference, the dispatcher's kfree_skb() drops its own); ordinary LLCP
datagram and stream traffic still delivers with the patch applied;
net/nfc/llcp_core.c is byte-identical between 7.3.1 and af6737b90668.

Not checked: real hardware; an over-the-air peer.

No Fixes: tag is given: both sites date from the original LLCP receive
implementation and our clone of net.git does not reach that commit.  Happy
to add exact tags if you would like them.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
