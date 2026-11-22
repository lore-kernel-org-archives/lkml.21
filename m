Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365265;
	b=OkbctUkboqai6+j/W68OlBDUHOO/if+ZVZY6yAf0XMmS/BJsWTWpBESTE/thnU+CyX4t
	 Qv+GnCGiaQcc6zuUMhNYOIjhCUDe5m2Qe6fqFp2BbJr7O+nK7ECid0xwmOhXspQhN9sFo
	 nvoKdL2JbnGF6HyYXyFBT9dtrwnBSwb7lomZSkKRyvnk6viTrpTt+Lgy9LuCHqDq9w82Q
	 FpK/yvWXi/j81A5xGUiqmhGA2exFzNOUaBddEA558t5AvZefrvg+giMsHv00a8DXqZs+5
	 e3XPaExtJja9GX4Tzg1AL5anWTD780045vJlRTNdqhEGWwBZ9NPpssUu5YfbPLIM/8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PKYANT6ORuAjCyrXKjjCsaVWwop42JBUOal0NPl0OtU=;
	b=A4dM1/OGx66kinMse2YpT4RvvHxvB/v9cgr0kRWSCyk2t3vIFXkNVFpD+zBP/e+QK+ml
	 yluONemVzM8SixcEv8aR1jt+ZtVMOZJjvdOngwfkEgPq2ShyP3yuRfZEMiy34HWHpp39i
	 z5NKqmRN5NeSYq0jl31juj4tnj4HzbGrG93JEPA+fZMI0WUhC1pRPvm3tE+WBoVzpz8Yk
	 8nOQ/O67q3FZsa5VQU6wGw6DveYTt0sHb4AT7jITaovQy2SE1looXf0IIl8ptQRk8wLyG
	 H54NFHr8bcFFEgcyHid1Zk2PKgxqbNOV++GNSb0gxQFPhDV9aE/Gr2K/JFsZ6JWPD5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLcVMaIM;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD68606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD68606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLcVMaIM
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1208580b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795365264; x=1795970064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKYANT6ORuAjCyrXKjjCsaVWwop42JBUOal0NPl0OtU=;
        b=XLcVMaIMsgTzBo78gyw0vfMzb+lmw2wx5kzg/3pL8r/aCHDsMdCSJ0pzbsQlZzb+Xf
         dhQDx4Q0rZ1G4ePNYuvKvoL9rGDscWLfNw7tITzVlen8a5dF8/x6Gx/hqznHcgNKrbBT
         Vo2QnkwPVBzWAOglMSGIOFAnVzgwod3D/Aw9MztVZm7IxUIWAP4xNC87er8o/S3CWiTt
         TsbcICCI4EYD1TQLhEkFusBItHqF683FwRzAltBXnWyky8PpnykVj4xrGm3GfzEzadT/
         XfnRxvRxv9mtmVmfqrgZsz/R6RpHvUMOPdw2ICZY6CZhK630lebjGsVV1++Q2JB54t2l
         UFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365264; x=1795970064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKYANT6ORuAjCyrXKjjCsaVWwop42JBUOal0NPl0OtU=;
        b=PHkyQLSJ+kVswAJU0uD8f8SQFiy5tq28lkhd23DsbIkZamvlTUqb8MG8Cu9fnP7xdR
         vhgF2PcoJwIx8il5qn7noTgk2m9siIFIqm8DjdjKp1swtfvEKYcK3XcN5E2/lho1GM3j
         tBVZtRzLIyzVoE32gKpMtrnNxaI/fkOaPL3tsdHIqDQmSGv82ZAtw9Jsv+s/RbARTBF2
         SRoz+nkF21DvCAxDbKQljMZpSzNy4DMbJOGEtzUwuL+h0rmmuTZIX8ZLXPDl9WFu3jj6
         ogTWZnhYonFhvzNEjeUPIM85aQfno5IOuVUQwGU/O+7J/+w944QTfSaoMegRm5djlu7u
         MJuA==
X-Forwarded-Encrypted: i=1; AL+hErEhetcWuHauwsZDaFihEygQL0pLdXl+eDfLepnXsrnvI3TN6Qf5PaapUlJf5x47gH8QxQIAUkzMrAr/Hj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sSP4v/PRTiZTcdbk1RHmQDsC5MkGANE52MS8+lkjEsj2wcg/4
	t/SU2aXTmsoHBoiaMzDMhhsM4ZDbg7U+J6G4gxdfybD11tLqIsSl7+oxMr+mQgdX
