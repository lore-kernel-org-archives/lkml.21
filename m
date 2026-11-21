Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231934;
	b=dTGiWfB+wFwI2N/eUhjKcc1rue8E1AjhU/AP4tgu6dELVrEdkcjX1m4CF7FrWIIQkmQO
	 GJmQAY6+36xIeFeYo+L1ek6VLykcQi4Ul3h8dyFDV7ntTkcyLGWVWlEI4Jt93e986Sgex
	 IFQUVfR53K3651tW/5Lqoxtz3evb7zkYs7l9LD3KONqQEQWuKWt7nBOc0KQn97VbTrZp7
	 yIaKwyIvYiJ6VS1Nmvy2elyFTLIUsy6ddl+oih7+aVcp814FVf0XDL9BYoA42KkLdLL8S
	 XLhEuIEiPiEQ60oXUZPdtnX2GNxdX5ITLIOcsjP5ELHzuHRg729A3NssbHGSCKi7PFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TAKJX2eFfbSxexSFrpKVYNT5rJCAgJ+amarkA8wMwcg=;
	b=LkC3DmFqZDgEXtTx7ZkUVqvOsHzEK9qercC6m6/Zu3x/BpX3WMTfUL7abODZN686RmI2
	 wZFdm4YuIfEfkdOmHwlN9+mfV5COrE66DmJuNRw+hQXO1faMlFICvYh9R77Vwva7hAvlh
	 5i2W4KYvLzRG8tG7akhVypKpuyTznqBup6h0AL34qxoyPelfD/5w5BLApu4WXLKcn53P6
	 6FveDHu24sYp0093Sn67tuavIjQ4Sp5AfA2vgrXCO1CyiJmGTC70bW7MzpKawFtJ/ZevJ
	 M53IY9jAfInju28jJ+mrdXGMCW0v/9Zg6rWVbZ0NIa0GvBnQiKDkeiF9+EO5U8bIdPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lx0rH40W;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6152606A6AA
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6152606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lx0rH40W
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99071945aa7so891620241.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231932; x=1795836732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAKJX2eFfbSxexSFrpKVYNT5rJCAgJ+amarkA8wMwcg=;
        b=lx0rH40WjAZuTpjzdSg282pS+q3j+eAu9Cy0K+veOkU0tDtEMXN41uf313jmctXIhQ
         fdxevo5fL5v+L3Sl13PZnFrKz6VejvKgVUn8MoXflglOvT51hxXQ26wpnkVRmw40JWst
         a7FdJ1mA7L0jBqsDyvZC3/dh9PyHqXNh1Ql01CZSCEOTEcn3OZwvFsOU5jb4mNDA4k8L
         scV6vMXBTeKplGq2iX7PS8Z4xMic8sIhapOXqR73taxxVE+0dx5fJ6es4zPI9xwxNjOl
         prPZk4Et9LNMc1/Jx1WVKh4I92PFC0V1WHU/F/21xUE6xr/NbIVXlPGoV8JNJViccL+B
         xxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231932; x=1795836732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAKJX2eFfbSxexSFrpKVYNT5rJCAgJ+amarkA8wMwcg=;
        b=OaObaI8z4zuwG2nFU10fMY6afMHKd+3T6i0kgwSGpZ3js0fKMF4Kig42OE88M6yGCv
         o9s9FIyzVaKhURrrFcVkW3TwisThS26BE1cY6DFmMFpSscF/j5M0Do7LkwoIXOguU/4J
         fDfIVUeJ3kNOQ4Cun8CFqk9AyK2YlusVbj5S2UBh1Af2fjQHzlY9FaAgcMFORMMdDz73
         tYWCsUfLOm4JLRuxBILJtvJMQKc5OtQyz8TNDBPccGMVXJ2MUdGl9JlxYZUeHlbjX4fx
         W0dn2NrrUPCreszV0tWdMN+NTnh93bENJKmkPHTeelORkDmVqOFPMZgsHkX6+5jnVlsq
         3DQg==
