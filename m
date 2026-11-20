Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143386;
	b=Ty2xItmdOIlNkBOXHn4isDu4P4H60S1m/PBr+qfghuqd2j/XY1t6hWqUMOxSbgTOSKs2
	 IAwxk2evxXn1nh5XdSIPJ5Oi7KUC9aS/RKFqGAfOqzfatRZYbchbKmBGXgmb6qFOQ+7Pv
	 4cRmkCbpw4w3+4A3vMuBjTjO1RdKa1AJGD60ScMftkLqlyKrMH01Ey81AtkgrXO84o1YV
	 TLz3GTL+thPaCGLf2OP8P11e6l54fz1yRvNV1JvEvhthmyLo/XW8ZADEl8eW9RQJo8KRx
	 BhkKtP/ufnOznG61h1cx3T9H/E6cOkOHgGiy6We8fGgIm1KSKRefl8Zwa+2Vl6P0mcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KWEY6nl/y5ZxN2FGJqAD1BanEQOLjtbrxGkg3tG9xY0=;
	b=y+VOxryRyNg//olbQyNpZXN/RTM4FnpmXvNyGN6yJLvZMYl6R4CrhVmlRrX74ON/uXMx
	 xha5nJuqLtqlMBToRHLIs80VpNWNx4HOoPU6dbGM64W5EyJ0prcyMhiSxpAPtibNkbFPf
	 yN18NDm3+zBs9gjRKqdvONvIluoqbHG3a61SYMdH5Gsl0VRNEufvoPJOQleUKmWzwYoMu
	 dpeDjdFHyf/XAUf2deS0YiZzGjYTf0wX4K4zbmkV+LJtTiNqbF2Mu0z/6woGFCBzm7t+K
	 0eaaGbCYEmxmc8YE2Sw2rCSCWwCjHrfBiwb3tUiTU4Uj/c2nSJ1wj+EZcWcp/ciq6zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NVEghiJ7;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757C60A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3757C60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NVEghiJ7
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed408b0d9dso1666765ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143385; x=1795748185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWEY6nl/y5ZxN2FGJqAD1BanEQOLjtbrxGkg3tG9xY0=;
        b=NVEghiJ7Ob3LqdXCc9Q3IfI1SEwA7mDDRvIfvBHpL4Hc7e8ehixqSDwd62wlpsqLMi
         PDj/Z3OiLuoxMDFGHRN7c8W917rU343Rq5uLhv8VUjS4aQKjKJoS2VNYSkxuts3qlXSL
         m1miO/XS+ayG9BzUn17rXTJaXrZNUhsBy8vA0YSoeDdJLqSPleYAgiElnw67Ovm/NOvR
         LihMt4I7FY/DLzsCivTMn0Jm7cRdwGxFXf9jG9HacYdfJsx1OhIAw4bzkj0+VuEWspnZ
         trFDDPDCQuBunBYrdcc4YynNO5PY+PhY73q8cWDDKpkL7mZQGBQQ7UmggjvROBbWQStL
         LbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143385; x=1795748185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWEY6nl/y5ZxN2FGJqAD1BanEQOLjtbrxGkg3tG9xY0=;
        b=qjnYV7eCtWQsGPcG8Fag4DwJRxHWxTDnRO5W/HAeIqGyO0PmFG0jRQ/TCG9pp/rOoz
         NfGG6hakvHahdxur29IkhuRi8LckyoNNOp9w0OXU+AK8RxYEyYFwOL1Ly5I8f3P4gz73
         5KhCYI24Z/Dq8HMbmzinvot5FZWXfOzuwjQLWPYqZxgcfajRW63BGFBOVB8K25U3b4HQ
         o4qzAk4c5qpcOw7plfZ+sGleeBP8lNioD/zx7P9Ic2C7u6Ib5WrL9+tAU7J6/jba+uet
         s8FfgwMYPf60Pyy7gieHAl0WdouAPTvIRjNRMdUkvUx+6sQwS/15FnoAeT3Nu2ooBVS/
         oFSQ==
