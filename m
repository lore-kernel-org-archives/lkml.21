Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097484;
	b=hmQ0pFUtHrwKLVgmvsTAuDshw0vGxRnRSiVWEqDkWayCXQK90YODrlo/ZyQITVdj/XJf
	 fmcC/NB0w+w46AEyMcearBcP6T2z0kjHdAF3wlPfuH88GU5QkbfbxpoHmDL5NOyz+YQGJ
	 y6NKT30cz1wGt18ASIv16zK1CeHRLuSkEOhrDn9HVj3/M9+r3LZ6RwFliIl4f4Lz/zGbk
	 s8apd96pncKRy84Mg6rjnUwnLUOZZG3b1rFIAA/lf0NFsoVFi6Lta/OBWDB6jHIQHOMlh
	 86hW3R+s2PCqis1AlAeaaEGu2GfQo5IVpzAyDiGth6Bsvy3eDUnU6PEjpfTBYSLtI0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NlHcMsNltoA1RVaZWqS6lSMU0wyom7V9Dy7Nz9l2BTs=;
	b=IeTBGQunXaVTwmoGUuSG2ziRzOXMTEqQvgBGovFRO1lghQExb7K7glPO0BiV8UwahOd7
	 YIjC+KcuArNCtCBiDSt1pkwDGa0pkLzUu3oBE5kUNFXqW1qoKhAd1QOoAFEDMrd3tjWju
	 Cdk3fvPu1DJaQn+rzL/il5eg1ZCs9dHis8/Pa/RczkM3F0NjM9ySx587a7AIbkaKl4aiW
	 dE+RtAuwpKsuGbsBvvx9L9++T8OTZv9HfDl3LefS2mMjcIilPNSnFYDX0bpGa+NNyHkdM
	 xIcE1at/uqdskZe4kc8AetD2TfDoZZJQo90/nDMvDOv6u95QUl8i4PdjRRQUODr89Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=C62OlvOA;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCFE606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECCFE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=C62OlvOA
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f2f2edb19so206645785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795097483; x=1795702283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlHcMsNltoA1RVaZWqS6lSMU0wyom7V9Dy7Nz9l2BTs=;
        b=C62OlvOAXzi4l3BV2Zpwe4h2T9O9R2BzGDUfWmfgpUkF4npm0CMGEV42snp0axiNa3
         b/klUNHafSiWBMa2qJ75Cn99ns94DPkT6Lb9AcJGAB4o0QToYI0jHQ3KKfOx3OjhwLHu
         HixNHj6nbJ2L0bkg5u5KbN4/mQXS2IcE7erQkZB5HStMTu7y192zXERmzQHmXxSDZ6Hw
         x3UC+ccCWjd2Hq2epzA1tRikTa9xgBBwMN140CzcUQ97e3k9QI+5VvnSYHuo42VczYjB
         w/qUTEfWZzuMyqtUKprESNbwkMaAuMkMkWpwJEh1h0KukeMWzYz5IsW33P+4QRpgRJgr
         boGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097483; x=1795702283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlHcMsNltoA1RVaZWqS6lSMU0wyom7V9Dy7Nz9l2BTs=;
        b=wf2W6HjPNoeZsvYg1an+egwGNIfXy14KiO2K1OBPEaAdHhcHXCgVcvZD/u8dmvNLP0
         Ci1f57iWPLpHbiYcwd2fLqy5Xbuu1l0OTW8SqYrdlJYiHKDn7h/VGqkEd0+flaFl/NRK
         lqpKTkFXPxSnPxG9G6pRHmldV7OVxkyD3tCyX8Gr7F4Eo1DE370VM8pJWyMbEYgRQCdx
         FJ69BcxPz16fDVwHB+bdwUbsFHo+2dB6mXySZnj37Zro5qjFPmE/yq66/DMnuPGphRe5
         RBSfLfYhJSE6Rkm8wV76f/fxq6WoVayjFs7hPHVrOf8EXbvknSimmynLyQKr0Hu/vt0Z
         2atw==
