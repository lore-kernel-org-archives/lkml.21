Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444598;
	b=q4COelGjP3keZv5Xkhyz8wNFkUmHybIxhvvudaV7cpEDo9XobcTPiXxU3Bt/vFeuXswT
	 i51G3rnr1qyKLbwJjQo4uWiiDwvfAr02OCm0OKgHY2aM228m9JqIdQV4PJcbZ93RRXdFE
	 uNakrLIfe24cCZjiRdB6EoQn8/shiiHqCdNrrWjuK5CCyzp7eB45UK8MIdgAnTCCHDsMC
	 UeJQHNnmhKFaeqMFsjuyanHWfhtgH0ydl5yPboPrP/jRa6XBXp0Y+6CMyMSltirYejNFv
	 z+Kp4U9KLNFah0UTu9F7GrEJzNXbPVu2xyhZ7zBHIB+mwf7zXxIPrERQy2sg8qSddXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c7RIFJ9JCRdyaG8UKVxLRWxNqNn9TfnyLCzHHvdNicM=;
	b=foJmLeK/ZOhsxLaQT9oovd8Foq/cel56cKzyDna8+m5tVmgLmaih364MTEloiSKvQ9YE
	 3hs7qRA3wgP5hyBXMi9cRuMq+ayTLDvxKYJ3ku/YVkzahCB7BhDZuls8DRCX5mKVUaYks
	 rHXcABHphZkCgsxuJ7p/AKOSStmytgBpdnaBTNjB7hbAPiAGwqIN8ryR1SkFZmr2t/Dse
	 PTjPtWKLYHqLbh80YRAr9Zn33MVwd3vPnpZ/9Fcr09B5lWCi28B6r8PnFi97h7mRiAyut
	 XFcsAULvKLzTbgXlFE6a68SdvlxsHv4W/bgLfsx43+GxYi5/XaSquTydJ67ZcIHeVCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=HQ61VKDz;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C55606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C55606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=HQ61VKDz
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f0621eec70so19117145ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795444597; x=1796049397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7RIFJ9JCRdyaG8UKVxLRWxNqNn9TfnyLCzHHvdNicM=;
        b=HQ61VKDzJuSyLg0GiLde4RIIRMg54I5xdOttpoZvzcz3swdIwdA/eSKH7IrbCIaMFH
         1ftQy0jVuo5nXxQBRZcVdZovUXDtn1enquSp8suF8HRaLvAAz2EKh4Af0WRRUH4/wAlv
         esH1cGnI3PK8URfa4yjsw4UQA14K+y/p53Aos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444597; x=1796049397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7RIFJ9JCRdyaG8UKVxLRWxNqNn9TfnyLCzHHvdNicM=;
        b=MCXPwenOznlQI8drrOykw6tgLYKPNjDiIQmX2QAlxLDm6A8u8RezBshzZpRKS3x41J
         G8eSigfjbwGIIYzhcgdcL9E3/6LxHOIDASdbZnq/yc58jhUfP6SFt+lGJx2iWkPRJVRQ
         +YuRgArSsbro5X0SJlZIBORhKlcoBQNlwElfKAJ5L5I1wdpnyplnR+jaGS4YeBHe8kw2
         gUwcErvk3sq5XWCEuc6XrITrRHli5LbN4j0iqo1a3S03kE9zfPSBdr8OynAukjztrI+i
         nM1QwZtrNRbFaZg6EiOpKoP/yMB+pwAeHNjiR/E77koOX7HtYo/aapyQP8qepRd/9hCg
         hPZw==
X-Forwarded-Encrypted: i=1; AL+hErEGeEqs6fHbUvqPnaVqyH9EStG4SNnygn7WHxGA2boRUMXLuVQGgLmOViyjRhDsz5JQ7NcMh140cJxLALE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dye2j401oq3Iuz+487+F5m3GMS2DR72GmrhlCr2n/VJ5spUuC
	2tzdb557tloEpyBaUDxs+yDl+gEg0L/PT72v0aBodPjFj5jkPLNqteek1UmV9dkeDDU=
