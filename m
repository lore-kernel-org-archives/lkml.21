Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436111;
	b=bkvoM1BAqgFpmWsmG2P9RGOkgmkLreLje35+duVVr50RaMgiPpkCWE4ZWT+Icki7RGRe
	 lRdiDR+omFqnHHmPKFOrLJZGS4WnWD8JXqhv3TxRugDoaelIsuAzvk85afzNHSP+3rcJ5
	 Ve3sIDlybOiMHNZ5MMoPAxY5UQW5ZnFq8pHcWJbprrxBlkudHcmmUYgu+JOUa5NeprOkV
	 rlMlXXApxkxSZk0MO944mBEwk67x07Mn2zZgiMV3wFyfFsWYPD4fIbubkq4zc5Iwls/3R
	 QZDkCDJC3Zr+ZFvJbseCpxzXW7vgn9zo9D+GvVUNqH5G/hRgdGZuXJW+jRTb7xfmblg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436111;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OB8qH3UShHcPHdnqwiYr4z2K76K3NwFVhnc0nApChiA=;
	b=irfpd+8DH9WfT/oGNwCkAArzlWcX2Yhrisrit62G7sdMDqlViYinPernJYsGm/tXy7O5
	 ZcRO0mGDPEnH16TJDbAsnguRDtCKEsukAHcIzyvhcDAb1EEz7wCzJEiShHZT7CmgAZZgQ
	 JXf/33UbsHE+MfiOQyfGPAHqhMqvsW+dxu/zeUbCMpp20gE2WjnBvHoRse64EMLshJx5p
	 ZIIxRUJxPbaQ2N8ljqz6q5lpcraPF6pxgAVsxCF3mGGXx6i2jmCH0GuikrJ4KFfu3GYZq
	 ZLaTaadH3jKxdRFN0LaajHVQM3F7m53lSxQtcOo0bqMiB4kLN4cQG5I56eQabr5N9EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AVSge/EE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B00606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVSge/EE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522B71F0093C;
	Mon, 23 Nov 2026 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436111;
	bh=OB8qH3UShHcPHdnqwiYr4z2K76K3NwFVhnc0nApChiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AVSge/EEo8wyENalUJnNlclCtMfnbU5R9U52GHjPrfTG1x0zWE305KHcobnH0IfvF
	 bq6k20PjZmAR7PTLgUbBrQZ/f13knoQ0eoZoULavLkERl6SiuOedIZ2m0AEdmq3K5u
	 Ov/1sIlknRfAAJXzaltsVKP9TL41CGsu1mE2jPFq8RIverYiBA2OxYJkTdyBeySU/t
	 b/JdKzRXDHfQhY26PdsH/fOhUXj5vkPZ0AC9wiN57gA2+Kvm4A0fixY0rbdty74r30
	 cTpfS/Dc9trH1Z1aoZhm6WqNHkAJ9SONdF8N3NHYHLeZgHtWZaYJqqxhm55ZsoNKa/
	 aJFHj4pADnGkQ==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 13:14:50 +0100
Subject: [PATCH v5 5/9] nvmet-auth: parse dhchap key from configfs
 attribute
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
Message-Id: <20261123-dhchap-keyring-v4-v5-5-81eefb4c0724@kernel.org>
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795436094; l=12382;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=1zSezwLuzOcYmimqOdGZEOUevcSA6ptoLFOkXnYS9fw=;
 b=V4R49s0tlTRf5OqMSm8qF0S+ZJht0kaa+niixk9gG6JkshJ7PmQRVQphp18aJmpoMenUi6J+u
 kmLCPuvuWDTC+1XrJxazyZSrc9ft2msTi1BR/GgTcAgdocNhRQk6AvK
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

