Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615194;
	b=3eX/+sMoS3E4LkICzpjrStbmeaQXMNaZdWpJHDJeqPmILgoA4pLj+H27UQ0PNBESS+xL
	 rlPThgjkjIRajXo4xEsWNWuPo8ukusu5wR97S1f5wdsEbkHApap2Xj8jQKSXpgtJQzbUG
	 VXy654o3iXypriJZam87HXfSsWRWSAW7vc/1yFHpb6cnlz8qGjIOkkt+4VYC8UHrTYnJc
	 qgmhqs25H1F2smCkwVK5oa5QB21UvlrG1s6gL7gSNyoWX/UMiUPj7aTLUKbXQf5DuAiOq
	 aZGHDajH7r1nVt08ncZytfps8B+R0E+EH8kjwrdXVOx0mEgCXkHxXlnB4eORAvV6y9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/i1AWHwYlBYllRQmEBTMsajgoaO2HBUmLOsCfs1bkio=;
	b=1sjOp66Ib8mqz7WIbYK/3s4/DfN4jKYUzPZNV5OYDo4iCosEzZQDytHvgvgWfd/29rAn
	 PHPK8SRHYrD5PltdDWGR9IiqJwG4JQ5YlG2erTf/Kcu67VaFhXjOPx4L4vtdCpIyKDCfa
	 6BypvAApKQPNt2N+X2RFuN4r3jBRgeif3tJEPg4tJQmIaiEUNBjbhmVPMCTFHi3owQ50J
	 eZderYzxEbuIvn/QThtIvlwYOA+1fMBoNC+GFnqHprdExrcnYj7fZ+/VR6VfosjwFBquC
	 OdEIGAe/AQpuz1jtuO7rMY6gFmbT7swCWlxcVAJaKRTrB9etNkNY5W4UdwoKJBt50bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IvUIcSvw;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346BC606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IvUIcSvw
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde827b7b95so1654147a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615193; x=1796219993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/i1AWHwYlBYllRQmEBTMsajgoaO2HBUmLOsCfs1bkio=;
        b=IvUIcSvwIEKeStYvCEZkyRkQyd2l8HHztZEtP6YfhkMkVrhJEn6kWXHYHCW1yogsdH
         8iKl3n/pSANAPar97Z0LAPgJBFlDyCjCTFyed/QaDvXvXGWUdeZI2XFXFLfgEqOMvHL8
         tgOwkinlw81HL8nwl0NnRrjK5R3/Nn10U3cUNSbbhV2PKoKsPr6YFnyYMzOfWrvGNw7p
         59Tbiu/aFV+M73WD2xSKZlqkD6kpH36LeGyUATrvM9RDwzYMgjex9/x7T2DeYSdxBWyw
         I3H598kS4ChEpNWoYzaUSMmYBewLgPj9zWORC5jARBwli8yBT7EtCtSETft8IKNn7ueI
         rgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615193; x=1796219993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/i1AWHwYlBYllRQmEBTMsajgoaO2HBUmLOsCfs1bkio=;
        b=TO1DJln7TY78aCoJmrV3tFXlX1XYJn4PqbB6+QYUgvs3Wiz5oAg0tGLkUlr7yw+0A/
         oqFd0lJZTgCOXtQzeCbBcQ3xqOpq/w4KHMb2jfA8lcdn+xpb9dbiFTutVItWdq2Kr7RM
         cMNKEXZfKfEr/OET72JKqViN7vOyzmIuXt2vtkkVYuh9MT7KdWjzu82qcH/Wb9zEIMmd
         fTsHVel2VVzwoWv+lp9uOEwbk69MWo8H7nEo5fff2TANuUZVa8QJiIpSbXUYVSv5jRHq
         blM0UZ2wRzJ2vyXc/+ed7JF9J4sxXsm2gwRTu4MP40eweNfjBGCwajQ7LhsJdUrzZb8Q
         FGXA==
