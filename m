Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486890;
	b=a+P2c5b72StUoLqdeNq08CNe6mz+8aaEm2HmLLnqUG4pBQS8tO70nZL6XNcYDFiq8Ko6
	 9ouEJ/300CJs7IZPm8JlZMgVRAUVeGKd4sCyFhN8Hr5a9/zTf7S//pl7ICtuS6BW8+v8m
	 vN2U+LVDKQPMAYMSGP6DgQlwsebFoE1wEa3WCi6qONe0xwwfxiWGvewZxee2MCy6onGuJ
	 b7Xu3ZUabaOdmfVDMn1XOu3l2OhyBRmP7FFcc+8WXyZPDN0XH1DxAooKpFlKm+uCgjWSB
	 mIIYrfd274Q751gHacjAEqsmIpOjk2FG/EOH9CwEarTM3MCyAM6XWrlhRzuP8IGPIcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S167o9uoutsfP2jut1Z47ahN/OtfjROuup7AudPgKbg=;
	b=thD/bS6ln86M8gr6xBRjOx6aom0VyjYQI8LpT1dSOfBEM3yEQ3TIJPV4bY3MktLaC3zg
	 fm6jOsw/O1VawgHI3oPBWr+FrNWqWEbuBcdy0BwlgkDWz7irOjPVmsuKYdGzVqK8SsNal
	 UqAWKVkQE/EN2KgHphLHe4B/XZwIcAAp9V3bkFFb2B8wijTXorBIsXHHSdJc4bKYiBFYc
	 gnhe/E8dztmsIAgb+KDiHKfUIp5uNndOyoaJaWUotblfY7hbm6l0Z8cE0xYCV9OM7oV0q
	 D2bQ4gn3T5xsnPBdVcE8m2jQi6x9Xvu2Pk1P9ZX5JwBLdgz9Rd49MPjj8GWIomegyZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZz9fFo;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975FF606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975FF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZz9fFo
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0a0d1a1e5so7578685ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486890; x=1796091690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S167o9uoutsfP2jut1Z47ahN/OtfjROuup7AudPgKbg=;
        b=LpZz9fFoyKJtDc3WnHBrsmEvV1Pgqp5tX4/73EvjvaCXtckQ86HWu1lM4yKPOLSPyQ
         3Bs+OqDHcG4rghN6o+2neRpZD63e8a4GSmp/mNk8x/JJIGmuD3ddPikpZO7cLq1TUrFU
         +19rYkQxY0aG4B1JpwKD0QJ0cTOFBiuNDNManLol9/QJUqLnBpAb2+X9/kf7gS7SXDEe
         eiCE4aQTWJtXTPrus5OhWQieSbp8YtiYVYem01xsReDaLYaSwpcGEI3ZEJzyb0LFWfFd
         WU3jD7OMVfDokDSjW1E/dw9/lqsoeD4kQpyx1oSxxjYc2ora9ejnMWAHzCSNVjrKnerp
         brlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486890; x=1796091690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S167o9uoutsfP2jut1Z47ahN/OtfjROuup7AudPgKbg=;
        b=MrLkLaLPJsD+vFlEJMjFuv08coK6geBlVDXKs/ncZLKLqfKI8hd6cDTczBkSRKrPya
         D1cQE6DZcchCew2TprsYrQ97sn+HKxfQxMI6TaZyOofIzIynmBuRvssr/9Ua0SjJ1nbJ
         s+VtlmkgtP53LPNuZmzfNiL0ir8o90HifhbUQcZcpDPy4MXTvUHpH/PIs3dK9zLGLXJb
         LI2L6uuSe6uBK9vw04cN4cDC8AiwkYnAFFS+fuNJ8nnjXlQ2Au2aWdn9T5HUwiFJ5Ak7
         O79HlATh96Q9oPWbg50THSHZbK5HoWlE/qlbpwKToc/w+fAGRnvjmIxseLcRX+0hlu1z
         JO4A==
X-Forwarded-Encrypted: i=1; AL+hErHxy4eB7Q4JN5EdOeMSAC+6lcoYTuCVWb7BIXMlEXGhVspV+y7GzTIfTFuJ+sHnKgd0vNwLPXnerM43O1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x65dIQbCD5A1y3GjgQoN8uXwoI0wkeKYvPaavKtAYxdeoLrCy
	ji9zUK9N1iF8KlhDDdnZ5IMX2z/Nk4XIZOhSSclPtdrcWyh52GVEmGRF
