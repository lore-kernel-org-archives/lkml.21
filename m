Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442021;
	b=0OPWqMoc3PGcU9jQqc9fBLfFN14DKoc0YNV+KVrpTqfm5Y+wMOLEjfug6ds8iVk0g3Qb
	 MpaUa+jj0RMy1i42U5hbLCk9ygwEBwstPvrUMsq80OEzg2EZBriUxN5+FUeSrxGk2viO1
	 TyiOj2nIApTIYQMIsj8acZKR+WKoEOxQM3l1eD89iminPUA3oo43WgfpDPTY0NuVIJm10
	 k6n2lPAup1cIq4Iq65HGBpUkgAimwuiNJyk+Hw+ZJl5SEF+sXQypIRCIk6weVxmlbhM3G
	 X0FlwkxZ0dpwHtVoUrGJy+JJ5UPUunZ1ZE4zJ+Wrm4LgR1WsX0DjyiNJm1G1gO+KUoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wm3Sj40aRyFsmu65pREyfH1l8+4v7dZwchrk4/0U/TI=;
	b=x2JqWH08e0BYtjbrxFUhcwmzg5+HtIToiVRkrcSqz57bYsHi7X35w57Zu8mSw3PglmhH
	 0a0HWc+tClnNH/l4ihVGk0YsSswRsmml1thF2t4Lw+D5Xlz/ZHP2Y5SWPJStVNPoPWz68
	 mtLd0/zGNW6tThB75IA2/VfyU92m3P0YgXKuj0X7vp3xRaiHA2fTVNHCYcvCpQP4afZYa
	 txBB3mLJD9xc6QVFHHw7VOickl1eOJf2L+Xi9LmflAnYZnmAhGPow3o0jE6URCy+562kp
	 OJENSX5g6nz85BJ01Xu0y0fM4B7JA5KVUJjCbA1obVWz6YUhg47LBPLA57ARrhw5C0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=YF6GU2Mf;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE14A606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE14A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=YF6GU2Mf
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b600fae14dso991059b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795442020; x=1796046820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wm3Sj40aRyFsmu65pREyfH1l8+4v7dZwchrk4/0U/TI=;
        b=YF6GU2MfzFL+xw6V4/1FgEhvCJ+SGtt7ZwKiCq76seKeW2U+Gmqpj4vH03OMUyVDDn
         bbKQCoH9Sz4bpDHyQY8LdxiQudYEt4WlhgauW4/H9O1bFOZxObOgqoLBVjW1cnxmAi/j
         UBvrOYUztODKaN999/b5ZgmkvhcpiB4UKNcEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442020; x=1796046820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wm3Sj40aRyFsmu65pREyfH1l8+4v7dZwchrk4/0U/TI=;
        b=ar/seD1HcGoqMjz96d6zZEClkV4m7t+N5iEKgrd7Mio+VP+dyYUk3tuUAc9YnYZs5R
         r3o0Uxog8WJDuvP9p3rf6vy/EDoHS7/a/yYM8Wlrf15X6fkOVYvQ3gTE6Gdbh7L+WInO
         GHZvUmgwLww3Io5EIYDeZ/i9pA359rrUjZ6eD75kZn/EXAamcKUe3hPNkAqo7Lycp1Nl
         jivPUzzauCOucRvpl5taQO2svT3Vm9iwco+UWj2vNsnk77eP5Ff8T1xPXSk72/f2HELl
         s3s10h8muOhF/1AxUejlB594ZVMuYRMrWFwD34980+ASnwwomv9hk4HGnOK6Jq7NhSAz
         H4sQ==
X-Forwarded-Encrypted: i=1; AL+hErFv+LXG96BhYMZm5KwQARJwdv5KRq/1/zxiO63S1aObLPWJHnLpT1Z4P5jvulxj9HO47d1m3TjoboZYPcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MTan/nXSw1EwchTyDrZCMMRHgGUhPFImPoKNSXnyk3JQ5XTV8
	8mHSz0KFCJW8HkWPCb6kCshq0BlTbD23+ojmF5p3jUDa8OHebm41J8a5ej8NNe1St/U=