X-Forwarded-Encrypted: i=1; AL+hErFg8bu1uxdjhNRZAiIstIS9QWAF8IfJy4bGzqw2vw/S8bT1kL6C9RC2Qs64hBUaYJUvEtgeFENwB9sDWso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TuMKmirJkNu7zWKt3zqBJosbsYTjYHsa2ZFv+YRILtm7iyuXX
	qjctRa4qgIxR3Ga4hORoixEo8v3x66VAktAl+WtU43ROHLbmCibrjCLM
X-Gm-Gg: AZFdTZdmSafMahLbZACcoz5UrZBvz5JJuNsq4qLe2choUhYnlfNQ64Hjto2WzFPFqg7
	Kh5W/zkwy2n22/Uh0X8eFbAXhVPBM9a4Z1HaCr68ch0enBDpzgSO5San/KApBmIHQvuVg2mG/lC
	hfkjgUBiPhzZxkfIJN4i42Mb6Ll6ljZVanF9UwtkHlad4SXXcubJBpDbBY2i3PbbeGCkCf++uaJ
	aYfK2niApYPI8AA17rBF9AzapOpbeMWTWASiBhSTp4ayWR6Kgx4Oyj05nc4Pknn2sf42DwWvYRP
	oMQlF6oaQ5n+V47HwGA8DQijxnXalaawkzKQNLBcG/3q2qjMJTS1w/MQ2YTAbovgFcz5IXW6q4W
	yK2YmnJapSsfXDJYxy27LSnvOFmJGSNPOvQ7uHt7TGI+3X40DzfqMgSoWyrO00wu7d3D5jb2ono
	nqmbpIz05FFOKsgma18/YkolszOf7E2UybW6I+GQawmltHVejm4GPQt9nTiJ0B8PvgV/I8eS4me
	eqQ4tQloJJdVZYOuS2KyDtGZ/3TKxI0/S1cqVGAI/4gG0891iXzm11NIZSHjc8iJXvbAyF+VJTZ
	9jY4r+5PsLg3n9u8XoKVNhvP/Q==
X-Received: by 2002:a05:6a21:511:b0:3f9:bcb9:30dc with SMTP id adf61e73a8af0-4014d14d4f5mr17022559637.38.1795615193316;
        Wed, 25 Nov 2026 05:59:53 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm9143860a12.2.2026.11.25.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:59:53 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 2/2] Bluetooth: L2CAP: Serialize BT_SECURITY with connection teardown
Date: Wed, 25 Nov 2026 21:59:39 +0800
Message-Id: <pm-bluetooth-objects-candidate-0069-v11-7d5800a0c21420dddac0-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0069-v11-7d5800a0c21420dddac0-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0069-v11-7d5800a0c21420dddac0-0@gmail.com>
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

The connected socket BT_SECURITY path calls smp_conn_security() while
holding only its socket and channel locks. The callee requires exclusion
from l2cap_conn_del(), but the fixed SMP child can be torn down before
teardown reaches the later socket channel:

  BT_SECURITY syscall               HCI disconnect
  hold socket and channel locks
  smp_conn_security()
    chan = conn->smp
                                    delete SMP child
                                    wait for the socket channel
    l2cap_chan_lock(chan)

Use l2cap_chan_lock_conn() for BT_SECURITY and its matching unlock helper
on exit. This takes the existing connection mutex before the channel and
socket locks, excluding SMP child teardown across the security call.

The excerpt below retains the headline and stack traces.