X-Forwarded-Encrypted: i=1; AL+hErFs0zUsG5x+mBMGrWUqbDe9DQcogM82E4qmG97zRSJkJUAXAF1YWhlDUr2b/XIubgWK1GCxgAN/+0OsCZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G5/DrzHl27E03FquGnCbUJ37KTvtsS93ALkTGD13z+UhNq54s
	I/Fe9Hj2b4+JxInorAsJjqmKFB/ai9ljaJASZemvMIWzwxUPh8hsYsD8o14soEBPokA=
X-Gm-Gg: AZFdTZfBc0+D4wVWliYs+SQVXoJja5NiqqMCzCCF85hA/djAAEte/upqU6SxPUtfl2A
	WveaniUoPP6NPZgywyg6gokVcjzQn/MR/8MOcQcEr2uO2HN+mWemoy0I0vRZnggtsdfqpGCFAQ6
	5K5z/ys+4aCW+OGJVjKa+2qC2iyif4Fv5qTFlChPsFz7Kdznja0WTtZ1tg9YzJYarKWevDaRmeg
	GigfG1qdiL2ftK/JKpzHyfARpM95KM80eh1c6FPUUwBe0Id25/yloPGg/KUzGGpwFV4gxOlk6kQ
	7lITDwI8HSY7xhI9swY35IUv0+lAUDi7xC8RIre5Fqb3APULahDo/Rq4dg5YWN3EXIoiW5QDnci
	dlmMhHwFTfudkfQ4A3PJ9O8RUBVDcGeIhFm29Eu1JTuSAhQXBdJgyX6SeYMdsmVOdIPSemPaUH5
	B9y69qqQ7Yg4++5IxpdqAXHNQbV+32YFxPo6fBO0nQZBGeLH1PuagAtjs/sichiXySCW6NPjBe0
	6ofxhx3uo697nr/GRqEKpGsah4MwPt/bdDCLSvAuwVNZkSCi1zI7RgTpmKFQiLgzygUpf2vBYu8
	YV5bqmnvet2zmY9bCxUMzBKV/MT891HWCyfNOmGqo5EeQDGCT0fhFg==
X-Received: by 2002:a05:6102:508f:b0:7cc:94e0:ad23 with SMTP id ada2fe7eead31-7d73967085bmr2738629137.31.1795231932385;
        Fri, 20 Nov 2026 19:32:12 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d7bcsm4871081137.4.2026.11.20.19.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:32:12 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: hci_core: keep the LE feature hold until completion
Date: Sat, 21 Nov 2026 00:31:04 -0300
Message-ID: <20261121033104.441146-3-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121033104.441146-1-andreiab9019@gmail.com>
References: <20261121033104.441146-1-andreiab9019@gmail.com>
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

LE feature discovery owns a connection hold until
le_read_features_complete() runs. If encryption finishes while the
connection is in BT_CONFIG, hci_encrypt_cfm() also drops a hold after
notifying the upper layers.

When an ATT socket has taken its own hold, the sequence is:
  feature discovery:        0 -> 1
  ATT connection:           1 -> 2
  encryption confirmation:  2 -> 1
  feature completion:       1 -> 0

The final drop arms the incoming connection's disconnect timer despite
the open ATT socket. After applying the event-waiter fix, four hardware
attempts showed the same sequence and a local disconnect approximately
four seconds later.

Restrict the drop in hci_encrypt_cfm() to non-LE links. BR/EDR connection
setup takes its configuration hold in hci_conn_complete_evt() and still
needs this drop. LE feature discovery releases its hold in its own
completion callback, including error paths. Keep the state transition
and upper-layer confirmation when encryption finishes first.

With both fixes on Linux 7.3.5, a hardware trace leaves the ATT hold at
one after feature completion and drops it to zero only when the test
explicitly closes the connection.

Fixes: a106e50be74b ("Bluetooth: HCI: Add support for LL Extended Feature Set")
Signed-off-by: Andrei A. Bykov <andreiab9019@gmail.com>
---
 include/net/bluetooth/hci_core.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 4aa0b49..227830f 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -2335,7 +2335,9 @@ static inline void hci_encrypt_cfm(struct hci_conn *conn, __u8 status)
 			conn->state = BT_CONNECTED;
 
 		hci_connect_cfm(conn, status);
-		hci_conn_drop(conn);
+		/* LE feature discovery releases its own hold asynchronously. */
+		if (conn->type != LE_LINK)
+			hci_conn_drop(conn);
 		return;
 	}
 