X-Gm-Gg: AZFdTZfG5RdkZlTDCoJ9s2YL94xB9i0TfVXLq4XX0/uTeaDVDvT/pXdKGzRYn+3ncO3
	FjN34yfNWs83ZNxyE/5GOqz7JJAirbs1Gt/VghXqHUHp9Ge5xOqua6PfLOKOdPP1pBzBHwem8iy
	+pYNC9GTV15xXDkaGgudkUX1iSYQG/GFpf9/FXeXjOKE0E6kNpZwAjvXlycMmBP8CKaxbAYdln6
	1sp/ohljth1I1EOmRwjbYRdbLI7vlHInIL6bSTG1iQdz6Qfmc4AWq9bjW7elFGygiVnGameptGh
	k9hXVkk/5BpdfWlw9OGC3psBefTec2xRdRE3TsLu8y15GX4RMbbrv35rikmbMSyidTmP7g/vRkL
	LU2QLgCQQ33GhtyQ0mQFGJqiE9N1z/8XyYhw0og6PsmKLr1I3QQAuCl/S3vDPyjy6thACNIHFQa
	Iv7ybfK8leMdc4JSWnIYzSgTGPWvVLGftXaLAwPUGPPE8J6DG7hbkmQkNxAq71Ft2/wO+KnNvyi
	9CMPu9oykKFNS4Tp3RFlWWnkFwpRz1QnUMuCNYhCknuXSEwUtqEz/5Yp9dBjQOcjXp4kXXjYc/z
	SZmKiNZFXEUAiS71QMl40OqNvd9R0Uyua9dqadYHpkEXMit5mgP2Gg2ZnLYSum4FrYRCxfpcrZA
	ENWPA1s1xC1fVZS5cgM+N6UC8e1mpSyvTmL6J6q8JLfZDaD7fBw5dD/Rp5RGBeBP1zw==
X-Received: by 2002:a17:902:ced1:b0:2f0:340d:dda4 with SMTP id d9443c01a7336-2f03f1ec3fcmr143338425ad.24.1795444597511;
        Mon, 23 Nov 2026 06:36:37 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee85466sm54062085ad.4.2026.11.23.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:36:36 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	stable@vger.kernel.org
Subject: [PATCH net] can: j1939: do not pass a NULL session skb to the socket layer
Date: Mon, 23 Nov 2026 20:06:25 +0530
Message-Id: <20261123143625.4021586-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123143625.4021586-1-piyus@iiitd.ac.in>
References: <20261123143625.4021586-1-piyus@iiitd.ac.in>
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

j1939_session_completed() hands the session's skb to the socket layer
without checking that there is one:

	if (!session->transmission) {
		se_skb = j1939_session_skb_get(session);
		/* distribute among j1939 receivers */
		j1939_sk_recv(session->priv, se_skb);
		consume_skb(se_skb);
	}

j1939_session_skb_get() returns the skb covering the session's current
offset, or NULL when the queue holds none, and j1939_sk_recv_one() then
dereferences it on its first statement:

	if (oskb->sk == &jsk->sk)

sk_buff::sk sits at offset 0x18, which is the address in the report below.
consume_skb() tolerates NULL, so the dereference is the only fault.

A peer reaches this by completing a transport session that has no data
queued - an EOMA for a connection whose data packets never arrived:

  BUG: KASAN: null-ptr-deref in j1939_sk_recv_one+0x34/0x170
  Read of size 8 at addr 0000000000000018 by task syz-executor
   j1939_sk_recv_one          net/can/j1939/socket.c:318
   j1939_sk_recv              net/can/j1939/socket.c:363
   j1939_session_completed    net/can/j1939/transport.c:1247
   j1939_xtp_rx_eoma_one      net/can/j1939/transport.c:1424
   j1939_xtp_rx_eoma          net/can/j1939/transport.c:1439
   j1939_tp_cmd_recv          net/can/j1939/transport.c:2153
   j1939_tp_recv              net/can/j1939/transport.c:2201
   j1939_can_recv             net/can/j1939/main.c:108

Test the skb before using it, as the two other callers of the getter in
this file already do (j1939_session_tx_dat() returns -ENOBUFS, and
j1939_xtp_rx_dat_one() warns and cancels the session).  Nothing is warned
about here: a session completed with no data queued is a peer's protocol
error rather than a kernel one, and a netdev_warn() on this path would let
a peer flood the log.

Cancelling the session instead of dropping the completion may be the more
correct protocol behaviour; that is left alone deliberately, so this stays
a fix for the dereference.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was checked by hand against the code, the fault was reproduced on
net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary J1939 transport sessions unaffected.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/can/j1939/transport.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f..af54e6a6bd71 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -1243,9 +1243,11 @@ static void j1939_session_completed(struct j1939_session *session)
 
 	if (!session->transmission) {
 		se_skb = j1939_session_skb_get(session);
-		/* distribute among j1939 receivers */
-		j1939_sk_recv(session->priv, se_skb);
-		consume_skb(se_skb);
+		if (se_skb) {
+			/* distribute among j1939 receivers */
+			j1939_sk_recv(session->priv, se_skb);
+			consume_skb(se_skb);
+		}
 	}
 
 	j1939_session_deactivate_activate_next(session);
-- 
2.34.1

