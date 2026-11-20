Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211084;
	b=OhoHHYQ54iMuTaPwRjcmAF2EHauGmGzllSgEY1neWsVjicYS8VIj5uV19QAg/Q7nOMm4
	 +JBeWtT7qf6Z+OjRFgmaR9LIaKsVJLyNzAsdhLCT/bMKuXZctLttMIEYYLp/iCL7ZUOSE
	 IVBViJM8NB7Uk6bCDTBfQ7uukC7SCwOpsAyJQ1pURWX9xcLCM1sZnnzgn5jtumOT2Emmc
	 PxlMPXzweaPWjCPdRqxLL3IcX9OtCTqydgQm/NYZbgtcXnalxDSEahFrxXYWsVcXXec9M
	 58Gv2d8jYrAqnuB1ojcsA7aiiuOuzh0DjKmcrBwbp6aWlc0R7mHDY6O2xiO+c0vTLFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p/0Ox3V5BO+3FpnWN22VOHbyRzkEWm7sZC7QWkt+6DI=;
	b=fl+qqDN9/gkYCcaC/2ZnTE9WLCuY83X7umqmPrrINIg5XBt587BhKRLN5n6idhoDHvED
	 M1WeHssvtj4gADstyJ4r3FJgyuWz2u6D+czbcBgX3ePjCJLAVlW4EoXeGSC+tChSOhEbA
	 cLmkn+bGGORbd6rBg/fJpt1OT/vF87trhpNx+c+sBA102ZTO6qcRfOMTjweYkejihd15v
	 XO3yAPeK/JUTgu7g4WDegl9tsKO2iA1oGjIPsQNZJHzojSR0aE5CaOIzh78Ulbo3aJVRS
	 4UISHiRqTM9Spyep11EiMkIUWbnHcwg6DNMZQh594+jjyZQqAXDHe6vsz9wy9KI2T2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMmUAfIy;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E733606A697
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E733606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMmUAfIy
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94961b68685so119611985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795211082; x=1795815882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/0Ox3V5BO+3FpnWN22VOHbyRzkEWm7sZC7QWkt+6DI=;
        b=VMmUAfIyNMrmGOB7JZt9y9kNN1YLbwThlBQBxrf/KO4MG67XStnTce0XqCUS/3nHo0
         Nky4kGslYEqsoTFHmxBnnwjmqXQE/7y9cQ7MU+wmcjBuLEJ9vnFLzJ0ygJAYFbNzfCRH
         nYTMfSepxBopwhSVVNtceCH16ak2Yu89c0zlAzR1AFr/pzOH0/rtWWT81xI62Zho8LoB
         kZUSuBctS5P6hj1ocFVe/I2Ho8qs1FHtiDfYAqpLdsCXZynvlOwcOrsR1/YMi5caFaGk
         0Zwxp4dM+hXcIkCbYH4AL/mmEsZi2owEjok4zuxe6QgjFGC93ErTwGzsk6h35KmJXUaT
         WcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211082; x=1795815882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/0Ox3V5BO+3FpnWN22VOHbyRzkEWm7sZC7QWkt+6DI=;
        b=HRI/Y6ccxRP2KOCuEsdcpM4llQiCUFnNXvBQbmBOTnJZ9ypHThZvyqQeoQDlvTnhcj
         G3dGdadQLtDK0Yj2GOpyMxcBzVtygZj4dGED/u9gfT/s4am2QOKcG1oIlcVbOil4oWA1
         w7kYBxkLNSQypNLk+mVCT9hv5ikWTdIQXQ6bpCuxkStN54LDxyrb1KQbFsSnXcyTe/V8
         TdECeOw3d0/z+xBQZ2Wg4+ItWtv8S5tWYOlcPsM5cEyRlRLrQudLFmPyRZIEBDNRfsIK
         L3r1hbYpGctp/4dmwQF3BL5lMQC0Iyb5/OWuihtM04Y56UoVjEyf9R/dD1KFwdFIJAad
         4XMw==
X-Forwarded-Encrypted: i=1; AL+hErGhpXUIIGW5jwh3msREi1EdLdM1pByjmcYsul7IWx91tfO8S1JzNzDS/tBnzH2nSX8ivySq3/7/1LVAobA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RkUQpA47OICPcRqyrRtAxMIHw49J8frhlrQtHCIPLaipUeuy5
	a47MdXuNZMmjTFk8GVDrQaLUJLSHM5vZw5r18kqXPkCp5Cq2Q/grOawR
X-Gm-Gg: AYBFou37LnbRO2VP1/fz068PNKbc3S0DbizoFXLYTtzNOujx69x4OtuToRei+rteUwD
	JI8qUNHAGLTX0cSqRYuoz6p/XMM62B1eshXBWwkzenzGcBgSCfck2ZCD76MhWFAFdRujc+fMQdo
	3u1ITA2zMuZ6YM4tTV8ZeD0AgynYHFUvj9OAYcxGTAZpVTI/I1dCEUVh+BlOQUkhxplWA2WbxaS
	CXlF2CpJTTMz1lJsssRoqp7lLlrxjfO16qml3GOZ4+9Tjjz2Cvl47xU7xE93ctDhyF47QZqUZ3K
	aysZtztDNfTGmRXOyhishh0RhjjH5TyCoxjK7UbFrINF9GRj9SiynXQHjk2aNZZ3BQPPvT+1gGy
	Pn9gwSw4DndCY4PDoomWpnNmez9U+wbMSxhLdI6Sic0e49oaqDpp/lKRBZeWbv2DSwSm2lnSz1x
	gloZds6OGSyXLEk6N8Gdu5vPRz4iDX/MzzSP3uWSewrZHXHiuBYae3bRxEhturdBTRbUBcnxeML
	A7hGdrh90a/6YAKpF8cC6rBck8dnRK55pnxjX1Vcwl9vnut4AcDTfDd60hK/UVHw/N0AxVhT2o6
	6XHZsn0dv3JkiyPi7/+dzYwoOEyl2SGols9HM/0Hq6okGkVf7ACN4+ShDuNHeNZzOZgb43j36N4
	pnXlPgtl4ThhaA8wmV0ohU2t/aDm25qr+gVRUoOSAyUfgzpB7ooiKAze4v1/Z3eqt7C0q/uST2S
	LwYtCzFgVyMyma6zahegiavGqNyc+jXjf1nTEgh2I45/p1OiBW
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr704755285a.27.1795211082080;
        Fri, 20 Nov 2026 13:44:42 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4d9:d040:5fad:8738])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031601sm290337685a.6.2026.11.20.13.44.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:44:41 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] rxrpc: Fix RxGK server to reject an expired ticket