X-Forwarded-Encrypted: i=1; AL+hErGhQ/V6MVlopQRJVFS2hxY1FGRHv3z1pQLmzwI7BKfbCzLIBOErBU2TpCzG1fqyCMPRdeb3JXRk+kfGlN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+ZMHEsj0oHd95LCqz9+t6P0J0yIAfMKVe2xuI0rsTUyU51Pr0
	GTYIohrEIIFtX+fABLjh21DKFxY26EuaEkHGFHE8GptbtocAaQdu0GiBMRs+ORI8rQ==
X-Gm-Gg: AYBFou22QlU7ZaOOU6X8u/dqP26hXsDOliPbjtdIuQf0RgDYPTCDS+/++GJ84h5DHcj
	MRsunkBi/P0M2NjjqYX+n2P30hKqKD/1kXHQOY9K1WjpQlzJvBUcKY7tYn4hCk8nZDbCQrGNpv3
	mk7seJ1pGd76RYVDLVNVKZOXlnKDBXiNRUE/x0zvANJsMsQTn+tyW2X9Rd/vRoUb5SJQ2Ts87Fn
	f9NX3KNYqDgMjKjeyglu6LTPWml+YY8n0URqQpAR8wx8rWKkllE40R0I9uLY0fgFSltTh1CF9na
	O1ac0jKRtxMsewOvJKYYF5u++jMTMTY9xBic0GKa0YenlDMu2eKCLCs9Pn9H/Xksohk3ivnYpfM
	4LuIxG9bwPnhTL4NmEHhQXnVeQGrylVYSaQzqwpbaJQK1XttjMmz743fzae1GQqcJa8jHmrX0GG
	xly/tt3oOOugwZ+Gs/6MKfF73PCNUko2dNtgsW9AVGzvFoCUnqFI08PQr77YY3Ew9XnrdtpjVA4
	1nkG2TkhWCIsXeCruNAx6KXtORNHzuset1SvWcU810vpCIbXdce4BmcG2lOXzfIKkkHDsDJLby3
	kl4prIzKMWe0WKNjZFoq2oWgJspqCobbIWtq0jq1cy8lcOexv9A=
X-Received: by 2002:a05:620a:394c:b0:949:91c6:973e with SMTP id af79cd13be357-94999602219mr1058615385a.65.1795097482486;
        Thu, 19 Nov 2026 06:11:22 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949b9ad0cdfsm57885a.39.2026.11.19.06.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:11:22 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	Benjamin Coddington <ben.coddington@hammerspace.com>,
	Rishikesh Jethwani <rjethwani@purestorage.com>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tls: fix send() returning success after the TCP send failed
Date: Thu, 19 Nov 2026 09:11:06 -0500
Message-ID: <20261119141106.840038-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling") made
tls_tx_records() pass the error of the TCP send to tls_err_abort()
instead of -EBADMSG.

However, the transmit path relied on EBADMSG in two places.
bpf_exec_tx_verdict() looks for it in sk_err to tell that the record
was not sent, and sk_stream_error() leaves it in sk_err, so later sends
failed early. Neither holds for EPIPE. As of now, send() on a kTLS
socket returns success after the TCP connection can no longer send, for
example after shutdown(SHUT_WR) or after a reset. Nothing reaches the
peer, the caller is not told, and every send queues one more record
until the socket is closed.

The issue can be reproduced with:

    python3 - <<'EOF'
    import socket, struct
    l = socket.create_server(("127.0.0.1", 0))
    c = socket.create_connection(l.getsockname())
    c.setsockopt(socket.SOL_TCP, 31, b"tls")
    c.setsockopt(282, 1, struct.pack("HH", 0x0303, 51) + bytes(36))
    c.shutdown(socket.SHUT_WR)
    print(c.send(b"hello"))
    EOF

Before commit b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling"),
the result is:

    OSError: [Errno 74] Bad message

After that commit, the result is:

    5

Record the error in the TX context when tls_tx_records() aborts the
connection. Do not count the record as sent, and fail later sends with
that error before they take any data. The send() above then fails with
EPIPE, as it does on a plain TCP socket.

