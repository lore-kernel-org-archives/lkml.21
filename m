Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037648;
	b=eR30x8jDZItEdwd6qBKbinsUWIYL+2bkxRlcuWScO+E4zyCZLHtj5X9sqjAQCyverPbs
	 HXwxOTMuca5mNEbFuypAOXzNN/SFFCsj1fX4l4ea62wHRxLPRHz5LRNhG/gLZd5yD9PER
	 2kHEKiacrGbLrmlisRo66r89uT1fy49QMbLKAj77cd5qruuKlDFCg42mKbjDEVP2bEnUF
	 yQ52+VkEBjbPfr2GaVzipTJjepiMxUugOovjQVG8WtY5Is438FhQDJ6YD0bN2enaJ5ocK
	 k16Wlix2rE0+xA9+i8UvH3IdfoYPLHfSq6t+ni86o9uSfF7b0+5UxabmLLtgh2v0Lxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7wkVVAr94vmiTO/mQBiU6goP09UpUl9nKX+foqCxc40=;
	b=f80If7Go5pYGNkwQzZemNAhxm4KRiByQaCU/2FW3KORuyta0YUxmsPU+j32U8050YlYa
	 s9d4WVXFeeTcZn4vdc0PJlhcp0iZdNgP17G6eqqer9I3SqVlnk2lDj8WJ8ftecwd4lxDk
	 WujW+QHbRzLa6DxFer23UJc9CSOWi8Cu5XnAc9kxc2vOj9ekDzR6cISP0TqMyO2/Egytl
	 dP5DGTLyFQ+wbhV3cAsJshWNG8IQYHLj3mmTXqtKNmRMiULstzlJll//5hkV52Eq71orm
	 i6FYDa/XKGOoIqeDJFPQGaTDyi/rfTr8+Qh1i0n4iuTGfH1nUoMuA/dekSAlckM+tWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odREYZc1;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7A606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C7A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odREYZc1
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b467581b98so18716855e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795037646; x=1795642446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wkVVAr94vmiTO/mQBiU6goP09UpUl9nKX+foqCxc40=;
        b=odREYZc1/GbDh/eSmuR6NoDDRRevw5GoM+eP3X4LTbkbVZwjGOglEoprh/KYAjM2Ib
         xvMJWQjUWhLso90cQ/VeXPK/eznybWngj1FdSb4Seo0mDR/dpBsPzwIcBrD4Ca4Muh6M
         MnfdPQdtEmln31VcIRfu4kiDrqXnZfGzgap3H8o5rJ7HdvrvjvdsVH3uyzjVCK98sK9B
         Ot3wbzIgQ2gXiSs5lamvnnfvUjFmyzdOSS/OoYlGx2mzmh1EEevsM5PutNK3fwByc/Rb
         CJY8DxL4HsSUJ479ETk5I7yNqUFoQZM84zZ681XQN09VSKW10YqPsEuLt8DA35m32LY9
         3Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037646; x=1795642446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wkVVAr94vmiTO/mQBiU6goP09UpUl9nKX+foqCxc40=;
        b=oq6AaeWroS5P+DQLNzP1PTv+9ULfSpYKaIV2vsCaC1arSE7Ox7oFGBr7/nZf6RO61n
         J6neulluHoGbhSG7WnxknMRjQQ0z9dibEcknbWarTxI8CWIUQLH0SgFF2r1j8EJtt1Nq
         yrHuEEUIUhI3RMrfT20HmEXeq8XlTy5dnSdtN9t4AkbHTygvFp2r77zf2sjaeQUmKgKg
         AjddlTnv3nTi+e79f0UFnyK3uvhzqfLenBAwGwg1PsaQmZip/6EMbVVHFwKmOcSHqPeg
         PNqhQX4/hwWsVHHwKESr1XxJ2OnpG6oyXu/+xCllBk9nTKKsIBz5rDZAvhDqfJVKru4w
         Hj8g==
