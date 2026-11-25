Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575462;
	b=3qqLz3sWILupIEchUytknNnyq7OJa4kOGCnLmeH4prmCfDAGAfzm+WwsSa16FtDNZokB
	 5ZsbHJZE+zhri0hFG1oXnpyXmEvL75LmopuBFIN36B6PVqBqeotBED4BoYwFlPAS66iZs
	 Y7BRiN6zbGLOhDXgBcSWo8NaCWrBOFW+eP2UoLCGRQD6Qw2+0fMCFq2imerZVmQAErGXG
	 B5xzDXplHZlCYmHBivbpkQEYPhXv4Nl9ZvZTmc/ufBts3jXcYaSJKePYZi139TAgOziD9
	 tn7T9R9KQL42h4wvE7Yeo/v8ZWrsO88THJZUzWnv4VVkTMre+5xjwSmkQ5HrR9Dzw5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
	b=bgArJNuIZS+ug/me4k4rj6Dq6vbi3Btq5/vQ5FpV8TQHGhWLl47JtJdtqx6W02AtTjt9
	 yTUmvuPCeraGzv1/LoT8/ryERHg+8V6VVH64KtUMJ0BW1ise3mO1XZhG5pdcUrTdJTGSc
	 2KJyuWXuLLJLf6qHd3rMWiuYBcK/+nJHGKFqvQ2B/GBJoq5h3giQELuS6yZDq4iwR+UN0
	 fanlddE2yt2zHyks14d1I2yxfUYsiFJO34Hbv/zEPajBqBS9PqpGnpq+86VS1eRGL04oJ
	 9eBcnWVslp9zxxKVk+j/Q51K2ot9xhnoxf4e3nw2j8DADkVMM/sFQmGdcI8xvD+pwhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9pck++a;
	arc=none smtp.remote-ip=209.85.210.67
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E74606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9pck++a
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-86288992de5so3988467a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575460; x=1796180260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
        b=t9pck++a1w4bc/mxi1Z84pgYZwdNd2gw5rXSY2Hazzt7fsd+ONy4xJDVFKnCck73AG
         eCppw7T6xcbzrFCuZuWPv6wC7/yrV8wRUazl8ni2x+qAEggMepFHaN+g2r7NFooWDBkZ
         x9WeLHk+l584mjuO1qtOb6krBqkc7eJz4Avi1ll/lq6RwyWSC05vCKW1kTYWenhuQ+UC
         7bnKodMtl96aMJjYt+FFRX4AqbgqLg153LtCC+WvWtKozQ0CfNqDTDQ2ivpPKd9aZpSe
         JUT8JIuE16PeTKA2FaUZEVE9baLGvRUdTMQBfZcZRYPS0txuzYjcsib1ALlX80oFJ+vE
         /2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575460; x=1796180260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
        b=cahTR1rpJie+RZAfjaPCQ/odN0BE/MZ7gjeoIVhIpXbPQt58QA9p3wGfwGefvKaTMH
         77Nrn31SSE/zfOdr+Y8k52yxOlpDIPvNVrECIymviZFKbIaa4Mvm60es7FdPUZWT3JLB
         BxHdJgwDpUSgRQDjZ22t96kj7jq3fRynltilR8roVSHFP4FMoFrK9MVPKHzkFIqjNzX8
         Yc6W0ny/0a/W6dk4cCVsZOJMicCpxzwmOFsGYoxjVonIAtBHQLtNsa+XOsrxlQEkSwh3
         re/91fDGlPkdHv9a8I53kaiRL4Q9dOmKr2L5oK6yuLKA6pOKdBqFodzdcNCNyAjJmgTe
         6A2w==
X-Forwarded-Encrypted: i=1; AL+hErFFoi5PDYeNTK7j5x/WVwrh5kc6/NlQwI/VVXT/OHnUDtgauUF/qcmlmcqUolA3NWhJzJsA7evg8hWz95M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lKA4MSkMEOK8TycbKIzjiP/pwoqeaWraPFHWX72T+3pNIKDMD
	7Ss6tWa0e+wrn4VKR5XarFj6XdEezRPm5tct9qKJnTzFsN4SHAfY++sZ
