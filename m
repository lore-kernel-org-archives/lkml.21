Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436117;
	b=5ltxOrIw1AOuEP2FPZesUEVsgOmlDgi+LK0LVMdEAYxpyXs/Lqz87st7kV4JpxZy30Bd
	 qqjN+kNTheV0yDt3S4b9XbEc9KZtoUk0YC3rx5YKSIHBw22ULOCVvU/eWc+6fjtsj0AOE
	 lbxJsyWbgg/Us0Wpm1wA4p/nY/0QORzV72VCTQeI6zC0SsYkGTgI6SYLrGgCA1HWifYEr
	 NyeCl7PEP4yW2JDPsphZ/Jj117CPFZ1k4h4iYzIlPrcKGjUf7ODDWLGsmAnbNMfO4lVKF
	 r8SSFFOyg1kZCb0gYrzfGSAVXK93UXufO1p2su95rltsRw9rj4TorkAHHMFwbeq/HhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436117;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=f6ce599FqRwONEOFMSTbCk4vIAmHrI8jxl4vZPZrkIA=;
	b=p1Nl9wFFZAxFS1yY2+ubAXaeONbLcV/dEErN/rkXVyZZoXN3EwaRU0FpoU0DsSflrBaX
	 DJlko7iWG6jNqEPVYWdsSVAXX6HfLOot7Uy9uHg0PWfSRRmTyQ+WvD2UsWXgPqmwtt+5M
	 3xaOkCwsDfRKVAITSFTue5cnMxeZj8V1grmllILETFRhtizEM03fZjMu+9UysQ0dD6+3n
	 T9dOdw0rvg9pBw5Wuob2B/qux75BRg6QOufa+R9FKnHsQvvLnUjBCM1Sr2zxCArwd3AkH
	 CWVnzpb8bUCRMMUnwDrUscoKxb9L2oFN0qbJzgV5HpXvjxrFueJLcrGYVx+Em5hAbrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqtXFiBy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqtXFiBy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0261F000D8;
	Mon, 23 Nov 2026 12:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436117;
	bh=f6ce599FqRwONEOFMSTbCk4vIAmHrI8jxl4vZPZrkIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GqtXFiBy/cfer8tHBB0USDia4XQYgBVYd1LB5PgtTp1MnMtHOAA0fxTJ+BlVenZJU
	 +tjMIj5JKU2048N+0lwXI8R3udQmj8Qz4IDIhnp1Lk5RQMWQIOMlAa1/agXH6yhfT1
	 Qf2TDLOl+g+5Ml0EVuNr1nuUcV+RDj7qO+vu3olopsdcOPw4p+wl43IMRNyKmYrKig
	 5F0MvOZKW7mqvKjnsXApOHt5y9atnItjDxYLp/vOgdikenvCQPdyIVRYX8opyptfuy
	 SgWojH66JhrQaKCSEso1ZCojSK94NqwoNAAwAhbnuUCAsXVgbHgX+L5TYYDccXLOVC
	 /MiaPtJs/6bSg==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 13:14:52 +0100
Subject: [PATCH v5 7/9] nvme-auth: wait for authentication to finish when
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
Message-Id: <20261123-dhchap-keyring-v4-v5-7-81eefb4c0724@kernel.org>
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795436094; l=1263;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=NQce0gsvHAsFMbR5yZxOTBCHXhB5o++ZAHZpRUDmz+w=;
 b=rv4zNgGBMYhxy04qFi//NHnwYKRSrzUKCdXhIdfQvJ0qbJSe6z0eOx/geZ2GrjtcmcV8ZNMmj
 1w6wcy5GrqgBvWLGXTHc5HO8hye2sP+lgzsdEDScvl/FNTumfETtrIp
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
index e6d42da84e1688110eb81e59161dc7c497bd0627..33f78914e8b5e6331e3a82f6bafa3c0bdc0b8ea6 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -903,7 +903,7 @@ static ssize_t dhchap_secret_store(struct device *dev,
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
-
+	flush_work(&ctrl->dhchap_auth_work);
 	return count;
 }
 
@@ -995,7 +995,7 @@ static ssize_t dhchap_ctrl_secret_store(struct device *dev,
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
-
+	flush_work(&ctrl->dhchap_auth_work);
 	return count;
 }
 

-- 
2.51.0