X-Gm-Gg: AZFdTZe/b8GdnSbODYLFlZnBzQDHaH/whzDyQAQxJa+GbmLYV6RTCOa4M1Y8MEaimKi
	csyrN/nPIy1JCIAyWE6S4bAH3WCnmEmiQLWEkFBg/NwX4DefzGF9cFyZ73DTKH+I4ik1icfWzAU
	PwYDFoQa/xBm73nYxfq6H0+X0VNwn/FfUTAIwdgm/CYrXCsz2H1RVg7J83wg2nJk+vq2kBZmVvf
	URnYbkWKTOgT2bNmjW9tWDne0lf1mMhPAwSC1DNGzXUybBqzKgap1PcG+GJPoyTvbqKQCHHD/5u
	HHMetJj56PJGOlMVYUV/krBn8H4oE8yM+juOPNSw0C8+OBxLbzJ5dzlocULFH6VGgAa+Nwi6EHc
	giz9rWN2zy1Zs8EK1xpr3BZ5yMTyxXEV7G8sax/4mW4ZO7KvyVn0HLzb0qUdnvCjDEM+kSqKz67
	59IrW3pCrnQMYrV7zVpUjB5/W/0/sN1jQhbTuQIrbJXYb4u3vAjithKKHFWl+Ey9XqRVYbouCMH
	YMhfGiLRKV2xAC2hRUHW6kthJBFFVwVyWF/XehOF3vbULpHl8UPZPKZ0HPxMsjnrZerfekhdnqK
	wHfnzhU7eqxEpS8n/cvAMptCPklq4KYrHeUGyzsbfmGG6yYJ+RnaOvnT+rJSMLZRgc4GSLJAngt
	wcCklXad6ZStgp6hk0SBH3aP+a9daTMU+r3vqk0FnQoYWdAVYuMYlZUVTea1rh+0X7DzBAelbB0
	s8PPO//FMDEQ==
X-Received: by 2002:a05:6a20:d10f:b0:3eb:9c9f:8b8e with SMTP id adf61e73a8af0-4014e74d04cmr10179615637.92.1795442020015;
        Mon, 23 Nov 2026 05:53:40 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfafsm5713466b3a.50.2026.11.23.05.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:53:39 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: alibuda@linux.alibaba.com,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	netdev@vger.kernel.org
Cc: Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v2 2/2] net/smc: bound the DMB-nocopy send-buffer credit as well
Date: Mon, 23 Nov 2026 19:23:27 +0530
Message-Id: <20261123135327.3953509-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123135327.3953509-1-piyus@iiitd.ac.in>
References: <20261123135327.3953509-1-piyus@iiitd.ac.in>
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

smc_cdc_msg_recv_action() credits sndbuf_space from the peer's consumer
cursor on the SMC-D DMB-nocopy path and then assigns that cursor to this
side's tx_curs_fin:

	diff_tx = smc_curs_diff(conn->sndbuf_desc->len,
				&conn->tx_curs_fin,
				&conn->local_rx_ctrl.cons);
	/* increase local sndbuf space and fin_curs */
	smp_mb__before_atomic();
	atomic_add(diff_tx, &conn->sndbuf_space);
	/* guarantee 0 <= sndbuf_space <= sndbuf_desc->len */
	smp_mb__after_atomic();
	smc_curs_copy(&conn->tx_curs_fin,
		      &conn->local_rx_ctrl.cons, conn);

sndbuf_space can already be non-zero when this runs, so the sum can
exceed sndbuf_desc->len and the comment asserting otherwise does not
hold; smcd_cdc_msg_to_host() takes the cursor in host order with no
validation, so tx_curs_fin can also be assigned a count outside the send
buffer.

