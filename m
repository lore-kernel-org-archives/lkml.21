Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995354;
	b=wCn/muz3keNSqJ8BlLmThz4UVgGluz08uNeymOqTuG57V3sv7EKDhB3DncnTf+UzdTrE
	 KEvA5svlwId3MrJKTgwqH+WztvhTXslh8OZVv1BjOSju9nirQfN85KeJMdARtW5H/49AR
	 upJZEt3tE9axtMdnH8+ZfgvmU+ocyvPMnp9BWQpzV+DWXAQEpXiEoqPLdK2HCtb6h2BSU
	 a8EZkh6v9pxQly63g8t7pacfC2UuAeHadKolhL8FBVfo2T9dMy/BL5rtw7DGMQGMHs1Fz
	 o2JDesYSYsd2n+BqYrOFFvQ07bmJy3lwJ6jKKi2aGdVqn8sry0LJBu1IR47NACPev6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cYYEd9Y/llbfs9yVbWJzUGEpA5R9yePtOz4eFsjI2i0=;
	b=sYEQPEpnTO1hU0ga7Q4jn+lQgwDFulKfNh0uTpD9QA+wnRhM+S9b4Xq7zwOfLp+ArsYZ
	 ampZRaQ8GgmEXKvGADtE1+u4IhYLd6GEozspDv+f+X68GuRwl8JzbExvcOEWSLokPCOuO
	 GGbAQg7PnoSo8y6L9umTI8+dWlpfqIaikoQaDG0YMqM6F9XjmLnHRc5kiCfho7nLpSNaZ
	 VubGUdMwlnwAA5BGXi6Bf2KY8LBVum4rhSnwdemhoRcgxqTe3Lz06wkulCXaks3HoHWzK
	 1aqc1nVa5o03ETfvZgEv5djEq+2PuwR1GIpCRPwAFTJbIzTRtgCbwHx1HpryhnOcKhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=TwLCzfJy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF101606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF101606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=TwLCzfJy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so7781745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1794995352; x=1795600152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYYEd9Y/llbfs9yVbWJzUGEpA5R9yePtOz4eFsjI2i0=;
        b=TwLCzfJysP/ordwYkhVjDPJyiUqimddrgEmY9S/fQLCQIOPAzjR9pVzCtiLsDTCh1P
         14eHjWGWytjDWhGvcA3r/KtJiWN7bb4gAUerqP26iI12K2ejXecRWDdhMcupzIjGLR6u
         jZRpc55u0HRrG/AAjp6qW4SSPkFSCKlETnbewmeiVDDCz/RwJaGjLuCixs/2E5f+a/MT
         /9cz1kDIjBGh1tD6vwLdDkBxCmE4TZlQBdgq9olzSAaGDgGGf9dmqwgT9SP3HanhDvay
         2+rzDu6SNOjR5mZSNav6treP9EJkxTyGl0AQp2sCjLnXYHQ1txjnuzeYGhe4lrh5773F
         oSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995352; x=1795600152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYYEd9Y/llbfs9yVbWJzUGEpA5R9yePtOz4eFsjI2i0=;
        b=Pf6rPNnS4F4zVH3hS26VBbmDKbkIVbASvvRhqN/8KEDREV4toVRa4/Ou1gRLU+wYC2
         piv1YXt3R1n726egC0eMNfWZn1dS8XXBft2v8SEx5qnUX0EXXwf/q/3XYpYeB73w07s9
         twtxoOarJaqxl7GcClKHgGgzlmvSDbSsyVufKwcPC3gGNg/K0HuQCpu7tAwRT8D1EDgL
         BqHSVwnjmn8ePxDcqlpqBTvEuX7u4ScrBMwG7oRd6YtyXH71V/LAihQ3zOaDw+kWbjeg
         SCOqonraqyXQwJ9tZdofpPLPGUaqWRTsDfjVAWIKVAJBgteivp2cwOvtaxgqUaMHJ1DW
         cFWQ==
X-Forwarded-Encrypted: i=1; AL+hErHHzIEA44nr1iKGrzWjrmFElDtVureNLECd6S3aWxD2LdiK9nB1SGKrCVpRsapT3zHNTftumMTqpX1FD5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DazJ1nwrzbTV6S8AryW1Vq2RoMcWG96NgcBhqLTdPwmQhIvPZ
	tmqoF14NFbkwqoc+E0gYEqnxOM/IYn8dmv9geX2/d9Yspt4slSJSlwtxr+6k6XpNbI8BPxJwHUe
	fIVuk