Date: Fri, 20 Nov 2026 16:44:39 -0500
Message-ID: <20261120214439.44958-1-astellman@stellman-greene.com>
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

rxgk_yfs_decode_ticket() decodes the ticket in a RESPONSE and builds a
key from it. Nothing checks the ticket's expiration time before the
connection is set up, so a client holding a token whose ticket has
expired can still open a connection and have its calls delivered to the
service. Section 6.3 of draft-wilkinson-afs3-rxgk-afs-08 says servers
must reject connections secured with an expired token, and rxkad
already rejects an expired ticket in rxkad_decrypt_ticket().

Compare the ticket's end time with the current time before the key is
built, and abort the connection with RXGK_EXPIRED if the ticket has
expired. The key's expiry can't be used for this. An end time less than
one second from 1970 is truncated to 0 in key->expiry, which means no
expiry. An end time one second or more before 1970 makes building the
key fail with -EKEYEXPIRED, and rxgk_extract_token() drops the RESPONSE
without aborting.

A ticket that expires while a connection is open is not handled here.
As with rxkad, the server keeps accepting calls on that connection but
can't send replies.

Reproduced on v7.4-rc3 under QEMU with the in-kernel rxperf server and a
small userspace client. The client's token has an end time in the
future, because the client won't use an expired token, but the ticket
inside it (encrypted with rxperf's test server key) has expired. Without
the patch, a ticket that expired 30 days ago gets a connection and
rxperf reads the whole request. Only its reply fails, with -EKEYEXPIRED.
Tickets with an end time half a second before or after the start of 1970
also get a connection, and their replies succeed. A ticket with an end
time a day before 1970 gets no abort, and the client times out. With the
patch all four are aborted with RXGK_EXPIRED and no request data reaches
rxperf. A token with an unexpired ticket works either way. No other
kernel changes, debug code or error injection were used. There is no
rxrpc selftest.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
v2: Check the ticket's end time directly instead of calling
key_validate() on the new key, which missed end times before or near
1970 (Sashiko).
v1: https://lore.kernel.org/netdev/20261119184541.26343-1-astellman@stellman-greene.com/

A reproducer is available on request.

David, this takes enum rxrpc_abort_reason to 128 entries. Your pending
"rxrpc: Fix packet encryption error handling" adds one more, so with
both it has 129. In a small test, clang treats a __mode(byte) enum as
signed and warns that the 129th value wraps to -128. I can reuse an
existing reason instead if you prefer.

 include/trace/events/rxrpc.h |  1 +
 net/rxrpc/rxgk_app.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index 56dc9b614071..684034c67c69 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -97,6 +97,7 @@
 	EM(rxgk_abort_resp_short_yfs_key,	"rxgk-resp-short-yfs-key") \
 	EM(rxgk_abort_resp_short_yfs_tkt,	"rxgk-resp-short-yfs-tkt") \
 	EM(rxgk_abort_resp_tok_dec,		"rxgk-resp-tok-dec")	\
+	EM(rxgk_abort_resp_tok_expired,		"rxgk-resp-tok-expired") \
 	EM(rxgk_abort_resp_tok_internal_error,	"rxgk-resp-tok-int-err") \
 	EM(rxgk_abort_resp_tok_keyerr,		"rxgk-resp-tok-keyerr")	\
 	EM(rxgk_abort_resp_tok_nokey,		"rxgk-resp-tok-nokey")	\
diff --git a/net/rxrpc/rxgk_app.c b/net/rxrpc/rxgk_app.c
index 200a30064fae..93ee8b84316f 100644
--- a/net/rxrpc/rxgk_app.c
+++ b/net/rxrpc/rxgk_app.c
@@ -47,6 +47,7 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
 	const struct cred *cred = current_cred(); // TODO - use socket creds
 	struct key *key;
 	size_t pre_ticket_len, payload_len;
+	s64 endtime, now;
 	unsigned int klen, enctype;
 	void *payload, *ticket;
 	__be32 *t, *p, *q, *tmp;
@@ -96,6 +97,16 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
 	 * the ticket.
 	 */
 	t = ticket + sizeof(__be32) * 2 + xdr_round_up(klen);
+
+	/* Reject an expired ticket.  An end time of 0 means no expiry. */
+	endtime = (s64)((u64)ntohl(t[5]) << 32 | ntohl(t[6]));
+	now = div_s64(ktime_get_real_ns(), 100);
+	if (endtime != 0 && endtime <= now) {
+		ret = rxrpc_abort_conn(conn, skb, RXGK_EXPIRED, -EKEYEXPIRED,
+				       rxgk_abort_resp_tok_expired);
+		goto error;
+	}
+
 	q = payload + 5 * sizeof(__be32);
 	q[0]  = htonl(RXRPC_SECURITY_YFS_RXGK);
 	q[1]  = t[1];		/* begintime - msw */
-- 
2.43.0

