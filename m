Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005339;
	b=FB7DtTl6s1Hq8TLwpcqX6r5KtLzeVipbd4+fJOktDMw1DLgU3l7carvIon087uW2Q5TS
	 duTSKHHWphbq0jXUUYilN9uDDeArS8OgK5PgPrwlmNgTmI5z5eADFkPPkga97gm15mq+Z
	 n3imHikeoLcFNBY2nVekUk89JU+0+btM3mt703D5m7uHOI32YYin6k1yfNkM7EvLAcHMb
	 Mz3iofs3QPNn22heiFFlGEK+6bWAUyjSR4Rw2JZJ2vnuPRHb/RPisffjgJxAD9MOEhbW+
	 MiwF8nBe6neminIxsO/brrlIK2j1Gl5hikD4wz80vB6Lspo7LxYfSAYMxcwl7CcTduA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LJABUKTN7kpkN8XdhP9ka8xCIsWxRGSyyuS9ICn+GoM=;
	b=PRjE5vYFHS1/vl8kj1yPmqw22Um0eUKoggmxKd5y0BLUHxCETZV9OuxzVrCGhG1UQ/oT
	 RqYigaOxGWH0Q+Jc9/s/sh5vHaSQ0J/woiL3eyw/WvwpF9X6qCyaHf214FGanQ36dT4mR
	 /8YTIycK62O4mYTBkJMJwvp/WVgWsGXTGFB5ehzogGLKcUGeXq+6roFbsM/JlqQMFcvIK
	 76jUM2ChQ5VaQY3Et7OtdqAoKEsT1Lhx4use3tmz0Q5ToVqGQj8GIdqcsroed1mQz3aKb
	 wVKjgSMMDVcsTrAztyd3Muo7DxKOfNq6MobiRfC85TRITDRXbUsbHmqtt83CDvHVYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnfms0QW;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9419B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9419B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnfms0QW
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eac4936dfdso1186595ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005338; x=1795610138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJABUKTN7kpkN8XdhP9ka8xCIsWxRGSyyuS9ICn+GoM=;
        b=Nnfms0QWxkSnJSNcwXez2Rq4hDfI4LE4q0O4T3nrnT9N2vxM5XjmE51txUY4vvVpk1
         dIW1i/VLRko8c4e2FzvgD1hIbluIr9hCf+NGB50cn+k8qPAYo0ugXCrnOktT35smLh1L
         MCwsKAjjWbbt6kP1ZlMsfl507Rl4nfgwS+wcDtUUH7zktgpngCCU5XW+A+/JVoyS8HB/
         KBUfXFXdGO6lgsXD+yB+jz3UW0HkHfXyXUXkEl4vvhG66UvVMp8LWzVNF8wGqR3TrZE0
         SbDivfHfIsB5zB5v360TeSJ+GNlRRho8Y3ufNVybu9k81AQyR+I/We60nEx36/iJfN1D
         Qe4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005338; x=1795610138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJABUKTN7kpkN8XdhP9ka8xCIsWxRGSyyuS9ICn+GoM=;
        b=D7ONGPEp3cCL+aDrAVBLMkMP3RmtA30BOCvxfbyiB9c0GZflkUnW4Ryg8FbCD9AYGE
         ntYdhfg2Plhhozfu/Ho8PbJ5q+tONVIQRCMFTh9baEtkT1DuvrOEk0n01DrmktBqeZje
         IxKtG52+Eqvz5ruJsxTsoBqYJFfgCY6/frSxUn8cE9yg440uzPISMmfUUoxYsroaLS0v
         NoXp68p84/GldwSbXtYrkDTtIUJaELc8lXPjLZYVXF/J766bMrIjAJ4beYPgV5QCeWAJ
         fVN34nlxRv0nTYxaBVOL4s9dS0UYg0wg0VBIpjVHPsis3koua8ksy8q19xfXY575dI0j
         UxOw==
