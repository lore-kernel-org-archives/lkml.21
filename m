Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010985;
	b=QrIAzc1extOasCmfDQVGMLgq/Fy8DmAp+XxZ1xmAqFADij60M5gjs0dSNMR8HIpxpQ3v
	 U0ZyNFgDE/BCa01WDyis7uXxASCZzPUaMVzgfL0AaCjZ+T7wNINgiaZazz0Veu58giOAO
	 z0hLjmjFs4Kw7WTpYzFOSyIxFsQz+PxV6r0GC4ixtvVeKnK3PkEHZjmR7QzBQcou1Nz8h
	 svROxOnGRSs2GwDZWdB9y6EcML8i3nYWL+Vv9/Jy5dRWrJTfcWPVD3rMY2uDSrkZlXGr8
	 f01RcNBMS5oOKXgw9EbOj3fu5RwmRUHaI4FynOi9MUxilyYUI2efCDHetK4nh1vVElA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
	b=n7LmijxX1Xoebln8QHQ7aVeC9tqFh1VmvHHk80MaEt605j9WoPuBKgC6WXwssa9YO9h9
	 vSqF+vqjJvKxjdwTsK2UW2X08IQ4t5sHlaSQfD3vvpr1kLJiQwDPyKe3RzYaJ+P6DNloF
	 aYIb+qAWmVAFBZUhJfIVLutP0yjrMNs8KkDW9HSl9SdMRY3Yom2EVVlpMwum8equyS6kD
	 aB3pTrKzC7T9mqnIh18WrCVW7wBfTbIOg3j31DTVRKgy+K5Pv2QKo3r7wqi7nqbGkOg3u
	 FpXvxyDdleY4yD6rM39rkA0l5Jln+RcZLyKtI4p4Y+5ufiM7oaV2xqfLtEpv+Lyhulg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFFEWmQg;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B25606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B25606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFFEWmQg
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-862df509d48so666043a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010982; x=1795615782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=sFFEWmQg7vNncfij1+tYVntU7ZjPo939n/lJjHpag/VXJRS5tBG7d8b4tAJJp08jTb
         sh8dYBYB2qEXxquBGgNARaSIrh4qDIYt//KoeIZd9rtWBc0jRPG04n4ZJ82nZ3ysHvgO
         /t7EWdSPRYUU2mz28gcHoXIPwVq+1ZEGj/fwH3Ke7aVeIVj9Gw/x33Ng/pVigk83WoaZ
         JWioVHcEds7pr6A3hGszhC2qrbRMO8tCCODs2vo+5jrBKDK7gEh7c77N0CqDkoI7gBXQ
         97hc53aWENm4x/9aZJwCjTIum5+1CxLPJVi/Qg3H80lg5AQWtLhrOjL6dwILGkHjDiVK
         tsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010982; x=1795615782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=bsYt1QlsOjjsEbviczMi05xy4OoPa6144BXuerrha1KuqqfBi7t/wIq18q+sAeK9j4
         gLd1GCtr5mu3d7tnZjbTLk1I8tDcJpDf7nWdi4Ikp0DSVlAKEIlcKfMVqZMMrk9P7NbL
         U2rrZJOofN2N3uwSQ2l9nnxsyEx6E6dWOujaMvXBiku/EwqWBpDlHw97A0glk4RShIB5
         tblOrKGrGM/RVbwYBmxtF6dbX6DHrxUi4zFjdgV8qQ/x25kN/00WW9ln63EOzuWeUbro
         oyFWRhpej7imTp946bXNiH3oYTu58woqwLNUvqhQf8RaolN8PAujNWotEmQsNn+yJfO0
         XFhQ==
X-Forwarded-Encrypted: i=1; AL+hErHOlRtdF0mVgNV8AJbck6zzBjMJD1E0u+fJ0aye6Buc7rlqDku0Xir64M5IVklZnjE7DE6jWDsneievwAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HSUoI5npFXjsRzRP2CZqe8iB5DNVTqSFQgYsauJGtBUKD4A+z
	9gwtyYUhejMPuZ2W1jZdmHA7N8KOfF4xh87v2FAWMaO6Wj8a0fciCZ7S
X-Gm-Gg: AYBFou1tKQLVmspw+Y2TG92DdRmNN85qweub2kyKjnhxkibjbnet5u/RXnC+7wVlkq6
	NjqXs6xtIGSAzUjafw0NVMLyzoHwg69vGUPP8mWkTNKvpa/MLjzawoKf70DWNsNDnV8vxua07/e
	cONXKHSRvrI9K1nUlq3M27WnXL4GoFn8jZkXwWA5/j2U44UFCsyXFDhHUmTwRpqVqAj0KXg3n8K
	or/fbrIkk0LCbYi78Q7HQrPOOhbJWsx0cBfPlvlrfWpdvliNbpQK+RCct1AekKfswcQA7zvwzHt
	zGzSLsvXlP4/eDEhie0ikmxjP0cPaH8qr83Z6BOcsUSutyunbTk6scyGF/Rhvdo11vLUUraNUEx
	gg3kDfuytg/qU7xjEZIBMrH8LevClw55MGbMrZa6EJXb/R16gKZ6EPHyiRwt7JAZAuZemrOO4Nk
	EWCsBZ1eIwyGuyGnLKsO5tpYMpwcXS8AsYeiUbzF+eXVnCH8+gQsnuNtIfECevCe23H4sBLsPSC
	M3D5ho00TN5tal49Yl14WzJE8awKX+UoAvd7zxz/U5pYVjulg47Dh6Yhb9zIINt0vT6bd3h/CAq
	ixCPICqWG3H4gsMTM8LDm9yzQc0FDA1/UV6EG8aTTHJigl5f
