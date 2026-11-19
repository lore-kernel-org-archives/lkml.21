Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113945;
	b=ZO61B6twgIxQzenifopH7Ogx/OEMj9reuqn9xOCA7fa0ELSLGWlcSx6ta+9YocHO/rjA
	 WHWFKUoWlVcf8expZGKSPL7Ywn0tIpYGf5MSu+gSgN+MihP1V3r8YGjR0fO/v/qKq2pGu
	 HmC1BZRpZSlliKUb2I6/WZ6YZNMFz833RTZlmIQeExeVwPh8uPa9yKlICnjuXmT4cDfe8
	 qFcduvoiFi0nRRXpvTHPd+z1kpcnSPKt3iNNiBSSN7yvz6OIEc5ggh3brU8lzgoM9UOX2
	 kMr4/2HmYaGvcgWNdOf1wo3bDH6XqSryQRC4z8NOShIdgIUGDil0L3uHZyP/MnGfcvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sv8olJzUFogc1iQqa1YZUkBH+/6GFReCOOw7AF+hLEw=;
	b=RBh+c+4GLzoXvqjIvaYmGy7nfTwvEnmDg3vvJIxSvQ0Zaos12TReX6fG5qi8yMAjI889
	 B5l4Q3dlrsqLNnzsbDdosImOsceb9Xj34iZq8vPvb7tAa99FSbFOoyYZrGFqdHQ6oSkly
	 TjqmYVSd6WLx3C8q2IdMqADffHDY4uBWjDEiwwipelsSKYjes0GwMlIhk/o9f5lfmk7dr
	 vsyTrN0ix+fZC8mN1ehwymCDV3VTXdDxg3+wKlfCs1jbnyECj0rzh0CouDez8h2PpzheS
	 OUktv6B44v2d1x+SBhqeD35gucdxDREuDUAvhK3cRKafafPXH9N2lhL3pwlmlLjkM+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjsISXao;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35599606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35599606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjsISXao
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-94937a33cfbso10457285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113944; x=1795718744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sv8olJzUFogc1iQqa1YZUkBH+/6GFReCOOw7AF+hLEw=;
        b=mjsISXao+1fqWbCM2EmEZT24xMN2dtJQyiVGCHZmYNtxPU0aZtbvytwe1VkM2FZgyf
         lb1LvEv4c71QJ+hbmUSevk6L0FEeSoEIEa1e52CInSYxyGpmh2/HDUytIQZQcCzfLBqM
         hm1mA+68xJjp3rxm61rSIEi6kFHxy75oZ5bihX61FTD4+XVxD6o6X6mtbHkr1to00E8r
         1Qhj2/lXJukRLsyXIUeNVqpQO2a8xgz9+55XX+NHgIGkNcMJJEgt+4d5EgHPwcdiHJwc
         Jb4CV+rl5kA8HaaU4gy4ga/WAYZS2BQ7O3DtMedvlPbW+dj7eXH0bU3cf6Mqm2PF12Cw
         rXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113944; x=1795718744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sv8olJzUFogc1iQqa1YZUkBH+/6GFReCOOw7AF+hLEw=;
        b=2hopd6VZXQI8wB69XFM1oJDOaXCahshNAOFfNsXEYhiIY4QWVcWfY9ALXblyt/grqR
         T6pX2wGfbgW9uBXBV4H4cVlHzBAKn6GRCyC54sxu64/i8HdxHQvOgDvGmWwftmYgYssV
         WjcIe94jEP3HAky6Iwx4VvWUpM9NuRWKZd7ni0qmJCEQtFSs4aVOy78bvZokp5Iex3J6
         vmde618GxtSipVmtGmptKfDLRrN5jugSkFE19OLYHqB6zPmb5dcexgwTuVIKgEcQIB55
         p8NqJwPA5G84CaTiDnhcyLdfs6x2W4gMRphnn5IxJNISLIsm2WbDGbAIgv9LdvxghyJ5
         Tmtw==
X-Forwarded-Encrypted: i=1; AL+hErH/TLOPf3cC2/Za5HeYXTvnnN8y5rjbXmF14ZLTl7XKdOccaEoWsHFg3WXLoV3gNnZVXNMBESVyS0dyZMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XnylxTLsquAc9/1fglv1eGm1BRD3UtD5EoURkT4gLeqrzAifp
	PktSy6LDcbAfGzOYV1GGLXBky5VwdVEHMx7sLtbzmajoAj2QGsU9Nh3z
