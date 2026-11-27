Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749904;
	b=DaaBH70vHi1b50RYnsWiQxvTherjJCl3jIPzSV7alXdrRDZRlyJMctqI9BN+itaGXSKX
	 HJJ98bkG7CJ9VeNKBE4sDTPCaGZvaXg7bxL2Q7P3OXLBMP9ufv8ndESF2RyB4mSjbSunv
	 1A/7qvgHgyFTuV1wrRcYEyB1dKO+kuh9ZoqUqdtsbs5C4Fw5QIk3Ir73hY8zjLwe+8UFD
	 puw3FOiftH0um5tbyw/7yIKfjDUDHyKuU5W9cCob3iOYtwLyR98Rx4h7imvfxyOxBPT9D
	 XPXvDwi2W3d3iv3e/n0vTDm36YYHxPvR1cF9v1BiLr9mAEc9/GwV/IrDGLLWDgkIDwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jLp1zVgyra6q3KRMbVPlHRrPKkxKf/mkhedlT39naDM=;
	b=3S7p4WdmuTh+BDhtszM//b8BcVTaJ0pwdv0xbD4MSWqy2LCdoZ1ozYbxBlWe5EJxAUTW
	 OMWX+1HZPSfrEbhgMbYMfRMhBNk/Vo6jiY4mjB01owNHWvXGbBGNPfOni3EY8xJpzfUdl
	 teQUv8ih8bI7aL0L15IjnxiksjqAkH+HChYzPqLy2SbGlWtsW2t3FQ2Al+3u3Os/nkLX/
	 1PHgVGv4rmKW12Cmk96/kaWeWcz8VFYq1JH/sdifzVnP63w+OdmTkFqwMbWmSF1PswAMi
	 S8nLdBhA5IzXVcBmyuKNBQAwilzDdLVVlwwjG7DsJDDne+VNBWw+L/K9ROfp02w5Cxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=(null) smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="h91Rby/1";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 309A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=h91Rby/1
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so5249755a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795749887; x=1796354687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLp1zVgyra6q3KRMbVPlHRrPKkxKf/mkhedlT39naDM=;
        b=h91Rby/12MFgK2KZ9lu0UCiz7Kmqforr4tO9ZJ1bt9otY9DCHMJrCVHWj8uXVEq9fM
         KJNH3+DF/A0yumOBQL73f08gJp+2pspmR5jKknKWC2eLMDhKdSRwlRsam8fs5G2Xy5LW
         TQ0NtTFlDjwy77nqtgDCQoAo2APN0+Cngy23A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749887; x=1796354687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLp1zVgyra6q3KRMbVPlHRrPKkxKf/mkhedlT39naDM=;
        b=C8WyQk9+RM2iTAnvzQ5cXE9MmIzuahv4mCL5W1a/nAZTWgEML6NujVQ7XvwvasWz+2
         qx6cwhiZFbrUb6y8CUVkY3PWW//wFriThnWTaw8dMzVWomN/eoV0uYEpAOfc0e/+6s0d
         uzTv6/k7pyrDzzTGPhgNIuC8oSVfPqfgtePNTYn6KZETEOTGZHTnJWy6nXXn55Fpfo/z
         jR+GujhMkbRTUFvHkvZGuZIbhZkoF8TN73aJpHxoy3UuDOrlgnXHynJhCx9Y9w01YPyn
         jgcOZx8+NgXo0wkd21mo/fA33ABqeCRZSL3FiEKIAwaNbzI3/748ljFH0Q5jrpUTiIHt
         ctbA==
X-Forwarded-Encrypted: i=1; AL+hErFRl7QunVuHMhpufIqTd9gujbt1LUonrab2sdLQnBcQgb2QXb43N91U9aUf1o8r11INvHiDZNarVGSOyW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YdI0ca232JBNW75InqffoWSJbsom8z5vk2mokItPnqmdZaFs3
	O2WMKv4116x9nMzTb/9XidfLdzGHsPT1TfUFJMNJJmCuOl1A29tgxHBeKH9u3BrOrwg=
X-Gm-Gg: AZFdTZcPn3bEZ/vwqULK8NYYk1XBD3V86QxfNoj+REgXixsyGUmdEU8J7znpehXcjn1
	mG3pdFFxe+/HWpt+82ihVQKdIrk2scJFNzwS67JQupmJfP3QF1pIRKfwWynIMmQYMTkqmkgpKRG
	Og5rffv++WKBRiwkS6hjd8L2+9cIBr2vJrExnzrrsPuFDGdQUFAapfNDJVWF9OjOlOlQmF+JAhQ
	v9tIEjF+SbH7ER5WqVryZNg9VRg5rJ9+uxSiMKjnBX6p5f3JvebhLdXWN2Pu1jtKekVgnt4Ku4U
	a1MHeSdsr02y0/1cxLcWamcZ7YBJlIBKvoQFWbxsk1XRkgWwqd16NA2vKtC2j4vKGVFNGLh3wz7
	c4lKT+NbPyJs3NtcYTrTU5zD05EEI9kYOYbFUhJdKVLffgoN6oW3+FfKZEYiH2dfwh7nBx1wdxe
	QVI95moPxaXaA6iCBOgA1NUvjpnSUTjRUlMcdAaQSNJhJzfvqNdbc38xXTfbwL8X83B1GT7Zk9S
	fYEqcZ+yTFDA8O8Iz85BcpQ2KraYlaK+gI5+jmmQz2l8OekbPOYK4URCUybSTgyEF7nT7XPKOJW
	1hXBbrdDZPZnh/fGK/9WNaPd2QvpOQi0iBFfBQuXn6D8kP2iIOo/uRvfeBtWY4XvV5LBYNaZ/rp
	wDTjFVC73JWy3yNlgd8PFpnJm+HXUhizVOeSe2PLPzz+e7WjlqtrrK7t0whWGxV9v