The receive path uses the same helper in
commit 5beb86f98c3d4 ("Bluetooth: L2CAP: return LE credits from
recvmsg under the conn lock"). The nested connection, channel and
socket lock order follows
l2cap_sock_defer().

KASAN report as below:

    BUG: KASAN: slab-use-after-free in smp_conn_security+0x268/0x960
    Read of size 4 at addr ffff888110c2700c by task pmbd0211-client/530

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? smp_conn_security+0x268/0x960
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? smp_conn_security+0x268/0x960
     kasan_report+0xe0/0x110
     ? smp_conn_security+0x268/0x960
     kasan_check_range+0x105/0x1b0
     smp_conn_security+0x268/0x960
     ? find_held_lock+0x2b/0x80
     ? __pfx_smp_conn_security+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? __might_fault+0xdd/0x190
     l2cap_chan_check_security+0x16a/0x2b0
     l2cap_sock_setsockopt+0xc88/0x2270
     ? __pfx_sock_has_perm+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_l2cap_sock_setsockopt+0x10/0x10
     ? free_zapped_rcu+0xd0/0x1e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_socket_setsockopt+0x66/0x80
     ? __pfx_l2cap_sock_setsockopt+0x10/0x10
     do_sock_setsockopt+0x1fb/0x430
     ? __pfx_do_sock_setsockopt+0x10/0x10
     __sys_setsockopt+0x106/0x180
     __x64_sys_setsockopt+0xc2/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7fdfe600a2ba

     </TASK>

    Allocated by task 514:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     l2cap_chan_create+0x47/0x930
     l2cap_new_connection+0x1f/0x280
     l2cap_connect_cfm+0x46c/0xe60
     hci_le_remote_feat_complete_evt+0x417/0x680
     hci_le_meta_evt+0x30c/0x5c0
     hci_event_packet+0x4e8/0xc70
     hci_rx_work+0x367/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 514:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     l2cap_chan_put+0x273/0x3a0
     l2cap_conn_del+0x41f/0x860
     l2cap_disconn_cfm+0x87/0xd0
     hci_disconn_complete_evt+0x30f/0x990
     hci_event_packet+0x894/0xc70
     hci_rx_work+0x367/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

Fixes: b25120e1d5f2 ("Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
This patch was written with assistance from Codex (OpenAI).

 net/bluetooth/l2cap_sock.c | 158 +++++++++++++++++++++----------------
 1 file changed, 88 insertions(+), 70 deletions(-)

diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index d8a7b5f4baf64..fae2c64eb39e3 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -929,12 +929,96 @@ static int l2cap_set_mode(struct l2cap_chan *chan, u8 mode)
 	return 0;
 }
 
+static int l2cap_sock_set_security(struct sock *sk, sockptr_t optval,
+				   unsigned int optlen)
+{
+	struct l2cap_chan *chan = l2cap_pi(sk)->chan;
+	struct l2cap_conn *conn;
+	struct bt_security sec;
+	bool have_conn;
+	int err = 0;
+
+	have_conn = l2cap_chan_lock_conn(chan);
+	lock_sock(sk);
+
+	if (chan->chan_type != L2CAP_CHAN_CONN_ORIENTED &&
+	    chan->chan_type != L2CAP_CHAN_FIXED &&
+	    chan->chan_type != L2CAP_CHAN_RAW) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	/* mic_len was added at the end of struct bt_security, so
+	 * accept the shorter struct as well, leaving mic_len unset.
+	 */
+	if (optlen < offsetofend(struct bt_security, key_size)) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	err = copy_struct_from_sockptr(&sec, sizeof(sec), optval,
+				       optlen);
+	if (err)
+		goto unlock;
+
+	if (sec.level < BT_SECURITY_LOW ||
+	    sec.level > BT_SECURITY_FIPS) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	/* BLUETOOTH CORE SPECIFICATION Version 7.0 | Vol 4,
+	 * Part E, Section 7.7.8: MIC_Length 0x00 is 32 bits,
+	 * 0x01 is 64 bits and 0x02 is 128 bits; all other
+	 * values are reserved for future use.
+	 */
+	if (sec.mic_len > 0x02) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	chan->sec_level = sec.level;
+	chan->mic_len = sec.mic_len;
+
+	conn = l2cap_chan_conn(chan);
+	if (!conn)
+		goto unlock;
+
+	/* change security for LE channels */
+	if (chan->scid == L2CAP_CID_ATT) {
+		l2cap_chan_req_mic_len(chan, conn->hcon);
+		if (smp_conn_security(conn->hcon, sec.level)) {
+			err = -EINVAL;
+			goto unlock;
+		}
+
+		set_bit(FLAG_PENDING_SECURITY, &chan->flags);
+		sk->sk_state = BT_CONFIG;
+		chan->state = BT_CONFIG;
+
+	/* or for ACL link */
+	} else if ((sk->sk_state == BT_CONNECT2 &&
+		    test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) ||
+		   sk->sk_state == BT_CONNECTED) {
+		if (!l2cap_chan_check_security(chan, true))
+			set_bit(BT_SK_SUSPEND, &bt_sk(sk)->flags);
+		else
+			sk->sk_state_change(sk);
+	} else {
+		err = -EINVAL;
+	}
+
+unlock:
+	release_sock(sk);
+	l2cap_chan_unlock_conn(chan, have_conn);
+	return err;
+}
+
 static int l2cap_sock_setsockopt(struct socket *sock, int level, int optname,
 				 sockptr_t optval, unsigned int optlen)
 {
 	struct sock *sk = sock->sk;
 	struct l2cap_chan *chan = l2cap_pi(sk)->chan;
-	struct bt_security sec;
 	struct bt_power pwr;
 	struct l2cap_conn *conn;
 	int err = 0;
@@ -950,79 +1034,13 @@ static int l2cap_sock_setsockopt(struct socket *sock, int level, int optname,
 	if (level != SOL_BLUETOOTH)
 		return -ENOPROTOOPT;
 
+	if (optname == BT_SECURITY)
+		return l2cap_sock_set_security(sk, optval, optlen);
+
 	l2cap_chan_lock(chan);
 	lock_sock(sk);
 
 	switch (optname) {
-	case BT_SECURITY:
-		if (chan->chan_type != L2CAP_CHAN_CONN_ORIENTED &&
-		    chan->chan_type != L2CAP_CHAN_FIXED &&
-		    chan->chan_type != L2CAP_CHAN_RAW) {
-			err = -EINVAL;
-			break;
-		}
-
-		/* mic_len was added at the end of struct bt_security, so
-		 * accept the shorter struct as well, leaving mic_len unset.
-		 */
-		if (optlen < offsetofend(struct bt_security, key_size)) {
-			err = -EINVAL;
-			break;
-		}
-
-		err = copy_struct_from_sockptr(&sec, sizeof(sec), optval,
-					       optlen);
-		if (err)
-			break;
-
-		if (sec.level < BT_SECURITY_LOW ||
-		    sec.level > BT_SECURITY_FIPS) {
-			err = -EINVAL;
-			break;
-		}
-
-		/* BLUETOOTH CORE SPECIFICATION Version 7.0 | Vol 4,
-		 * Part E, Section 7.7.8: MIC_Length 0x00 is 32 bits,
-		 * 0x01 is 64 bits and 0x02 is 128 bits; all other
-		 * values are reserved for future use.
-		 */
-		if (sec.mic_len > 0x02) {
-			err = -EINVAL;
-			break;
-		}
-
-		chan->sec_level = sec.level;
-		chan->mic_len = sec.mic_len;
-
-		conn = l2cap_chan_conn(chan);
-		if (!conn)
-			break;
-
-		/* change security for LE channels */
-		if (chan->scid == L2CAP_CID_ATT) {
-			l2cap_chan_req_mic_len(chan, conn->hcon);
-			if (smp_conn_security(conn->hcon, sec.level)) {
-				err = -EINVAL;
-				break;
-			}
-
-			set_bit(FLAG_PENDING_SECURITY, &chan->flags);
-			sk->sk_state = BT_CONFIG;
-			chan->state = BT_CONFIG;
-
-		/* or for ACL link */
-		} else if ((sk->sk_state == BT_CONNECT2 &&
-			    test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) ||
-			   sk->sk_state == BT_CONNECTED) {
-			if (!l2cap_chan_check_security(chan, true))
-				set_bit(BT_SK_SUSPEND, &bt_sk(sk)->flags);
-			else
-				sk->sk_state_change(sk);
-		} else {
-			err = -EINVAL;
-		}
-		break;
-
 	case BT_DEFER_SETUP:
 		if (sk->sk_state != BT_BOUND && sk->sk_state != BT_LISTEN) {
 			err = -EINVAL;