Found while comparing the behaviour of different kernel versions. The
program above reproduces it on an unmodified kernel. Tested with that
program and with the tls selftests.

Fixes: b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behaviour of different kernel versions.
I used an LLM to analyse the problem and to draft the patch and this
message, and I analyzed the result myself.

Changes in v2:
- Keep the abort in the TX context, so that later sends fail and queue
  nothing. v1 only fixed the send that hit the error.
- Tell that the record was not sent from that state, not from sk_err.
- Cc the address of the fixed commit's author and the bpf list.
v1: https://lore.kernel.org/netdev/20261113193649.3822306-1-hengyul@cs.unc.edu/

With 20000 sends of 16 KiB after shutdown(SHUT_WR), net reports 19856
of them as sent and TCP memory grows from 15 to 158882 pages. With this
patch, all of them fail with EPIPE and TCP memory stays at 0 pages.

Rishikesh's "tls: make the record number wrap abort final" adds a
similar state for another abort. I can rebase on it if it goes in first.

 include/net/tls.h |  1 +
 net/tls/tls_sw.c  | 22 +++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index 0b001b8ab1c3..7d43ffe46f33 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -100,6 +100,7 @@ struct tls_sw_context_tx {
 	struct tls_rec *open_rec;
 	struct list_head tx_list;
 	atomic_t encrypt_pending;
+	int abort_err; /* error of the send that aborted TX, never cleared */
 	u8 async_capable:1;
 
 #define BIT_TX_SCHEDULED	0
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 226e0f176fdc..795cbfe5fb2a 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -413,6 +413,9 @@ int tls_tx_records(struct sock *sk, int flags)
 	struct sk_msg *msg_en;
 	int tx_flags, rc = 0;
 
+	if (unlikely(ctx->abort_err))
+		return ctx->abort_err;
+
 	if (tls_is_partially_sent_record(tls_ctx)) {
 		rec = list_first_entry(&ctx->tx_list,
 				       struct tls_rec, list);
@@ -459,8 +462,11 @@ int tls_tx_records(struct sock *sk, int flags)
 	}
 
 tx_err:
-	if (rc < 0 && rc != -EAGAIN && rc != -EINTR && rc != -ERESTARTSYS)
+	if (rc < 0 && rc != -EAGAIN && rc != -EINTR && rc != -ERESTARTSYS) {
+		/* sk_err is cleared when it is reported, keep the abort */
+		ctx->abort_err = rc;
 		tls_err_abort(sk, rc);
+	}
 
 	return rc;
 }
@@ -636,6 +642,9 @@ static int tls_push_record(struct sock *sk, int flags,
 	if (!rec)
 		return 0;
 
+	if (unlikely(ctx->abort_err))
+		return ctx->abort_err;
+
 	msg_pl = &rec->msg_plaintext;
 	msg_en = &rec->msg_encrypted;
 
@@ -708,13 +717,15 @@ static int tls_push_record(struct sock *sk, int flags,
 static int bpf_exec_tx_verdict(struct sk_msg *msg, struct sock *sk,
 			       u8 record_type, ssize_t *copied, int flags)
 {
+	struct tls_sw_context_tx *ctx = tls_sw_ctx_tx(tls_get_ctx(sk));
 	int err;
 
 	err = tls_push_record(sk, flags, record_type);
-	if (err && err != -EINPROGRESS && sk->sk_err == EBADMSG) {
+	if (err && err != -EINPROGRESS &&
+	    (ctx->abort_err || sk->sk_err == EBADMSG)) {
 		*copied -= sk_msg_free(sk, msg);
 		tls_free_open_rec(sk);
-		err = -sk->sk_err;
+		err = ctx->abort_err ?: -EBADMSG;
 	}
 	return err;
 }
@@ -807,6 +818,11 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 	}
 
 	while (msg_data_left(msg)) {
+		if (unlikely(ctx->abort_err)) {
+			ret = ctx->abort_err;
+			goto send_end;
+		}
+
 		if (sk->sk_err) {
 			ret = -sk->sk_err;
 			goto send_end;

base-commit: a8aeac0b1883206cf72461258e6bfd991589049e
-- 
2.53.0