X-Forwarded-Encrypted: i=1; AL+hErG+BfVRqkh2hD2X1jF+WzNeEsjfbM8qERfRGqIDVvhqNaVFZO6GiG92CoSavC4WWByyJSLWxWOBPjaSpPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MLlXcFLD1dJjywWa4mnBA/oxzyColqWj5WBNpBCDKPTOu8RSq
	WS6zOtxW0EFhWleDB2AisexIBlwb4n9JW488PJolUMiyKXyGvZRjJ30Uz6nuvA0A
X-Gm-Gg: AYBFou0QO7ezMyp/GAwwjIPyOw0Iljr2Yr41mQlSE1yOW4einEUMGYwqS8VdPVbgTaL
	T8hvk9ktpKyZZ9W0Jw0ZRylUzrUe48xxkCONlTrii5pC96F/aoc/cL2OAM6PTtAAh/y3j2yGObs
	5Y5KOOb5v1SLB44/rt8ey4ak7GKMkI8o8etJgk8a4JWovZSGdnBOLELtZsuRz8clNXUD5NUXblr
	KdycpfFfRg3MviWR74ejB7/JIQCso4USmbtp1gKL2i3sAK1oQtjFApzdFQg+zZIzinLTfPlBf9W
	T2zxgSRa/IbuWWTbyWRydl9yjyIgUfqtcmc5iamVknf5aFwHm1f6rwuqjj69gCmGsjEZfzViMdO
	hUMk3kTBU0GB94UpncR+v8A6w+Hokimg4F8kVFv70UmOvaSL/aJKFV3TB/IyRH1HVfxQT/nV7xJ
	7bkYD6uLOFw+PQX9TCU/Zj25dwjZ+CI3tyl+Qae1c1BVFJCwS2MlnEVIaChLykC1Jo02zThtynr
	7wZQi6URyEoFLj79iNjZeLEsUSZneu/VefQhd3txnRT2biLLjoi0JiKvAIN+d+1c4uM5vIxRg3C
	BgOlDFFHGgRhYy5gPWp8t+HrDwdB7dZIyjLjG6DPkyEAD1/aZsfS7WZj3Aa40zaTja1yllhRFNs
	M8ypYctI=
X-Received: by 2002:a05:600c:3ac5:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb7da0f7e5mr78512745e9.5.1795037646220;
        Wed, 18 Nov 2026 13:34:06 -0800 (PST)
