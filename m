Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453818;
	b=PcudPLsK/fOMnum2jIQfgaXcvpj1pcdbvchQ2qUp7ntagXhPaXh4pBN3+FNTDP6O01EM
	 9QSLVXFzbt/dRYKqbHbNq6M7AnUSBVtxnyQGe3qkpSG9yzS2Wf00mbMKwt7QQ557ZA45a
	 l8fq3xKsNefEF/9KUcxS/Xsl1JoK23/WbkIIE+ypKppuZqjJjHNDTGrDg/JbD0NXqt+SR
	 2BDrmQfJ6ciBmGqJZTCHo704VuutB5RAEgQtq0Ai7Q/S17U3/n+8UKO5fQU1FHxTjP6Ol
	 7k5Xza6xpHTA3xmTtAk49HgwpS6u2x1WiKQ9vd4bjluqxISGmS/sOJO8ACkmoqykcIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453818;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zGcHYyYknrUgVwD3U/9hFrGFjNt40QxW3tbuOMlg1EY=;
	b=o/p51JYmFSCaHuQT4LTR4Vz4PcNarpqkThANrCRhfPZ/04vr6DbEPSHODe6Xe/4KVVCn
	 XgPOmJqI+ilxm+vLTUmB2Rqn1H6lbJAQ4TQRSypwrV30vMCuyQKtfI2VjmrQRVbKJWhZ2
	 zyUTvB7B3+0ss+YbiXki8wHzQhu8eAYQ5ONt9jQCjCowcC1LaWoKcogKCeIvDTmQH2jU9
	 9RTO23D7qhGcETuoL88Cj2gSuH/oz9f5ZQx1Vf24PYSGkAUP8FR24Ey6DWLXOlKr3mngl
	 Tat9vuiuUeQlF6J68KBnZiesKlLHnsVkt2FVOBaZh54m+/H/n3/bGECA701b0WZ4U9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgtIJiHG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC6606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgtIJiHG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B911F000CF;
	Mon, 23 Nov 2026 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795453818;
	bh=zGcHYyYknrUgVwD3U/9hFrGFjNt40QxW3tbuOMlg1EY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TgtIJiHGWbUKmW7CFDPk6/ZsxBHEUyh3DXhSPxPyuIWW7BnZAhPsO1c1Uj5WxTdGS
	 KAzJ/gb1nQf0ubyQKZbpFHyrgJezam/kQ0US8Ms9yDJny/YDGTdxnVWYHWBywUa96q
	 +i+DnQ3fITzbQe5e4OmUvo7kXAfV57ODgRKeYSjGKoVWzM7JwPslYHCKXBTRVr2kYf
	 QavrnZU3MYFx33VhE4QFPf8UrtvI+1kK1VfxrJsa0vWwZMkaD8xnc1tNjIV3Ihh68J
	 vo5oiu8cS+lgfQeLOjTB6mnFAfw6PjHtBQy7FzXzJGIwQ5NeZ0NWN0rNgyjr2liyE3
	 Rg9FNLqoP1GGQ==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 18:10:02 +0100
Subject: [PATCH v6 2/9] nvme-keyring: add 'dhchap' key type
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
Message-Id: <20261123-dhchap-keyring-v4-v6-2-5082a49715ab@kernel.org>
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795453811; l=8003;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=kgGtoap2q+Slqw7dJWsEmFpdAtkiVs7SZIajkmpHFzo=;
 b=rZ09fKdExx0i3vQeBL88FYCJgh++9WgXh35XVQoQ5RfwJBj35r3af3HR1EEuwaIADYkQyiMUR
 j0FYYv+AQGJC+LnAwioYEt615uNl9y/6MzpBlPNcfUu78hDKdanvhDm
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

Add a 'dhchap' keytype to store DH-HMAC-CHAP secret keys.
Keys are stored with a 'user-type' compatible payload, such
that one can use 'user_read()' to access the raw contents
and the 'read()' callback to get the base64-encoded key
data in the DH-HMAC-CHAP secret representation.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
---
 drivers/nvme/common/Kconfig   |   1 +
 drivers/nvme/common/keyring.c | 217 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 218 insertions(+)

