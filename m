Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574218;
	b=l94XC0LN3CH1rH7uFieykNk//4Y5bekjbXEIWeEx3gEapKJKncU9aXGkcWi6hpXny4gw
	 GtKRcP7HWwhB211k+hJP/EBHiVBGy2Xm7X3V8OHfM7ieU16o0+Fl+4guYvgV2YXF/HtqL
	 tuQ4kwao61lPxbsf2NtXtD7Oof7C+fGWroX1I8LdC0c+MxSayxh0kXahM8pJivXLQb5oW
	 bnzqO+lDAZsCYFVxAApYN6SEytcNewG4au+Ef+pZjEZuSYcZs5cvDh03Z+mz4DH4xo+Cz
	 Bxh1AS+rQJP8fhaK9gnbq3KVt5S8tLHFcys1h11gSS9M6DO7FlFucvq33Qa4WC6oMRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qcscy56M/CoCoEWONbNvA0WraoTWByCF8svZRDgoSrY=;
	b=37MqBLFVoLg9tnA+73C+JRjP/RNMZMt499ZZlF7Tgvm+STg2oHsEcG/wjmPCrKeE8iDk
	 RkEdSw+2TsSF32+c4J7CCFUwLRZW8oXRHBOqUErQpwTkI73SgaC/kf3OsUUvwBEoA2VmB
	 l77Piz3Y032+p1sEdNm4m/o5ReWSH6A0/nO56WZ4zKiO/YmFSIv9Zd2p6FhbtXFxtPURQ
	 JFra5fSWHdQaoEyjTMngfMOQe9Q4jGTWreRS1C+4kuaiCfbblTncF6G1hp6iUzd3U4ltw
	 txtl5bLg8Ryh1IGt7wpase7gb1dxK9GGsViUOmnR5tqkDGhUEuUNGkogBM5ztq6HOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6JkcNuZ;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A0606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04A0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6JkcNuZ
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b271e573adso2232798b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574217; x=1796179017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcscy56M/CoCoEWONbNvA0WraoTWByCF8svZRDgoSrY=;
        b=w6JkcNuZetKNcfvjGYEZkRJSqOX99DtTgjmY/t9hV67fWOF43XdsPIeBTYmmEN7tqo
         Oe4rl6Gskg3nN9WTVaMEDs+7cBe4MJVpRtuNMoxtbhfM5NAriK7aRrMxnlZ/g3vOB28C
         FLqHPHweaSbTAWnKlIs3HXSRSEwQkUpswJ/BR0/SkW8cgxumMCpw7qcVlpPQYAXRldso
         8qywPQ4QDcRL5YHtCn43ETUlfTBX/JRE4sN72uFkWO+gFJ9SAfauQKhPkpDwDZsAcKV9
         SHQp/N5GieLUvJfNMx2lrBqv6vw4aQ7rTo2wgxdRNRzJPzfL4WEB8cDmLQ86+WHbmTQm
         gnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574217; x=1796179017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcscy56M/CoCoEWONbNvA0WraoTWByCF8svZRDgoSrY=;
        b=BV2F/loyiwhc5HBifAXCF7JdWL+DJw5A3CMKOpJtAqWWVJX2mJ03VSewraXcEexgj2
         KEJHYPAKLzJAnfD1IzDLFfY/up7AqcGZ/yJno4d3gE4YcpIAmhg5+Lh82WbfABZv7Ff7
         XMJzniOcBLGCimc2idVtFaDLJhY3O0WYfm+ajxboYHROFuBmatXAPbgisRNgwAf4TCxS
         +jRHBjJqI8SGI3pYQQ/qZQB4YdRhXQe7J/e3UEOi5tg2MdDwfk0+oVIK9wA4HULvuMJp
         jFkRgM9s77FEkipwIggv+oCAD5wQuZQ5tQstbmDuoaks4smTPWRZLU6/wwYFkQOYiFCp
         MRcg==
X-Forwarded-Encrypted: i=1; AL+hErHTtrzv0p5m2szHJ3glo/Gv2Wt7eFB3yTnH+TLSedeq2EvaTISi6OhNG1nF1lm/VooGfC/u8Nm1PXMfhn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AYnHMzCsTUXgdiI27GpuKjfzTGwueUCiyux1Xb5dh+D99529K
	e8nmGdnfNphgcVYV4/AH/Z0yieC+ChCpxiz7KgllucN0AG2nb1N7uvmH
