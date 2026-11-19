Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108465;
	b=OnRSuvBq+fzmyYayqqKvG1lmwAC2e+0ZzWhGhChQd0pjMGFpX2TiF6wkgRSvredx1t+r
	 fhaSfW7QQVd2y6+2lpMNkcrjWDVwnZh6mjUySRisv0+5G7KB154NaALN7K5qzJ7JSqt5N
	 az88nupNASL1/XjRZCKRgewu9ZnliR7gWYCDy6hOPtdXrskJX2kiHUpJuaqW2tOTR8T4F
	 rs7Bcij/ITouTHz2eW3ZY9dqnE4hCVyTC8OBiq7CahRrPvRZ+1AQWr2QDLv98WXbCFSZn
	 qrd4EYmyrXpzb+7kqVoDvGqmItr2wlSBPnbZ6ZDSq0YeWfQNG+7s96QuH6Xv5OSf+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HhZGlNLLUFACUzqnlk8PPKTHaglC19lgiNotXjp/ynI=;
	b=e68zb7HSl9FMWNUkHb4AqfcmM0yU/eWgsKW4kihWaDj/AEybM6TYr6+SJM3D0HPim/8h
	 +2ZcYPtOJNPTkBZZsRmpXhFt6dgmgZbjO/FEfKpoPaQTMEkmX44Su5Tz71Bzt6gdUWRW4
	 h5FhkeW99OFhOyFj+Pa4GM7rutxy/Kz42Jk+i2W+PeJTcSFiFy0mG8AiMmk6CAB5rUJS8
	 A3WaDJo8Abt2J5NFIOAw/4+ZD4RsFeZOpKDcGL3R3EmjeXfW2gim2AewmZHIRhdIkzMuZ
	 VW5YhLMcUVeN5ZcuTBbLNYMhb1rlRdao5XMQoo7LhQ/Zk3I80gvyEXegfKdVZxKvj4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=TQPFaJn7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D22606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D22606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=TQPFaJn7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so19711055e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795108463; x=1795713263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhZGlNLLUFACUzqnlk8PPKTHaglC19lgiNotXjp/ynI=;
        b=TQPFaJn7mE09goYV3+Xo8kUI/DygA1uaiFmHcXdW6I5NBDQXrr8J1t9AjPMEkS4TA4
         LoKDClkSBELPS28po3Y63QjJ+xaFpApUCrmbZeaaulgDJRKd5ILCidwwYqYwbXnWIpPr
         9b78y+4rgNrf/kN31Brr1P/2DgzLKjcStk2Z9OV31LyuPoQkh1uibGFzXPBeXiRuyFxa
         Jjt697hpVN4viiVTzBoMnQ5i+ddMRU1E9UGjMTOKeOFlFyV9wW/FA8vAGyN3O64aDVkg
         W89zZbxxPry+Ke0qfxFH0xOp87vWdjy6KaOUR53VqqAfthC9dGM+2pYzaXxgK0UNO/Dn
         0Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108463; x=1795713263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhZGlNLLUFACUzqnlk8PPKTHaglC19lgiNotXjp/ynI=;
        b=1xIIxityhpGGzzO4RorCV1DLUYzkMGtEPFDuFi1xj8HZsjP7ei3Wehb+tyNraX4oPB
         Baz7hC704dAFDJmVAVRUBNmc9WLZsI0Cg0fJltj+r+NXzp8btUXRkYIFLtLLSBAaaYbd
         17j6iBKX+BET2nPefqV+apEbriI5/2fWppP+YWJH5nsOMYKTj11ba6SzWV+dXbICMRo4
         llPb0fZRAehzZD2nRpeieRAJeog3PTHRnKfvzjlwQ/HexpvBASzLZ53mK5pDN+WzHk5E
         xT2urXIHaijOgjH0Du1AZN+Z9XmTzFUD/qPiYBlYfSpS1Xy+dASl4lwcbd1hzQKCfDeX
         LsCA==
X-Forwarded-Encrypted: i=1; AL+hErEDLlWipiz2laafdEuf5kGWrNbZkw5XsP+EF3M4iOPa6cP/NDI/wjHqyx8nC+4ephiDArEIq5+ldVhlF5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CfpNOaQAzOVyBnmk5LSJeKIN5wGF1k7ZjLCaYOxRYjwq9oNrf
	2iSW6AjRXq4qMkjzcTpBBH8LP550G+AjeZoYrZ/JO4+bNoOE1N2JUbspm2/ckLMKAe4=