X-Forwarded-Encrypted: i=1; AL+hErHCTJRQsxdV3dVDCReoBhFYTq9U3p0/91U/zEOZ3uHll2P1/1cMuqBrXkRjOp/6VSurVU7wadEwcK/Dk28=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yoIAH0J/vi8upKs0QxCjrybJ6k3qz0y11U8jzsVEAEPhR+XQ2
	clR7nCMG5ZnrkyIGvO7bg6/b9J9/dABEtbgx855nWv2Euf++w5x15+yY
X-Gm-Gg: AZFdTZfuZ4uLOqv1sEB4U98fn+b5SbJQU7pE0U/bNCD97dUnVPVpYlwHSww8U/pKw9l
	wSBokYJmJmHwcNrPetdCaaXjPfR+ol5/ibwMVg3XPzv+HORV+Xm4tmuWCihYIh2ZWQ3PMn+c4Yc
	+KnlnLydekfkMayozoI39XHeVXN5xVy+wriljYZ4KUFAHAohkNLeqaOy8nk1Ys//wnLmWeh8oif
	a7aoQnh2986lm+11x8qlTNEa/mBymFnnYoY9X4eLqoNgp4WIwAX2fyBWskhgiVs17sxqG4jez3+
	yTs1NhNnfQlUICZoYPKqrMBSgXckf41QsPIYlOUYcbmN0BbwFsfDbYCNdTJ34aZlln+km0614i7
	p3HAdGT8Hs+OqoAsK9FxWdVmq0xV/OT7fX7ojgbbYlZCjjqYtYdqqDkWdGOu+Klqg0P1wmdo+V2
	Dkc9y4cIlK79zl6Hkjq+kVkuq147nhDOlIocomFHPzuHtxsfU6uluMAaYyCktg+6B0rhlDOC2q/
	ev+VSjU9OO2sJR6e0FvB81kGi58K2FHxCiz4RvwdhNeV+KjWgNzVag2GIsjorc7nIza+KBTPiMb
	qi91By8eWuGicJZ8ncYNyaNDO+Z47hQqL+3/3QWArE3Ib5nPtg==
X-Received: by 2002:a17:90b:1d47:b0:3b0:975b:2256 with SMTP id 98e67ed59e1d1-3b3d07a8e0fmr4090356a91.4.1795005337818;
        Wed, 18 Nov 2026 04:35:37 -0800 (PST)
Received: from security.datascience.hku.hk ([175.159.181.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm1700937a91.0.2026.11.18.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:35:37 -0800 (PST)
From: Yu Junzhe <junzheyu1@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Yu Junzhe <junzheyu1@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6] Bluetooth: hci_core: lookup hci_conn on RX path
Date: Wed, 18 Nov 2026 12:35:33 +0000
Message-ID: <20261118123533.25-1-junzheyu1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Bluetooth: hci_core: lookup hci_conn on RX path

Backport of 79a2d4678ba9 ("Bluetooth: hci_core: lookup hci_conn on RX
path") for linux-6.6.y. Adapted to this tree: 6.6 still pulls ACL, SCO,
and ISO headers with skb_pull(), and sco_conn / iso_conn have no kref,
so the SCO and ISO paths take hci_conn_get() under hci_dev_lock and
hci_conn_put() on every exit. The L2CAP change matches upstream: look
the handle up under hci_dev_lock, call hci_conn_enter_active_mode()
there, and take l2cap_conn_hold_unless_zero() before dropping the lock.

hci_acldata_packet() looks the connection up, drops hci_dev_lock, and
calls l2cap_recv_acldata() on the raw pointer. The first access there
is hci_dev_lock(hcon->hdev). The hash lookup takes no reference, and
bt_link_release() frees the object with kfree() from hci_cmd_sync_work.
SCO and ISO have the same shape.

CVE-2025-68304. Only 6.6.162 was checked.

Tested on Linux 6.6.162 KASAN with /dev/vhci. A userspace racer does an
outgoing high-security L2CAP connect, floods ACL data while the
connection is still hashed, then completes HCI_Disconnect with status
0x1f so hci_conn_del() runs on hci_cmd_sync_work. The unpatched
campaign kernel (6.6.162 #3) printed:

  BUG: KASAN: slab-use-after-free in l2cap_recv_acldata+0xcc8/0xe60

Read of size 8 by kworker/u17:0 on hci_rx_work. Allocated in
__hci_conn_add from hci_connect_acl / l2cap_sock_connect, freed in
bt_link_release from hci_cmd_sync_work, last related work
hci_cs_auth_requested. The same program on the patched kernel
(6.6.162 #1) finished 99 connect/auth/disconnect rounds and 1589888
ACL frames with no KASAN report.

Cc: stable@vger.kernel.org # 6.6.162
Signed-off-by: Yu Junzhe <junzheyu1@gmail.com>
---
 include/net/bluetooth/hci_core.h | 19 +++++++----
 net/bluetooth/hci_core.c         | 69 ++++++++++++++--------------------------
 net/bluetooth/iso.c              | 29 ++++++++++++++---
 net/bluetooth/l2cap_core.c       | 23 +++++++++++---
 net/bluetooth/sco.c              | 36 +++++++++++++++------
 5 files changed, 105 insertions(+), 71 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 62804d98d..7a2729f86 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -837,11 +837,12 @@ extern struct mutex hci_cb_list_lock;
 /* ----- HCI interface to upper protocols ----- */
 int l2cap_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr);
 int l2cap_disconn_ind(struct hci_conn *hcon);
-void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags);
+int l2cap_recv_acldata(struct hci_dev *hdev, u16 handle, struct sk_buff *skb,
+		       u16 flags);
 
 #if IS_ENABLED(CONFIG_BT_BREDR)
 int sco_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags);
-void sco_recv_scodata(struct hci_conn *hcon, struct sk_buff *skb);
+int sco_recv_scodata(struct hci_dev *hdev, u16 handle, struct sk_buff *skb);
 #else
 static inline int sco_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr,
 				  __u8 *flags)
