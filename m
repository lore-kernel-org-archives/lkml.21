Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051632;
	b=o6uyLfUrMMb0VxLeXq6L64eXjOJFE5EDM9uNV/m/V456Tnh7/9S6SR9nVV3BS4oF+5kP
	 HT+F78pzD7lw+1X5KKYdtGVHQ4EfDzJrKM25dWcg4VeNLbDmlcjhwLg+73WH6zqsUEN+S
	 Jp285xb02BIugltmm1k6K3/w+CknIiYXNpNDtKtYfAyXyz1eGpLvxe6pxXui0FJadbBwW
	 NUNp/PHNK1rlSp42FnQtb6FtVgMyDxRgjRtxo5fUyttOq+8qFKW8Y8RvIvmsV1l+NIfBk
	 9enmCy1vf3DDaXRVe2M9+mBjGAfXAZEag8QDMdtBw22uyAiopML7i3NHrbkax7j8irg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wMPR2OAqKd8NTkv9afi4XE21M7DTJCxQ1aj05lm6jLA=;
	b=VRCeiwoepgzaSzw8BiAAEIMqtypdX4oR3eoGhUg6ynPO6qFWCbOLuYgKjviDBoOd00h/
	 wfZVhkjULWx1XQIZGVb7gtNJ9TZu0aWaQu2jTDWPl7PsgjJ6fY/IkqPpj3+lTDjHNceF2
	 xlMux5hb0oibwPfrpy1krMXMqLpWVmmONtnwqO/kbh8Vl5M6gYVQwwxjTAI4g4wiStvqY
	 22DqmUbKZBIRe+Jwt0hVMNRsd9NeJ6bP7/4nUD3wFcXbZWEoP+r2MfgCGv/HzGKK5cMQ9
	 OCA3/+edY7KFh/JQPSrKXIF5LEeC9ddmiJElGQMGvx2rjT5TOpuu0yk5TTSaRSSHXxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnBigy5L;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5326D606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5326D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnBigy5L
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-94961d90b79so228402185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051631; x=1795656431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMPR2OAqKd8NTkv9afi4XE21M7DTJCxQ1aj05lm6jLA=;
        b=dnBigy5LCe3PKsBq23e+tzlO8XsZwaQCApUPD1wD4F6K6Q5XNb5RCm9PkGUqNAq275
         kDRAPaS8Z1ouYJH9Gi/DA/vAdNWLSBfwtrt+ZcCHcPqbjR4l/m4lvpjbg0MdRqkR3IXY
         3gEPFuzpldVtV54oxUxL7CZ0fg0cay7mfcrBcfxJK57/bOcwe1Y6UNEu4npiVjwc4h31
         uqZLBnbePKmptJZk9mv4MKFVJQLET8BnkaroIthf7S0Uv3tDvqCHPH1pEP7okI7CXY45
         lvJf3xvwTroXbIm5BtDjmNOqsqIJP6JWA1cfQDm4OOL/Qm5Gc05pIlE3dUKtBVISQA3+
         Zuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051631; x=1795656431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMPR2OAqKd8NTkv9afi4XE21M7DTJCxQ1aj05lm6jLA=;
        b=OfhWbfTGRSWcD3ojSZoMeoJHK6TW8fJFIft0WWienhYDNnzkOcXlQEF2F4qyMiguLo
         /PC2Zmkp9o1E/JJki1RxKbuhg/XwnpDmSj5W8r7bK9vC91/nOR+AjmCvb6LE2FGWodxw
         9ZpyQjVJEZd93VEqOR2sPt+rkEXAKAStlRZFO2leU2lLP3uMrfbMPYRsCn54eQNsL2WW
         r9jzwlG4tRGFQLIYGZPtKjorNA6WhpKtbqDHP86SZ8nY7h4hXGMNqXcKIDBxZZ05MDs+
         CNv6ke1GlweempypWEtKAFJylYf0Y8LbxO387Fb0dJzNavrvBBPYK+1IlAfB1gapidq+
         eLxg==
