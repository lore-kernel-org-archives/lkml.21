Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444595;
	b=T/iGptUhZDMNZmWmcbHjC7rnxB5Mz7ZnaGFkgkyGR/ZqExrDeiIOBYoLnXI6qqvnW5h7
	 iO/lFPV0P4ZH1FtdTaCYJsYCbOD/kHXiOl8ZbTeD8ju4EQ4hVZG85bTjJyj67lhBbHhtx
	 j/LOFbBAK2Uf0gXpwmRwaiOPh1qliaxnI0HPB0hj8r+IxR0b6w02R95MnEki3oC+EQdxZ
	 IxRNyRsmyFZ5coxPEVxVqM36LGcwjgZzjalRYioaVVaQmGonjUHNQ3WOgXxLC1oXIwl+I
	 W551oyJJc62UGLGCdoTNEKCXYzVPxryP4fITzcwWixWX4B7hhJT8/qGrWvBHntMqDNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ehRimsJYB3Ch55Y8eVy07JQEbqg0JrRGoOw4sSOHi78=;
	b=b5YuYUuRYWM2cXZb8B5XnNXFqXtsBH/b6Ftfvr8VvNGt28bUapoG0csh640KsJP89TJP
	 NZceXOgSbZfCNVbqRK3SkVsdRx5xwhoCGiCS7VP1vYlRZUUVHqXglClsyuAN+JGMS34w1
	 dZodyafqgrDbOIPwP3t2EJSTQPnqAmnGPZhs8EgYuywYaZBDY4plem2k53KASgRYBkoxH
	 /J+AKX/0bkKotkgxvn9iPPPf0YZTJ2FiaRgErccUFY7r5KmQSbgTLeUEA0zwiOO6HmZFI
	 Myg/wsICs7HvbqbDtys7ZpyqEV1FbJLkiOKTq4DHo89+S7yeDVzcbR+ezcsDO7SUjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=AnccZPWW;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507C606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1507C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=AnccZPWW
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04e3bf46dso23048255ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795444593; x=1796049393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehRimsJYB3Ch55Y8eVy07JQEbqg0JrRGoOw4sSOHi78=;
        b=AnccZPWWxApE8C7F8ef8F1nyqmuie0g7OtihE5H0iGKBFsVGEZAv1U0L195NboFEG8
         nBggwRfvjhv39Myhzm9UjQvOLBbo6J1mCXRKDhYbxS+xrK6hiE6iaBNkLq1kgjU4Yy49
         SFEmfPFmXPENCyBbY5HsY9ddOzwthwbrruy6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444593; x=1796049393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehRimsJYB3Ch55Y8eVy07JQEbqg0JrRGoOw4sSOHi78=;
        b=Q+OKEyfrGZq4RugMtCqjg1EdxPHI7AZsJR0OQFneC8Rl4913zn32Idfeu1NCxv5trZ
         X11PZy1W+W1/wbQb/WNn7LwvtrZjKekJfNgLV6YOpNc/u3GO2yVQMyf9GtdW3Nf6wfc2
         5X6LAQkMF+rK2R4ajbyqBefwWwsWBUDKW8Q1i7UsIIxaAl1QPHGkL2MJB8QQRor3ZRWd
         1ZUqyfoXfhnrut41fxqX/SwVQcsOFCDZb7tYJRWJD9mu7EARIV9LdFAkdN/H3F/+TLvW
         Ust2hIq6vmOojVqb4fg6Nd8HU1SBWXtcd57l+8JpFwTFQx492v+HWd7P+ak4hHrALFbp
         By5g==
X-Forwarded-Encrypted: i=1; AL+hErEn/2Rvbote0XzDxqKybt+fXifRJj2QjfM+alwf2vstRWuK1zITSZenHXjasOgvhwPavv0uDZTVDCvfNDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QzLbROu9jJAaj06P7MyQ16W2LEeDEQZPhx0kxMyicqOaCY2zB
	1MTjtkBDTFAsRLAjd7zIuGeyE4IdQgX7/btulFuqbZqnSfStHgHVQcRf36BcB4AFw7k=
X-Gm-Gg: AZFdTZcmoYixauJQneM/qpww8GSTNavUctnHueORcLH7Df1OACERqOq5+KN6fFCdZp+
	3M21127hwrs9sIQRGivoAEi9yvTD/qmI0fwGUD7NZu9OQBz7jtbCZqAAPvOxRSAi97WJ5x3nalp
	Rs7SK6IqZzwIId1x97GqvrWcYHDAScxRHd215ZhLnu8063pPhtfBKe9IqD7du9mZRqExL9vKW2v
	aYTY0iRV75HSj2Up82lL8SQGvIqFPs6idYmDRwKnTqVy+PiQmFg8uU9UDUjd//ec79ktXiG/kW0
	AbAqnRTMnpSzP0eD927282PO9jTHpG4SKBoZcfOxWRS4gykayUhORLN396lLN4emkD1F4l8sgNf
	VVHQQEXMHW9uliHSa+41pt43e/V01Bu/+Gr8Kh0DVrIGqYn85l/0jVrdmDImDY350WJv1+cYhmD
	tUbASJcLuH4v6pgSZXdq3x/cEgb720+5xX3Y+ks0A0njXKsnIBJ2GYbU8ZyILhUQlahwqjRuS1M
	oQ7f3nfELW9NxxpLUyriRDjUB17QF5usCQt8zlYHgz3aqbfAe8KlXmItLVeTa2Kx5hlUWvD3cgI
	YOZqkZyrqwKZgpNj4qzL41P17ik1HdemRVqUgWmt3bjOC0e3nTwUdFMnHrBr2+3/Zfb4Qi/p+HE
	QVZoKERjQkIZHfc49LMWtWJ/JovQNyK2EU3VcYFQ/S1kfq4L5qw3ddalypVbeZBULVw==
