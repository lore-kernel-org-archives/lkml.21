Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975716;
	b=tcl0OZ4+uSgEDzJDQpXRCO+A2bHDPLmvR3wCmZAyNE0C6mIfQJPdMCrkgcSZd2Lej+TN
	 sbX5U6bDKa5o5e8OzsEhOSgudBxuWIo7Z4WtpR3TR/r2ym6CZyoqvKCJXOcB1UAfAVg8o
	 fS63M/Ud+JsVRRNkOZ7YnKWJrjOvtaSkOAy2e9Dh/MoiOi41bQrG79XL1GyW6AI8gm/M+
	 B9EQvGgdh0faU7+DGTlKnYcBf6rL4P/82dvAnfhsNLNJG0nFn30a4aR+FOAfPVLbC1cRE
	 RHgriQ1DR5o+UzS+2FbPVkoUlTz+FhpNArzHqPgdDJR7dNv47qrv1yEMN09HvGfbOQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5FjZ6WhHQk3C5UxN5EckOwOWr0Pet54k2c653v4aiuo=;
	b=HwMm5RK0vLF8PS9cQIjnh3zdQj67bhg5CSeDdavrMd8y7fiZVrh6cOQ0IPAEsORNpKC9
	 XYoKEZgD5q3sQZvxmKUGpS/fo71Suygse9boGIMeG9XeVZyK/qZBmi6bsffnllOR0RcEH
	 R+tXyBKuOhM5zIbq/fhTa9eYVkoMvM52aZ5+HhhY9LTcguJ3995UI24Hnxg81gTeFU82W
	 /tg+626TKc+ozGBEHx6js45cL49tSt3LUdS02+aX8mSD4z4ueYSRcNggIY8LpzAcMaEa8
	 3R/B/X59NFCNEJNCwU4AR9QgNwthDfMfG/NGde/vyQOyDFdPGo1DES61zCGDEasqPJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDpjUlh3;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF89606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDpjUlh3
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a07078200fso263670b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975715; x=1795580515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FjZ6WhHQk3C5UxN5EckOwOWr0Pet54k2c653v4aiuo=;
        b=GDpjUlh3WxtUt7TB0bO1Ya/dzT+z9CelVYZvoJQt9gsRJpCgesn+84i8VsvP1zjoEd
         JkyL6lWDEdZgywkga/whCbfanuIb+1VBLANvFCtbnH02qEfBb/yr7X2iCUmD2ojdHPHU
         qqq2RqACS0imNCqrnWkhglN8xvXuq8SPrRjRsstLqVahTqtmX5pSHnI7dLVOAXEQpCLa
         0JAcrZ4MlDzdJo7XTCLguhVjueU1Jbx9RIzxLs3YgCblDQS4QfLbzFO/JsCAvGG7aBrh
         l8PweLcTCvHIMWifUHBl7k/Po7TuybhHvWe7rcHd97GXc6e99IDAG9Lkdpx4ykqnMqNA
         E6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975715; x=1795580515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FjZ6WhHQk3C5UxN5EckOwOWr0Pet54k2c653v4aiuo=;
        b=fvkgfiG7W0iHeJuWVK26lOzcqXtl8r9Z8gzH6qrT02Sy5iyhtnOlwhffkyZuCNCXoY
         6QrAlDvh//Dcl2AkbUZhXw6gU2EzWn/aftjoxcaDaRBiwbJ0EvnPwldwYQB68ecNN7Zn
         u7qIJrLYintm5B8LTF8qu/fhZzl/91jARK5ReVSs6dORFy3+XkNyiBOzCRkQncyt7E5q
         1GWhKngqS/Hsu+iDehIQ0JfKQ/OgZYrX4LltgnUcfNpZlbHUUJHDVTV99Hb2C8+y0k7p
         4I1pdXOw05yHRWcwetQAPdpEd+Qf+Ejh+0AJxV3XKbDb5b8eyo+P0e2Co4SDIwF6UrIT
         ew1w==
X-Forwarded-Encrypted: i=1; AL+hErE6OZDSr5naA4GAgOnSvFDdA33yT1DF2fRSWSuAqtasqIZuVGPa1cOl9lssQ8vXPlSy57RvT1YF9lsbJps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hpWPUXL+zuBRImG2NWY2wdw0eWZpyxUAcLiL1zgRyZ6OCR8rL
	hNx4ZiC5WC4tz//qPK/okb5/zm8ZX5ZjSJdXHxcf1Gg6s6/8YxFqFrmD
