Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580622;
	b=XL/7Ues5hJDcIaM9sDfxWCpnld9oLhtn5+Yyl+RFlfnH4q5Ztsfi1NWs2CapccXTzSfO
	 JpkMrUU599lfzx8KT/qIKpp4gzgg0smNKz/UF8+EVX4lzdt/JBv9DD99m5wdP4uz6ZhP/
	 fA2m/2PQ21iPh0v5+6Lk5RdF+9nBI2YwWwivS+FGhLTP5nCrk8HM/mF0itDAyBTq+9DAC
	 kYb7etuJIhMIPwwKFpJN+0A46Y2W7RamaKH8HpWZ9fU0SNJfpRX7c+QW2cCJ3rBhyf3bP
	 9sRdSnesrtviyBHDogRPD3WuxqK8i7ZCYemDu2Oncci6f2IEDKJ2t08Av/3xAyAExBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=va0ggwHRJKjl4TPXGJhxPFGY4MyUe0PHa151+Q/wcNI=;
	b=P+e0mhbCRRMPUPEQ1TLJMf1MBdfbQ9hoglfp+7PzanK13+xpsMkllUtjWRU5LEejGxZJ
	 zQHs21WxingDrquCcvnLj0h/kY5dLNbFyqzyFEavKhPGoOxPJLQRpSkqSq04kK/tJpTXC
	 m9Qoc7vzRy4oNqHJiBPwuwFsHEQ5WJxyFmukWD7o+zfx2uNLdc68N+UqLbf0k1xynyusX
	 KrW2isgS4rqD0AJlw8h9ZLTAa5uBaPmkGBer9uyeT+O0LIzjt72ZNjinOAqXS5QhVSXdp
	 F5ic+tudVdF2lw0V5hI0WwLsmf8wAg3KNVwqEyAk5+S9NrOR2fqxdo8Ka6gHTyB+AdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MqdlJ73A;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34B7606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A34B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MqdlJ73A
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b3fff0d993so727864a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580621; x=1796185421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=va0ggwHRJKjl4TPXGJhxPFGY4MyUe0PHa151+Q/wcNI=;
        b=MqdlJ73A4xj6m67NEm2/sbs/5Pi+1Cfize3YWEEqZtl4uS1+XB3qZrP+IoezQWRk5H
         X0kWZPGewUmX97In46VFqRUWQOxyiicqb7V+RIAJ+nEY3cN9OmIZuAb9HYNbly/9P0rW
         HjjFS9SrHg5Kk2dBUTVWS/Yq2rqn/RcACUZfYcFet9xc9xBAKweckSsrzatIR5hpHhAu
         kjtIGHQpq2LUqf3UiFdbgfcSwnkIbZ0NEW+ndZQj+xYO3vkQHeAINyjltsOp0ek9vy75
         FIIA30RcuawQvZp0pWmtDsluXYS13hIfGy3B7JTlRX/c31WMKUlSKHYUyeFIZ/cXpBHc
         9dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580621; x=1796185421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=va0ggwHRJKjl4TPXGJhxPFGY4MyUe0PHa151+Q/wcNI=;
        b=BsARiwalT3Rx2udYn8Dk5pAPffMnImqgd/K0dHUOpNVXip0eHg0CFC+Q8X3jOwHKco
         ljZUrKfcRBadosmkslV2g2QUW79EJzONYLzlrwUu53EQr+uE8fV4RYWIOkhqbs1S8l9a
         Pd3fmmd7VP4djJgMvdPG2hUEJzwXV1ZsXU6G5J+R+pL7oDV+83PE5Gul/KSE1JNS7WcU
         shkbZ4U8TpqcKTEQA/UG9r9hrLpRz1hzLp2knsxQ3sNU3Gagi50Vb6YbaaRyeFs0z8MN
         TbRqSlyT+cF3OPAWGCI2DNUm4EMHHvEqM53BsIC14BMKhggcT06XADmPIqj86YD+zioA
         lOBg==
X-Forwarded-Encrypted: i=1; AL+hErG2bNYYhp2BJsvRzIluSc6IgUIVsQuy4YfZ/O7wiq+jSwX64Iig+UiXzRagZ2O52TJ/vyxRTGlbdoc4rcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z98EgPKNULswlpOedBCOVHCuYYF8ocffGpPrid9inlO8rOjwckA
	tgkvgl6RlEZupMyUZQWbhXcRfCCXbkSEoGb7/xgqQec7NUySavTMCjhZ
X-Gm-Gg: AZFdTZf7IoJYWyjKr+TNlHs53vUu1XjzfEy5/8be/1VuBEiHlSkQt8KuAV++rsZbAuZ
	UoNF33OZXV0C1arHnyTPeg1HoIfiQ9M2IyEqn+c9g9TJRuCFxunuVD8GAw7HAtwMByhFn3KokiV
	BXxxsf/bToD2UeaGT//JvK95P79Pg/16Sw/7jB92c3MjlS7Tjclb1kfZ/J1nj/W05EDOiOivutK
	kJfXo3sp1yfXP9oCYCmbVL2qK+LP7AbPR2LmXQMQEVgZFhdPYx6/eOM4wROYknxJWnwTfqPRV3I
	oWZg+1Cc+Hb0xglrY9IHkirwgdw8Hrp/NWump7ofzRKuiXQQZB4yN1ya9BFyKFXdQAB6uUHSwci
	YLRPptNjHsxv+uuOOVRM4WvudEEJFK2qNDZTSaIONmfM+JPjTqObiEo9KtMuR2FA1THgY3HTfQj
	qAmsmHIzGBDsDenyKVYl/gQZFQBsvGGXOLRpCqd5Ue+e58dG2Wiv6dj+Lo+xyxiTUCC5HOHg8xD
	KIAMLs/PGGd1I7+TwwvmS+GJhRgV5T7s006Uhl7eXduv1+cYZ6IS0ii1v1aExU/2pbspTNXwfC4
	xD4douZbmKI0/tmybA3Jtw8tJTHLDV3at/zqNu+mO2n3