Received: from localhost.localdomain ([2001:16a2:c01c:327c:c4:b89d:8df9:7d38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb844ef1adsm527625e9.14.2026.11.18.13.34.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 13:34:05 -0800 (PST)
From: Mohammed Alquraini <mohammed.saad.alquraini@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mohammed Alquraini <mohammed.saad.alquraini@gmail.com>
Subject: [PATCH] Bluetooth: L2CAP: check security before completing a deferred BR/EDR accept
Date: Thu, 19 Nov 2026 00:33:22 +0300
Message-ID: <20261118213322.60067-1-mohammed.saad.alquraini@gmail.com>
X-Mailer: git-send-email 2.50.1
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

A BR/EDR L2CAP service that listens with BT_DEFER_SETUP asks the kernel to
enforce its BT_SECURITY level and only decides which peer to admit. The
deferred-accept completion path does not honour that.

The child channel is placed on the parent's accept queue at CONN_REQ time and
is reported pollable (bt_accept_poll() returns EPOLLIN for a BT_CONNECT2 child
on a BT_DEFER_SETUP listener) before the link security procedure resolves.
When userspace recvmsg()s the deferred child in that window, l2cap_sock_defer()
moves the channel to BT_CONFIG and __l2cap_connect_rsp_defer() replies
L2CAP_CR_SUCCESS with no security check. If the security procedure then fails,
l2cap_security_cfm() has no branch that matches a failed result on a BT_CONFIG
channel, so the channel is never torn down: a peer that failed the service's
required security level keeps a connected, data-passing channel.

The sibling setsockopt(BT_SECURITY) path already rechecks with
l2cap_chan_check_security(), and the non-deferred incoming path denies with
L2CAP_CR_SEC_BLOCK; only the BR/EDR basic/ERTM deferred-accept path was
missed. This is the BR/EDR counterpart of commit 522e9ed157e3 ("Bluetooth:
l2cap: Check encryption key size on incoming connection").

Gate the deferred completion on the security state. In l2cap_sock_defer(),
before completing a BR/EDR deferred accept, call l2cap_chan_check_security();
if the level is not yet met, mark the socket BT_SK_ACCEPTED, leave the channel
in BT_CONNECT2 and send nothing. l2cap_security_cfm() then resolves it: on
failure the existing BT_CONNECT2 branch denies with L2CAP_CR_SEC_BLOCK; on
success, a channel the daemon already accepted is completed through the same
path a non-deferred accept takes (state -> BT_CONFIG, CONN_RSP SUCCESS +
CONF_REQ) rather than re-signalling an accept already made, so exactly one
CONN_RSP is sent per channel and the on-air sequence stays strictly monotonic
(AUTHEN_PEND, then AUTHOR_PEND for a not-yet-accepted channel, then SUCCESS).

Validated on an arm64 QEMU rig with a BR/EDR peer emulated over /dev/vhci:
with the patch, an early accept followed by a genuine Authentication_Complete
failure is answered with CONN_RSP result=3 (SEC_BLOCK) and no data is ever
delivered, identical to the non-deferred control; an early accept followed by
a successful (keyless) auth completes only after the security chain finishes,
with exactly one CONN_RSP SUCCESS and no trailing PEND; a deferred listener
that accepts only after the security resolves goes through the designed
CR_PEND -> recvmsg -> SUCCESS path with the link at the required level.

AI assistance was used in finding and preparing this patch.

Fixes: f66dc81f44d9 ("Bluetooth: Add support for deferring L2CAP connection setup")
Signed-off-by: Mohammed Alquraini <mohammed.saad.alquraini@gmail.com>
---
 include/net/bluetooth/bluetooth.h |  1 +
 net/bluetooth/l2cap_core.c        | 10 +++++++++-
 net/bluetooth/l2cap_sock.c        |  7 +++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -407,6 +407,7 @@
 	BT_SK_SUSPEND,
 	BT_SK_PKT_STATUS,
 	BT_SK_PKT_SEQNUM,
+	BT_SK_ACCEPTED,
 };

 struct bt_sock_list {
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -8011,7 +8011,15 @@
 			__u16 res, stat;

 			if (!status && l2cap_check_enc_key_size(hcon, chan)) {
-				if (test_bit(FLAG_DEFER_SETUP, &chan->flags)) {
+				bool deferred = test_bit(FLAG_DEFER_SETUP, &chan->flags);
+				struct sock *sk = chan->data;
+
+				/* Complete inline if the daemon accepted early. */
+				if (deferred && sk &&
+				    test_and_clear_bit(BT_SK_ACCEPTED, &bt_sk(sk)->flags))
+					deferred = false;
+
+				if (deferred) {
 					res = L2CAP_CR_PEND;
 					stat = L2CAP_CS_AUTHOR_PEND;
 					chan->ops->defer(chan);
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1274,6 +1274,13 @@
 			release_sock(sk);
 			__l2cap_le_connect_rsp_defer(chan);
 		} else {
+			/* Defer completion until security resolves. */
+			if (!l2cap_chan_check_security(chan, false)) {
+				set_bit(BT_SK_ACCEPTED, &bt_sk(sk)->flags);
+				release_sock(sk);
+				l2cap_chan_unlock_conn(chan, have_conn);
+				return err;
+			}
 			sk->sk_state = BT_CONFIG;
 			chan->state = BT_CONFIG;
 			release_sock(sk);
--
2.43.0
