Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705428;
	b=OjMB7OlHh1S7pd0zskixHKWiiPieR7nLdDqC6/tfdiFZKY2LtOi3dqBQ5lXo5vepRuSl
	 sLavhKZeGp0jjtq94eXEa+KWiis4A3XdVHvevy/c/SBau+Z2IrKOTzLD/ofGLqCqXbXQd
	 w6r1f+LMyiHYP5mI1MJR+tiJACfmnTITztMpqVNFyL4WYaEdjnqF7i10luQAlBLYOdekI
	 HmszlMkbenhNSEoLZkdK897a4xPH6Gm189bH2TpjWU5goRBJ+GjuJhXX0m2QXP8yOWN4Y
	 jlsZ5p1f3qZYLpj4am0a5yAKIkxPcnvJTi60hk8cBGndVhx9pWkeXh4vFdSCowNxbaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A0nHs2DHN4CrZLg8J552iINpEC7h8BMV5slPOBKdd7I=;
	b=kOkTUgPoJmPLFEcOMBaFuzwoFTzaEF1RNczFx5HDBl4xWB6OtG9aLAqyyQI4OEa5tUVo
	 vmRb9N/Y9fmXsho8Z9B8sohTKoShvHsIDT/Ehl8NL5M38i6+bPPjO6mENijU7fAiyOdJe
	 2TepoagVBKjIImsMDgZg+0SDA5qXg9569J6E/HOnhGIEinOOBwDQ7nilippYl/W/0iqm+
	 ZQJ48qaKfN3vQRbKJWwvhO/Fy429Ei23Owk2xDnwGTOR4U7sxahzafAwkdkH/bg+jYDIM
	 fOY7TWwWVQ2mfekS2hjuAQkzoBObAsfivnO7AvdiPWDO1YQY4CQw4t3zBujjWkAvLHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=XwK+P0aQ;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2646606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2646606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=XwK+P0aQ
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f066274caeso33634645ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705426; x=1796310226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0nHs2DHN4CrZLg8J552iINpEC7h8BMV5slPOBKdd7I=;
        b=XwK+P0aQ+Rp31QXWvDcqbUfM+HK9MCbbBjOXaSxSKoyI+MU00NKDs5WBIOGhY9E1qp
         EQaDUBnD/jk83Laus9blkljVsfUxthsfTXpsawPmCTmqWaqq+z1pcENJFmGbgjGKmZBf
         3xH6J79M17d0C0BMBT7JtlujhM+d3f0uXi0G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705426; x=1796310226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0nHs2DHN4CrZLg8J552iINpEC7h8BMV5slPOBKdd7I=;
        b=KSDv+YBM2ByUPBu7ql8jyRdJieMIKCMX/nUSlP/os8FUTNaQyS8rRml5uXQ9K8J+IX
         5inQQXkPvs2t9+v2N4coG+7kRMz9naQv7lDgOzDS3oBHOk7UI69R0N9HwHH+c7e7Z1JM
         3qyFoUkHTkdtJfPQyxFiBFS0aQuDNfFJHZcPrwGbuXb0S17UzR7S4J3oFcAexu63Wi4h
         zZeUeaHWBwFLIix/eiq10qVrDF6PMzv6agc6TF84rxrN9XvGRAW6bQrIXtNKqAsHtRds
         RgxGRB2FrC3LRlvaTKBRPdnUAa8FMWHAiCUStCf6Spw6C7Cd+paEbLznvYTZsDirQQNJ
         Sf9w==
X-Forwarded-Encrypted: i=1; AL+hErGHiFjIlT2/WmOwP2EMNSJxvcnmaGelsPjFwYFQo2IgeoATOC2T4rT5R1ehL+oKSHEosL8o3vradJ+FmO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tmn1P+Yh/0q8HS+KDN4dcQgQ3lF43IpqCI99awxwglw9mNMSh
	lkY+OtOXTD0mzr9RnrD7xVFh46J3knq/qzyw7F7AZUmQu06Onkv+13ridc1Rn0k46hQ=
