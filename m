Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970755;
	b=UTLJsH8oTSR23RAOOXcaAqZr31eS7k27b4EmK4wfNS5p1LNtpGLdFJiGSeOpzbC+rvNd
	 JKXxB+p3Ysl8ju4/IwjNUZHzH8RJynXqY6sQGtw7/OYQC79L3gOhkKvuLfqoGRbeBcXmA
	 /ahgLYviYRRUDdQUJCtZaZQNLIqTPkZEuKvZKeAis9xpaJfyncXjGKvq2MvhR44kQR3dc
	 q/3mOKDgTsPaxnbOua9uSX3SQdMDO7dY4thLPBQhzNl3ye3F4vGglTrkUv3zg/6Vi1MYI
	 5zLw7xU3gk12z3jp6ctlDYY/HvY+DKLvvfodXkHjmeTSL9iHUEfdGUQea1clOe9GsDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970755;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hKNadeghD4t96xVRga8eHBeh1KEt9UEEgQUl3K4u/fk=;
	b=Bo4pa9pDDzayryRq+CADmuhgWH8VQdNQB2TjUDsPLLg7VFyS70UJ2ghkauamtW4DAGgw
	 3Ja0mSS3BHz2bPP9bPMTaf/YjLs2UQcylYmZIkeY3AqjKwwIJ/cy9eBeo5wzrTKCfAOJg
	 t97OrJwN9Z2iTjhxUssORLIE0A3Qez3CHr3koUdpOQnOcZZenFDZIHWCOwMJJ/epN/TJJ
	 oxeMVaDMt5L5reMsiLY4Hvv6wvp8wfGyjf6FtC5TWZx9SkYCjwjEQRkO81C8h02L7b2BU
	 xdjmQx2705DoPo15I0WoJWHJSp5RP1RUC3IhadaZyQh21Vhe+baXSywpwuUjZ1yJYsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WK1BFh3k;
	arc=none smtp.remote-ip=95.215.58.164
Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFA1606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFA1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WK1BFh3k
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o+mw5452YG3BbC1ZrMAJhmXBOZ3fUIA50s92Q87f+OM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794970751; v=1; x=1795575551;
 b=WK1BFh3kzR+JZ0nksrH3KDMnOSsTq1OSD73n0CrG7IoLF+hEoiA6jPo26uEA9g+E3XT2ZJcX
 b+HhZAb76rjLAZvOZEmJosTt5WFHl+2H4DB/A1oaNLYYt/auKaOiNgXMfzE5lW2FPYgTnSdprH3
 cs0fkgOWYeJ5Svofb38LOBXo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd8b8ab25e26c594;
	Wed, 18 Nov 2026 02:59:10 +0000
X-Mizu-Trace-ID: cd8b8ab25e26c594
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org,
	tariqt@nvidia.com
Cc: horms@kernel.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	mbloch@nvidia.com,
	borisp@nvidia.com,
	witu@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net-next v2] net/mlx5e: kTLS, Simplify error unwind in mlx5e_ktls_set_feature_rx()
Date: Wed, 18 Nov 2026 11:58:46 +0900
Message-ID: <20261118025846.3377199-1-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

mlx5e_ktls_set_feature_rx() has become harder to follow: the error
handling is nested in the conditions and the main flow is conditional.

Handle the disable case first, handle the error cases in conditionals,
and keep the main flow unconditional. Use goto to unlock on the early
returns.

No functional change intended.

Suggested-by: Simon Horman <horms@kernel.org>
Suggested-by: Tariq Toukan <tariqt@nvidia.com>
Link: https://lore.kernel.org/all/20261029134019.GG257209@horms.kernel.org/
Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
Changes:
v2:
  - Handle the disable case first and keep the enable argument unchanged,
    instead of reusing it as a flag to destroy the tables. (Suggested by
    Tariq.)

v1: https://lore.kernel.org/all/20261116110830.2850785-1-xuanqiang.luo@linux.dev/

 .../mellanox/mlx5/core/en_accel/ktls.c        | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
index 3cc1213c2f68..2358ad1f2331 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
@@ -135,21 +135,24 @@ int mlx5e_ktls_set_feature_rx(struct net_device *netdev, bool enable)
 	int err = 0;
 
 	mutex_lock(&priv->state_lock);
-	if (enable) {
-		err = mlx5e_accel_fs_tcp_create(priv->fs);
-		if (!err && !priv->ktls_rx_was_enabled) {
-			priv->ktls_rx_was_enabled = true;
-			err = mlx5e_safe_reopen_channels(priv);
-			if (err) {
-				priv->ktls_rx_was_enabled = false;
-				mlx5e_accel_fs_tcp_destroy(priv->fs);
-			}
-		}
-	} else {
+	if (!enable) {
 		mlx5e_accel_fs_tcp_destroy(priv->fs);
+		goto out_unlock;
 	}
-	mutex_unlock(&priv->state_lock);
 
+	err = mlx5e_accel_fs_tcp_create(priv->fs);
+	if (err || priv->ktls_rx_was_enabled)
+		goto out_unlock;
+
+	priv->ktls_rx_was_enabled = true;
+	err = mlx5e_safe_reopen_channels(priv);
+	if (err) {
+		priv->ktls_rx_was_enabled = false;
+		mlx5e_accel_fs_tcp_destroy(priv->fs);
+	}
+
+out_unlock:
+	mutex_unlock(&priv->state_lock);
 	return err;
 }
 
-- 
2.43.0