X-Received: by 2002:a17:902:e847:b0:2ef:cf8a:622f with SMTP id d9443c01a7336-2f03f1cf5d7mr114757805ad.17.1795444593265;
        Mon, 23 Nov 2026 06:36:33 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee85466sm54062085ad.4.2026.11.23.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:36:32 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] can: j1939: NULL dereference when a peer completes a session with no data queued
Date: Mon, 23 Nov 2026 20:06:24 +0530
Message-Id: <20261123143625.4021586-1-piyus@iiitd.ac.in>
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

j1939_session_completed() passes the session's skb to the socket layer
without checking that there is one.  A peer that completes a transport
session whose data packets never arrived makes j1939_sk_recv_one()
dereference NULL.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN.  A patch follows in this thread.


1. Root cause

net/can/j1939/transport.c, j1939_session_completed():

	if (!session->transmission) {
		se_skb = j1939_session_skb_get(session);
		/* distribute among j1939 receivers */
		j1939_sk_recv(session->priv, se_skb);
		consume_skb(se_skb);
	}

j1939_session_skb_get() resolves the session's current offset through
j1939_session_skb_get_by_offset(), which returns NULL when no queued skb
covers it:

	struct sk_buff *skb = NULL;
	...
	if (!skb)
		netdev_dbg(...);
	return skb;

j1939_sk_recv() then walks the bound sockets and j1939_sk_recv_one()
dereferences the skb on its first statement:

	static void j1939_sk_recv_one(struct j1939_sock *jsk, struct sk_buff *oskb)
	{
		const struct j1939_sk_buff_cb *oskcb = j1939_skb_to_cb(oskb);
		...
		if (oskb->sk == &jsk->sk)

sk_buff::sk is at offset 0x18 on x86_64, which is the faulting address in
the report below.  consume_skb() tolerates NULL, so the dereference is the
only fault on this path.

The same getter is checked by both of its other callers in this file -
j1939_session_tx_dat() returns -ENOBUFS, and j1939_xtp_rx_dat_one() warns and
cancels the session - so this looks like an omission rather than an
invariant.


2. How a peer reaches it

By sending an End Of Message Acknowledgement for a session with nothing
queued, so that the session is completed before any data packet arrives:

  j1939_can_recv()            net/can/j1939/main.c:108
    j1939_tp_recv()           net/can/j1939/transport.c:2201
      j1939_tp_cmd_recv()     net/can/j1939/transport.c:2153
        j1939_xtp_rx_eoma()   net/can/j1939/transport.c:1439
          j1939_xtp_rx_eoma_one()       :1424
            j1939_session_completed()   :1247

Everything on that path is driven by received CAN frames, so on a shared bus
this is reachable by any node; locally it needs only the ability to send on a
CAN interface (the reproducer uses vcan).


3. KASAN report

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-j1939-null-session-skb-mainline-7.4-rc3.txt):

  BUG: KASAN: null-ptr-deref in j1939_sk_recv+0xd4/0x3c0
  Read of size 8 at addr 0000000000000018 by task x/9440
   j1939_sk_recv
   j1939_xtp_rx_eoma
   j1939_tp_recv
   j1939_can_recv

j1939_sk_recv_one() and j1939_session_completed() are inlined in that build.
On 7.3.1, where net/ is built without inlining, the same reproducer names
every frame separately (kasan-j1939-null-session-skb-7.3.1.txt):

  BUG: KASAN: null-ptr-deref in j1939_sk_recv_one+0x34/0x170
          net/can/j1939/socket.c:318
   j1939_sk_recv_one          net/can/j1939/socket.c:318
   j1939_sk_recv              net/can/j1939/socket.c:363
   j1939_session_completed    net/can/j1939/transport.c:1247
   j1939_xtp_rx_eoma_one      net/can/j1939/transport.c:1424


4. Impact

A NULL dereference in softirq context, from the CAN receive path: an oops
that kills the receiving context and, with panic_on_oops, the machine.  It is
a denial of service, not a corruption - address 0x18 is not mappable on any
supported configuration.

net/can/j1939/socket.c and transport.c are byte-identical between 7.3.1 and
af6737b90668, so nothing in between changes this path.


5. Reproducer

j1939_eoma_null_session_skb.c in this directory (sent off-list on request;
see the note at the end).  It brings up vcan, binds a J1939 socket, and
sends the connection-management frames that complete a session with no data.
It faults within a second on both trees.  CONFIG_CAN, CONFIG_CAN_J1939,
CONFIG_CAN_VCAN and KASAN are required.


6. Suggested fix

Test the skb before using it, in the shape the file's other callers already
use:

	+		if (se_skb) {
			/* distribute among j1939 receivers */
	-		j1939_sk_recv(session->priv, se_skb);
	-		consume_skb(se_skb);
	+			j1939_sk_recv(session->priv, se_skb);
	+			consume_skb(se_skb);
	+		}

Deliberately without a netdev_warn(): a session completed with no data
queued is the peer's protocol error, not a kernel one, and a warning on this
path would let a peer flood the log.

Cancelling the session rather than dropping the completion may be the more
correct protocol response.  We left that alone so the patch stays a fix for
the dereference; say the word if you would rather have the session cancelled.

The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched kernel
is clean on the same reproducer; ordinary J1939 transport sessions (a
multi-packet transfer over vcan, RTS/CTS/DT/EOMA) still complete and deliver
with the patch applied; both j1939 files are byte-identical between 7.3.1 and
af6737b90668.

Not checked: real CAN hardware - all of this is vcan under QEMU.  We have not
tried this from a second node on a physical bus.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