X-Gm-Gg: AZFdTZcugiBwKSyisFU9IgywRJI/pukKTNF8CBgvAdttydKH9/h2ScGzYARrBOwBOJJ
	zgHbGRINdI3j4d3wqOzVJrKG9dlHPDx7fYTopQR01KswajFfMv/rVHf+B8OB8oQbBtDFh3ydW4Z
	lM3/q9CGSj+WY089hMis4rvpcjDXDxmupEl624vMkPu+9KAS+6U56LNf7gyU36MZ4KeJGrzNziS
	lA+KdFxDiKv9vpvnfBZjBsZgYygE+8IFHuNIan8W1SCYtAMGqmAv9ZBjOvBFUJE3jWfh6/MKHly
	+kwgZtQ6W/lIIGYmEZD8Xp8hZHFlLhxRXBR8WkIYT+K1dbUk107/MXQTdVLRFwSYr265rhNLFXM
	I/ru4ZNuO3taW7Md7CFH4lQlncgPcHeT/pxkZ7ojYB33bCvPEu3aVWQAslZNfqObVyV0BDOsn88
	ChiJEAEsmqG/dSX9R2nqc+8Uo0a3D81KfBs7Hn0L6by8h4qe3OrxHMgR5gFbjp0Ur6hwKqzlN4K
	PziULtdGSl5Wxjv9Q70oolgm1QKEvEP3Sn2sJ1Zs8a8OKI69p0L1OLRk1o6o1f+aZtr5Jh3NilB
	O2EKxzCioBPCZKdC6850MGbZ5aEEo6kqsWB6VdEB7i0osDd+gunsfJB4TaWVx5yK5+uS2b8i8n8
	PFwL/V8D6x5nC0oCjRrMUMbONdrI=
X-Received: by 2002:a05:6a00:4189:b0:899:55e9:880b with SMTP id d2e1a72fcca58-8c87bacb423mr7471731b3a.14.1795365264278;
        Sun, 22 Nov 2026 08:34:24 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm4218560b3a.18.2026.11.22.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:34:23 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hauke@hauke-m.de,
	Ho Jie Feng <hjf3108@gmail.com>,
	stable@vger.kernel.org,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next] wifi: rt2x00: upload beacon before starting the beacon queue
Date: Mon, 23 Nov 2026 00:34:16 +0800
Message-ID: <20261122163416.14269-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On PCI and SoC devices, rt2x00mac_bss_info_changed() starts the beacon
queue without uploading a beacon, and leaves that to the PRE_TBTT
interrupt. But the TSF is 0 when the queue starts, so the first TBTT is
due at once. With no beacon enabled, BCN_OFFSET0 is 0, and rt2800 sends
a beacon from shared memory 0x4000, the start of the pairwise key table.

On the RT3883 this wedges the baseband until the BBP is reset: the radio
neither receives nor transmits, so the AP never comes up.

Upload the beacon of the first beaconing interface before starting the
queue, as is done on USB devices. The (PRE)TBTT tasklets are not running
yet, so this cannot race with them.

Tested on an ASUS RT-N56U (RT3883).

Fixes: 1dae8d342e84 ("rt2x00: Limit beacon updates in bss_info_changed to USB devices")
Fixes: ba08910e04e0 ("rt2x00: change beaconing setup on RT2800")
Cc: stable@vger.kernel.org
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
OpenWrt PR: https://github.com/openwrt/openwrt/pull/26850

 drivers/net/wireless/ralink/rt2x00/rt2x00mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
index 3bc0c1c906..48c875e198 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
@@ -630,10 +630,12 @@ void rt2x00mac_bss_info_changed(struct ieee80211_hw *hw,
 			rt2x00dev->intf_beaconing++;
 			intf->enable_beacon = true;
 			/*
-			 * Upload beacon to the H/W. This is only required on
-			 * USB devices. PCI devices fetch beacons periodically.
+			 * Upload beacon to the H/W. This is required on USB
+			 * devices. PCI devices fetch beacons periodically, but
+			 * the first TBTT can come before the first fetch.
 			 */
-			if (rt2x00_is_usb(rt2x00dev))
+			if (rt2x00_is_usb(rt2x00dev) ||
+			    rt2x00dev->intf_beaconing == 1)
 				rt2x00queue_update_beacon(rt2x00dev, vif);
 
 			if (rt2x00dev->intf_beaconing == 1) {

base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