@@ -849,23 +850,29 @@ static inline int sco_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr,
 	return 0;
 }
 
-static inline void sco_recv_scodata(struct hci_conn *hcon, struct sk_buff *skb)
+static inline int sco_recv_scodata(struct hci_dev *hdev, u16 handle,
+				   struct sk_buff *skb)
 {
+	kfree_skb(skb);
+	return -ENOENT;
 }
 #endif
 
 #if IS_ENABLED(CONFIG_BT_LE)
 int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags);
-void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags);
+int iso_recv(struct hci_dev *hdev, u16 handle, struct sk_buff *skb, u16 flags);
 #else
 static inline int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr,
 				  __u8 *flags)
 {
 	return 0;
 }
-static inline void iso_recv(struct hci_conn *hcon, struct sk_buff *skb,
-			    u16 flags)
+
+static inline int iso_recv(struct hci_dev *hdev, u16 handle,
+			   struct sk_buff *skb, u16 flags)
 {
+	kfree_skb(skb);
+	return -ENOENT;
 }
 #endif
 
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 84d9a445e..defa61803 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3798,13 +3798,14 @@ static void hci_tx_work(struct work_struct *work)
 static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct hci_acl_hdr *hdr;
-	struct hci_conn *conn;
 	__u16 handle, flags;
+	int err;
 
 	hdr = skb_pull_data(skb, sizeof(*hdr));
 	if (!hdr) {
 		bt_dev_err(hdev, "ACL packet too small");
-		goto drop;
+		kfree_skb(skb);
+		return;
 	}
 
 	handle = __le16_to_cpu(hdr->handle);
@@ -3816,31 +3817,21 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hdev->stat.acl_rx++;
 
-	hci_dev_lock(hdev);
-	conn = hci_conn_hash_lookup_handle(hdev, handle);
-	hci_dev_unlock(hdev);
-
-	if (conn) {
-		hci_conn_enter_active_mode(conn, BT_POWER_FORCE_ACTIVE_OFF);
-
-		/* Send to upper protocol */
-		l2cap_recv_acldata(conn, skb, flags);
-		return;
-	} else {
+	err = l2cap_recv_acldata(hdev, handle, skb, flags);
+	if (err == -ENOENT)
 		bt_dev_err(hdev, "ACL packet for unknown connection handle %d",
 			   handle);
-	}
-
-drop:
-	kfree_skb(skb);
+	else if (err)
+		bt_dev_dbg(hdev, "ACL packet recv for handle %d failed: %d",
+			   handle, err);
 }
 
 /* SCO data packet */
 static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct hci_sco_hdr *hdr = (void *) skb->data;