diff --git a/drivers/nvme/common/Kconfig b/drivers/nvme/common/Kconfig
index f1639db65fd38abde01832a7404cbc48cf49a93e..24c893c71d86527c1cdf3adace2151f2894afbb6 100644
--- a/drivers/nvme/common/Kconfig
+++ b/drivers/nvme/common/Kconfig
@@ -3,6 +3,7 @@
 config NVME_KEYRING
        tristate
        select KEYS
+       select CRC32
 
 config NVME_AUTH
 	tristate
diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
index 87cb51e1f5a7f330af4705f4058f661d15f5984a..fc7f833a7c6b6358d58b319365b667336d24cd32 100644
--- a/drivers/nvme/common/keyring.c
+++ b/drivers/nvme/common/keyring.c
@@ -4,6 +4,9 @@
  */
 
 #include <linux/module.h>
+#include <linux/crc32.h>
+#include <linux/base64.h>
+#include <linux/unaligned.h>
 #include <linux/seq_file.h>
 #include <linux/key-type.h>
 #include <keys/user-type.h>
@@ -253,6 +256,213 @@ key_serial_t nvme_tls_psk_default(struct key *keyring,
 }
 EXPORT_SYMBOL_GPL(nvme_tls_psk_default);
 
+static void nvme_dhchap_psk_describe(const struct key *key, struct seq_file *m)
+{
+	seq_puts(m, key->description);
+	seq_printf(m, ": %u", key->datalen);
+}
+
+/**
+ * nvme_dhchap_psk_preparse - prepare DH-HMAC-CHAP key data
+ * @prep: preparsed payload of the key data
+ *
+ * Decode the DH-HMAC-CHAP key data passed in @prep and
+ * store the resulting binary data. The binary data includes
+ * space for the CRC, the version, and the hmac identifier,
+ * but the data length is just the key data without the CRC.
+ * This allows the user to read the key data via the
+ * 'user_read()' function. The additional 'version' ahd 'hmac'
+ * data is used in the ->read() callback to generate the
+ * base64 encoded key.
+ */
+static int nvme_dhchap_psk_preparse(struct key_preparsed_payload *prep)
+{
+	struct user_key_payload *upayload;
+	size_t datalen = prep->datalen;
+	int ret, offset = 0;
+	char *p;
+	u32 crc;
+	u8 version, hmac;
+
+	if (!prep->data) {
+		pr_debug("%s: Empty data", __func__);
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		return -EINVAL;
+	}
+	if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%n",
+		   &version, &hmac, &offset) != 2 || offset != 10) {
+		pr_debug("%s: invalid key header\n", __func__);
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		return -EINVAL;
+	}
+
+	if (version != 1 || hmac > 3) {
+		pr_debug("%s: invalid key version\n", __func__);
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		return -EINVAL;
+	}
+
+	/* skip header and final ':' character */
+	if (offset > prep->datalen) {
+		pr_debug("%s: invalid key data\n", __func__);
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		return -EINVAL;
+	}
+	datalen = prep->datalen - offset;
+	p = memchr(prep->data + offset, ':', datalen);
+	if (p)
+		datalen--;
+
+	/*
+	 * payload is < key | version | hmac >
+	 * base64 decode will always return less data
+	 * than the encoded data, so allocating the size
+	 * of the encoded data will be large enough.
+	 */
+	upayload = kzalloc(sizeof(*upayload) + datalen, GFP_KERNEL);
+	if (!upayload) {
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		return -ENOMEM;
+	}
+
+	/* decode the data */
+	prep->payload.data[0] = upayload;
+	ret = base64_decode(prep->data + offset, datalen, upayload->data,
+			    true, BASE64_STD);
+	if (ret < 0) {
+		pr_debug("%s: Failed to decode key %s\n",
+			 __func__, (char *)prep->data + offset);
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		kfree(upayload);
+		return -EINVAL;
+	}
+	if (ret != 36 && ret != 52 && ret != 68) {
+		pr_debug("%s: invalid decoded key size '%d'\n",
+			 __func__, ret);
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		kfree(upayload);
+		return -EINVAL;
+	}
+	ret -= 4;
+	crc = ~crc32(~0, upayload->data, ret);
+	if (get_unaligned_le32(upayload->data + ret) != crc) {
+		pr_debug("%s: CRC mismatch for key\n", __func__);
+		/* CRC mismatch */
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		kfree(upayload);
+		return -EKEYREJECTED;
+	}
+	/* append version and hmac to the payload */
+	upayload->data[ret + 4] = version;
+	upayload->data[ret + 5] = hmac;
+	upayload->datalen = ret;
+	prep->quotalen = ret + 6;
+	return 0;
+}
+
+/**
+ * nvme_dhchap_decoded_key_size - Size of the base64-decoded key
+ * @size: size of the encoded key
+ *
+ * Returns the expected size of the key after base64 decoding
+ * include 4 bytes of CRC.
+ */
+static inline int nvme_dhchap_decoded_key_size(int size)
+{
+	int keylen = -EINVAL;
+
+	switch (size) {
+	case 32:
+		keylen = 48;
+		break;
+	case 48:
+		keylen = 72;
+		break;
+	case 64:
+		keylen = 92;
+		break;
+	default:
+		break;
+	}
+	return keylen;
+}
+
+/**
+ * nvme_dhchap_psk_read - read callback for dhchap key types
+ * @key: key to read from
+ * @buffer: buffer for the key contents
+ * @buflen: length of @buffer
+ *
+ * Formats the DH-HMAC-CHAP key in base64-encoded form as
+ * defined in the NVM Express TCP Transport Specification Rev 1.1,
+ * Section 3.6.1.5 'PSK Interchange Format'. The payload of @key
+ * is assumed to be of 'struct user_key_payload', with the data
+ * consisting of the key data of length 'upayload->datalen', followed
+ * by four bytes of CRC, one byte version, and one byte hmac fields.
+ */
+static long nvme_dhchap_psk_read(const struct key *key,
+				 char *buffer, size_t buflen)
+{
+	const struct user_key_payload *upayload;
+	size_t datalen, keylen;
+	u8 version, hmac;
+	long ret;
+
+	upayload = user_key_payload_locked(key);
+	/*
+	 * Expected output string length:
+	 * strlen("DHHC-") +
+	 * version (= 1) +
+	 * ':' (= 1) +
+	 * hmac (= 2) +
+	 * ':' (= 1) +
+	 * encoded base64 key length +
+	 * ':' (= 1)
+	 */
+	ret = nvme_dhchap_decoded_key_size(upayload->datalen);
+	if (ret < 0)
+		return ret;
+	keylen = ret + 11;
+	if (!buffer && !buflen)
+		return keylen;
+	else if (buflen < keylen)
+		return -EINVAL;
+
+	memset(buffer, 0, buflen);
+	version = upayload->data[upayload->datalen + 4];
+	hmac = upayload->data[upayload->datalen + 5];
+	ret = sprintf(buffer, "DHHC-%01hhu:%02hhu:", version, hmac);
+	if (ret < 0)
+		return -ENOKEY;
+	/* Include the trailing CRC */
+	datalen = upayload->datalen + 4;
+	ret += base64_encode(upayload->data, datalen, buffer + ret,
+			     true, BASE64_STD);
+	buffer[ret] = ':';
+	ret++;
+	return ret;
+}
+
+static struct key_type nvme_dhchap_psk_key_type = {
+	.name           = "dhchap",
+	.flags          = KEY_TYPE_NET_DOMAIN,
+	.preparse       = nvme_dhchap_psk_preparse,
+	.free_preparse  = user_free_preparse,
+	.instantiate    = generic_key_instantiate,
+	.revoke         = user_revoke,
+	.destroy        = user_destroy,
+	.describe       = nvme_dhchap_psk_describe,
+	.read           = nvme_dhchap_psk_read,
+};
+
 static int __init nvme_keyring_init(void)
 {
 	int err;
@@ -271,11 +481,18 @@ static int __init nvme_keyring_init(void)
 		key_put(nvme_keyring);
 		return err;
 	}
+	err = register_key_type(&nvme_dhchap_psk_key_type);
+	if (err) {
+		unregister_key_type(&nvme_tls_psk_key_type);
+		key_put(nvme_keyring);
+		return err;
+	}
 	return 0;
 }
 
 static void __exit nvme_keyring_exit(void)
 {
+	unregister_key_type(&nvme_dhchap_psk_key_type);
 	unregister_key_type(&nvme_tls_psk_key_type);
 	key_revoke(nvme_keyring);
 	key_put(nvme_keyring);

-- 
2.51.0

