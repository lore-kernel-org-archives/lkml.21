Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453833;
	b=0YrblQyMsk4My85l6y3qG5LpAtt97wEujCR2zQmXbJ2ideNQqEmYL1rttAPktFr7BCU5
	 12ZllSXTWW3Q1tnXuTJUfsbTFddJvH7FstjElYdwL9M3IWnXkoJAELQ6kpiDo4XrHs1IA
	 3ZRakgoT7MmKVjSxzPhw2slpe3dkpgqeAGznh4jGjnZLRYOWY/LOLoFFzCxQsSfqNssSF
	 L/p5V8jtI0f9lik/sOAxkBK+kcyVZCHhkGEBr04p0miEytz67N9FYuLOTtOva8vN6/Dqp
	 9TRi5lR09c9x907op9Si2oM/40ljKkOSmi5m5iN0Wx5GqykftJQ2KpjTCJQoXu8FsqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453833;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LNEib23kdbMBmadoWSW0XQ0A3tFBRek9SSNN92u2eYk=;
	b=a8yA6CKTIfR18BJ7N829Kb+natMYcbcR/GyeMLbK/NI39gznoT08qTO7O0pzq/rE4IRu
	 5wrElhec0qt6FAB9eprfg95A9Npbn6472BtwqYRw0Ibh2wsEQLJK6cBIMKn7d+EscKy1+
	 WxNi1tLMiK8nvmGbr16xvE7XQ2NC5lldKS2Ik9mu9vTsL2b8PnWPazN1Qvl71oMhsIENr
	 x4cJpNbEyXjO9ien1jhxOdraw4uRPjr6AeXGZA/l1bcQ5QHaxXxwKplhzS7i+XNQgLp0c
	 Wfh7swTGtIt1SCGE5VvvWx8EV34l4ROTJtiAINvIzXwOCThLQj7W0lAlIf/yzKsS0Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwBwPo52;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC7606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwBwPo52
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02A51F00ACF;
	Mon, 23 Nov 2026 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795453832;
	bh=LNEib23kdbMBmadoWSW0XQ0A3tFBRek9SSNN92u2eYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NwBwPo52aWGqeBDE3K8inUD7CkUpn9i8jWv0waSEL4+rB+96wntI0/gn9s6UsnRpB
	 gGXsD51QLUw27YDxj/Jixq9/V6ncpBzIg7qge6jwCDQsLCl0y/lwOJixECErwhxzu6
	 zD7iOUZJ6QPJWL1XAQl47/lt1qvblIkriJgPxVUcQc3tpL+OmXvXCmk1Wfl0ZIDLYk
	 DcJtmT0gdiSesMXXiC8eGsaZNHl29+m/HtNmL6s70l/znr+an3msKPVs+dG4ttBZyg
	 nomttMkoMGXcdQ7RBSH5NpKxFrRRzzfcBOgaTdEWDKowoFX+JTCKmtfVapWZiTHq6o
	 81NRyF2hMnsbQ==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 18:10:07 +0100
Subject: [PATCH v6 7/9] nvme-auth: wait for authentication to finish when
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
Message-Id: <20261123-dhchap-keyring-v4-v6-7-5082a49715ab@kernel.org>
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795453811; l=1265;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=7VrlctXLlyrYagLcRP+azunhus4YGknA+amKa/OT2yU=;
 b=86wY3AwPcjlAEvnt1dEXGhuEDNj1ouzJDAlgAFI6PsqSD+k0URXGPHEwNvCTxCl7CUuAwYa5+
 j6Yji3VlCj9CaSeo4ecb8F2C5XyCZzGN5NvBzVF4F9pG1JZydeRRWcD
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

When changing DH-HMAC-CHAP keys in sysfs we need to wait for authentication
to complete on all queues. Otherwise the user might change the keys while
authentication is in progress, causing the authentication to fail and
I/O to be interrupted.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index c94abb901a73c880d354d9c1223d89fe5c9b0e89..8b6e5409f4893d8e56ff6fb15a89b540b1f733da 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -911,7 +911,7 @@ static ssize_t dhchap_secret_store(struct device *dev,
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
-
+	flush_work(&ctrl->dhchap_auth_work);
 	return count;
 }
 
@@ -1011,7 +1011,7 @@ static ssize_t dhchap_ctrl_secret_store(struct device *dev,
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
-
+	flush_work(&ctrl->dhchap_auth_work);
 	return count;
 }
 

-- 
2.51.0

