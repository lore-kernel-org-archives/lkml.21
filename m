Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991781;
	b=zBxcIvtBRCPx7cJ0pP2B8JZkK6H6MhRuIBVTjIIOcNSd5gxbCYM7l6g7G2aGGbWTqs6P
	 KfUM/QLBLHqC0Dd9bncS+REKdSSvI42DQRI0jeyHDFHoIReOFh8Z2WfFqbGRjeV1bwxNU
	 FrT0cX6QmF3L1sapmqiE5+JvRNA0DG8X0Bweo9B53OV4uAIkbdxFd+4hppcDNcyPM+vZ7
	 A8poZInb+LF0paBs+op8OeE4k5SZVciNt4aB2YzYE3TLnnujrg6AJILOxe1RRfOTk4E3y
	 0uUNKjUI0AeDWTx9pNIhrgFw69pp38WiQIBNFtsoi0ZVb5CSc9KlMrJ0wgtMrJ1oFrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3KSTlKXLcvFE39HjBxEy6lamoTPY2th5Ul1xhrdr1rQ=;
	b=M4Jmyy5ha/bVhFzYh7W3Zi3Q3xVYvfG7XScdq12pib1maIdHKz1OzCvV+tqBRKB/izuv
	 M9sV16C8lRckCpY3hIYb6VsK76RmE/FfLQVLwxJi4OzX+m5zUaD+of5a6U8OK5E6LW/7A
	 kj3sKqtjQ/Gui0CZUcv4D7rNGZnKOkH3AgRKLOc/SEXoIDHAZtXSxoSw/8+oVdd9Z5Asf
	 fAsj3YyXIeouINcXPsvhi9r+oEVMz9418lSNg2X3/BGCCCy8gFL+NC9VE51IudMYBKE9V
	 QpoiKtStRtuPf0BLAtyf3UJIfUHGKPWLPFdbPs80UmlFdo7Rw7Jba8uJTxPx2XRNOGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gf7oNAPC;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F45606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F45606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gf7oNAPC
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8629eb92bebso232237a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991780; x=1795596580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KSTlKXLcvFE39HjBxEy6lamoTPY2th5Ul1xhrdr1rQ=;
        b=Gf7oNAPCCRd1rqT09B1dAuM9Xla1krFFlz71lRsX5gHLceMZr9JWlhfxsSWEdIqvgu
         jWnLgVzQcjc79iyvGw2qLFrIkpOlzzBzpqPHUg8LPZzI3cCDMjbrijlo2UzPryjWkMSd
         utah1JJTmCiBlKbxSHGh67phkY9R+P/83bYqE26gvungBXtQ4gYul+WMZIbnGSJnmMzx
         hVHzsIMHGha3yRdHvRsFxV4dUpQdpTEsXdV5v+fD6k9XV+IuwpK5NtqTGrysvzPu1MnR
         yJULP2q2OXOC6D/Brdldgz4FAnRAv+kMP+ek4DuVITqfgc+r/O3hko0b3oNgJEZetGJi
         hJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991780; x=1795596580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KSTlKXLcvFE39HjBxEy6lamoTPY2th5Ul1xhrdr1rQ=;
        b=v6YDAsVr/HT1lSkGKmsSwKIBag3D8W5DoeEpjGk2oR74HA7/U5j/V7BLwWARPkltk8
         t5jrqkqHmCefVhPrUxApBInL+h+lWeUpLkuKcFMNOeA0GKmpqlj/YGrq0PBOKljSB7Sp
         kXcnFyEYigY+aDXqG7eQ6rvoIZgSB8LOILO+SeK7996F4PcehfVggHNV+waNBhkuD46b
         7IAZNypOpNhuTpI9xsPm2dHpxCu0/BIL7GaTK8qm3jc4Pu9wgRXH5NcGiprUwVOY5ptV
         L8iBOYHL4ew1u2XePrTeXqsHlCPgFsfPhUudsfIBHYvFyEqoJVt0D7p6/+CnmEZUv32r
         H0bg==