X-Forwarded-Encrypted: i=1; AL+hErEd6J59b6WN1VzkidsKbAzWwZNjxYtFUKk++JkVXjN3dphFj3dyJkgDWEOhu9zif8/7m5yvZuvUQysdIWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C3lwXaJDQ6ksYDbxkwnYD41l15zmH4a+KeZWqgH0v0PIeLzbX
	WuAuE5B96Scf9rZfKaPuOQX1asJOYTc78UuyKPKSJP7on1V83ufs6VySIDkcEyqFaqcyxYxAzXj
	VoyAxgoCkGiZYMmkHrtGYYnDoWKjoE5bPW8poKQVTol+oANIFplevLbwD8qs+u8nnPr3PSiStVz
	rbxvmv
X-Gm-Gg: AZFdTZcerVM09nxdRxxKnNGg9XyO4E0ExMbkLP/14IyE/o1VWWwtqc3PYr5Y+4ifstA
	WFK6IUZsDg9Ks99sUDJdqyXsi2WzjgsiJ0XSmuDxZSJZs3m5pVxwsmfvNNfrVMgmFuH8QsVqbk9
	2UjE7WmfqFYfe1xWecaFsPOKz5owr/fN4ORF7oB8bl4RAC5ZN8Ls8RjHgiOXCyYxKJN2Y6X0czG
	5KM8ZWnfVRphVoDBTlX+VJhbJAG8jPw/jRYEUUpkd4Na6oaJmV1k6TcxQgT01K+y0HfQCuVLMbf
	bi4ke1v3HoZVvTiEEzNcjDWW7l1lYsdBa14MQ7sFteDHe3gPWSg4ujby0Spv+QIcAWhE/TNWGVv
	vAcnauND34I0r0zn57iO3COJQREy7tEVsCWdiSM8DpSBxjcoxvZ+fnGmxTCsnK2i3msOIzYdFzG
	1ySZPbGGdBSt5YaaE1bRoTKAyFTqyzkjBIpX4Ds5GPSTZENhKxjwSxf5x9v5W8LaxZPreTbFNPZ
	t6K5cHjXHIQLFu7fRpEAFypaiLGIHmH8yVCi7Km2+ITlpvDcpS5kmd5ELGXmdbMCcTITk/r46rz
	SPUS2JTXUc7eZVa7OszS4oZEvWaY5vZ1wW3phA==
X-Received: by 2002:a17:90b:17cd:b0:3b3:ab8c:c7e5 with SMTP id 98e67ed59e1d1-3b41c95f65fmr1345392a91.56.1795143384542;
        Thu, 19 Nov 2026 18:56:24 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5546461a91.8.2026.11.19.18.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:56:24 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [PATCH v2 5/5] scsi: mpt3sas: Link tag set debugfs to the controller
Date: Fri, 20 Nov 2026 10:56:04 +0800
Message-ID: <afdf1d26951b84f4de98c0a8b34d3800019df3f0.1795143228.git.lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795143228.git.lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com> <cover.1795143228.git.lei.chen@smartx.com>
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

The tag set debugfs directory lists the adapter's request queues, but
does not link to its IOC dump and host recovery debugfs entries.

Link the SCSI host tag set to the mpt3sas/scsi_host<host-no> debugfs
directory after adapter debugfs setup succeeds. Remove the controller
link before deleting the adapter directory.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 drivers/scsi/mpt3sas/mpt3sas_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_debugfs.c b/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
index 183391f6b8d1..9f64a7c9db60 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_debugfs.c
@@ -144,6 +144,8 @@ mpt3sas_setup_debugfs(struct MPT3SAS_ADAPTER *ioc)
 	snprintf(name, sizeof(name), "host_recovery");
 	debugfs_create_u8(name, 0444, ioc->debugfs_root, &ioc->shost_recovery);
 
+	blk_mq_tagset_debugfs_link_controller(&ioc->shost->tag_set,
+					    ioc->debugfs_root);
 }
 
 /*
@@ -152,6 +154,6 @@ mpt3sas_setup_debugfs(struct MPT3SAS_ADAPTER *ioc)
  */
 void mpt3sas_destroy_debugfs(struct MPT3SAS_ADAPTER *ioc)
 {
+	blk_mq_tagset_debugfs_unlink_controller(&ioc->shost->tag_set);
 	debugfs_remove_recursive(ioc->debugfs_root);
 }
-
-- 
2.43.0

