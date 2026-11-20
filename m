Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173283;
	b=F1/v2kOiqoFOnKwtrZDnnDVjeXJ+fxnJgvsT4Lw+oEtt3riGLzyB7jWeYDuVriuqQgaq
	 yMIvzR6N6BsIltKa64oRumXq3t8SrSbyKlDYaenuAd/w8/xdLRpfDzfDXL7eJGPC4OT6A
	 zK0/m7HZrX5NbKGlP1YHIrwDBs67wqxeyUksSlx2c6SP3YCCB9W4EvspH9qyPeFCJbZ2X
	 RHNRfCKIHBo4uJSDIcUSnJj4Ol8Zy6c0poA+1CH+BbVk5wo6UvnNG8jioIzcxfosl7cR4
	 o1t/GkjVxSfPiTUBrcSoM6q4/nmi7cHVm/ecz5hUcnO971zRsPgyJmtBtZv0kqDYhRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173283;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/JMR9TFiJzwG3lAtbz5hLpz0Matvxxs056r7ELV4oUQ=;
	b=THqX+CNiENa4/Wt+Q7N6GyY3MHGnH5FlF1FqEhCfgE7iWK5CYH1vh+k0O5YYhrEKwPIM
	 gbicwfax+fJTQNLVhYTISQ979woJro5DEZxP7tFbZpn4Iy5yBWoCyVgW8SzQRsJAwksoL
	 GXCO6OptnG/1WDCs9MHQ+SC2tRd8QZXWSTa+xbbXgZI+L2ZAAWU3WoprijsZCQwumi1ue
	 VGkZkDKUkybJ5ScWRiEYpkqh9vXr7Xxe7ZwAe7vTVr34MibK6eaEtZlL8750k2hkNxJE1
	 DmkHOUgfgQ9BcHqlVoswWIQERRiGp47w3uDyP/Eu9VIY4xrzWUOJAv4KuT+KCxcKJ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TT8ykJtp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7660A260C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TT8ykJtp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90001F000E0;
	Fri, 20 Nov 2026 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173282;
	bh=/JMR9TFiJzwG3lAtbz5hLpz0Matvxxs056r7ELV4oUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TT8ykJtpYV/uDoVhZoACeJUjmYQgLZV4DMbKUXn8Z/yzNUmmLlcB3mrBKVloq2E70
	 LiFsCLfVXjXQTGtPPZRi93kQyDHKe0EKJgULID2/xgtHQJDL1RNqZa+kKaoKQUCM/s
	 L4+b8iUZgXqqYw3/ArqhJUv+ytVqEo2coXQxdPkWm/5GxBMdWk9gYJVwaLlTistKH9
	 EQ+9rbl2YiTPrH4/Odyvd5gKTuLkEcAisscZdTNx5l1jCeAKwNa6Uvz56+zagW0tlW
	 7WxDIsM8zi5rHG3zNFbPigUQ34z90Ge3OegGgvqasqjTQDHDw+s+NqqpQhxdHv8kkb
	 LJjGch4JHRFhw==
From: Hannes Reinecke <hare@kernel.org>
Date: Fri, 20 Nov 2026 12:14:08 +0100
Subject: [PATCH v4 9/9] nvmet: add configfs attribute 'dhchap_keyring'
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
Message-Id: <20261120-dhchap-keyring-v4-v4-9-5f8c7d9926ee@kernel.org>
References: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
In-Reply-To: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173255; l=4262;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=AM65PWWM2z4sGGsDwGsE+4TOPK1kOwxA9hN1ksrgpJ0=;
 b=vK9iz8yHuoz/OJXdBwjJsHv9Ah2fBaGEqTamycxz8YqdELzOnrYEwbcbpX2Hl/PVEthWz5CNK
 /kKpVfAD0/+AGXJrtfq+hhPIVy4+0rYfOGUirnWJwGfaFyCBrqI08iO
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

The authentication code now fetches the key from the kernel keystore, so
we should be able to specify which keyring to use for looking up keys.
So add a configfs attribute 'dhchap_keyring' for the 'host' directory
to specify the keyring to use.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/auth.c     |  2 +-
 drivers/nvme/target/configfs.c | 62 ++++++++++++++++++++++++++++++++++++++++++
 drivers/nvme/target/nvmet.h    |  1 +
 3 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index 4f2489c5d894b24f25eea8e55e26d2afa7ea40b1..d583813ef4f274853ec2adf961f2d0c3c3544be5 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -68,7 +68,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 		return 0;
 	}
 	len = strcspn(secret, "\n");