-	struct hci_conn *conn;
 	__u16 handle, flags;
+	int err;
 
 	skb_pull(skb, HCI_SCO_HDR_SIZE);
 
@@ -3853,33 +3844,28 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hdev->stat.sco_rx++;
 
-	hci_dev_lock(hdev);
-	conn = hci_conn_hash_lookup_handle(hdev, handle);
-	hci_dev_unlock(hdev);
+	hci_skb_pkt_status(skb) = flags & 0x03;
 
-	if (conn) {
-		/* Send to upper protocol */
-		hci_skb_pkt_status(skb) = flags & 0x03;
-		sco_recv_scodata(conn, skb);
-		return;
-	} else {
+	err = sco_recv_scodata(hdev, handle, skb);
+	if (err == -ENOENT)
 		bt_dev_err_ratelimited(hdev, "SCO packet for unknown connection handle %d",
 				       handle);
-	}
-
-	kfree_skb(skb);
+	else if (err)
+		bt_dev_dbg(hdev, "SCO packet recv for handle %d failed: %d",
+			   handle, err);
 }
 
 static void hci_isodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct hci_iso_hdr *hdr;
-	struct hci_conn *conn;
 	__u16 handle, flags;
+	int err;
 
 	hdr = skb_pull_data(skb, sizeof(*hdr));
 	if (!hdr) {
 		bt_dev_err(hdev, "ISO packet too small");
-		goto drop;
+		kfree_skb(skb);
+		return;
 	}
 
 	handle = __le16_to_cpu(hdr->handle);
@@ -3889,22 +3875,13 @@ static void hci_isodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 	bt_dev_dbg(hdev, "len %d handle 0x%4.4x flags 0x%4.4x", skb->len,
 		   handle, flags);
 
-	hci_dev_lock(hdev);
-	conn = hci_conn_hash_lookup_handle(hdev, handle);
-	hci_dev_unlock(hdev);
-
-	if (!conn) {
+	err = iso_recv(hdev, handle, skb, flags);
+	if (err == -ENOENT)
 		bt_dev_err(hdev, "ISO packet for unknown connection handle %d",
 			   handle);
-		goto drop;
-	}
-
-	/* Send to upper protocol */
-	iso_recv(conn, skb, flags);
-	return;
-
-drop:
-	kfree_skb(skb);
+	else if (err)
+		bt_dev_dbg(hdev, "ISO packet recv for handle %d failed: %d",
+			   handle, err);
 }
 
 static bool hci_req_is_complete(struct hci_dev *hdev)
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index 217ba98b0..cbb315922 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -2059,13 +2059,29 @@ static void iso_disconn_cfm(struct hci_conn *hcon, __u8 reason)
 	iso_conn_del(hcon, bt_to_errno(reason));
 }
 
-void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
+int iso_recv(struct hci_dev *hdev, u16 handle, struct sk_buff *skb, u16 flags)
 {
-	struct iso_conn *conn = hcon->iso_data;
+	struct hci_conn *hcon;
+	struct iso_conn *conn;
 	__u16 pb, ts, len;
 
-	if (!conn)
-		goto drop;
+	/* 6.6 has no iso_conn kref. Hold the hci_conn across the recv. */
+	hci_dev_lock(hdev);
+	hcon = hci_conn_hash_lookup_handle(hdev, handle);
+	if (!hcon) {
+		hci_dev_unlock(hdev);
+		kfree_skb(skb);
+		return -ENOENT;
+	}
+	hci_conn_get(hcon);
+	conn = hcon->iso_data;
+	hci_dev_unlock(hdev);
+
+	if (!conn) {
+		hci_conn_put(hcon);
+		kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	pb     = hci_iso_flags_pb(flags);
 	ts     = hci_iso_flags_ts(flags);
@@ -2115,7 +2131,8 @@ void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 			/* Complete frame received */
 			hci_skb_pkt_status(skb) = flags & 0x03;
 			iso_recv_frame(conn, skb);
-			return;
+			hci_conn_put(hcon);
+			return 0;
 		}
 
 		if (pb == ISO_SINGLE) {
@@ -2191,6 +2208,8 @@ void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 
 drop:
 	kfree_skb(skb);
+	hci_conn_put(hcon);
+	return 0;
 }
 
 static struct hci_cb iso_cb = {
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 94fddc456..5b5a9e763 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7752,13 +7752,24 @@ struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *c)
 }
 EXPORT_SYMBOL(l2cap_conn_hold_unless_zero);
 