In preparation for moving the nvmet DH-HMAC-CHAP code over
to using the kernel keyring convert the configfs interface
to use 'struct key' instead of storing the key data directly.
This avoids having to pass around a pointer with the actual
key material.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
---
 drivers/nvme/target/auth.c     | 181 +++++++++++++++++++++++++----------------
 drivers/nvme/target/configfs.c |  81 ++++++++++++++----
 drivers/nvme/target/nvmet.h    |   9 +-
 3 files changed, 180 insertions(+), 91 deletions(-)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index 26457ce4acc2a8664ec9c2a9ed6d66fed93b61fa..8b77164512c9cb2d50ee5cdd45152b15f425ca92 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -19,52 +19,63 @@
 
 #include "nvmet.h"
 
+void nvmet_auth_revoke_key(struct nvmet_host *host, bool set_ctrl)
+{
+	struct key *key = NULL;
+
+	if (set_ctrl) {
+		if (host->dhchap_ctrl_key) {
+			key = host->dhchap_ctrl_key;
+			host->dhchap_ctrl_key = NULL;
+		}
+	} else {
+		if (host->dhchap_key) {
+			key = host->dhchap_key;
+			host->dhchap_key = NULL;
+		}
+	}
+	if (key) {
+		pr_debug("%s: revoke %s key %08x\n",
+			 __func__, set_ctrl ? "ctrl" : "host",
+			 key_serial(key));
+		key_revoke(key);
+		key_put(key);
+	}
+}
+
 int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 		       bool set_ctrl)
 {
-	unsigned char key_hash;
-	char *dhchap_secret;
-	int offset = 0;
+	struct key *key;
+	size_t len;
 
 	if (!strlen(secret)) {
 		down_write(&nvmet_config_sem);
-		if (set_ctrl) {
-			kfree(host->dhchap_ctrl_secret);
-			host->dhchap_ctrl_secret = NULL;
-			host->dhchap_ctrl_key_hash = 0;
-			host->dhchap_ctrl_key_offset = 0;
-		} else {
-			kfree(host->dhchap_secret);
-			host->dhchap_secret = NULL;
-			host->dhchap_key_hash = 0;
-			host->dhchap_key_offset = 0;
-		}
+		nvmet_auth_revoke_key(host, set_ctrl);
 		up_write(&nvmet_config_sem);
 		return 0;
 	}
-	if (sscanf(secret, "DHHC-1:%hhd:%n", &key_hash, &offset) != 1 ||
-	    !offset)
-		return -EINVAL;
-	if (key_hash > 3) {
-		pr_warn("Invalid DH-HMAC-CHAP hash id %d\n",
-			 key_hash);
-		return -EINVAL;
-	}
-	dhchap_secret = kstrdup(secret, GFP_KERNEL);
-	if (!dhchap_secret)
-		return -ENOMEM;
+	len = strcspn(secret, "\n");
+	key = nvme_auth_extract_key(NULL, secret, len);
+	if (IS_ERR(key)) {
+		pr_debug("%s: invalid key specification\n", __func__);
+		return PTR_ERR(key);
+	}
+	down_read(&key->sem);
+	if (key_validate(key)) {
+		pr_warn("%s: key %08x invalidated\n",
+			__func__, key_serial(key));
+		up_read(&key->sem);
+		key_put(key);
+		return -EKEYREVOKED;
+	}
+	up_read(&key->sem);
 	down_write(&nvmet_config_sem);
-	if (set_ctrl) {
-		kfree(host->dhchap_ctrl_secret);
-		host->dhchap_ctrl_secret = strim(dhchap_secret);
-		host->dhchap_ctrl_key_hash = key_hash;
-		host->dhchap_ctrl_key_offset = offset;
-	} else {
-		kfree(host->dhchap_secret);
-		host->dhchap_secret = strim(dhchap_secret);
-		host->dhchap_key_hash = key_hash;
-		host->dhchap_key_offset = offset;
-	}
+	nvmet_auth_revoke_key(host, set_ctrl);
+	if (set_ctrl)
+		host->dhchap_ctrl_key = key;
+	else
+		host->dhchap_key = key;
 	up_write(&nvmet_config_sem);
 	return 0;
 }
@@ -150,10 +161,8 @@ u8 nvmet_setup_auth(struct nvmet_ctrl *ctrl, struct nvmet_sq *sq, bool reset)
 	int ret = 0;
 	struct nvmet_host_link *p;
 	struct nvmet_host *host = NULL;