X-Received: by 2002:a05:6830:b13:b0:862:a6c5:8f12 with SMTP id 46e09a7af769-862ddc4b53amr4063814a34.11.1795010982542;
        Wed, 18 Nov 2026 06:09:42 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f0239a3fsm2126877a34.20.2026.11.18.06.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:42 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:04 -0800
Subject: [PATCH net-next v5 2/6] psp: support tx rekey operation
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
Message-Id: <20261118-psp-v5-2-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

The tx rekey operation creates a new psp_assoc with the same rx state,
but with new tx state. The new association is spliced into the socket
with RCU to be used immediately in the tx path.

Drivers that use on-device tx key storage need additional logic to delay
key deletion until after any in-flight users of the key have been
drained, so return -EOPNOTSUPP for now.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count the socket twice in stale-events
- document that the previous rx SPI also stops being accepted once
  its device key is rotated out
- drop the claim that the peer accepts both the old and new SPI
  after a tx rekey
- document tx rekey in the tx-assoc op doc in psp.yaml

v2:
- place new assoc on pas->assocs list instead of psd->active assocs
  list
- reject tx rekey on SADB devices until deferred tx key deletion
  lands
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     |  5 +++-
 net/psp/psp_sock.c                   | 57 ++++++++++++++++++++++++++++++++----
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index d5713f5d1af7..f6af1a510d17 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -283,7 +283,9 @@ operations:
         post: psp-device-unlock
     -
       name: tx-assoc
-      doc: Add a PSP Tx association.
+      doc: |
+        Add a PSP Tx association.
+        If the socket already has a Tx association, rekey its Tx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index fab797506b0a..43f222b38d3d 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -145,7 +145,8 @@ Rekeying
 
 A connection which has completed the exchange described above and is
 in the "PSP Full" state can be rekeyed in place without being torn
-down, using the same netlink calls as in connection setup.
+down. The Tx and Rx directions are rekeyed separately using the same
+netlink calls as in connection setup.
 
 ``rx-assoc`` allocates a new Rx key and SPI, which should be passed
 to the peer exactly as during the initial exchange. The SPI which was
@@ -154,6 +155,8 @@ next Rx rekey, or until the device key it was derived from has been
 rotated out, so packets the peer sent before it learned the new SPI
 are still received.
 
+``tx-assoc`` installs a new Tx key, which takes effect immediately.
+
 A rekey is rejected with ``-EINVAL`` if it would change the PSP device
 or the PSP version of the association. It is rejected with ``-EBUSY``
 if the socket has not completed its initial exchange in both
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index c1e38845f08c..d497f41c483e 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -280,6 +280,53 @@ psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	return err;
 }
 
+static int
+psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *new;
+	int err;
+
+	if (psp_dev_has_sadb(psd)) {
+		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
+		return -EOPNOTSUPP;
+	}
+	if (!pas->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+
+	new = kzalloc_flex(*new, drv_data, psd->caps->assoc_drv_spc,
+			   GFP_KERNEL_ACCOUNT);
+	if (!new)
+		return -ENOMEM;
+
+	new->psd             = pas->psd;
+	new->dev_id          = pas->dev_id;
+	new->generation      = pas->generation;
+	new->version         = pas->version;
+	new->peer_tx         = 1;
+	new->prev_spi        = pas->prev_spi;
+	new->prev_generation = pas->prev_generation;
+	refcount_set(&new->refcnt, 1);
+	memcpy(&new->rx, &pas->rx, sizeof(new->rx));
+
+	err = psp_assoc_set_tx(psd, new, key, extack);
+	if (err) {
+		kfree(new);
+		return err;
+	}
+
+	psp_dev_get(new->psd);
+	list_add(&new->assocs_list, &pas->assocs_list);
+	list_move(&pas->assocs_list, &psd->stale_assocs);
+
+	rcu_assign_pointer(sk->psp_assoc, new);
+	psp_assoc_put(pas);
+
+	return 0;
+}
+
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
@@ -312,13 +359,11 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 		err = -EINVAL;
 		goto exit_unlock;
 	}
-	if (pas->tx.spi) {
-		NL_SET_ERR_MSG(extack, "Tx key already set");
-		err = -EBUSY;
-		goto exit_unlock;
-	}
+	if (pas->tx.spi)
+		err = psp_sock_tx_rekey(sk, psd, pas, key, extack);
+	else
+		err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 
-	err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 exit_unlock:
 	release_sock(sk);
 	return err;

-- 
2.52.1