X-Forwarded-Encrypted: i=1; AL+hErE9BrQyvSD1cj9MJOJ6qDKUllh2cUDt2bNac71iVeN8ifA9gBJHmarnp0T8D9+E6qBAhbG2ZKlIZYzHsvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TE1rkaEBaFPbFKpVNRs0Xmty5Tzht/zR2J0CCDYVUHL8bFjn3
	J6cFtcwx5pgBW++nK7rPF66obbhq5pJk2E1NhDdLmKwkdbbNncmXtl6u
X-Gm-Gg: AYBFou1QThd4CkU4CKpCYLWtXSlRMZ9arkGKtMoGBLoMn3BFIGiBHICc4hsLNlQqyS+
	z7jf2yDsuV03cidMJXt1DKDQT7CmX77WGxv2AvWrt9BAA8dsj4RUvnUeJ9y9LhE0hjQJMBSMpET
	YlwCTH7Xio5UxpvsnPcUXFBWQqch3nA5na7BnKAqoIioKQbaOhnDGdjpDKvbA8nJv8syBf37CsB
	Ji8/7bq7IQbJwvavC8A7m4Ws1nmzVSmVQLD1lxMN+djTUqMA5Txub0VZO5w/YmxHEwQMKMTEzLm
	YFdW26VJaI7sXl0tI+SC1j80Q2CEpDizoQnZTqlN5EMUtVaSMKaDRJq6q8ic9Su2q45ca0HBCWe
	15dsya30aD5ckoe/GDsIN4Xdr3SeYqlL+wJcWWi1qECmZTK+4kmtnaaHXbAvIfl+kmWmldcvZSD
	hlQ1tTkoi+ikMfgyluYzy9F2sLwQ9MfEubUqNbRYztLIDIfwPJbqBwd67dTrH9k5m0sjDUCNBFz
	jXpeGLa280cyTd7o0h+FMpTCEDAq8oob1eL8MR+3TINoK64WVQANP8J9QGNXaV8FH/dwkRz6QMf
	zrN9tlnRgx4IYl2kX27mpr4UFHVsGLefHQ9UT7+oSYyyLm5oqYQOZP/4BYhyqZIAvjox
X-Received: by 2002:a05:6830:264c:b0:862:a7f2:6d7d with SMTP id 46e09a7af769-862f086c34dmr1737910a34.24.1794991779830;
        Wed, 18 Nov 2026 00:49:39 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm1530710a34.3.2026.11.18.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:49:38 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: initialize sk_peer_lock in cloned sockets
Date: Wed, 18 Nov 2026 16:49:27 +0800
Message-ID: <20261118084927.1756747-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

sock_copy() clones a struct sock with two memcpys that both include
sk_peer_lock.  sk_clone() re-initializes sk_lock, but nothing resets
sk_peer_lock, so a clone created while the parent's sk_peer_lock is held
inherits the lock in the locked state.

The first getsockopt(SO_PEERCRED) on such a child spins forever in
queued_spin_lock_slowpath().  spin_lock() disables preemption, so the
task never schedules and its CPU stops reporting quiescent states; RCU
grace periods then stop and callers of synchronize_rcu(), such as
expand_files() from accept(), hang.

Initialize sk_peer_lock explicitly for the clone.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/core/sock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/sock.c b/net/core/sock.c
index ad414878dc5b..b5e2a2a7741c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2545,6 +2545,10 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 
 	sk_node_init(&newsk->sk_node);
 	sock_lock_init(newsk);
+	/* sock_copy() copies the parent's sk_peer_lock verbatim, including a
+	 * held state, so the clone must start with a fresh lock.
+	 */
+	spin_lock_init(&newsk->sk_peer_lock);
 
 	if (lock)
 		bh_lock_sock(newsk);
-- 
2.43.7