X-Forwarded-Encrypted: i=1; AL+hErFmz4F/6qNHXLGX2z/eOqCrST8XsBcRQzhy/dFyoxOuUaEMXt/styaFwGn0a6yRm7y3hztMiZNPwbYVXUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RElSSh446Yq7QNaINtA2VCT2zXh3YB4+EC2GaDAKwXnxK0NkA
	GYdhV8yc2FbEqvzraZRZZgKFmCWNi8kftbM1eZrhn9MWCbLIYm8nD6v1
X-Gm-Gg: AYBFou0J4nCbVDMPw5CCRWnVjTt+Sbvd/JY+j2tcb7uXYLWIuCc1bml5uVB0cExPYXS
	+h5Rf7Bq1rvgfU8CqfbYZfvbe1n+PmRNX6l9BBmmf236C548CgfVDnNFA8cw6I8IvqXeDPKUuGC
	r4/mB6YqTr2dNg5VrX/p5aQv6JV3xELTfAtoRY/4CI3/YCXQ8zQp5S+J+2w202f2bu74A6CYpI5
	DtzgJhRlWUGb/N2/A1Xq9UwXr95UwpyPTfWJsTa71S1p6ZL+RxRvG6CpWSyFVxNbOl+b+/KxcpU
	XdRANo9tekpe0iBGOe5D5Z/8bdkgONQ6C+ZUJTIXR7Oh9G9I7YOYNXzCSRJ4zKomW+B+gi051+I
	clyLec6CcdDUpvl4+5nmNeBEHbbKPsWJi1pYTrkemOKMeGAq5fLxXgfEt5qSvHJMoKcpej0xBaw
	VHZ3hpuCc34CkjIOQR0EmjdjC4C7f1WYVsD0YLt63gG4ctRXS4G0MKDyQjiTCkolbgJwzZP+Czj
	KpsuUVcwiUQcS4UM6FP3v4IEWFTBguliZZrGsIQjl+CNOqOb05CzslKMjIYxdNEglrhhSxiPgag
	jLFiLUqTZrrJS/syopLg7DqmS8Y51Q8gbPFCPxgo7HN8SQV6LS0O1FVLC35Rt9hQns9pR1VxHjg
	=
X-Received: by 2002:a05:620a:2709:b0:93e:920c:c00e with SMTP id af79cd13be357-9499957ea71mr827141385a.21.1795051631052;
        Wed, 18 Nov 2026 17:27:11 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b4524c3sm318730885a.1.2026.11.18.17.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:27:10 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Gal Pressman <gal@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] net/mlx5e: Skip hairpin entries not ready in debugfs dump
Date: Wed, 18 Nov 2026 20:27:07 -0500
Message-ID: <20261119012707.555494-1-lcy8047@gmail.com>
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

Hairpin entries are added to the table before creation completes.
Reading hairpin_table_dump can therefore dereference a NULL pointer
while creation is in progress, or an error pointer if creation fails.

Skip entries that are still being created or whose creation failed.

Fixes: 0e414518d6d8 ("net/mlx5e: Add hairpin debugfs files")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE_EN,
MLX5_ESWITCH, MLX5_CLS_ACT and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..c6623f13261b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -1067,12 +1067,15 @@ static int debugfs_hairpin_table_dump_show(struct seq_file *file, void *priv)
 	u32 bkt;
 
 	mutex_lock(&tc->hairpin_tbl_lock);
-	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist)
+	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist) {
+		if (!completion_done(&hpe->res_ready) || IS_ERR(hpe->hp))
+			continue;
 		seq_printf(file,
 			   "Hairpin peer_vhca_id %u prio %u refcnt %u num_channels %u num_packets %lu\n",
 			   hpe->peer_vhca_id, hpe->prio,
 			   refcount_read(&hpe->refcnt), hpe->hp->num_channels,
 			   BIT(hpe->hp->log_num_packets));
+	}
 	mutex_unlock(&tc->hairpin_tbl_lock);
 
 	return 0;

base-commit: 342e62fd34c2674e82bffc89cb5c7091924986d9
-- 
2.43.0