X-Gm-Gg: AYBFou3shz24NnjhSMTKk1ysHrALur1yc8hRM++ypvY++kdMRidLaeLQ5pCCDCIsZTf
	mU4DfXc+EF4PjNZomR4hPNEAEz7ytAJm36B/MhW5bjCWd33LPbnK6jZ131EJR1rkXqeq85239Vf
	AsctXP8in9KDN4JLwEbzNaZfGb7l0oKhV//FpCHX/6aQ6n1KdR5TveqQyfPqVyCTQQt0S35u3Uz
	nPBzPiQesgUm+FhQr0Ob+rqsXM/r0pbQcXUgnKwLjrPlponPHByVhRCx72d7b6ORiD/IKbVxvFa
	FREfnyGlXnJsRYahs3G46tejwAC/6A+GtJgPGZ3mdOOxHodtuj3ND2vPCEiA3yXsTP6qY+ijZnc
	k7Ba7ND0B355ncB7V9hUp1mb3gr0T9C12t0MNgG0XsiKoFd8FFzC1+gcElitbOTmDP817pzxNoH
	v4125mTizSvw/MNRKRZ7G60rPOCYWPpBCVdoLHx5uoCsfYmwQqAJsBvry0iJRqNji69rNtCBvlb
	BrtbOD0jxpJm8D7q4tDlOajhzi/NMFRZHtrLOlY1X05Dgj2erfl2o5wP3kzDRgAdBDZ8BDAY2jW
	TvBQoAZ+O0J64Y+PKpk05t7mXxGuVDBdOkbTPArsG4eA4Rfa6AQi8ye4SnA1C+4ZVcsNgZR/gOd
	RtCVV5SEkUpkGhmOs6dHDeoDuS/EVClJwTvKsWiIGyUHKA8RkbHctTqYiGqphYrr6n0LpKH0ldi
	Nm6Rttyi+ay/PbkTbXj2AhDvjpYQc=
X-Received: by 2002:a05:620a:271a:b0:949:7473:b1a5 with SMTP id af79cd13be357-949bab1d726mr76159685a.55.1795113944016;
        Thu, 19 Nov 2026 10:45:44 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c935:f347:a919:9f78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3c2abesm21186085a.26.2026.11.19.10.45.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 10:45:43 -0800 (PST)
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
Subject: [PATCH net] rxrpc: Fix RxGK server to reject an expired ticket
Date: Thu, 19 Nov 2026 13:45:41 -0500
Message-ID: <20261119184541.26343-1-astellman@stellman-greene.com>
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
key from it, with the key's expiry set from the ticket's expiration
time. Nothing checks that expiry before the connection is set up, so a
client holding a token whose ticket has expired can still open a
connection and have its calls delivered to the service. Section 6.3 of
draft-wilkinson-afs3-rxgk-afs-08 says servers must reject connections
secured with an expired token, and rxkad already rejects an expired
ticket in rxkad_decrypt_ticket().

Check the key with key_validate() after it is instantiated, and abort
the connection with RXGK_EXPIRED if the ticket has expired. A ticket
that expires while a connection is open is not handled here. As with
rxkad, the server keeps accepting calls on that connection but can't
send replies.

Reproduced on v7.4-rc3 under QEMU with the in-kernel rxperf server and a
small userspace client. The client's token has an end time in the
future, because the client won't use an expired token, but the ticket
inside it (encrypted with rxperf's test server key) expired 30 days ago.
Without the patch the connection is set up and rxperf reads the whole
request. Only its reply fails, with -EKEYEXPIRED. With the patch the
connection is aborted with RXGK_EXPIRED and no request data reaches
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
A reproducer is available on request.

David, this takes enum rxrpc_abort_reason to 128 entries. Your pending
"rxrpc: Fix packet encryption error handling" adds one more, so with
both it has 129. In a small test, clang treats a __mode(byte) enum as
signed and warns that the 129th value wraps to -128. I can reuse an
existing reason instead if you prefer.

 include/trace/events/rxrpc.h | 1 +
 net/rxrpc/rxgk_app.c         | 7 +++++++
 2 files changed, 8 insertions(+)

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
index 200a30064fae..34a3bdea531d 100644
--- a/net/rxrpc/rxgk_app.c
+++ b/net/rxrpc/rxgk_app.c
@@ -147,6 +147,13 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
 	if (ret < 0)
 		goto error_key;
 
+	ret = key_validate(key);
+	if (ret < 0) {
+		ret = rxrpc_abort_conn(conn, skb, RXGK_EXPIRED, ret,
+				       rxgk_abort_resp_tok_expired);
+		goto error_key;
+	}
+
 	token = key->payload.data[0];
 	token->no_leak_key = true;
 	*_key = key;

base-commit: 1e575bda30acc0bf01f799cee798d4a1c100d538
-- 
2.43.0