-	key = nvme_auth_extract_key(NULL, secret, len, &generated);
+	key = nvme_auth_extract_key(host->dhchap_keyring, secret, len, &generated);
 	if (IS_ERR(key)) {
 		pr_debug("%s: invalid key specification\n", __func__);
 		return PTR_ERR(key);
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 319947aa0a40f918e15e9e2130ebf3a79e2d6efe..ffe0f852e59d9d45e7e90ebf8926c8be6fbf688e 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -2347,6 +2347,62 @@ static ssize_t nvmet_host_dhchap_ctrl_key_store(struct config_item *item,
 
 CONFIGFS_ATTR(nvmet_host_, dhchap_ctrl_key);
 
+static ssize_t nvmet_host_dhchap_keyring_show(struct config_item *item,
+		char *page)
+{
+	struct nvmet_host *host = to_host(item);
+	struct key *keyring;
+	ssize_t ret;
+
+	down_read(&nvmet_config_sem);
+	keyring = key_get(host->dhchap_keyring);
+	if (!keyring) {
+		page[0] = '\0';
+		ret = 0;
+	} else {
+		down_read(&keyring->sem);
+		if (key_validate(keyring))
+			ret = sprintf(page, "<invalidated>\n");
+		else
+			ret = sprintf(page, "%s\n", keyring->description);
+		up_read(&keyring->sem);
+		key_put(keyring);
+	}
+	up_read(&nvmet_config_sem);
+	return ret;
+}
+
+static ssize_t nvmet_host_dhchap_keyring_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	struct nvmet_host *host = to_host(item);
+	struct key *keyring;
+	char *desc;
+	size_t len;
+	int ret = 0;
+
+	len = strcspn(page, "\n");
+	if (!len)
+		return -EINVAL;
+	desc = kstrndup(page, len, GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+	keyring = request_key(&key_type_keyring, desc, NULL);
+	if (IS_ERR(keyring)) {
+		ret = PTR_ERR(keyring);
+	} else {
+		down_write(&nvmet_config_sem);
+		key_put(host->dhchap_keyring);
+		host->dhchap_keyring = keyring;
+		up_write(&nvmet_config_sem);
+	}
+	kfree(desc);
+
+	return ret ? -ret : count;
+}
+
+CONFIGFS_ATTR(nvmet_host_, dhchap_keyring);
+
 static ssize_t nvmet_host_dhchap_hash_show(struct config_item *item,
 		char *page)
 {
@@ -2404,6 +2460,7 @@ CONFIGFS_ATTR(nvmet_host_, dhchap_dhgroup);
 static struct configfs_attribute *nvmet_host_attrs[] = {
 	&nvmet_host_attr_dhchap_key,
 	&nvmet_host_attr_dhchap_ctrl_key,
+	&nvmet_host_attr_dhchap_keyring,
 	&nvmet_host_attr_dhchap_hash,
 	&nvmet_host_attr_dhchap_dhgroup,
 	NULL,
@@ -2445,6 +2502,11 @@ static struct config_group *nvmet_hosts_make_group(struct config_group *group,
 #ifdef CONFIG_NVME_TARGET_AUTH
 	/* Default to SHA256 */
 	host->dhchap_hash_id = NVME_AUTH_HASH_SHA256;
+	host->dhchap_keyring = key_lookup(nvme_keyring_id());
+	if (IS_ERR(host->dhchap_keyring)) {
+		kfree(host);
+		return ERR_PTR(-ENOKEY);
+	}
 #endif
 
 	config_group_init_type_name(&host->group, name, &nvmet_host_type);
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index c8757cedcd841742ff79c830335cfab6e9fc2401..0f76633c6aa65cec26516bd7f0c55dea815a57f5 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -403,6 +403,7 @@ struct nvmet_host {
 	bool			dhchap_key_generated;
 	struct key		*dhchap_ctrl_key;
 	bool			dhchap_ctrl_key_generated;
+	struct key		*dhchap_keyring;
 	u8			dhchap_hash_id;
 	u8			dhchap_dhgroup_id;
 };

-- 
2.51.0