X-Received: by 2002:a17:90a:e705:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3b41c7e127cmr22418092a91.3.1795749887577;
        Thu, 26 Nov 2026 19:24:47 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm112521635ad.57.2026.11.26.19.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:24:47 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai
Subject: [BUG] rxrpc: stack out-of-bounds read in rxrpc_input_soft_ack_tq()
Date: Fri, 27 Nov 2026 08:54:42 +0530
Message-Id: <20261127032442.2631270-1-piyus@iiitd.ac.in>
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

Hi,

A peer can make rxrpc_input_soft_ack_tq() read past a local variable on the
I/O thread's stack.  The read is 8 bytes and lands on whatever follows a
one-word bitmap.

The cause is rxrpc_seq_in_txq():

	static inline bool rxrpc_seq_in_txq(const struct rxrpc_txqueue *tq,
					    rxrpc_seq_t seq)
	{
		return (seq & (RXRPC_NR_TXQUEUE - 1)) == tq->qbase;
	}

It masks the sequence number down to the queue size and compares that with
tq->qbase, which is a whole sequence number rather than an index.  A queue
is only allocated when send_top + 1 is a multiple of RXRPC_NR_TXQUEUE
(sendmsg.c), so qbase is 0, 64, 128 and so on.  The test is therefore true
for the first queue whenever the sequence is a multiple of 64, and false
for every later queue no matter what.

The one caller is rxrpc_input_soft_ack_tq():

	if (call->tlp_serial &&
	    rxrpc_seq_in_txq(tq, call->tlp_seq) &&
	    test_bit(call->tlp_seq - tq->qbase, &new_acks))
		summary->tlp_probe_acked = true;

new_acks is a single unsigned long.  With qbase 0 and tlp_seq 64 the offset
handed to test_bit() is 64, so it reads the word after new_acks.  The
offset
is tlp_seq / 64 words, so it grows with how far the call has gone past the
first queue.

The first queue stays in the list as long as it is not fully hard-acked, so
a peer that soft-acks packets without ever advancing firstPacket keeps it
there while the call transmits past sequence 64.  The tail loss probe then
sets tlp_seq to the last transmitted sequence, and the next ACK that
reaches
the first queue does the read.  Only one bit of the value is used, so the
leak is narrow, but the read itself is out of bounds and the offset is not
fixed.

The test came in with the RACK/TLP work in 7c482665931b, which added both
the helper and its only caller, so this affects v6.14 and later.  It is
still there in mainline today.

Reproduced on 7.4.0-rc1 (63fe746a609a) with KASAN on x86_64, and on 7.3.1.
The rxrpc_tlp_probe tracepoint confirms the condition - it fires with
pq=0x40, that is sequence 64:

  BUG: KASAN: stack-out-of-bounds in rxrpc_input_soft_ack_tq+0x467/0x530
  Read of size 8 at addr ffffc9001363f848 by task krxrpcio/0/9662
   rxrpc_input_soft_ack_tq+0x467/0x530 net/rxrpc/input.c:959
   rxrpc_input_soft_acks+0x2f0/0x4d0 net/rxrpc/input.c:1014
   rxrpc_input_ack+0x6c5/0x910 net/rxrpc/input.c:1199
   rxrpc_input_call_packet+0x1db/0x250 net/rxrpc/input.c:1290
   rxrpc_input_call_event+0x16d/0xc30 net/rxrpc/call_event.c:338
   rxrpc_io_thread+0x534/0x860 net/rxrpc/io_thread.c:531
   kthread+0x26a/0x2c0 kernel/kthread.c:436
  The buggy address belongs to stack of task krxrpcio/0/9662
   and is located at offset 40 in frame:
   rxrpc_input_soft_ack_tq+0x0/0x530
  This frame has 1 object:
   [32, 40) 'new_acks'

A patch follows.  It compares the base of the queue instead, which also
makes the probe detection work for queues other than the first - at present
it is dead code there.  With it applied the same reproducer reaches
sequence 64 again and there is no report.

We found this with a syzkaller-based fuzzing harness driven by an AI tool.
The analysis above was checked by hand against the code.

Reproducer: not included here.  Documentation/process/security-bugs.rst
says a finding made with AI assistance is treated as public, and the same
paragraph says not to post the reproducer publicly.  It is a single C file,
tested, and available on request.

Thanks,
Piyus