-	struct key *host_key, *ctrl_key = NULL;
-#ifdef CONFIG_NVME_TARGET_AUTH_DEBUG
-	u8 host_hash, ctrl_hash;
-#endif
+	struct key *key;
+	key_serial_t key_id;
 
 	down_read(&nvmet_config_sem);
 	if (nvmet_is_disc_subsys(ctrl->subsys))
@@ -186,44 +195,76 @@ u8 nvmet_setup_auth(struct nvmet_ctrl *ctrl, struct nvmet_sq *sq, bool reset)
 		goto out_unlock;
 	}
 
-	if (!host->dhchap_secret) {
+	if (!host->dhchap_key) {
 		pr_debug("No authentication provided\n");
 		goto out_unlock;
 	}
 
-	host_key = nvme_auth_extract_key(NULL, host->dhchap_secret,
-					 strlen(host->dhchap_secret));
-	if (IS_ERR(host_key)) {
-		ret = NVME_AUTH_DHCHAP_FAILURE_NOT_USABLE;
+	key = key_get(host->dhchap_key);
+	if (!key) {
+		pr_warn("%s: host key %08x not found\n",
+			__func__, key_serial(host->dhchap_key));
 		goto out_unlock;
 	}
-	if (host->dhchap_ctrl_secret) {
-		ctrl_key = nvme_auth_extract_key(NULL, host->dhchap_ctrl_secret,
-						 strlen(host->dhchap_ctrl_secret));
-		if (IS_ERR(ctrl_key)) {
-			key_put(host_key);
-			ret = NVME_AUTH_DHCHAP_FAILURE_NOT_USABLE;
-			goto out_unlock;
+	down_read(&key->sem);
+	ret = key_validate(key);
+	if (!ret) {
+		if (ctrl->host_key) {
+			pr_debug("%s: drop host key %08x\n",
+				 __func__, key_serial(ctrl->host_key));
+			key_put(ctrl->host_key);
 		}
+		ctrl->host_key = key;
+	}
+	key_id = key_serial(key);
+	up_read(&key->sem);
+	if (ret) {
+		pr_warn("host key %08x invalidated\n", key_id);
+		key_put(key);
+		key = ERR_PTR(-EKEYREVOKED);
+		goto out_unlock;
 	}
-	key_put(ctrl->host_key);
-	ctrl->host_key = host_key;
-	key_put(ctrl->ctrl_key);
-	ctrl->ctrl_key = ctrl_key;
 	ctrl->shash_id = host->dhchap_hash_id;
 #ifdef CONFIG_NVME_TARGET_AUTH_DEBUG
-	host_hash = nvme_dhchap_psk_hash(ctrl->host_key);
-	pr_debug("%s: using hash %s key %u\n", __func__,
-		 ctrl_hash > 0 ?
-		 nvme_auth_hmac_name(ctrl_hash) : "none",
-		 key_serial(ctrl->host_key));
-	if (ctrl->ctrl_key) {
-		ctrl_hash = nvme_dhchap_psk_hash(ctrl->ctrl_key);
-		pr_debug("%s: using ctrl hash %s key %u\n", __func__,
-			 ctrl_hash > 0 ?
-			 nvme_auth_hmac_name(ctrl_hash) : "none",
-			 key_serial(ctrl->ctrl_key));
+	pr_debug("%s: using dhchap hash %s key %08x\n", __func__,
+		 nvme_auth_hmac_name(ctrl->shash_id), key_id);
+#endif
+	if (!host->dhchap_ctrl_key) {
+		if (ctrl->ctrl_key) {
+			pr_debug("%s: drop ctrl key %08x\n",
+				 __func__, key_serial(ctrl->ctrl_key));
+			key_put(ctrl->ctrl_key);
+			ctrl->ctrl_key = NULL;
+		}
+		goto out_unlock;
 	}
+
+	key = key_get(host->dhchap_ctrl_key);
+	if (!key) {
+		pr_warn("%s: ctrl key %08x not found\n",
+			__func__, key_serial(host->dhchap_ctrl_key));
+		goto out_unlock;
+	}
+	down_read(&key->sem);
+	ret = key_validate(key);
+	if (!ret) {
+		if (ctrl->ctrl_key) {
+			pr_debug("%s: drop ctrl key %08x\n",
+				 __func__, key_serial(ctrl->ctrl_key));
+			key_put(ctrl->ctrl_key);
+		}
+		ctrl->ctrl_key = key;
+	}
+	key_id = key_serial(key);
+	up_read(&key->sem);
+	if (ret) {
+		pr_warn("ctrl key %08x invalidated\n", key_id);
+		key_put(key);
+		goto out_unlock;
+	}
+#ifdef CONFIG_NVME_TARGET_AUTH_DEBUG
+	pr_debug("%s: using dhchap ctrl hash %s key %08x\n", __func__,
+		 nvme_auth_hmac_name(ctrl->shash_id), key_id);
 #endif
 out_unlock:
 	up_read(&nvmet_config_sem);
@@ -263,12 +304,14 @@ void nvmet_destroy_auth(struct nvmet_ctrl *ctrl)
 	ctrl->dh_key = NULL;
 
 	if (ctrl->host_key) {
-		key_revoke(ctrl->host_key);
+		pr_debug("%s: drop host key %08x\n",
+			 __func__, key_serial(ctrl->host_key));
 		key_put(ctrl->host_key);
 		ctrl->host_key = NULL;
 	}
 	if (ctrl->ctrl_key) {
-		key_revoke(ctrl->ctrl_key);
+		pr_debug("%s: drop ctrl key %08x\n",
+			 __func__, key_serial(ctrl->ctrl_key));
 		key_put(ctrl->ctrl_key);
 		ctrl->ctrl_key = NULL;
 	}
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index ff3a8d74de59966952a3991542077feebae10770..12c093f4c8363927b5d41d0cc4445db50d8202b0 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -15,6 +15,7 @@
 #include <linux/pci-p2pdma.h>
 #ifdef CONFIG_NVME_TARGET_AUTH
 #include <linux/nvme-auth.h>
+#include <linux/key-type.h>
 #endif
 #include <linux/nvme-keyring.h>
 #include <crypto/kpp.h>
@@ -2234,15 +2235,29 @@ static struct config_group nvmet_ports_group;
 static ssize_t nvmet_host_dhchap_key_show(struct config_item *item,
 		char *page)
 {
-	char *dhchap_secret;
+	struct nvmet_host *host = to_host(item);
+	struct key *key;
 	ssize_t ret;
 
 	down_read(&nvmet_config_sem);
-	dhchap_secret = to_host(item)->dhchap_secret;
-	if (!dhchap_secret)
-		ret = sprintf(page, "\n");
-	else
-		ret = sprintf(page, "%s\n", dhchap_secret);
+	key = key_get(host->dhchap_key);
+	if (!key) {
+		page[0] = '\0';
+		ret = 0;
+	} else {
+		down_read(&key->sem);
+		if (key_validate(key))
+			ret = sprintf(page, "<invalidated>\n");
+		else {
+			ret = key->type->read(key, page, PAGE_SIZE);
+			if (ret > 0) {
+				page[ret] = '\n';
+				ret++;
+			}
+		}
+		up_read(&key->sem);
+		key_put(key);
+	}
 	up_read(&nvmet_config_sem);
 	return ret;
 }
@@ -2251,9 +2266,19 @@ static ssize_t nvmet_host_dhchap_key_store(struct config_item *item,
 		const char *page, size_t count)
 {
 	struct nvmet_host *host = to_host(item);
+	u8 *keydata = NULL;
+	size_t len;
 	int ret;
 
-	ret = nvmet_auth_set_key(host, page, false);
+	len = strcspn(page, "\n");
+	if (len) {
+		keydata = kstrndup(page, len, GFP_KERNEL);
+		if (!keydata)
+			return -ENOMEM;
+	}
+
+	ret = nvmet_auth_set_key(host, keydata, false);
+	kfree_sensitive(keydata);
 	/*
 	 * Re-authentication is a soft state, so keep the
 	 * current authentication valid until the host
@@ -2267,15 +2292,29 @@ CONFIGFS_ATTR(nvmet_host_, dhchap_key);
 static ssize_t nvmet_host_dhchap_ctrl_key_show(struct config_item *item,
 		char *page)
 {
-	char *dhchap_secret = to_host(item)->dhchap_ctrl_secret;
+	struct nvmet_host *host = to_host(item);
+	struct key *key;
 	ssize_t ret;
 
 	down_read(&nvmet_config_sem);
-	dhchap_secret = to_host(item)->dhchap_ctrl_secret;
-	if (!dhchap_secret)
-		ret = sprintf(page, "\n");
-	else
-		ret = sprintf(page, "%s\n", dhchap_secret);
+	key = key_get(host->dhchap_ctrl_key);
+	if (!key) {
+		page[0] = '\0';
+		ret = 0;
+	} else {
+		down_read(&key->sem);
+		if (key_validate(key))
+			ret = sprintf(page, "<invalidated>\n");
+		else {
+			ret = key->type->read(key, page, PAGE_SIZE);
+			if (ret > 0) {
+				page[ret] = '\n';
+				ret++;
+			}
+		}
+		up_read(&key->sem);
+		key_put(key);
+	}
 	up_read(&nvmet_config_sem);
 	return ret;
 }
@@ -2284,9 +2323,19 @@ static ssize_t nvmet_host_dhchap_ctrl_key_store(struct config_item *item,
 		const char *page, size_t count)
 {
 	struct nvmet_host *host = to_host(item);
+	u8 *keydata = NULL;
+	size_t len;
 	int ret;
 
-	ret = nvmet_auth_set_key(host, page, true);
+	len = strcspn(page, "\n");
+	if (len) {
+		keydata = kstrndup(page, len, GFP_KERNEL);
+		if (!keydata)
+			return -ENOMEM;
+	}
+
+	ret = nvmet_auth_set_key(host, keydata, true);
+	kfree_sensitive(keydata);
 	/*
 	 * Re-authentication is a soft state, so keep the
 	 * current authentication valid until the host
@@ -2365,8 +2414,8 @@ static void nvmet_host_release(struct config_item *item)
 	struct nvmet_host *host = to_host(item);
 
 #ifdef CONFIG_NVME_TARGET_AUTH
-	kfree(host->dhchap_secret);
-	kfree(host->dhchap_ctrl_secret);
+	nvmet_auth_revoke_key(host, false);
+	nvmet_auth_revoke_key(host, true);
 #endif
 	kfree(host);
 }
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index 1dfdac159dab044566aac47862665784feddec0a..e708c80e8426f426adf4e98defaa9e77e30d9a58 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -399,12 +399,8 @@ static inline struct nvmet_subsys *namespaces_to_subsys(
 
 struct nvmet_host {
 	struct config_group	group;
-	char			*dhchap_secret;
-	char			*dhchap_ctrl_secret;
-	int			dhchap_key_offset;
-	int			dhchap_ctrl_key_offset;
-	u8			dhchap_key_hash;
-	u8			dhchap_ctrl_key_hash;
+	struct key		*dhchap_key;
+	struct key		*dhchap_ctrl_key;
 	u8			dhchap_hash_id;
 	u8			dhchap_dhgroup_id;
 };
@@ -998,6 +994,7 @@ u32 nvmet_auth_send_data_len(struct nvmet_req *req);
 void nvmet_execute_auth_send(struct nvmet_req *req);
 u32 nvmet_auth_receive_data_len(struct nvmet_req *req);
 void nvmet_execute_auth_receive(struct nvmet_req *req);
+void nvmet_auth_revoke_key(struct nvmet_host *host, bool set_ctrl);
 int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 		       bool set_ctrl);
 int nvmet_auth_set_host_hash(struct nvmet_host *host, const char *hash);

-- 
2.51.0