-void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
+int l2cap_recv_acldata(struct hci_dev *hdev, u16 handle,
+		       struct sk_buff *skb, u16 flags)
 {
+	struct hci_conn *hcon;
 	struct l2cap_conn *conn;
 	int len;
 
-	/* Lock hdev to access l2cap_data to avoid race with l2cap_conn_del */
-	hci_dev_lock(hcon->hdev);
+	/* Lock hdev for hci_conn, and race on l2cap_data vs. l2cap_conn_del */
+	hci_dev_lock(hdev);
+
+	hcon = hci_conn_hash_lookup_handle(hdev, handle);
+	if (!hcon) {
+		hci_dev_unlock(hdev);
+		kfree_skb(skb);
+		return -ENOENT;
+	}
+
+	hci_conn_enter_active_mode(hcon, BT_POWER_FORCE_ACTIVE_OFF);
 
 	conn = hcon->l2cap_data;
 
@@ -7766,12 +7777,13 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 		conn = l2cap_conn_add(hcon);
 
 	conn = l2cap_conn_hold_unless_zero(conn);
+	hcon = NULL;
 
-	hci_dev_unlock(hcon->hdev);
+	hci_dev_unlock(hdev);
 
 	if (!conn) {
 		kfree_skb(skb);
-		return;
+		return -EINVAL;
 	}
 
 	BT_DBG("conn %p len %u flags 0x%x", conn, skb->len, flags);
@@ -7885,6 +7897,7 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 unlock:
 	mutex_unlock(&conn->lock);
 	l2cap_conn_put(conn);
+	return 0;
 }
 
 static struct hci_cb l2cap_cb = {
diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 75609dbd5..98fd0c89b 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -1432,22 +1432,40 @@ static void sco_disconn_cfm(struct hci_conn *hcon, __u8 reason)
 	sco_conn_del(hcon, bt_to_errno(reason));
 }
 
-void sco_recv_scodata(struct hci_conn *hcon, struct sk_buff *skb)
+int sco_recv_scodata(struct hci_dev *hdev, u16 handle, struct sk_buff *skb)
 {
-	struct sco_conn *conn = hcon->sco_data;
+	struct hci_conn *hcon;
+	struct sco_conn *conn;
 
-	if (!conn)
-		goto drop;
+	/* 6.6 has no sco_conn kref. Hold the hci_conn so the lookup cannot
+	 * be freed before sco_data is read. The lookup stays under hci_dev_lock.
+	 */
+	hci_dev_lock(hdev);
+	hcon = hci_conn_hash_lookup_handle(hdev, handle);
+	if (!hcon) {
+		hci_dev_unlock(hdev);
+		kfree_skb(skb);
+		return -ENOENT;
+	}
+	hci_conn_get(hcon);
+	conn = hcon->sco_data;
+	hci_dev_unlock(hdev);
+
+	if (!conn) {
+		hci_conn_put(hcon);
+		kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	BT_DBG("conn %p len %u", conn, skb->len);
 
-	if (skb->len) {
+	if (skb->len)
 		sco_recv_frame(conn, skb);
-		return;
-	}
+	else
+		kfree_skb(skb);
 
-drop:
-	kfree_skb(skb);
+	hci_conn_put(hcon);
+	return 0;
 }
 
 static struct hci_cb sco_cb = {
-- 
2.53.0