X-Gm-Gg: AZFdTZfYM5VpfWeA6DYfTl1N5lSthc2gn8mQcdbmzvW0H2lMKvePg3Lxqe0Cj4oTRUW
	36sZDTNmKt53o6XTcCcFpQ8IZIsD7pxACbXGKst9xFbqeyupGP6E7AuqFyxajqYOPf+J5dT5QMe
	KfHUkn+9T8eAIMvMvfOzGbYRfikqqEb/jNosJXgQWcgr1Un3xlPO50mhzsBSopHhyTK3F3KKUfM
	QoHk/CW6gs99dVgl9tXhqbcrJXPO4t4Ua9H497jRRV4lqelqi3kTjRkv2G8oOCyl0GXtdHOk25K
	1Jj07gJmnD7puFica9jlbkfWIknS9BwIGeiYuuDyP8oNCBFjl4MlnYzUUg8plqP0hpSwuqLSZJF
	nirKf2+LMXzoH3IvVO5Cnv/SGy1zbASeC3rjxsEcY0G8TS2ssj34s1bDo4H4IvliyyK7mP49zOM
	VfWP4C+gUBs2P5UHNxuovv1ENb3n9RLY/MzSsUjEyxpllykfDZu8GrdpBQ6y8iqqoikKqvZ9uPP
	QzPjide6svO6OpbepBGxjZx+2zCTYay3JgVEra95W2IOMsoyu+mfhGrRqUF6DJMeJceVUsK7sqG
	HigkJ/3+1+YcIfWAf4r+F5/wZQP7otaUn4xfQVroriz1XuGeIuI+YS2maNyM3va7bUwPr+3Seg=
	=
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr128824035ad.54.1795486889807;
        Mon, 23 Nov 2026 18:21:29 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b7be3347sm7003095ad.15.2026.11.23.18.21.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 18:21:29 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: marcelo.leitner@gmail.com,
	lucien.xin@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vladislav.yasevich@hp.com,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	stable@vger.kernel.org,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net v2] sctp: preserve the peer transport during INIT error cleanup
Date: Tue, 24 Nov 2026 10:21:00 +0800
Message-ID: <20261124022107.32283-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

sctp_process_init() removes non-ACTIVE peer transports when INIT processing
fails. The transport matching peer_addr may itself be UNCONFIRMED, because
sctp_assoc_add_peer() only promotes an existing UNKNOWN transport to
ACTIVE.

If no ACTIVE transport remains, the cleanup can remove the last transport.
sctp_assoc_rm_peer() then interprets the empty list head as a transport and
passes the invalid replacement to sctp_assoc_set_primary(). KASAN reports a
null-ptr-deref in sctp_ulpevent_notify_peer_addr_change() through
sctp_assoc_rm_peer() and sctp_process_init().

Keep the transport matching peer_addr while removing the other non-ACTIVE
transports. This preserves a valid replacement path without retaining an
arbitrary UNCONFIRMED address from failed INIT processing. On a live
COOKIE_WAIT association, T1-init remains armed and can continue using the
retained transport until association teardown. Successful INIT processing
is unchanged.

Fixes: add52379dde2 ("sctp: Fix oops when INIT-ACK indicates that peer doesn't support AUTH")
Cc: stable@vger.kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Link: https://lore.kernel.org/netdev/20261112092114.12458-1-ljp1205831794@gmail.com/
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
v2:
- Keep the transport matching peer_addr instead of an arbitrary last
  transport, as suggested by Xin Long.
- Update the subject, cleanup comment, and commit message to describe the
  retained transport's use by a live COOKIE_WAIT association.

 net/sctp/sm_make_chunk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index 15c2d87575a8..65594eaaeacd 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -2525,10 +2525,14 @@ int sctp_process_init(struct sctp_association *asoc, struct sctp_chunk *chunk,
 	return 1;
 
 clean_up:
-	/* Release the transport structures. */
+	/*
+	 * Release non-ACTIVE transports except the one for peer_addr.
+	 * Keep it so sctp_assoc_rm_peer() always has a replacement path.
+	 */
 	list_for_each_safe(pos, temp, &asoc->peer.transport_addr_list) {
 		transport = list_entry(pos, struct sctp_transport, transports);
-		if (transport->state != SCTP_ACTIVE)
+		if (transport->state != SCTP_ACTIVE &&
+		    !sctp_cmp_addr_exact(&transport->ipaddr, peer_addr))
 			sctp_assoc_rm_peer(asoc, transport);
 	}
 

base-commit: 145480b28ca82e9fae789427cc4569e596515a32
-- 
2.55.0

