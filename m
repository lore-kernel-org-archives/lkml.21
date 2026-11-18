Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986668;
	b=Hiye47Xmb5ZJu4rpXqxUtA3TG2T6/RqupdkSdq+Q5ABVAObW7SrH3W9ieb4zqt2Wz83Y
	 2sZAsc9DoueaTTT34Xx40Ny9ozTwaVyNq3j1auCWst0qrS08sfrGEYyQlw3fXYtlVBltb
	 naLNRB5/fn8MhU62mXL+CFkL+3+/VT3CsbTGqlXDOqY/utWn5JCzqyF1r2vPtD8SqFgd1
	 Q2Onp6cWAU3CA/8kH1fa1Jr2NML58dnlcxvrlfM1Qqstpz+6SNWpxJHVCbEs5E/2BPDpE
	 PUkyxf8EkB+F7m/60P/CJOsBeAMxV97ko72Qh1dfdt3GG2222RnVyKCxxQ6LpSVCTbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nWldKJH4ToQxxszIhmpTBzaHDyg4JETHklQ1vv7jvRs=;
	b=17Jl03qp6VvpsMQt2uEGagkC93exLILt4i04QSbtnoVc07XByENPJ4eJmxLJsUBoIv3c
	 i/92tRyeXdGhXjCPrLtBjxYLdMUbjPSMMJk7ni68cvU16g+mkZAgnLuzvqBz2pwpnrTH6
	 +wcUesJISs/gNbGZIze0JYmocAt8NC8luYYNYfwKapqycy9LuaW6ofacStVwTIZfT4nrK
	 cXZLN7/iB/JKrB1GBz/i08DOzEcEGdIaOi6bPNir33Sz9IGimrRI4dx+0mTYhvKZYo1GZ
	 66fCEziUW+y1+8m7utVYoHJ8+aVL665vN/G5ALnPdXIcNvLxIXyp1ry2bmd50dEt+sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=optmKBhu;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA33606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=optmKBhu
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so1686133eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986667; x=1795591467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWldKJH4ToQxxszIhmpTBzaHDyg4JETHklQ1vv7jvRs=;
        b=optmKBhusOrjDG69jg4Kw6QLVtpKWDX78kqzv3mPhfX5qbKGNxRR1TibCIDs7O8EV9
         3z4iKtcjBbS6ZAe9w5FhT98RQTWHR5PmplbO4tvYLIPtxgpHG5kQdshJkIWQHzq1LI+a
         JCIPr/G10qtfR4xiT6ZTB2VGsNouIRDgSmVz+nw36GIWTx486CaGLhQEcsWkQ3I7n9aB
         w1P+lJPvCHr6TlyEzxATkOF6vPgv5CJ64FIrBcpIMt5NKt/D/PaR2xFMTytjVMipDbDA
         eUNumuvsq9voFOu4z9CgQ+s+KmE3DTGKpD4NfFqdzjhS33FGkbAyV7x1e4GNZF+pbvyd
         0QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986667; x=1795591467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWldKJH4ToQxxszIhmpTBzaHDyg4JETHklQ1vv7jvRs=;
        b=Y4IybqszSzefmOYc/Jjaq4Ws8rbsY+wO/MWrOytdrNU3YZOdnv37x2Wp5anKiOatoS
         3MdEJnC9KqZoUgRWeFoNosK+brphi/chRiMhpbf3p3yH2dBtA2x5fYgupO+cP8jiuQqs
         c4IK5RMhPnpPkQSARuVWHpccksB7LjXMb1SjkDzKNQg4N3TELxKT3b/3kV253JgTUHzu
         sp+NsTmACtcg/m8pKP39sjaXvMlmzAdep727dIYGMUOQyyPI8TQlXM1udHbsrPShF2jO
         6fNDM00GqzfoXBihPjqaRtvAo4Zk94YxA+byaHo7YU7uP4gt/wQyQq53Rs0XhvyVteRu
         wYNg==
X-Forwarded-Encrypted: i=1; AL+hErGfgt4I/TEryRD0xDUNj22ei+Slg6Szrr89IlHU0qCG6L5vNMqIpQpmT4CgkPVgdyZsCl24y3zNwUKr/Nc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nwwmQnixMwyjXNdJ1APRZU4lgLJxvavoA6EMNrY0X6TmJRNiQ
	WEW0J9rwkJrePWK7MfTasf0OpU2Yd+vX+Kzh+BqtxONTaIjrV48TCIVa
