Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512060;
	b=LVvHZqJk92TQTF3HKys/HQ0oapHCo/QKUxtoI5+oYi5lEdL8iVq1qVeCuav3MMBZaiAM
	 2rviEBNsMCdN8NvHJOBT/78QZ3J+N+abNZNiL9oa+pWHgSKFOfbYOEEMfhM7cjbqvlxQL
	 2I4We4DYl5CqddrY3Na9od8zDRSRfz6g0U92k5LMAlU4U12ZwEHUGfiqCnQwXsJcEMrI0
	 /rJRDZ8fiHo+RNyUW3z1cOqhGcxIiloWZiWDEt9zkpNidUiShonhQd0hh5k1BWTWXSYZw
	 KrIKduAXNKKt6NYURDm3J1mGFRXp9r//i+QUCh0DheZGrw2+BdSitp+QmY6tkWPuQQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512060;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=A4qNjXr7gru+en691Xh7tZguWdeIUYdmSdX45dTKY3E=;
	b=5pJVENOv1CNR2QRjsIQpj/JPLITUe3IKWTYgNxVijjWZONTl2isX2i9CjsTE3F2C86fO
	 0vzsxeiuphk2N4ShvbjLBlr16J8z3kPhzfoiK6fD59ufbjWzAtguC9YG/XlfLkZZNFaDW
	 r1LzRMFbGrTqbisXtDuyp55or0PBSn1/yKKb2yxw9p+r3iMZVHWC/U4CfYQLQh0s6mXGg
	 AqLpP8FD1QJjG0JQ+fgf0V1aPpy2+qdQoPmSL8UI2bLV9yi2zQtqn82AA4KNS1donI5Ev
	 +qLurVNbV+WLLOg7wv8d9aFEtPfgw2GIoslLJGXmzKhaET5V4l4yNvBkf0N/a6mQEbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ic7WZBgb;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220E606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1220E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ic7WZBgb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795512058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A4qNjXr7gru+en691Xh7tZguWdeIUYdmSdX45dTKY3E=;
	b=Ic7WZBgbrTKYRzh85H6gzhi7dW4w4L2V++Zcp04bECRymm8CIhyJDl4fB2p8hcp7YBQ76b
	5yUBeyqUpFqkR51wZFH+aRgWXFDOfHQ2NwUbWKRBRAw2qFz9YV7KqW4krNFU1OE5zpVbIk
	NXlOwJ3l3qJ1q2oS+c1CgsJDAzdS4KU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-0fETCUzCOmuz2edAQ9kvrw-1; Tue,
 24 Nov 2026 09:20:54 +0000
X-MC-Unique: 0fETCUzCOmuz2edAQ9kvrw-1
X-Mimecast-MFC-AGG-ID: 0fETCUzCOmuz2edAQ9kvrw_1795512053
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 416AB1944B03;
	Tue, 24 Nov 2026 09:20:53 +0000 (UTC)
Received: from fballuch-thinkpadx1carbongen13.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C45B841F;
	Tue, 24 Nov 2026 09:20:51 +0000 (UTC)
From: Filip Balluch <fballuch@redhat.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jtornosm@redhat.com,
	Filip Balluch <fballuch@redhat.com>
Subject: [PATCH] mac80211: fix missing crypto tailroom in fast-xmit
Date: Tue, 24 Nov 2026 10:20:47 +0100
Message-ID: <20261124092047.452491-1-fballuch@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

A key uploaded to hardware with the IEEE80211_KEY_FLAG_RESERVE_TAILROOM
flag set tells mac80211 that the driver will handle the encryption
itself but needs MIC tailroom reserved in the skb. The regular TX path
honors this through crypto_tx_tailroom_needed_cnt in
ieee80211_skb_resize(), but the fast-xmit path always passes ENCRYPT_NO
and never reserves tailroom for such keys.

mac80211_hwsim claims CCMP/GCMP keys as hardware keys while encrypting
in software at TX time, so with full-MSS TCP segments the CCMP code
finds an skb without the required tailroom.
dmesg logs:

WARNING: CPU: 0 PID: 0 at net/mac80211/wpa.c:462 ccmp_encrypt_skb.isra.0+0x73/0x1f0 [mac80211]
RIP: 0010:ccmp_encrypt_skb.isra.0+0x73/0x1f0 [mac80211]
Call Trace:
 <IRQ>
 ieee80211_crypto_ccmp_encrypt+0x3c/0x60 [mac80211]
 ieee80211_encrypt_tx_skb+0x91/0x110 [mac80211]
 mac80211_hwsim_tx+0x1cc/0x7f0 [mac80211_hwsim]
 ieee80211_handle_wake_tx_queue+0x74/0xc0 [mac80211]
 ieee80211_queue_skb+0x204/0x430 [mac80211]
 __ieee80211_xmit_fast+0x206/0x3b0 [mac80211]

and the frame is dropped. The same combination of fast-xmit and a
RESERVE_TAILROOM key is reachable on ath11k and ath12k in raw mode,
where the firmware expects the reserved MIC space to be present.

Pass ENCRYPT_DATA instead so that tailroom is reserved whenever a
driver requested it. For drivers without any RESERVE_TAILROOM keys the
counter is zero and the resize behaves exactly as before.

Fixes: 17c18bf880b2 ("mac80211: add TX fastpath")

Signed-off-by: Filip Balluch <fballuch@redhat.com>
---
 net/mac80211/tx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 91b14112e24f..760da3114956 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3753,14 +3753,14 @@ void __ieee80211_xmit_fast(struct ieee80211_sub_if_data *sdata,
 	    ieee80211_amsdu_aggregate(sdata, sta, fast_tx, skb, da, sa))
 		return;
 
-	/* will not be crypto-handled beyond what we do here, so use false
-	 * as the may-encrypt argument for the resize to not account for
-	 * more room than we already have in 'extra_head'
+	/* the key may require tailroom to be reserved, e.g. when the
+	 * driver encrypts in software (IEEE80211_KEY_FLAG_RESERVE_TAILROOM),
+	 * so ask for encryption tailroom even though we don't encrypt here
 	 */
 	if (unlikely(ieee80211_skb_resize(sdata, skb,
 					  max_t(int, extra_head + hw_headroom -
 						     skb_headroom(skb), 0),
-					  ENCRYPT_NO)))
+					  ENCRYPT_DATA)))
 		goto free;
 
 	hdr = skb_push(skb, extra_head);
-- 
2.56.0