X-Gm-Gg: AYBFou25ad68X1mICF2Q8OgE548LyAGMDyvZj9tmE7VpDd9VH0JZk+pGXFKH80QkV4H
	hFkBu5/TTG/Ou1dHMKCSDUcwbn5caVd2pHGJ6Gxb/zt9VGDyxxWtKj0npEEieVe7SdEMznBgnsV
	+S8pXCmI36eJAUB+xC+b3yqcID2yAPeR4zkxpPnAIkwBwF3zQNzWbAK8xbWKBVp73vyLkGaJLIw
	uP1zi3y6TJaZ+Rfdu2w1QZqU34w5kHGyOLK1HNtDT4y5oNMTIuaSm4v8NYw9BVOcCiluL8wLFdh
	TgRk6dOJETG6g5k1tsxNOSy6PhhVwD6PuX4CjQzBeEonBzZgKNSugJwhPKe469yLoPRTorqddoi
	iz+3MserlsGb3RPdmwLcXy0i4cX1UzyH5J6CnH3hcwJp3SsbUoBZojLnxq6U1B6jU92I99ExE/i
	vt6EOfQr+s0XwI3Nile0xhYd1tsfjRjEy3dO8LEEljuGyO5TXKD9gR4evM0w7emLCdjyYxWF+vG
	YJJC3SciQrwQAjy7ecLHMjJXLIlSy34Q3J1r4b8y+fFTL89iUJG/Ffu1B1eL6Im7P2zc/Nl19q5
	/RIJSvowgy/J7J2Qt9usx159InrVq/ZNAA4z6nOueua1CLzXd9FLiAAXxl1qDQndbBFSasVsxXZ
	t8M8NwP4ogOQque8FYDMs12hWng==
X-Received: by 2002:a05:600c:19d2:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb7d5d6636mr38640805e9.1.1794995352243;
        Wed, 18 Nov 2026 01:49:12 -0800 (PST)
Received: from localhost.localdomain (static.16.56.4.46.clients.your-server.de. [46.4.56.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm188858905e9.8.2026.11.18.01.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:49:11 -0800 (PST)
From: Jaskaran Singh <jsingh@cloudlinux.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: RFCOMM: add the listening session under rfcomm_mutex
Date: Wed, 18 Nov 2026 09:49:11 +0000
Message-ID: <20261118094911.277-1-jsingh@cloudlinux.com>
X-Mailer: git-send-email 2.47.3
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

Sessions are added to session_list by rfcomm_dlc_open() and by
rfcomm_accept_connection(), and removed by rfcomm_session_close(), all
with rfcomm_mutex held.  The listening session is the exception:
krfcommd adds it in rfcomm_add_listener() without taking the mutex.

That relies on krfcommd adding its listener before anything else can
reach session_list.  rfcomm_init() starts krfcommd with kthread_run(),
which only wakes the new thread, and then goes on to
rfcomm_init_sockets().  Once bt_sock_register() has made
BTPROTO_RFCOMM available, a connect() can reach rfcomm_dlc_open() and
add a session while krfcommd is adding the listener. The two
list_add() calls on session_list then race and corrupt the list:

  list_add corruption. next->prev should be prev (ffffffffc0f12540), but was ffff8cdd86b43700. (next=ffff8cdd84444f80).
  ------------[ cut here ]------------
  kernel BUG at lib/list_debug.c:29!
  Oops: invalid opcode: 0000 [#1] SMP PTI
  CPU: 1 UID: 0 PID: 7188 Comm: krfcommd Kdump: loaded Not tainted 7.4.0-rc2-vanilla #2 PREEMPT(lazy)
  RIP: 0010:__list_add_valid_or_report+0x6d/0xa0
  Call Trace:
   <TASK>
   rfcomm_session_add+0xa5/0x110 [rfcomm]
   rfcomm_run+0x145/0x1bb0 [rfcomm]
   kthread+0xe9/0x120
   ret_from_fork+0x2bc/0x350
   ret_from_fork_asm+0x1a/0x30
   </TASK>

The above stack trace was reproduced on a rfcomm module with an added
msleep(200) before the rfcomm_add_listener() call.

Add the listening session with rfcomm_mutex held, like the other
sessions.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jaskaran Singh <jsingh@cloudlinux.com>
---
The trace above is from mainline v7.4-rc2 (Debian trixie's kernel
config).  rfcomm.ko was rebuilt in-tree with one debug change,
msleep(200) before rfcomm_add_listener() in rfcomm_run(), so that the
listener is added after rfcomm_init_sockets() has made BTPROTO_RFCOMM
reachable. The corruption above hit on the 9th module load. 

Without any added delay it was not observed (0 hits in ~158,000 module
loads).

The race was found and reproduced with the help of an AI coding
assistant (Claude). Reproducer available on request.


 net/bluetooth/rfcomm/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index 8a4205347c4a..2d35121224a0 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -2219,7 +2219,9 @@ static int rfcomm_add_listener(bdaddr_t *ba)
 	}
 
 	/* Add listening session */
+	rfcomm_lock();
 	s = rfcomm_session_add(sock, BT_LISTEN);
+	rfcomm_unlock();
 	if (!s) {
 		err = -ENOMEM;
 		goto failed;

base-commit: 3c5963d23d64972385786e0be47be16d89ff4434
-- 
2.43.7