X-Gm-Gg: AZFdTZdykz8nfL7SG+qIFSsWqybEtrrE8MnSIjt+BAI+H4G6s6WPIZ2Dod9sFH0+6no
	wIdkHJVnHpdKrlbvQHXcYlX+Vn1Me74R3HjJZ3fNG3ZP0QERnCOk8MYZNRBEHuMu88tKedkV1Jr
	mVpGsLIxCgBymHnb5dcJJ6DrfIAWUeZdR6CW/vdfwtzQrq1BkMh3iazhxEo26ggiAYKU7e7JXL2
	aUCNgAki7j3jrfUg88/L4I71wG/1ALxcmSYbvF6dcwvmeM/uiADqniAu4rwvRi5vmT9lHlyz+lY
	qhrctt8aDJcqpaa9/WP9pt+KxQESJOwF1hif8SyXpl1xKFuqB4I7s7/3AW8QaAXGxk2uecHmear
	efbW7yRZGJ+Q9/YmqgG3mI821JOlgzwswnq9JJyk2GbYnGfPMidmvqaTFXqjvI08x6xs9oSDxdv
	1ozAzu+MkngueRd2jCXSGoQXM6SYKZ1CUlamzGFXaOEbHw772gQ3PoNaKLF33Sa7gNkrTg9sXvV
	YQT9F/by+2Y407eBTivoElnfX2lP6d0spTYRl35tB20MnU2f+9JHkDxBg5SXgO1UeUSghh9vMuA
	vfhCI1HSBdTWuCVqxnLxiPywe7D2WfEvf/VkZptjpAwRnMuZJMMgtEXVGbUVV4NnsgxD5HeefI3
	Btvyq0/1oFnSXbtz0ih5hFofWT+sCI85XVoQoquBLg7OOrdmTpDraUnD3iAxhOv2aFwWExDpLh2
	n8XlguDxYXoA==
X-Received: by 2002:a17:903:b4b:b0:2ef:f51c:7b09 with SMTP id d9443c01a7336-2f03f19075bmr209178975ad.28.1795705426236;
        Thu, 26 Nov 2026 07:03:46 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm104226565ad.17.2026.11.26.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:03:45 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Vincent Mailhol <mailhol@kernel.org>,
	linux-can@vger.kernel.org
Cc: kernel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai
Subject: [PATCH net v3] can: j1939: reject an out-of-range data packet offset
Date: Thu, 26 Nov 2026 20:33:39 +0530
Message-Id: <20261126150339.2110025-1-piyus@iiitd.ac.in>
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

j1939_xtp_rx_dpo_one() takes the peer's data packet offset and stores it
without checking it against the session:

	session->pkt.dpo = j1939_etp_ctl_to_packet(skb->data);

j1939_session_skb_get_by_offset() then looks for a buffered skb at
pkt.dpo * 7, and j1939_xtp_rx_dat_one() copies into the session's skb at
that offset.  An offset past the session's packet count has no skb behind
it, so the lookup returns NULL and the copy and the completion run on it.

