Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612158;
	b=sUHrA8H0xwIH5oArc/gDtLi+pd4RmgvVl5FNRi9UJWgyueseb6uaoWhbI5jiE7xyxpt8
	 5Uq217AH6IO2g+SqbXAmKTgU7Xn/1qSystYp+hwivy4o+9068q1jppjuM1td0C3fiHrdG
	 i5bcBsqL8HZXykf+XoGsrTvnYIgZvzQflUGY6ABIg0WWuLQILk0NjBwfoSjhIdeo1LEw6
	 1Nku+jFpP4H6/TmT7GnAltsdGctxygEeI+dK3LR2stZR3rDaj3uE8wRffBJ9LS22dWP9r
	 07nHeERaOMKcUekJKs7arqcwWj0I5Ewb65MoizeNEXHbXoblwSwqd/c9LJmOn7JEyig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s2Uai/Jx+DsKJXOsj9Tyr4955RyN79SwqNHEfqnOVlw=;
	b=ej/SBasQIwU2J8ew9UWBuV7JM/iCt/Qfa03E6btctODNWI9I3DLLD83SWtO8sOEdVNmY
	 PQcKzPg3MVSw/uJpN0D0DpwbBnRz257y1BT0bfhZkGZMP0XXPUTBlgSKnga4/TasXymmW
	 tPJheBMJawZuAQH84iwX1j9KjQAL3U1Bsg5CbcUhJ/k6NTmVn0AGjcRwDKNMhP2XklD/R
	 A9jPCXs8yJwlO3jsn34sSmh6YW2smzYaTuPvpiCsyb7wblN6+X4s6LuSFM8WXr92x7E9b
	 Ebz7goEK/LHjOBhDL8YvDYxBX3tnc9YZ5dDk4XXlmC4B08SdJ7h+Xl3UlHRYIeEyZvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVKTEc2l;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AB3606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22AB3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVKTEc2l
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so5903472e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612157; x=1796216957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2Uai/Jx+DsKJXOsj9Tyr4955RyN79SwqNHEfqnOVlw=;
        b=lVKTEc2lNHdpTwKr8lglyGtOBtHeG9zD/QDgjI5phvAjvuQSxC/8xEkjYBC1CNulpD
         E5V19yYj/qLxSTAfqfTy52s/SOMdI/p83EjWJzlKYeBckAUhqxBaisun6ZqsChaZwLWK
         j8qyBtD96Sq6+kCSYXrTJ+93ASjHrV2XDjEjl4jzgLRW81n5163oJzLS6r1peth99zM4
         iMeGJY4WJmUaGgUKoDXg7oOpBPRaYwkH1S9yCuNqM87e/fSmBZigCKWZKLBTIOZOxBIx
         7AvJyYinYCcb7lw8QZNPmcfRua+ULTq5wBHdHwGSDCx4p+ZqyOem22ZXUPq0NxP5VkWV
         k4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612157; x=1796216957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2Uai/Jx+DsKJXOsj9Tyr4955RyN79SwqNHEfqnOVlw=;
        b=JJ8eu19ulJeyO1J+IkC209DRWJkO1BrLIJjp3oufcx2Ji+YJJLY5Tj7NTN68RkiFjH
         0hutMzKG4juRR5rQZ4Pxo30E75PgV0seclfiIURB8gzVXD3CWF+1rOEAkMTIniNCBtVn
         wcp8WGVX6Z6IfXx1SB6lJ3Vjna2wmlR1ANUHFFDRxTYWq4BCSnC8OFp5nmM9lPWCtgW3
         yNd5+0pO2hqEvClqvnvbIeBjuPIKhLUmiNhW4+eW3VnDH5xjrW4fLvYUJkvIPIsD3zU7
         mun5VILsU0DFy8uqU42rz81pisQ+oAzRWTXmYnMfNiV6rjucBn5y2gD2QfcqNevYxM+x
         U8Ig==
X-Forwarded-Encrypted: i=1; AL+hErFNISoxkokwh8BwU8HpqkjWPWFA8Zf33jctHtvtfUPvLWS+xX2SRDyQ7ll61afC6aXKQIdoGr+srYckcJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+npZUaOBxFuY67UOXP5W5Dizgtm4uDDxxGqdpM1D9nqcdxBsfz
	0naUmBfUlF/sHyovK3ZF2+meULrROJHpcpavJZb3sV2Km8mSjS5ajraS