X-Gm-Gg: AZFdTZdfVgqJB5arRJd08wK4TyP97mFBWmVxdeg9ez17ksk7OThyZJjhuFgA0gOMbLc
	yehzaMATwfIUsmrKGcMwS5uGTrrm7yvjuUgsXEa2Ld8RnYlP+an7RHPCMWCmS+9oSugWB2CS9Yr
	Bisn1OLfkmjKKI4Rm7NUWCOAXyRttAZemXgv3K02j2VFLDNnbhLkWQX6uc3C7yo22no4PQYkAhX
	3vfueYjB5TVAxyDZ7g9qUz9+EB5xhn9rDS8Keua0Q7ztkzq0kt90FZFBa7u64AeD1U6Te2dNblI
	UbrP8g7KOY9d/MQl/tWkSuXjz6uoBNGS1sxlCJ4G468Wsmm6hz/NZfV/DbhdCrk/zCmeSPxTNwf
	Z3+aksLfqfds4oBZG4+he0wDyyE0hjHYAFo7UJ4rm0QFv0UpThQWZUNlcv/5c5HwJpIrTVpxIPZ
	oIOkyq2UAVLHSz5/lH77zQtAEPPjf5oYZS5NqTHcLIb4LRgnstTGjWKyg/tzQs+etzAO6PwGPjP
	sAlpLpxnjBoGb7BDPJuirKvBFHboaboNimLy5MtZWCxWuvxB2aBNRFNfZ7a5kYwFk7/GJUXyiNI
	2g1Yyh4KhhJzWeWDDRRf7PIbYRNRdGWwedZ5L13xdvPO7DmQjKhspux03pGKiW1xfO9QsplR3+D
	CB86QIPQeQ59AsVMboeUq2qpn0RbBO+6WN//jYpfG
X-Received: by 2002:a05:7301:4682:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-382803787b6mr1855612eec.24.1794986667042;
        Tue, 17 Nov 2026 23:24:27 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm4894511eec.28.2026.11.17.23.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:24:26 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: briannorris@chromium.org
Cc: francesco@dolcini.it,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patila@marvell.com,
	cluo@marvell.com,
	linville@tuxdriver.com
Subject: [PATCH] wifi: mwifiex: shut down the auto TDLS timer instead of deleting it
Date: Wed, 18 Nov 2026 15:24:19 +0800
Message-Id: <20261118072419.1259830-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

mwifiex_clean_auto_tdls() clears auto_tdls_timer_active and deletes the
timer, but the callback may already be past that check and rearm the
timer with mod_timer() before it returns.  timer_delete() does not wait
for a running callback, so the timer survives the cleanup.

The mwifiex_private structure is freed later by mwifiex_uninit_sw(), and
a timer that fires after that dereferences the freed structure in
timer_container_of() at the top of mwifiex_check_auto_tdls().

Use timer_shutdown_sync(), which waits for a running callback and
prevents the rearm.  A reconnect sets the timer up again with
timer_setup() in mwifiex_setup_auto_tdls_timer(), which restores the
callback, so the timer is not lost for the next association.

The cleanup also has to happen when the interface is no longer a
station.  The feature flags and priv->bss_type are re-read on every
call, so a bss_type change while the timer is armed skips the cleanup
entirely and leaves the timer running past the interface teardown.  Key
the timer shutdown on auto_tdls_timer_active instead, which is set only
by mwifiex_setup_auto_tdls_timer() and cleared here, so the timer is
stopped exactly when it was started.

The peer list is independent of the timer and is flushed unconditionally:
mwifiex_add_auto_tdls_peer() appends to it whenever adapter->auto_tdls
is set, whether or not this interface ever armed the timer, so guarding
the whole cleanup on the timer state would leave list entries behind.

Fixes: 9927baa3c724 ("mwifiex: add auto TDLS support")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No mwifiex hardware was
available, so the disconnect/unbind race was not run.
 drivers/net/wireless/marvell/mwifiex/tdls.c | 26 +++++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/tdls.c b/drivers/net/wireless/marvell/mwifiex/tdls.c
index c71ffe8399e4..99948db5bbdf 100644
--- a/drivers/net/wireless/marvell/mwifiex/tdls.c
+++ b/drivers/net/wireless/marvell/mwifiex/tdls.c
@@ -1483,13 +1483,29 @@ void mwifiex_setup_auto_tdls_timer(struct mwifiex_private *priv)
 
 void mwifiex_clean_auto_tdls(struct mwifiex_private *priv)
 {
-	if (ISSUPP_TDLS_ENABLED(priv->adapter->fw_cap_info) &&
-	    priv->adapter->auto_tdls &&
-	    priv->bss_type == MWIFIEX_BSS_TYPE_STA) {
+	/*
+	 * The timer itself records whether this interface set it up: the
+	 * feature flags and bss_type are re-read on every call and can have
+	 * changed since the association that armed the timer.
+	 */
+	if (priv->auto_tdls_timer_active) {
 		priv->auto_tdls_timer_active = false;
-		timer_delete(&priv->auto_tdls_timer);
-		mwifiex_flush_auto_tdls_list(priv);
+
+		/*
+		 * timer_delete() does not wait for a callback that is
+		 * already running, and that callback rearms the timer when
+		 * it finishes; timer_shutdown_sync() waits for it and
+		 * prevents the rearm.
+		 */
+		timer_shutdown_sync(&priv->auto_tdls_timer);
 	}
+
+	/*
+	 * The peer list does not depend on the timer: entries are added
+	 * whenever adapter->auto_tdls is set, so it has to be flushed even
+	 * when this interface never armed the timer.
+	 */
+	mwifiex_flush_auto_tdls_list(priv);
 }
 
 static int mwifiex_config_tdls(struct mwifiex_private *priv, u8 enable)
-- 
2.34.1