Reject an offset that is not below session->pkt.total, and look the
completed receive message up at offset 0 rather than at whatever window
the peer's last DPO named.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org
Co-developed-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
v3: addresses the review of v2
    (https://lore.kernel.org/r/sashiko-outbox-233959@kernel.org)

    - a second out-of-range DPO no longer leaks the session.  Both
      findings there are right.  j1939_session_cancel() does nothing once
      the state is WAITING_ABORT, so on a second bad DPO the
      j1939_session_timers_cancel() in front of it cancelled the 500 ms
      timeout and nothing restarted it: the session stayed on
      priv->active_session_list with no timers, holding its skb and its
      netdev references, and unregister_netdevice() hangs behind that.
      v3 deactivates the session in that case, the way
      j1939_xtp_rx_rts_session_active() already does for a second RTS.
      The first bad DPO still cancels and lets the abort go out, so the
      change is confined to the session that was already dying.

    - an EOMA no longer completes a cancelled session.
      j1939_xtp_rx_eoma_one() checks the PGN and the size but not the
      state, so an EOMA arriving inside the abort window completed the
      session: with v2 looking the message up at offset 0 that handed the
      aborted session's data to the receiving sockets and queued a second
      J1939_ERRQUEUE_RX_ABORT.  The delivery itself predates this series -
      j1939_session_completed() always called j1939_sk_recv() - but v2 is
      what made it reach a whole message, so the state test belongs here.

v2: rejected the offset instead of tolerating it, and looked the completed
    message up at offset 0.

    How this was found: an AI-driven fuzzing harness built on syzkaller,
    developed jointly by Kapil Vaswani and myself, driving ETP sessions at
    j1939 under KASAN on x86_64.  The analysis and this changelog were
    written with the assistance of a large language model and checked by
    hand against the tree; the reproducer and the KASAN report in the v1
    posting were produced by us.  Both v3 changes come from addressing an
    AI-generated review of v2 on the list, and each mechanism it described
    was read in the tree before being acted on.

Link: https://lore.kernel.org/all/179553126874.3135.14817947057284289051@kernel.org/

 net/can/j1939/transport.c | 49 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f..54e7ae9a88c3 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -1242,10 +1242,15 @@
 	struct sk_buff *se_skb;
 
 	if (!session->transmission) {
-		se_skb = j1939_session_skb_get(session);
-		/* distribute among j1939 receivers */
-		j1939_sk_recv(session->priv, se_skb);
-		consume_skb(se_skb);
+		/* the whole message, not the window the peer's last DPO
+		 * happened to name
+		 */
+		se_skb = j1939_session_skb_get_by_offset(session, 0);
+		if (se_skb) {
+			/* distribute among j1939 receivers */
+			j1939_sk_recv(session->priv, se_skb);
+			consume_skb(se_skb);
+		}
 	}
 
 	j1939_session_deactivate_activate_next(session);
@@ -1418,6 +1423,18 @@
 
 	netdev_dbg(session->priv->ndev, "%s: 0x%p\n", __func__, session);
 
+	if (session->state >= J1939_SESSION_WAITING_ABORT) {
+		/* This session has been cancelled and is waiting for its abort
+		 * to go out.  Completing it here would hand its data to the
+		 * receiving sockets and queue a second RX_ABORT, so leave it to
+		 * the abort path.
+		 */
+		netdev_info(session->priv->ndev,
+			    "%s: 0x%p: EOMA on a cancelled session\n",
+			    __func__, session);
+		return;
+	}
+
 	session->pkt.tx_acked = session->pkt.total;
 	j1939_session_timers_cancel(session);
 	/* transmitted without problems */
@@ -1823,14 +1840,36 @@
 				 struct sk_buff *skb)
 {
 	const u8 *dat = skb->data;
+	unsigned int dpo;
 
 	if (j1939_xtp_rx_cmd_bad_pgn(session, skb))
 		return;
 
 	netdev_dbg(session->priv->ndev, "%s: 0x%p\n", __func__, session);
 
+	dpo = j1939_etp_ctl_to_packet(dat);
+	if (dpo >= session->pkt.total) {
+		bool was_dying = session->state >= J1939_SESSION_WAITING_ABORT;
+
+		netdev_info(session->priv->ndev,
+			    "%s: 0x%p: data packet offset %u is not below the %u packet(s) of this session\n",
+			    __func__, session, dpo, session->pkt.total);
+		j1939_session_timers_cancel(session);
+		j1939_session_cancel(session, J1939_XTP_ABORT_FAULT);
+		if (was_dying)
+			/* The cancel above is a no-op once the state is
+			 * WAITING_ABORT, so it does not restart the timeout
+			 * this function just cancelled.  Deactivate instead,
+			 * as j1939_xtp_rx_rts_session_active() does, or the
+			 * session stays on the active list with no timers and
+			 * holds its skb and netdev references for good.
+			 */
+			j1939_session_deactivate_activate_next(session);
+		return;
+	}
+
 	/* transmitted without problems */
-	session->pkt.dpo = j1939_etp_ctl_to_packet(skb->data);
+	session->pkt.dpo = dpo;
 	session->last_cmd = dat[0];
 	j1939_tp_set_rxtimeout(session, 750);
 
-- 
2.43.0