X-Gm-Gg: AYBFou0cSqmUj6GKJ3dVdmMzvUGK+zT+Hcyew/gy5fgzTr1r/VnmY6SRZ2cXUbk7ynF
	ZeP1KnSFk2WFesXMebH8cP999t4mWVZmrRFESCrAWLh/iT+8f98rf3J/bDPuWw/LL+7U0z4dCRf
	Bzw6/V4/KEw0DeCsXug9dukmB88oYbK80IkMJyUP/9udLGBXqWownF58+zE2P4gEYRU1UzMieRP
	Lxkdh+Rw4SjzCiD3MYC2cd5lVW9FsFBuKPOZ0tCEcoRjNmSuGIp96xbv1I+z14OMdjPppC1YF0b
	xZryeucTatLrrCxZIEaLzSpjiEBOygWpeoiIK9b9XdqscFh9tLHOTC2tBNjs3dQ1EFKY3MZPow6
	Z4r8eO0lI009to/G02MIaqEEC01DoUxm4sYNLS/4CCNDLD+qRvPTwIi4MbvU/Kv8MBKezngev9g
	JuvHEoStLg/R0EUr9XKremOiAUh6FtpI0Acq8c+axOooCMtHYa0c5LyaOd5t6hbmiuptpSlLwQ/
	JhY3n9X1B8rcGneJwABBTlUrdGfeGSV68KW2Be7O4mok0n3YgQTbfbg1Hisqj9yRTspmiZ+p7AC
	iCWc2tBV8L3C7LjOmoETGCH4
X-Received: by 2002:aa7:930b:0:b0:883:904e:da56 with SMTP id d2e1a72fcca58-8c5d4101715mr1030823b3a.36.1794975715272;
        Tue, 17 Nov 2026 20:21:55 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aaa8dsm455003b3a.10.2026.11.17.20.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:21:54 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 1/4] Bluetooth: SMP: Publish root channels after initialization
Date: Wed, 18 Nov 2026 12:21:35 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com>
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

smp_add_cid() marks a channel as fixed before setting its operations,
address and parent nesting level. Once it also sets BT_LISTEN, a global
fixed-channel lookup can select it before the remaining stores finish:

  Controller A                     Controller B with the same address
  smp_add_cid()
    l2cap_add_scid()
    chan->state = BT_LISTEN
                                   l2cap_global_fixed_chan()
                                     select A's root
                                   l2cap_new_connection()
                                     call chan->ops->new_connection
    chan->ops = &smp_root_chan_ops

A per-controller mutex cannot exclude the second controller. Finish
initializing the listener before setting BT_LISTEN, and serialize that
state change with global lookups through chan_list_lock. Keep the fixed
channel type assigned before publishing BT_LISTEN so connection-oriented
PSM lookups cannot select an untyped channel in between.

Fixes: 70db83c4bcdc ("Bluetooth: Add SMP L2CAP channel skeleton")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Assisted-by: LLM

 include/net/bluetooth/l2cap.h | 1 +
 net/bluetooth/l2cap_core.c    | 8 ++++++++
 net/bluetooth/smp.c           | 3 ++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index cf5c2df68af8c..e3d826772db66 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -982,6 +982,7 @@ int l2cap_add_psm(struct l2cap_chan *chan, bdaddr_t *src, __le16 psm);
 int l2cap_add_scid(struct l2cap_chan *chan,  __u16 scid);
 
 struct l2cap_chan *l2cap_chan_create(void);
+void l2cap_chan_listen(struct l2cap_chan *chan);
 void l2cap_chan_close_unlocked(struct l2cap_chan *chan, int reason)
 	__must_not_hold(&chan->lock);
 int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 0d4f3341bd47f..319016eff9689 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -456,6 +456,14 @@ static void l2cap_chan_timeout(struct work_struct *work)
 	l2cap_chan_put(chan);
 }
 
+/* Publish a fully initialized listener to global channel lookups. */
+void l2cap_chan_listen(struct l2cap_chan *chan)
+{
+	write_lock(&chan_list_lock);
+	chan->state = BT_LISTEN;
+	write_unlock(&chan_list_lock);
+}
+
 struct l2cap_chan *l2cap_chan_create(void)
 {
 	struct l2cap_chan *chan;
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index f8f86b8f73f05..948a847c0dc23 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3400,7 +3400,6 @@ static struct l2cap_chan *smp_add_cid(struct hci_dev *hdev, u16 cid)
 		chan->src_type = BDADDR_BREDR;
 	}
 
-	chan->state = BT_LISTEN;
 	chan->mode = L2CAP_MODE_BASIC;
 	chan->imtu = L2CAP_DEFAULT_MTU;
 	chan->ops = &smp_root_chan_ops;
@@ -3408,6 +3407,8 @@ static struct l2cap_chan *smp_add_cid(struct hci_dev *hdev, u16 cid)
 	/* Set correct nesting level for a parent/listening channel */
 	atomic_set(&chan->nesting, L2CAP_NESTING_PARENT);
 
+	l2cap_chan_listen(chan);
+
 	return chan;
 }
 