Unlike the failover path in the previous patch this is not reachable from
a hostile peer today.  The branch runs only when
smc_ism_support_dmb_nocopy() is true, which needs a dibs device providing
support_mmapped_rdmb(), and the only provider is
drivers/dibs/dibs_loopback.c - where both ends of the connection are the
same kernel and the cursor is written by SMC itself.  So this is
hardening rather than a fix for an observed attack: it keeps the
invariant in the comment true by construction, keeps the cursor inside
the buffer, and stops a future device that implements the op from
inheriting the problem.

Bound the credit by what this side has outstanding and advance
tx_curs_fin by the bounded amount instead of assigning the reported
cursor.  For a cursor that reflects real consumption both are the value
that is used today.

How this was found: by AI-driven fuzzing built on top of syzkaller, on a
loopback-ism connection with the peer's consumer cursor forged by a debug
patch so that it reports consuming data this side never sent.  KASAN
reported an 869056-byte write past the send buffer in smc_tx_sendmsg()
(use-after-free in _copy_from_iter).  With this patch the same forged
cursor credits nothing beyond the outstanding bytes.

Fixes: cc0ab806fc52 ("net/smc: adapt cursor update when sndbuf and peer DMB are merged")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
Link: https://lore.kernel.org/all/20261122053223.2497832-2-piyus@iiitd.ac.in/

This is 2/2 of a two-patch series; there is no cover letter.  The v2
changelog is under the --- line of patch 1/2, and in short: v1 was a single
patch that clamped the copy length in smc_tx_sendmsg() and named this
DMB-nocopy path as a remote attack.  Both were wrong - the clamp left
sndbuf_space inflated, and this path is reachable only on loopback-ism, where
both ends are the same kernel.  v2 bounds the credit at both sites where it is
added; this patch is the hardening half.
 net/smc/smc_cdc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/smc/smc_cdc.c b/net/smc/smc_cdc.c
index 32d6d03df321..9ffa3e422aa1 100644
--- a/net/smc/smc_cdc.c
+++ b/net/smc/smc_cdc.c
@@ -333,6 +333,7 @@ static void smc_cdc_msg_recv_action(struct smc_sock *smc,
 	union smc_host_cursor cons_old, prod_old;
 	struct smc_connection *conn = &smc->conn;
 	int diff_cons, diff_prod, diff_tx;
+	int sent;
 
 	smc_curs_copy(&prod_old, &conn->local_rx_ctrl.prod, conn);
 	smc_curs_copy(&cons_old, &conn->local_rx_ctrl.cons, conn);
@@ -361,13 +362,26 @@ static void smc_cdc_msg_recv_action(struct smc_sock *smc,
 			diff_tx = smc_curs_diff(conn->sndbuf_desc->len,
 						&conn->tx_curs_fin,
 						&conn->local_rx_ctrl.cons);
+			/* This difference comes from the cursor the peer
+			 * reported, which is taken as it arrives.  A peer
+			 * cannot have consumed more than this side has
+			 * outstanding, so bound it by that and advance
+			 * tx_curs_fin by the bounded amount rather than
+			 * assigning the reported cursor: the invariant below
+			 * then holds by construction, and tx_curs_fin stays
+			 * inside the send buffer.
+			 */
+			sent = conn->sndbuf_desc->len -
+			       atomic_read(&conn->sndbuf_space);
+			diff_tx = min_t(int, diff_tx, max_t(int, sent, 0));
+
 			/* increase local sndbuf space and fin_curs */
 			smp_mb__before_atomic();
 			atomic_add(diff_tx, &conn->sndbuf_space);
 			/* guarantee 0 <= sndbuf_space <= sndbuf_desc->len */
 			smp_mb__after_atomic();
-			smc_curs_copy(&conn->tx_curs_fin,
-				      &conn->local_rx_ctrl.cons, conn);
+			smc_curs_add(conn->sndbuf_desc->len,
+				     &conn->tx_curs_fin, diff_tx);
 
 			smc_tx_sndbuf_nonfull(smc);
 		}
-- 
2.34.1

