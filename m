Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970671;
	b=Jl+AE94hMIrmVb6wp8kb58gyeBmvtXY5yqzTNaSC9EmGWxGP7Ef4lrlblyPv/46aIOHb
	 /zB5Nz9KViI8qTgTaoJy4xFlPgFElD3dPbWK235FBthhnV3j81dTexUeURAM7PlQ6h/q7
	 muNiBzhLQdxPI0WE2ce1pWZkasCzFlDjKlFIjovVOK9gJdACBzYuWrKi3sAT0+WtQVvHr
	 GqQ8PBsBXovpCkUG+/HBqOISaKIMuBwoMm28rXJ7cOSA/3U56arJVstUqryubYlU+wxCF
	 PGsgHUwJ4efRvxQvwygDZSVAcDBHb+BXvgb/LW5ejuGpNWVg1yL3kbT3RwrLMewNB4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kT3HQni3XcTQ7LEiQEu3BRMI7SNNhbbgRV/REjEiKmQ=;
	b=1c3CVNpccCEUOeulNd4KLzjdGxpqaQpzMjju92HdrhIZSuC0fPA3Id4IE1xSAVO5fKJD
	 ecaHxX4IHNqMutI8nEHP5wtoI+ita4aXo9XO9At9gGbYtRJ6TM/9oKuk5qYNPJWAmgKK0
	 qsHco4vSAyxKIps1/DD0EJTCSMhjiKpaDuMSJNJhf3AMGkOwdO3MWBvFLHq7ny3Wy942S
	 DhgLCUQQtNQDkWITsqanoLoKrdkaCMmHDp71JmRwkJp1Y7PT/5lUGzYa/IU8CD5Y3OC+X
	 WXRJHoGOj/7ozcLyOKxMNwF7HqwrlDIeBETVHj9F+XKKf40O0oa45m0pvclSXzX8cew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iy9IuGJ4;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80890606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80890606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iy9IuGJ4
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2efde3200c7so1815365ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794970671; x=1795575471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT3HQni3XcTQ7LEiQEu3BRMI7SNNhbbgRV/REjEiKmQ=;
        b=iy9IuGJ4bL7vqlV/MYSu6Re8usSSPT0Hhc3Y4ll5nHtkfGc+Sj5HXBLm58giVkVTzc
         GvnVIedTr+06+PQAiXCYZrC8rBdaQyGiBz1TnOhqTGpKTsJEsjbgv80whWujRS0vXYiZ
         WtgKoKxfAS9Qasts/ICNTQFjo/4BRUEjOpTOC5zPTiukdVNW/ktlBsulbD8YVR4bG54E
         LuDcOrSGy1wMxKrhKRe962Qtzofs2TFo0dKmI8q/w/wSRWel4siJDSIhHvCYkEHGEsof
         lUzxhnRs2EmiJnMKtG5RmBIGnJ46Jq3ztvZTa6eDdQZrGg8wAhfP+JZadg70RVLQbxjv
         6IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970671; x=1795575471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT3HQni3XcTQ7LEiQEu3BRMI7SNNhbbgRV/REjEiKmQ=;
        b=nOVMlTOpyGPqmWobyIPF7ZQ4DtghJ5lYebYaWxwSW2Ls7KLsISSiCTphM3OmrKzJuT
         e3r1Vvs8ljSuAR0k3LvCnUHkShQELmfpSWgxKVYKDIUxTaPr1sWpdRJ2+UwJayOmmkqw
         DCSiPhrYesUTKIw80dSWP6JlkgibBvQWephTj0bKixeJedkRGtH/Lx1l7/UNF3mrNsGp
         LKSkLpX4ywJ0QyyOBVa3CjBRGjKZGiHtRueVf3nxO8fbVy3oFxJBuVNow4TawCOBzbJ3
         c1FiKQMqwGCOYcI6iLe3k1MmCiNMLjRkyuSjZ4iogSetebzYm0ZLXJZTo23ZMujHjErF
         ebqg==
X-Forwarded-Encrypted: i=1; AL+hErH7bsd5HBozE/hQ1mWgtLUeHww4CB/eqSMpIj81mcbJTz4yGPhFDNF5hUdDk7DOE+jVhjawK8tWHzTY11M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HMxXc4XjYQBdm/Dt87ZgWPgZjmPpjmz1SzZGBKlQQ7Wt6TjJl
	mNxPCbCO11I5Mv97kGpwuE/tgAQa8e3grUFFH6wr7agMYHwLfg2h312X
