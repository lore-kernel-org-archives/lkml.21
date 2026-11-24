Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529447;
	b=MtkBBAJAra6RIteOCslTIFxbk9/IoCNJVJ8nRcAudmtUPaspuUxQabqdL7rYb/iQD6KB
	 KCwaU6TqzsdX5O8ORmtGfE7dZnu6PP/I4rD9JbpzYDMsN4PF/pB5WSfRh6Riog6Os1t+9
	 0O79wH1cyVdrRP2EhNovZ7/e+xaODPE8j5PLlSYdPehp3BIIydyQZVEgYKDLoaJoeb9QY
	 fD/ya4WQIwpvMEY8dLL5gR+NpSwMhunbvSjZ4tJyDr5xHWHzhiFZ2cRI3hLdVydgMdiJi
	 m7ZaJt7HDnQ6lZyLPnwfyb9MtoT/qRmJ6fVsLTmePxgToFixB+UuUwot/3ve0fzqe5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XShi4tcBiiUeex/UpD4VJCvI1c9XNejU2j6InR/Tko4=;
	b=RusPaCrl/E4sl2GxuIawY/TGNfLhLLtbojbfgy2qXxcUxVsfxsfsFYagFirkbJ08lIf+
	 KJk+gRKyu2h2n94j8HrzBPKptyKLjtDMkNd6RGRxq86fTtp18TuUQ4B3/Sr7CWLPiGjJO
	 4RZt19jxMVN0pnh0Kmo9IqkjE48xntLKzBmi+oROo6Wkfym7zNkUYku9fQIWtOud7emdB
	 A3n3meR4dMgQ30NB3dNro+DLvj5RZi/vb8oifsuFPp7ZML/u+d0/k9za3J861jw9RZkDz
	 ICXpYuCnBVjPM0Gr+MsNaBPuMeM3TIRkxXhTg2+nbtML5U/FRLMsX46m1N6Qx0cJYFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rKjh+Un/";
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428F606A68F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6428F606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKjh+Un/
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-990703f817fso2369046241.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529445; x=1796134245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XShi4tcBiiUeex/UpD4VJCvI1c9XNejU2j6InR/Tko4=;
        b=rKjh+Un/CNcE7k3fd7JY9nVSCz8T6Bo6KU6Qm6T3vrx+6SJfiPSjKWghWYp2uXDhUo
         3kr6Q9jdUclD6RZoVflL/78OQ5p1jdt1lxMxwRLzpuyUehFJ38Vfmg4aTo6IjGtqJShb
         nYfRrqAxGtqsHGzZiLYbBx63qIBfW6dJlGpXuxi5xpGTrKn46KU9r1rf+npSeCebGlr5
         eyFSLxC4lM/8SmJPPguML7m4LNMH/AIE3I/qoKc9OucuAdFS9hwo4jV0PaGgoh1Rc7Hv
         nAj8B+N1szk/xEk8tDyWqmAmkttvGHW2/US7cHCVmLUW5miZKppN6yLln3p+rVSNbHbu
         +8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529445; x=1796134245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XShi4tcBiiUeex/UpD4VJCvI1c9XNejU2j6InR/Tko4=;
        b=PjL5UMmb4CfaRR7nxiRJdGqzyXFokU3MiCLX7sKpKHSU9qtLPc72t8ClxP8ILaHUwk
         d1HWIlPZQl4BXFVKTxg8/cCzMYqv4j4fV6FWEzMPcRqbrDFcZ0Z0A3XjbD0ZbGxcT6jn
         NmQdfoqI4/+/s3T17RZY75VotC5P5UWj0Y05G2Lr8AuxiYuEmxyXeqbOPLxUs0qTL0VC
         Htbr/qh3EP3tyBBmMi4chMIXvbhgpMOiEW5gaLrFDugdAaEwQWW1XKJe6fobquk6nvNH
         bbWTgqPXMstAv03tLKv/Vi831Izh7QRtAUAV0HRFovrZgtFLPdcHdt8BfQoFK42ZRQ25
         0AzQ==
