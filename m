Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436122;
	b=SCCLD3DGXtYZR3Wnyd85lcvbmGJGq2ViLwcTY1Er+Q6fimgTclH9Q8wbfZXF9XWGBGNs
	 cYCMLUiBL9JRDN6YvPV1OsshJQqgwrvnUgvuJoQ8V0dxiHzJu6o4Eg2iXpgwS5GWkY5dY
	 S9uqJ/RZblydRIwGbEhkiCb7DfpoSLX8sUVPm4KTsOGBvF6xo062OtqkfGBhWIfspHKX6
	 O19kd4zHI/9jFvondVHVjzDfEwF1FpNwLJvKRDqquQLjAMoIqHnZN2CF0bbN6145pppC8
	 JMMImNsnux5nltI3R3NaLUk7CZlu4Zg/cBUx98SEIR8HWBn1+7hOpIfu6Z51lxkOSpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436122;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0A1HxPCZgktUb1uEsmTz8nm5mXUnvFpX0/TSq8lRGL4=;
	b=JSHKbqHfU56SuBEnZUzvVtxAhorC93FcJ226MACmcSt8XjMxkeFta2yqouFvVsP/29My
	 tsBkm5z0dPvKmMS1tmRmLXSI8Bfylf3oNcYWiZi/g01RsvSC/FIU2SCkDYJCOo4qyy5RC
	 ZwHg7WuJqZuRWBEx9uhTsBLGJavQYQ6fuHbKUx4+oPEeWPKedlpk1YxfAjgLH0CCxy/yV
	 kunga2G4sYQvt+IPiql4tJSPZAVPqVvxT5E+RoW+U1thDkTySBH0sYf5ZmPsmWYKMCanw
	 slPosg0TGJFs7AZTSGWqWMTgKohHrlcTYKX0SIiqQ5AE6vh++grk5e6ZYco+Gt4PyVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+jInvKl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EA606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+jInvKl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5171F000C4;
	Mon, 23 Nov 2026 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436122;
	bh=0A1HxPCZgktUb1uEsmTz8nm5mXUnvFpX0/TSq8lRGL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F+jInvKlucvFjbPWgfkDtngrdHsyleLMAelHvMDYDjrcBzHrn7yCIAe3KemPJ6cMj
	 7dONviRhWOf/CA6Bf2nc83qQ0i6hLbC9kwGTFra8FEyFXvYjK3OnnlGDR9+vBIbsMe
	 NROLJvv3mFIDo90AVGDH7vHQDL20ivZJGs+Bvpozg+zuGFDexE+yh/tr+EgNruZFO6
	 fNNwtcyod7o1XwF0qsZVJWPYghhXqacZnh28LBNqGLxp/pY8V0MDJ6qsyoIoTkTscT
	 qI++L1Oc7rEVTOYJrSjk1Nym9ZK1GAB7uXAAhT3EXZQQVGgw4gfVryp/OS6QVALW2o
	 fBXsvY99MPLmg==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 13:14:54 +0100
Subject: [PATCH v5 9/9] nvmet: add configfs attribute 'dhchap_keyring'
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
Message-Id: <20261123-dhchap-keyring-v4-v5-9-81eefb4c0724@kernel.org>
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795436094; l=4583;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=2QeKje07TRqRAHvADLlnR5xZ61GdGqKA9Y/L4hYiRz0=;
 b=fJsSFOsTUZZkt8kMofdk46nWUKnX/5HpwgQkhom1HTQ3VHuvqNgsUEvejyI/5fXhs3Jwqcxm1
 gQyoShrGhb1Bb0U3XIs5eG+k8CAfEbd/8j3tyDzeTD4iwBhCpbz6zh2
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

The authentication code now fetches the key from the kernel keystore, so
we should be able to specify which keyring to use for looking up keys.
So add a configfs attribute 'dhchap_keyring' for the 'host' directory
to specify the keyring to use.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/auth.c     |  4 ++-
 drivers/nvme/target/configfs.c | 63 ++++++++++++++++++++++++++++++++++++++++++
 drivers/nvme/target/nvmet.h    |  1 +
 3 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index 7204ace149565205241b7a85ab62389dafa980b6..84091803af300f840aa00c593eb41c1874450183 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -68,7 +68,9 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 		return 0;
 	}
 	len = strcspn(secret, "\n");
-	key = nvme_auth_extract_key(NULL, secret, len, &generated);
+	down_read(&nvmet_config_sem);
+	key = nvme_auth_extract_key(host->dhchap_keyring, secret, len, &generated);
+	up_read(&nvmet_config_sem);
 	if (IS_ERR(key)) {
 		pr_debug("%s: invalid key specification\n", __func__);
 		return PTR_ERR(key);
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index bc46d760aaa4a3316e6c62390cebf32092e5062f..eb20599cf372d23f27b53dc6c1cd070b61d0977f 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -2348,6 +2348,62 @@ static ssize_t nvmet_host_dhchap_ctrl_key_store(struct config_item *item,
 
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
+	return ret < 0 ? ret : count;
+}
+
+CONFIGFS_ATTR(nvmet_host_, dhchap_keyring);
+
 static ssize_t nvmet_host_dhchap_hash_show(struct config_item *item,
 		char *page)
 {
@@ -2405,6 +2461,7 @@ CONFIGFS_ATTR(nvmet_host_, dhchap_dhgroup);
 static struct configfs_attribute *nvmet_host_attrs[] = {
 	&nvmet_host_attr_dhchap_key,
 	&nvmet_host_attr_dhchap_ctrl_key,
+	&nvmet_host_attr_dhchap_keyring,
 	&nvmet_host_attr_dhchap_hash,
 	&nvmet_host_attr_dhchap_dhgroup,
 	NULL,
@@ -2418,6 +2475,7 @@ static void nvmet_host_release(struct config_item *item)
 #ifdef CONFIG_NVME_TARGET_AUTH
 	nvmet_auth_revoke_key(host, false);
 	nvmet_auth_revoke_key(host, true);
+	key_put(host->dhchap_keyring);
 #endif
 	kfree(host);
 }
@@ -2446,6 +2504,11 @@ static struct config_group *nvmet_hosts_make_group(struct config_group *group,
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