X-Gm-Gg: AZFdTZeFkKbnwrU18LF4YxVEbbCy3isR4M8ruW3jkm+wr6KqiP2eqQ5jgX7Ktt+RURL
	qs1PA/vFCSHeNsqZOkyFJCLjZAbc/d2OjAOlIlKoFoLaV8jeVx0lFjpXI3kh8k+e6d2O8eUjMCi
	P0YjI30agkAQB+UA1z1qQagYdJRZpVw2cF8N9c7UH5vNZGFtqNNLFwVCKB+C7Zi7z8fr7TmPt6H
	jszPFWrCdxS9wCw1jgBCR00eEdIOjIhI48aU+Uj5okob0bHxrDlo9mZ0xBL7K37/IMn4OtbHLvU
	DCODjBOlJ6+iKyeWpnu86nL3MaeB07dxPlU+UnUFx/6uBu9Oh20qBuMkSEBts70aik3EMNyAMef
	oAUbsHqEAUbPMULei6j9nCxCov3+EAxgAbuDRber+Gzhf8SkMhcsecj6JwwK++BSdh9Sq4mgy6B
	Jrs+suAO6jwnDTcXE5zFDi3xg50ODHkiXD8helSJU3KmPV30ZtXsKxKqBk978cizmYZpULedxgQ
	TkIIUFNu+OFW/aRTRF4kvT4C+u1c6TlqaOii8AEpk3DdxwADiVhKnTFAfRWug23oioUrqj1RTnv
	5mw4Y+gD0rXOTA34v7SSasNL69/yrG8RBhWKAbASToaPvcFkGM3ZbdFPiqmnrOCesTsr
X-Received: by 2002:a05:6830:640d:b0:862:c21e:4f75 with SMTP id 46e09a7af769-863091e1e95mr13456344a34.15.1795575460166;
        Tue, 24 Nov 2026 18:57:40 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm10701384a34.4.2026.11.24.18.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:57:38 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH nfc v2] nfc: llcp: walk the accept queue under the socket lock
Date: Wed, 25 Nov 2026 10:57:30 +0800
Message-ID: <20261125025730.383142-1-bsdhenrymartin@gmail.com>
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

llcp_accept_poll() walks parent->accept_queue and reads each child's
sk_state without holding the socket lock.  nfc_llcp_accept_dequeue()
unlinks closed children and drops their creation reference under that
lock, and the last sock_put() frees the child.

A poll() racing with accept() therefore reads a freed child:

  BUG: KASAN: slab-use-after-free in llcp_sock_poll+0x440/0x4e0
  Read of size 1 at addr ffff888112387812 by task poc.bin/528
  Allocated by task 198:
   nfc_llcp_sock_alloc
   nfc_llcp_rx_skb
  Freed by task 529:
   __sk_destruct
   nfc_llcp_accept_dequeue

Take the listener lock around the accept queue walk.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v1 was posted to netdev without a target prefix; netdev does not take
nfc patches, so repost to the nfc tree as [PATCH nfc].  No code change.

v1: https://lore.kernel.org/netdev/20261118083811.1721010-1-bsdhenrymartin@gmail.com/

 net/nfc/llcp_sock.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..3503f1a7a7cc 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -584,8 +584,16 @@ static __poll_t llcp_sock_poll(struct file *file, struct socket *sock,
 
 	sock_poll_wait(file, sock, wait);
 
-	if (sk->sk_state == LLCP_LISTEN)
-		return llcp_accept_poll(sk);
+	if (sk->sk_state == LLCP_LISTEN) {
+		/* nfc_llcp_accept_dequeue() unlinks and frees closed children
+		 * under the listener lock, so the queue can only be walked
+		 * with that lock held.
+		 */
+		lock_sock(sk);
+		mask = llcp_accept_poll(sk);
+		release_sock(sk);
+		return mask;
+	}
 
 	if (sk->sk_err || !skb_queue_empty_lockless(&sk->sk_error_queue))
 		mask |= EPOLLERR |
-- 
2.43.7