X-Gm-Gg: AZFdTZe1vMkjBVsRXM+1C3A4DnsuQcTNu1tVH3HhFqmw43QWzCQzQkNfWy0fJbhHNfF
	CLJv7ReV+zqIfkObm/ACz7+kMSHP1LVU1OObvb539s/DWKqLQ6DdFIb//2MhE72D8tCyWLDpH6H
	vLkwpv+f7KfZIo80oQHP/TV17/3WXYhsIR59cNhkTlSxuzl179XdB1MEwySWCCOR5SyDiojSauG
	tAalAkRkxLEr8suo8v4Rt5H0zw+RPNrImcqXNo2FckbG9QPViJqTL3e/sQ4U6Y7BIvO/rBCfrw0
	PnL9w+kj1JgQKMzQH0J1w29975YeGdPyVYD1QeLBAP3qvTLZ6/MbH/oEkUMVwdmHMnw9NHiD4GC
	yFoFr3h4BWxp94CHw4KmvQqY4EP+BVa560fqESmU6eHttT9demCJViUILBqgOCHgE51ch1LCBet
	6xsuyFdwBkQ2Aza3NHSTcQmfVhcrjCaZ2bpGTqMM4tBwx/ncVZVl+nTDbqDjXtuPb82UmcH07vl
	w7KcEI0hp7V0KEidZ68eL3TSgtBZnfJS8/2GHrMGloY3PoQmTyK0xkK8ei6vHKK2k7SIK+YQoHG
	CErFGpw1LXJm7CsF4KyGFVvaRFNDKOByfYH7t6wbHcYQOQldbjq3R0OascQ=
X-Received: by 2002:a17:903:2303:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2eff7100c4fmr12373385ad.1.1794970670319;
        Tue, 17 Nov 2026 18:57:50 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5a3ee36sm5620635ad.0.2026.11.17.18.57.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:57:49 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Moshe Shemesh <moshe@nvidia.com>,
	Shay Drory <shayd@nvidia.com>,
	Akiva Goldberger <agoldberger@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/mlx5e: TC, fix a NULL pointer write in the peer flow error path
Date: Wed, 18 Nov 2026 10:57:08 +0800
Message-ID: <20261118025708.86215-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The peer flow add path hands the duplicated flow over to the origin
flow before it looks up the peer entry for the peer vhca_id. When
that entry is missing, the function returns -ENODEV, and the caller
then deletes the duplicated flow with list_del() on its peer node, a
list head that was never initialised and never linked. list_del() on
such a node writes through the NULL page.

Look the peer entry up before the duplicated flow is created and
handed over, so that a missing entry is reported without leaving a
duplicated flow behind. The entry cannot change in between: the peer
loop in mlx5e_add_fdb_flow() holds the devcom component's read lock,
and peer_flows entries are only stored and erased by the pair and
unpair events, under its write lock.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: 9d608a40c2d4 ("net/mlx5e: TC, track peer flows in a vhca_id xarray")
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 708b7987ea4c..d41969117d30 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -4630,6 +4630,10 @@ static int mlx5e_tc_add_fdb_peer_flow(struct flow_cls_offload *f,
 	else
 		in_mdev = priv->mdev;
 
+	dup_peer_flows = xa_load(&esw->offloads.peer_flows, peer_vhca_id);
+	if (!dup_peer_flows)
+		return -ENODEV;
+
 	flow_flags |= BIT(MLX5E_TC_FLOW_FLAG_PEER);
 	parse_attr = flow->attr->parse_attr;
 	peer_flow = __mlx5e_add_fdb_flow(peer_priv, f, flow_flags,
@@ -4643,9 +4647,6 @@ static int mlx5e_tc_add_fdb_peer_flow(struct flow_cls_offload *f,
 	peer_flow->peer_orig = flow;
 	list_add_tail(&peer_flow->peer_flows, &flow->peer_flows);
 	flow_flag_set(flow, DUP);
-	dup_peer_flows = xa_load(&esw->offloads.peer_flows, peer_vhca_id);
-	if (!dup_peer_flows)
-		return -ENODEV;
 	mutex_lock(&esw->offloads.peer_mutex);
 	list_add_tail(&peer_flow->peer, dup_peer_flows);
 	mutex_unlock(&esw->offloads.peer_mutex);

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.1

