Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436102;
	b=m68olsBSRI1IparuyoKXZU0jeOSV3nMeRVj//zB5XWYeKqmO//UudNP9eM4M/cfpcj9a
	 xYcqwBAqcPPOLuKE64tUJjJ/TG1ZKZspcv3mjfjizD+GA8jwKnYTgvTZMbnC3q/3X86Ad
	 Y67Hx2s1gcx2LlmlNJ4SIaid1MXFl3cZLUYESzhRgIaEhir1Yq1etQmbisVvYMmMnachb
	 SzNHMt5vdTGwOlWxVcyLdCK6wtOA+8D7nd5lbZPydlL1IvqVLJ+EXmPhjJnImeIvFqaT/
	 8jouJ710IjvdRMaZ2+iqcAlydv88nIb7hL/apZW67DpEU+izWQ6yTVRnpT1+Y9NMZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436102;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zzKxxjZ94OMgytnjzLDfgXkvuSh5h18zWYCH72gJp3U=;
	b=W7y5alfeha18z1TzkF5Ghq+XcSvWQaPfeBfePm+sTwv19XVdufphGC2PL3UI6B5za0hk
	 rGZolg0buel6ANeXq94024YXtw2ONGYOtemtPGWvorHHUF4jSrG/iW22QNh0xYbNBPh84
	 BGX84O4graL/dUvrhzRm4RYqOaLP1rLvnfvsFwxeH3meQUVRHrbyd3m6wsIJjo7/TIenK
	 V+bO0uVP9ocQq6XPQgdOfpt3rGjWBhSvhFKhH0I9My+UVJdWREm1y1iidzWpc693+vERy
	 HkQCkDNrBt10LIzK0hN/089+R2vasdcNRoSHfex13nK5dg/uS1ujmcc+Iwj3zZf3OAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sb4mp+Yg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78D606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sb4mp+Yg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643391F000D8;
	Mon, 23 Nov 2026 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436102;
	bh=zzKxxjZ94OMgytnjzLDfgXkvuSh5h18zWYCH72gJp3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Sb4mp+YgYd2204b8IRPVsRgWP2Rd0sdrUFgxt45YMqs+gVIGrWSU8+NbQucPX93mX
	 mZM2DHY1mZijuKlaht9rPsyMMm0D9Qze13UXG/+8d0PceunrM6P5we3S+tGD+g0DaR
	 wXIazl5xY8ZX1hJaZGfKIncwPK4uQMoo5C6g/BGZ3FMIdyxLy1vs5dNBEXqbuFfm8y
	 jGixlNK8HD3hvOdgLpRoxZWgScpBp6rakkQRIFRkq8fRJCnJ2SPaWz7ymz/ByTkTHn
	 4f/ftGnmhJKIcIDkcI3gXG2sbeCnFU8TZBTtlTxUoSuK/B4yuJl/Ex0GWl6vRY3AaK
	 afMjZ8A/pG4YQ==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 13:14:47 +0100
Subject: [PATCH v5 2/9] nvme-keyring: add 'dhchap' key type
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
Message-Id: <20261123-dhchap-keyring-v4-v5-2-81eefb4c0724@kernel.org>
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795436094; l=8129;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=H78zwxzT2/WXziPhIOUPHzNvamrAb0ga3eYzkxZYcvE=;
 b=Bvy5AiFkFbwZRJXHNc++x94k0UbroMsu9R3YaNYyquaNqUl8MuJ35b0fRrpBEo8WvU7GeN0Lw
 Lkd5Et4GW0VBavWSF7NDAjjjZBRoR146/N8xh4GinnnIZlt5nElv44s
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

Add a 'dhchap' keytype to store DH-HMAC-CHAP secret keys.
Keys are stored with a 'user-type' compatible payload, such
that one can use 'user_read()' to access the raw contents
and the 'read()' callback to get the base64-encoded key
data in the DH-HMAC-CHAP secret representation.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
---
 drivers/nvme/common/keyring.c | 235 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
index 87cb51e1f5a7f330af4705f4058f661d15f5984a..d0c36d153afdb39ae698cf86cefe53f82af34907 100644
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
@@ -253,6 +256,231 @@ key_serial_t nvme_tls_psk_default(struct key *keyring,
 }
 EXPORT_SYMBOL_GPL(nvme_tls_psk_default);
 
+static void nvme_dhchap_psk_describe(const struct key *key, struct seq_file *m)
+{
+	seq_puts(m, key->description);
+	seq_printf(m, ": %u", key->datalen);
+}
+
+static bool nvme_dhchap_psk_match(const struct key *key,
+				  const struct key_match_data *match_data)
+{
+	const char *match_id;
+	size_t match_len;
+
+	if (!key->description) {
+		pr_debug("%s: no key description\n", __func__);
+		return false;
+	}
+	if (!match_data->raw_data) {
+		pr_debug("%s: no match data\n", __func__);
+		return false;
+	}
+	match_id = match_data->raw_data;
+	match_len = strlen(match_id);
+	if (match_len != strlen(key->description)) {
+		pr_debug("%s: match '%s' '%s' different size\n",
+			 __func__, match_id, key->description);
+		return false;
+	}
+	pr_debug("%s: match '%s' '%s' len %zd\n",
+		 __func__, match_id, key->description, match_len);
+
+	return !memcmp(key->description, match_id, match_len);
+}
+
+static int nvme_dhchap_psk_match_preparse(struct key_match_data *match_data)
+{
+	match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
+	match_data->cmp = nvme_dhchap_psk_match;
+	return 0;
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
+	int ret, offset;
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
+
+	if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%n",
+		   &version, &hmac, &offset) != 2 || !offset) {
+		pr_debug("%s: invalid key data '%s'\n", __func__,
+			 (char *)prep->data);
+		prep->payload.data[0] = NULL;
+		prep->quotalen = 0;
+		return -EINVAL;
+	}
+
+	/* skip header and final ':' character */
+	datalen = strlen(prep->data + offset);
+	p = strrchr(prep->data + offset, ':');
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
+	ret = base64_decode(prep->data + 10, datalen, upayload->data,
+			    true, BASE64_STD);
+	if (ret < 0) {
+		pr_debug("%s: Failed to decode key %s\n",
+			 __func__, (char *)prep->data + 10);
+		prep->payload.data[0] = NULL;
+		return ret;
+	}
+	if (ret != 36 && ret != 52 && ret != 68) {
+		pr_debug("%s: invalid decoded key size '%d'\n",
+			 __func__, ret);
+		prep->payload.data[0] = NULL;
+		return -EINVAL;
+	}
+	ret -= 4;
+	crc = ~crc32(~0, upayload->data, ret);
+	if (get_unaligned_le32(upayload->data + ret) != crc) {
+		pr_debug("%s: CRC mismatch for key\n", __func__);
+		/* CRC mismatch */
+		prep->payload.data[0] = NULL;
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
+ * Returns the expected size of the key after base64 decoding.
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
+ * Formets the DH-HMAC-CHAP key in base64-encoded form as
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
+	if (!buffer || buflen == 0)
+		return -EINVAL;
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
+	if (buflen < keylen)
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
+	.match_preparse = nvme_dhchap_psk_match_preparse,
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
@@ -271,11 +499,18 @@ static int __init nvme_keyring_init(void)
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