X-Gm-Gg: AZFdTZeuUSyOqEdXE4nofHan1javTbXbOWsId+IjynzMx1I0xn01vlGJHrVaXXZIzY9
	Owfx0vI6Ra6UYWIRwx0he9GkKC3dt/fNf2W+cA7apd6TPx7Tuyagb1aRxtJEsYKz/2RquyB0e0L
	YlSZA3RFbQTfXoIFGI8SggaiBQ8tLoOiK5/ScRKSDbUucM/EpQ+UlqFSQdt3cApNwUV//MIPZHO
	Z0waPjkA1jDcwIKUEsNr9omKmiLtIYLtGsfGA7w/Qa3k9yJHZppy4aUVGAqL2tUsdUEB5qpas4d
	8FBLHuSbc+5TSSGk4XZUOn8cwPkzy4a+jfI51626l8DPGInr/IaetzAd3N1O2b5bbeb7KZfJIVb
	ob+EehtwBbceIwYnwmFi5+u7SHE05VdqlRtNKO/JCFSl928LHTrCdnREdMRp8lDVtlgLneFgteP
	uxz3Qp7nbB/bo7GwaI9HPPe1ROouy40BgVdWwgidaPhUDZaKt0t2j+wnmXHYXAQmbs1iFIbipKT
	KeOArHJNDiLUdzYfH6TCRAIVrEZaJP2Mfk95DVSK10tqqhQ9dc0bq5wAbmAVDCCyOT69hb9UUtn
	K7KzSdswtjROW+8Lu7C+TgMBv2oiey03
X-Received: by 2002:ac5:cf1d:0:b0:5ed:e8fc:b13c with SMTP id 71dfb90a1353d-5ee8261f236mr5261299e0c.8.1795612157012;
        Wed, 25 Nov 2026 05:09:17 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b60b201sm17299447e0c.14.2026.11.25.05.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:16 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] Bluetooth: hci_core: preserve LE feature holds across encryption events
Date: Wed, 25 Nov 2026 10:08:28 -0300
Message-ID: <20261125130828.18441-3-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125130828.18441-1-andreiab9019@gmail.com>
References: <20261125130828.18441-1-andreiab9019@gmail.com>
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

LE feature discovery now owns its connection hold until its asynchronous
completion callback. Encryption Change and Key Refresh Complete can run
while that discovery is pending in BT_CONFIG. Neither path owns a second
setup hold, so dropping one there consumes the upper-layer hold after
feature discovery finishes and disconnects an active ATT connection.

Keep the BT_CONFIG drop for BR/EDR, whose configuration path still owns
that hold. Route both LE key refresh event formats through the same
confirmation helper via hci_conn_refresh_key().

On LE setup failure, explicitly request disconnection instead of relying
on a drop of the feature worker-owned hold. The abort request records
abort_reason before queuing its work. Do not let a later encryption or
feature-complete event announce such a connection as successful while
that abort is pending. Apply the check to both LE feature event formats.
The feature worker still releases its own hold and device reference.

Fixes: a106e50be74b ("Bluetooth: HCI: Add support for LL Extended Feature Set")
Signed-off-by: Andrei A. Bykov <andreiab9019@gmail.com>
---
 include/net/bluetooth/hci_core.h |  9 ++++++++-
 net/bluetooth/hci_event.c        | 10 +++-------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 4aa0b49ae..68cce0628 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -2331,11 +2331,18 @@ static inline void hci_encrypt_cfm(struct hci_conn *conn, __u8 status)
 	__u8 encrypt;
 
 	if (conn->state == BT_CONFIG) {
+		if (conn->type == LE_LINK && conn->abort_reason)
+			return;
+
 		if (!status)
 			conn->state = BT_CONNECTED;
 
 		hci_connect_cfm(conn, status);
-		hci_conn_drop(conn);
+		/* LE feature discovery releases its own hold asynchronously. */
+		if (conn->type != LE_LINK)
+			hci_conn_drop(conn);
+		else if (status)
+			hci_disconnect(conn, HCI_ERROR_AUTH_FAILURE);
 		return;
 	}
 
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 014207d2d..3ccd8027a 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5798,11 +5798,7 @@ static void hci_conn_refresh_key(struct hci_conn *conn, u8 status)
 	}
 
 	if (conn->state == BT_CONFIG) {
-		if (!status)
-			conn->state = BT_CONNECTED;
-
-		hci_connect_cfm(conn, status);
-		hci_conn_drop(conn);
+		hci_encrypt_cfm(conn, status);
 	} else {
 		hci_auth_cfm(conn, status);
 
@@ -7478,7 +7474,7 @@ static void hci_le_remote_feat_complete_evt(struct hci_dev *hdev, void *data,
 				hci_le_set_data_len(conn);
 		}
 
-		if (conn->state == BT_CONFIG) {
+		if (conn->state == BT_CONFIG && !conn->abort_reason) {
 			__u8 status;
 
 			/* If the local controller supports peripheral-initiated
@@ -8190,7 +8186,7 @@ static void hci_le_read_all_remote_features_evt(struct hci_dev *hdev,
 		hci_le_eks_oppt_encrypt(conn);
 	}
 
-	if (conn->state == BT_CONFIG) {
+	if (conn->state == BT_CONFIG && !conn->abort_reason) {
 		__u8 status;
 
 		/* If the local controller supports peripheral-initiated
-- 
2.56.1

