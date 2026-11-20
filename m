Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173277;
	b=HC39HA3CpvPm/YLnDiX0FRFBqk1Tvmjmhp3JqIU6coTLJPNNjJ/8e66F7/y4+TiWmzk2
	 1kMDg25gfWTAaObIJC6gsDMkYRnrHBuoRImIKWEXqLVirGFcBiybAd1vJg9XVsxxmRUGz
	 OYcTefOkUP7YJFsZNDeXaQi7HBhXv/oHz+iNM/g4cWHghXu2FZbZ/zhZ5X8ZXzA+e5PF7
	 J+mSsi64AgNTbay8LCHHcKQi+YkdGCOsSQF/P0OMghjN5ns3D+LWstEddpBW6rqqrxgZf
	 iredmVfgdHMOwKQ/hoaa+qayEPGZycmtAuD1KVtQbPqgMw+TemCUvQTPcqFJyWr0d8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173277;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AfDl09HCOdC6ty2onrha6eMWA47wa+fLuXb2WwM6rSw=;
	b=AdUmOm9G7ft68M84Yym/cSjFsqpFkdU6lfdQPrgvd52dPqsZOnpMQejKDVJYexs5XJ3Q
	 8RifwYV3K9ply450a21qTFSdSHnpnnwz1GwwDAqiewQo0/UhAsOAbIcm+W4bTaQA6pdWT
	 QMeN+xLjwu/5gMLIUEEj2UlGhxTeulD9kFuvVNbvYp2LgoSEH94jPzGzv0u3amlCYjR+m
	 +zQZ9xpIAA3z52llQgUIPMe0WUJ5DSAKlZ2zI26VcbucXBI4CssllgGEbdr/zQ1/K/L8o
	 hjUhF1G2kh/HBKnn6XkigCkhLRoGp7tfrrY52sU3WVyT6jsONLmf50Ull+cJbydrG7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqkwZTXS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41827606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqkwZTXS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F511F0093E;
	Fri, 20 Nov 2026 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173277;
	bh=AfDl09HCOdC6ty2onrha6eMWA47wa+fLuXb2WwM6rSw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GqkwZTXS/VvSSegFTnqFSPKP/0HoasBNR8yVVdWZQgXpZZNspD/pL1kgRzqrYNRGT
	 4cRM3wDDt2aqzcp9iu/zidMNEGNAbLPcss3p9ku0ftdvSsgpuUNvQO61+8PDXE6zpT
	 rTgos49nT64iQ88ct+adz42TJQZtBjGnru8uhAvWC7AwU7Y5S8k30R8muWTP9IuGLM
	 Y/UDbpsTENTqAxCld9z43kxPQfsLevNMFbvsb+gAh4gtjadDcMe42lLAhYkwNAKi62
	 pFxyHLV+ed+uTXq2/ugbe++p66gIyzkSnnCqyc87JQxwPfCpdQQkX8rhfeK9qPUgST
	 Wkd1BzUUcZ9bA==
From: Hannes Reinecke <hare@kernel.org>
Date: Fri, 20 Nov 2026 12:14:06 +0100
Subject: [PATCH v4 7/9] nvme-auth: wait for authentication to finish when
 changing keys
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-dhchap-keyring-v4-v4-7-5f8c7d9926ee@kernel.org>
References: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
In-Reply-To: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173255; l=1812;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=iC5uIetjBmiu+F/MAqTDdLINO5cA+QFsZTQyB9J/JXw=;
 b=472pOmkDTRMcF4MYfGAdKFt9PSahbLRaHfzWZihopwAl24EjPSAFnxpb0WvktRYYs3YeAIP9T
 sm2XC4B2z5RBQhVzO8Yzl29CqPRfeDx66BKWIrTMSgRZadiNCaGaS4d
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

When changing DH-HMAC-CHAP keys in sysfs we need to wait for authentication
to complete on all queues. Otherwise the user might change the keys while
authentication is in progress, causing the authentication to fail and
I/O to be interrupted.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/sysfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 47caed2ce39786848a5acdb1dc50e4b156694086..ce327a018b0d0a24e26a7f9bfce761157aafe871 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -875,7 +875,6 @@ static ssize_t dhchap_secret_store(struct device *dev,
 		if (generated) {
 			dev_dbg(ctrl->dev, "revoke host key %08x\n", key_serial(key));
 			key_revoke(key);
-			synchronize_rcu();
 		}
 		key_put(key);
 		kfree_sensitive(dhchap_secret);
@@ -897,7 +896,7 @@ static ssize_t dhchap_secret_store(struct device *dev,
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
-
+	flush_work(&ctrl->dhchap_auth_work);
 	return count;
 }
 
@@ -973,7 +972,6 @@ static ssize_t dhchap_ctrl_secret_store(struct device *dev,
 		dev_dbg(ctrl->dev, "revoke ctrl key %08x\n",
 			key_serial(old_key));
 		key_revoke(old_key);
-		synchronize_rcu();
 	}
 	ctrl->ctrl_key = key;
 	ctrl->ctrl_key_generated = generated;
@@ -983,7 +981,7 @@ static ssize_t dhchap_ctrl_secret_store(struct device *dev,
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
-
+	flush_work(&ctrl->dhchap_auth_work);
 	return count;
 }
 

-- 
2.51.0