X-Forwarded-Encrypted: i=1; AL+hErG9jAO7swTGPvb5g+rwtPCw8gEDd6b/MWw0jOf7hxIO0uTYS7cheZ1bpo9rKmAICEHNr2LcPkx+fmBpS+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GxFdqxEMDjvDofvVmD/OIkkuHCoheoQ46WJ2+CUfOUnqS+c3D
	qK9Oi09s0Md4Z3tJ2cSLd6ofpwvTUun1X6DVY4WJWrg5KN3iHptArX4v
X-Gm-Gg: AZFdTZf4Dj0NM7RjPCY8k+5UoPwmweT5Bxu8zgVbYTdMQepvZl9ZNNsf7IcljTKAvVK
	3/87QEM7ruQALbGq0UbA1bowcue2qyu4XjuOw2+8fRV0vtJ10KcF/XE3pQCD5xZ+7w4vQke2YfP
	Cvv8iUe75iwP+TnlOmX/BP+o9HqVkjZR1JKlRplhYL9cFxjiq9kG5Gpwv4uVBfUbbWEGZiPwrxh
	hKW7DgbkPch+Y+E8F+Wgx+BWz/cX6gEEPehdpP1xvohg7+0FXDtqBHji6zGk8Cju/LeQBx2Z8Vv
	ze9G6AIUkfbqD6lU7S1XOPgcLg2t1JJEqkGVtx8IUhgFFmFwLc6uGo0AlJpXvWTPwC/y8/D6/rP
	dbJVVuuc30HktBw7TTtQusizAcaZFYbtYRLe3G+hnxstEs8epRkzPmQUk+o4ACUX8PalvLwLC+E
	Bdmym2AHVhbUEjOdV31l2RTnlDWshPbtJtvviAWdIC+9VQ++n8CoCVi3e9SecNeczmQo6GBxKn9
	zIHNbgRTxXWxARXaLXboj8R5qwozIz8i5m4JlF/n30ucuklafgg5DA617OqpLwQkNfKE3DcUvL4
	dIj4UNHeJn8dx2FkHgnkalUr/ekCJFdF
X-Received: by 2002:a05:6122:4698:b0:5ea:c98d:768 with SMTP id 71dfb90a1353d-5ee8ae8eb5cmr8365635e0c.6.1795529445171;
        Tue, 24 Nov 2026 06:10:45 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555137sm14056121e0c.3.2026.11.24.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:10:44 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] Bluetooth: hci_core: preserve LE feature holds across encryption events
Date: Tue, 24 Nov 2026 11:09:56 -0300
Message-ID: <20261124140956.15296-3-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124140956.15296-1-andreiab9019@gmail.com>
References: <20261124140956.15296-1-andreiab9019@gmail.com>
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
that hold. Route LE key refresh through the same confirmation helper.

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
index 7cf63bc0f..469d4f077 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -2272,11 +2272,18 @@ static inline void hci_encrypt_cfm(struct hci_conn *conn, __u8 status)
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
index 477b876fd..b224d4d69 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5435,11 +5435,7 @@ static void hci_key_refresh_complete_evt(struct hci_dev *hdev, void *data,
 	}
 
 	if (conn->state == BT_CONFIG) {
-		if (!ev->status)
-			conn->state = BT_CONNECTED;
-
-		hci_connect_cfm(conn, ev->status);
-		hci_conn_drop(conn);
+		hci_encrypt_cfm(conn, ev->status);
 	} else {
 		hci_auth_cfm(conn, ev->status);
 
@@ -6961,7 +6957,7 @@ static void hci_le_remote_feat_complete_evt(struct hci_dev *hdev, void *data,
 			}
 		}
 
-		if (conn->state == BT_CONFIG) {
+		if (conn->state == BT_CONFIG && !conn->abort_reason) {
 			__u8 status;
 
 			/* If the local controller supports peripheral-initiated
@@ -7639,7 +7635,7 @@ static void hci_le_read_all_remote_features_evt(struct hci_dev *hdev,
 		}
 	}
 
-	if (conn->state == BT_CONFIG) {
+	if (conn->state == BT_CONFIG && !conn->abort_reason) {
 		__u8 status;
 
 		/* If the local controller supports peripheral-initiated
-- 
2.56.1