X-Gm-Gg: AZFdTZeJxTft2hR7KUB/HcLQL8yWfrE1Xdex6KSww5BuWwJKA9XPUn8p4AlVNNcjM1C
	IhW4SILLScL4gRZNrrbHfyxHUlw1e51XXn59JsFXsHLqmeetfXe6leuinZ1y5HaJX0ZLK9B+Qc5
	qOos1M3y5ZyiAq0tV5PZwr2XH8EmiaDnDf2p4NIwPyG+7ixKBFrwya0CxBaoioXQIBM74d/yklo
	yvjeW8MBinDZchBAPeILccY42fW0zhYbfVzHQJb6y6qPy+vLQUcJM7l/oNdXitk26dM2XfIW/mt
	VC7Se6UT3KeSF9I5OlDUfcQYRKdAGlsXQzo2gR/076QSmdl5cV5rV8tm+P0xxBoIe+qYzAk0Sb+
	D2Q0rD6hUiy6bQaGt83Sa1JwtBaXe+g/krZQAC2bPQKj270+mHZGW8cm8rXYNNPyzuBdsXiDXMz
	c69Ze0Q4Nz2+qUoDK2cLJdvVdZFw3SPDwNqjYVfBwTK7uas6dQlW4ke2qHeXn0xhkm9kYIUbRLz
	Y1nUfIKRQujSzA28xocjQtQhApvmV4N2e1EP/FQ+lzv/gtngZv+KwoB15y8sWGSoxotKAJWtloG
	sbDAhZGbC5JdS54ovKOSVvI74LgmkWLlRGO/ZZ3zJIGWYAA/QRqhMXKgJa7YYvslGGs=
X-Received: by 2002:a05:6a00:1820:b0:8b1:1b86:71d2 with SMTP id d2e1a72fcca58-8c87bfa766cmr14875130b3a.22.1795574217152;
        Tue, 24 Nov 2026 18:36:57 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm7294885b3a.23.2026.11.24.18.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:36:56 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jun Yang <junvyyang@tencent.com>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 1/1] sctp: fail the association when the INIT-ACK cannot be processed
Date: Wed, 25 Nov 2026 11:36:50 +0900
Message-ID: <5d2a09ae8d660d10091942d426c0c8f1f82c1705.1795572890.git.kyuwoncho18@gmail.com>
In-Reply-To: <cover.1795572890.git.kyuwoncho18@gmail.com>
References: <cover.1795572890.git.kyuwoncho18@gmail.com>
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

sctp_sf_do_5_1C_ack() queues SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.
If either fails, sctp_cmd_interpreter() stops there, but the association
stays: with the peer marked AUTH capable and asoc->shkey still NULL, a
chunk that the peer wants authenticated, such as the ABORT built by
close() with SO_LINGER {1, 0}, takes a reference on the NULL key:

  BUG: KASAN: null-ptr-deref in sctp_auth_shkey_hold (net/sctp/auth.c:113)
  Write of size 4 at addr 0000000000000018
  Call Trace:
   sctp_auth_shkey_hold (net/sctp/auth.c:113)
   sctp_control_set_owner_w (net/sctp/sm_make_chunk.c:112)
   sctp_make_abort_user (net/sctp/sm_make_chunk.c:1016)
   sctp_close (net/sctp/socket.c:1564)

Process the INIT-ACK and set up the association key directly in
sctp_sf_do_5_1C_ack(), and abort the association with
sctp_stop_t1_and_abort() if either step fails, as is done when the
INIT-ACK fails verification. This also aborts when sctp_process_init()
rejects a peer that is ASCONF capable but not AUTH capable, which used
to drop the INIT-ACK and leave T1-init to expire. SCTP_CMD_PEER_INIT
and SCTP_CMD_ASSOC_SHKEY have no other users, so remove them.

Fixes: 1b1e0bc99474 ("sctp: add refcnt support for sh_key")
Suggested-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/sctp/sm_statefuns.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
index fd9f94c12d42..206fa0b6cd4b 100644
--- a/net/sctp/sm_statefuns.c
+++ b/net/sctp/sm_statefuns.c
@@ -605,9 +605,11 @@ enum sctp_disposition sctp_sf_do_5_1C_ack(struct net *net,
 
 	if (!sctp_process_init((struct sctp_association *)asoc, chunk,
 			       sctp_source(chunk), initchunk, GFP_ATOMIC)) {
-		sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
-				SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
-		return SCTP_DISPOSITION_CONSUME;
+		if (err_chunk)
+			sctp_chunk_free(err_chunk);
+		return sctp_stop_t1_and_abort(net, commands,
+					      SCTP_ERROR_NO_RESOURCE, ENOMEM,
+					      asoc, chunk->transport);
 	}
 
 	/* SCTP-AUTH: generate the association shared keys so that
@@ -615,9 +617,11 @@ enum sctp_disposition sctp_sf_do_5_1C_ack(struct net *net,
 	 */
 	if (sctp_auth_asoc_init_active_key((struct sctp_association *)asoc,
 					   GFP_ATOMIC)) {
-		sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
-				SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
-		return SCTP_DISPOSITION_CONSUME;
+		if (err_chunk)
+			sctp_chunk_free(err_chunk);
+		return sctp_stop_t1_and_abort(net, commands,
+					      SCTP_ERROR_NO_RESOURCE, ENOMEM,
+					      asoc, chunk->transport);
 	}
 
 	/* Reset init error count upon receipt of INIT-ACK.  */
-- 
2.43.0