X-Received: by 2002:a17:90b:39a7:b0:3b3:cb03:8740 with SMTP id 98e67ed59e1d1-3b41c96302emr26652973a91.5.1795580620889;
        Tue, 24 Nov 2026 20:23:40 -0800 (PST)
Received: from gmail.com ([36.112.206.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm27969788a91.11.2026.11.24.20.23.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 20:23:39 -0800 (PST)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org
Cc: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	roid@nvidia.com,
	baijiaju1990@gmail.com,
	ziyuzhang201@gmail.com
Subject: [PATCH net] net/mlx5e: Fix deadlock when parsing flow actions fails
Date: Wed, 25 Nov 2026 12:23:23 +0800
Message-Id: <20261125042323.88050-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Neigh and route updates take encap_tbl_lock and then wait for
flow->init_done on every flow attached to the encap entry.  The only
complete_all(&flow->init_done) sits after mlx5e_tc_add_fdb_flow(), so a
flow whose actions fail to parse is never announced to them.

Such a flow can already be visible to the updates:
alloc_flow_post_acts() runs post_process_attr() on each post action
attribute, and mlx5e_tc_tun_encap_dests_set() attaches the flow to
e->flows there.  A later failure in alloc_flow_post_acts() goes through
free_flow_post_acts() -> mlx5_free_flow_attr_actions() ->
mlx5e_tc_tun_encap_dests_unset() -> mlx5e_detach_encap(), which takes
encap_tbl_lock.  The checks parse_tc_fdb_actions() runs after
alloc_flow_post_acts() reach the same detach from mlx5e_flow_put().  An
update that holds the lock and waits for the flow then blocks the
cleanup that would have to wake it, and both sides hang.

When parsing the actions fails, first delete the post action rules
installed so far: a woken neigh update may release e->pkt_reformat,
which those rules still use.  Then mark the flow FAILED and complete
init_done, and only then detach the encap entries.  The neigh paths skip
a flow that is not OFFLOADED and the route paths skip one that is
FAILED, so a woken update leaves the flow alone.  complete_all() is
idempotent, so the second call for a failure inside
alloc_flow_post_acts() is harmless.

Commit 37c3b9fa7ccf ("net/mlx5e: Prevent encap offload when neigh update
is running") fixed the same lock cycle between the encap entries of a
single attribute.  This patch only covers a failure while parsing the
actions.  A successful setup still takes encap_tbl_lock again after a
post action attribute attached the flow, through the encap dests of the
main attribute or mlx5e_attach_decap_route() for TUN_RX flows, and a
waiting update can block it there as well.

Fixes: 8300f225268b ("net/mlx5e: Create new flow attr for multi table actions")
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 .../net/ethernet/mellanox/mlx5/core/en_tc.c   | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index b290beb4369a..91e04a84bf07 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3748,6 +3748,39 @@ free_flow_post_acts(struct mlx5e_tc_flow *flow)
 	}
 }
 
+/* Neigh and route updates wait for init_done while holding
+ * encap_tbl_lock, so the waiters have to be woken before error cleanup
+ * takes that lock again.  A flow that fails here is skipped by them: the
+ * neigh paths check OFFLOADED and the route paths check FAILED.
+ */
+static void mlx5e_flow_init_failed(struct mlx5e_tc_flow *flow)
+{
+	flow_flag_set(flow, FAILED);
+	complete_all(&flow->init_done);
+}
+
+/* Remove the post action rules of a flow that failed to initialize.  A
+ * woken neigh update may release the encap header they point to, so they
+ * have to go before init_done is completed.
+ */
+static void
+del_flow_post_act_handles(struct mlx5e_tc_flow *flow)
+{
+	struct mlx5e_post_act *post_act = get_post_action(flow->priv);
+	struct mlx5_flow_attr *attr;
+
+	list_for_each_entry(attr, &flow->attrs, list) {
+		if (list_is_last(&attr->list, &flow->attrs))
+			break;
+
+		if (!attr->post_act_handle)
+			continue;
+
+		mlx5e_tc_post_act_del(post_act, attr->post_act_handle);
+		attr->post_act_handle = NULL;
+	}
+}
+
 int
 mlx5e_tc_offload_flow_post_acts(struct mlx5e_tc_flow *flow)
 {
@@ -3852,6 +3885,8 @@ alloc_flow_post_acts(struct mlx5e_tc_flow *flow, struct netlink_ext_ack *extack)
 	return 0;
 
 out_free:
+	del_flow_post_act_handles(flow);
+	mlx5e_flow_init_failed(flow);
 	free_flow_post_acts(flow);
 	return err;
 }
@@ -4579,8 +4614,11 @@ __mlx5e_add_fdb_flow(struct mlx5e_priv *priv,
 		goto err_free;
 
 	err = parse_tc_fdb_actions(priv, &rule->action, flow, extack);
-	if (err)
+	if (err) {
+		del_flow_post_act_handles(flow);
+		mlx5e_flow_init_failed(flow);
 		goto err_free;
+	}
 
 	err = mlx5e_tc_add_fdb_flow(priv, flow, extack);
 	complete_all(&flow->init_done);
-- 
2.34.1

