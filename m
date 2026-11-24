Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554769;
	b=4rnAj3gObSVHoNVF1NbYn+4k6wdkQt4BaYsbOO3m5dgMZDHNMRT78rYaooKj2RLy+Ijz
	 aSKKyKidyKsGJ4YKaABsgx00ueBXzUe1PPQNgafIRXYUqufa0/eV9Xme+HwAPsCSho5dM
	 aoQvi4SxH7gOoaXXTqM0iFfaEnKVhsPtKpcXhCRFFSeSdhhGuKyNc2JXHQD5Bj1bnXVeQ
	 k4AF/CL1ItpaKMx6c6x1ewXwfhkMsmlmYWUXAM9MsE6oR3s5/7hPE6yFVK/ooRfQfLqqY
	 kvlWnNys6bocxILKvxoL5EAtGlCsnOell+TA/mxNbDsmjzFR/Vo9WC81adEsWNDVoNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2KMr8B1XjeGr5sbvvGEh5j7YxioCwr2NncjqTlPhcoU=;
	b=tkDU/6oSQ76IFGXHxWUiO3EWja6MOhJ6qU49vRjIFaINZPBvQwQigN4NVyQxrFbvrveZ
	 I1qWfjoIDfj7quf4fWzPDwfAG3epGN5MDhuCHBlcArlgQemBt6OUVfr4O5sOX1FkRp+5g
	 uIYfhhVAHZGHiwZ6ga8Trvfy452BoQmTWZJPY1MUYvHKFh2IAFiqANV4plr7iAEDORKgW
	 XAk3i3qKZGjsDFv3n3/ioHCZqtwZ3k/bDiPvdvRoI+jj6Sji3QsTqkSZ3eg3S/46H8s6K
	 k4p72B241tKcRjMMyE50CGl/RxEyN07aeA3TW0M4RpTENpU3SHCTMHBi+JztLNzypLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7XudmzB;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA82606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA82606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7XudmzB
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38644aedba1so7708426eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554769; x=1796159569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KMr8B1XjeGr5sbvvGEh5j7YxioCwr2NncjqTlPhcoU=;
        b=F7XudmzB3UMlmDKY4pxSeier24JSGJsFdvj6+8k67E1xyhKDTD2515LthAx9Dx/1cq
         q4N08LAtEpSX15Ao2DEYIAH3BFsRkPEUlJ5xvKv7HMpPPSaRxtsimOfzGvXu0O8fTff/
         Wb6vzY5tzZCp3hhIKKTmNfiW0r38pg70He4yMolGzOfYWA60BBFdM7jCOXqTtXI04aC2
         2yL6pjGR5/0WAM03AjtdQEPTDIhXZYJRLFyLhmM0LhPURBxKOAx4WvnVsm9/XOVgWvze
         Tn3UEfxmHlQXCZqIjLIEvXemp/MbkiESvG5KCS3OQDwecGucAZGI2ePm4KnKa3VNS0v2
         c18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554769; x=1796159569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2KMr8B1XjeGr5sbvvGEh5j7YxioCwr2NncjqTlPhcoU=;
        b=elnON0Ndp+yFiKGUlAZqF8wfFTPQPAvg+Jcv9Ak+uDiblFoUGVrOO/joxO5E5xoaE3
         7e0b4F9EVgv4L0vM6Ev8wG42DSMRlF86SpSc+W6m6VN5ij/bh+iWDgf2GVkgF3V7VCG3
         iV33qSAIxnVDJ5nrva4S0MzlCwjxIxWiEjDA3ahh2B2rnqEn6h/wJKip+6/uIWOVs0em
         WMvaoOv6BzYxLftBMbotB9URajK+SHZEFsBzqq01QqMbzbemp1Rcl/u+M6U4Ouzbguh6
         KOkAV5/5r4jJCrE+JN14/xDX3FSS9M3rbMfX8bqQAbnL4AUCJgk1QUHThKuO9o7vW9gx
         D/aQ==
X-Forwarded-Encrypted: i=1; AL+hErGkOmw/OmoyuPC+WEBwkv8AXAzVOeScP3WoOBO8En1OHC62g2wz5QFrRb9CUAEixdSoQYqqjiRMeXsX2OM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8066UQYUMsTVXSDNwKe/vC4VPBiUoKHyzd3KRzvwfsHt1YQeOv
	pHF9ayWA/u8bdwKqc4sslb5PnVdGeAmfNU66GefuoAZVdiJENHxXQlHf
X-Gm-Gg: AZFdTZepinBTj6wMrmhxS51KL/HXgizDoPErrZT9Ozmbkvlfsd3ynB/h0IVrIvn9NI8
	aYOnw9u3fxf+hyPVtr6EPFarAGfScAHFiSjkCtrL95UpaSHOyn1BcyrQ3vfXONCzmI8+8hk4iDk
	rC2xNyDEEK7R0vEYMXC/4MyqFrPdHNAtCiy8Iv3kpqpz0pGfj8J3Kx3KCs/2TaOqBT6QvpOi6tZ
	DSDR0axJnkNLsy63Nv4EX2/rV3/DFkJnSjQaZ+i30RxaRyXvnjSOWoO8A+Gf9uCyfLeCfHISz7I
	DJWo9tckUzeOrJpNiOwiTwBZDf9+WNIj7r7VDAjrfTOMSiRgSb3SzKiR/1L2d1d+6DkGTrE39Cw
	3QIsbtfpxn73wCKnVEM5uPDHA/UKh8EJGgK7AGrTcvJeSzAibSYSNM432dHEfuGgDbgMuq2kCz/
	yNVcwUcoWGGguXBd9nrJuYeRB7/FrErhzq6GsjQhmz+LQaKLdaVqaQm4OFtLEz/mV9Yr7UiXeth
	fFgtX8QJedI2ptIf6anv+qupBGKYHQk2lArbR4B6FVKhTyKx4uacIwDXX+/2nHaEVfx2k1Yfuwn
	4814r0O6fIBEIHH06G+JVwKG/E4NBePgzujFtrKLAP39Zyz0hy5evQ==
X-Received: by 2002:a05:7300:6881:b0:386:9ffb:33b4 with SMTP id 5a478bee46e88-3869ffb51abmr11773929eec.33.1795554768490;
        Tue, 24 Nov 2026 13:12:48 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm22124445eec.18.2026.11.24.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:12:48 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] Bluetooth: hci_core: preserve LE feature holds across encryption events
Date: Tue, 24 Nov 2026 18:11:27 -0300
Message-ID: <20261124211127.41609-3-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124211127.41609-1-andreiab9019@gmail.com>
References: <20261124211127.41609-1-andreiab9019@gmail.com>
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
index 4aa0b49ae1..68cce0628e 100644
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
index 7991db54c2..cb9e4255a3 100644
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
 
@@ -7470,7 +7466,7 @@ static void hci_le_remote_feat_complete_evt(struct hci_dev *hdev, void *data,
 			conn->le_rx_def_phys &= ~HCI_LE_SET_PHY_HDT;
 		}
 
-		if (conn->state == BT_CONFIG) {
+		if (conn->state == BT_CONFIG && !conn->abort_reason) {
 			__u8 status;
 
 			/* If the local controller supports peripheral-initiated
@@ -8171,7 +8167,7 @@ static void hci_le_read_all_remote_features_evt(struct hci_dev *hdev,
 		hci_le_eks_oppt_encrypt(conn);
 	}
 
-	if (conn->state == BT_CONFIG) {
+	if (conn->state == BT_CONFIG && !conn->abort_reason) {
 		__u8 status;
 
 		/* If the local controller supports peripheral-initiated
-- 
2.56.1