X-Gm-Gg: AYBFou1Kwuo0jNQXzYjHIODTLpx1wVrIXT5t9Qr73vuh45lgLxmGJVycrcGzThGv3N9
	3kIb2nqOUO9iypEgUhB8Afod3/l+L8qxy3BLwL4txZGs1igP0z4kZbjlDQ8RTCSmGu4TuD2RDF8
	1Y08TgNlKPpBU4XVgInAcfhAHZZpKcPnUBcZ/x8S6wbQ0uKi2O/ZDpgKovNGxDO+SuyAwdbDAF5
	orqNlnsu5SVmqNKMib+pdwJ61eTZSeB+LP1J7iKNULOYFxufkPQULtEvZvl/YEdW2RwfPJ5zKrO
	ep1pt0a3pWcSFTD9ibb1m6dosKRAJJU3VSBV54TbZmDlZ4xKJqhxYA7eO50ASsDYdksoO3mUpZ1
	qXHSB0y1eG9UQB+Mkt7YMoD2Up3pNk4HZzCD5Cc4VXd2Z6qXtjG5fgQdeX70mcBlFVqRKxt9fAk
	zukMvA7EpLpow0rcwf3QcywLpCWblHn+G1k3CcyGlxLcyUqWjBtC6aEjjVlNthm78kMLw6g/Vz3
	lrYdUPbx4TNa0yLSpWvBGmFjeuoSkeY0YyJwekYd+EUR0w5ACChaJg5DiB6nlG+9LKCCWcjJjNZ
	JXp4zTgYnNCaAdgEDmUnnGiH
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr4530775e9.1.1795108463295;
        Thu, 19 Nov 2026 09:14:23 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84cc09b1sm44392685e9.0.2026.11.19.09.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:14:22 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH] wifi: mac80211: reject zero or oversized fq_quantum in aqm debugfs
Date: Thu, 19 Nov 2026 18:14:07 +0100
Message-ID: <20261119171407.1975535-1-amisiurov@cloudlinux.com>
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

The aqm debugfs file lets you set fq.quantum, the byte budget a flow gets
each round in the transmit scheduler. aqm_write() accepts any u32 with no
check.

The scheduler keeps draining a flow until its budget runs out. A quantum of
0, or one above INT_MAX, makes that budget never go positive -- it stays 0,
or wraps negative in the signed counter. The loop then never moves on: it
spins forever holding fq->lock, and the first frame sent hangs the CPU:

  watchdog: BUG: soft lockup - CPU#1 stuck for 145s! [kworker/1:1]
  CPU: 1 PID: 22249 Comm: kworker/1:1
  Workqueue: mld mld_ifc_work
  RIP: 0010:__list_del_entry_valid+0x21/0x100
  Call Trace:
   fq_tin_dequeue.constprop.0+0x426/0x8d0 [mac80211]
   ieee80211_tx_dequeue+0x817/0x15d0 [mac80211]
   ieee80211_handle_wake_tx_queue+0x1ae/0x2a0 [mac80211]
   drv_wake_tx_queue+0x1a3/0x350 [mac80211]
   ieee80211_queue_skb+0x302/0x610 [mac80211]
   ieee80211_tx+0x261/0x3e0 [mac80211]
   ieee80211_xmit+0x18c/0x280 [mac80211]
   __ieee80211_subif_start_xmit+0x5a3/0xb90 [mac80211]
   ieee80211_subif_start_xmit+0xe2/0x7f0 [mac80211]
   dev_hard_start_xmit+0x157/0x420
   __dev_queue_xmit+0x1116/0x1770
   neigh_resolve_output+0x472/0x9c0
   ip6_finish_output2+0x87f/0x1320
   ip6_output+0x1dd/0x630
   mld_sendpack+0x94c/0xd40
   mld_ifc_work+0x42/0x270
   process_one_work+0x830/0x1330
   worker_thread+0x4f3/0xb40
   kthread+0x32a/0x410
   ret_from_fork+0x2c/0x50

The same lockup was fixed for the netlink knob by d1cba2ea8121, which caps it
at INT_MAX; the debugfs knob was left unchecked (netlink also cannot set 0,
where 0 means "keep"). The file is root-only (0600), so this is hardening.

Fix: read the value into a local and accept only 1..INT_MAX.

Fixes: 9399b86c0e9a ("mac80211: add debug knobs for fair queuing")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found while reviewing a backport.

Reproduced on almalinux9 5.14.0-503.11.1 debug over mac80211_hwsim: writing
'fq_quantum 0' is accepted and the next TX wedges a CPU as above; with the
fix 'fq_quantum 0' and 2147483648 both return -EINVAL and TX keeps running.

 net/mac80211/debugfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
--- a/net/mac80211/debugfs.c
+++ b/net/mac80211/debugfs.c
@@ -117,6 +117,7 @@
 {
 	struct ieee80211_local *local = file->private_data;
 	char buf[100];
+	u32 quantum;
 
 	if (count >= sizeof(buf))
 		return -EINVAL;
@@ -133,8 +134,12 @@
 		return count;
 	else if (sscanf(buf, "fq_memory_limit %u", &local->fq.memory_limit) == 1)
 		return count;
-	else if (sscanf(buf, "fq_quantum %u", &local->fq.quantum) == 1)
+	else if (sscanf(buf, "fq_quantum %u", &quantum) == 1) {
+		if (!quantum || quantum > INT_MAX)
+			return -EINVAL;
+		local->fq.quantum = quantum;
 		return count;
+	}
 
 	return -EINVAL;
 }
