Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278987;
	b=aJODMn0hwq1kFchSNNFRW9fg+Cn2FvwJEcflDrW7yJcNirVICww0OMNbZ1QJra/38F9J
	 bUGoHIDtOYja99juw0+1LnF0/ZssLyc2QrdJyMclWR18c00smYUr1GfpwSW41ZD4PfkMs
	 HTsHD0OTgm79oNqnZ8Z6MUROIxPxpyufqHXIdNF/TSCuj++yIN4cF0KNDphcRkCutku6e
	 +CYBIux5mVzCcy9BllpCGFNuvzEaX6rC516pIapEvPF2RzUZr1jiZ7ymJYd5cMGXq+nLC
	 IWQ7187s43+QaXSyPA8D5cuf0TeXaPuZ/A2D1hxjjkTeXT15D45eN2BJo2s+zrlV0pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JdxWEIL0M9ex9lHBtx8gNprPKuZ5+30UhfHTwNk0jrM=;
	b=1nUgE/Crrz5iVrkH2jMn5Dq0S2OZFUO1B9I8P//NbKYP2ebRPC3oWL128NsX1Cj3aR1P
	 r2Wpp6167XTw5wp3gwVr9MpCOFUiHfcRzW6hYgrIfkjpLDZrDKGhB+hHt8uKzZC0SuVBB
	 WV6XQXrRSYyGpz/RHm80OHINzntv7JZCzTVMEb0ZrXUbP8hqeEjyphkzCGoPbpdD1uRcF
	 gKSmayXUV4l7WKkwBDIHrv2h5X/7jsCdGG4HBHDlso8D5doJqlR6TxW/XySmfG7Hvk/3u
	 o+ZySWwOas2dxsMs9o59UydpytLnW6MGhc4/L1gWFvJvIsztci4KBUtRnoZhGRgmZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E77nioXE;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F1606A335
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67F1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E77nioXE
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f045b921caso10166875ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278986; x=1795883786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JdxWEIL0M9ex9lHBtx8gNprPKuZ5+30UhfHTwNk0jrM=;
        b=E77nioXEx6DTUNqfNXcdKo0zWowoSzsXLv5vkooVBnbC5TteHUj+9qERJY65168DJQ
         V+Bd4PTUI4E5MJQC53YkSuvqb2BzNwm68zCA1RzD4ISJLxD/JaV/0MrKJOqpDdt6gHQ4
         CPBXPatc0Sg02709BK1LCNdJa9aUi902nGLvs0TXOhNMciVSbPnpBASRG5KX0Yqoldf8
         aYfYvYS0rd+xtDgITDIneWq/Pa4oPH3/lso75yL4UxHWr9WjW/PhW4OAwgitrVPq8CKT
         5cJSjVOK5BJPo6G/kHYFPLd0aZG+PwTLmA2KHN0vYc5lR0Afho31kl8+weh3IytCA+mJ
         xGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278986; x=1795883786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JdxWEIL0M9ex9lHBtx8gNprPKuZ5+30UhfHTwNk0jrM=;
        b=GG5MQywd0LUCsmxIMHS55FI0/R1jbuFTtBwpAmzugGsV428ySwkFw4nm3+N9hJtUyR
         W2LvAB4roFqI/JnM9lcjSFMujuLhB0Q8GcVguT40Zai08wRkO3UVFLyB4Q3JlwHGKiPy
         T30lnFZ49FC8GxSHD0Zo/EaYbrZQ1A2cLTcIANXwCWFwMDABNldVObflD+4yUQ5zKK8x
         98wkzckdF5/R58jUk8m+EFTAH4uXAK3qT9Y1R1B1DJDsMP9bajAyHdZWKbonfvqW9Af3
         /72SYgfqg4kf1Vn197FE92s+vVzSjN/TRw8dIkrWVXNn0zVBbOihkZv4HAeSv6cAyIL3
         kRLw==
X-Forwarded-Encrypted: i=1; AL+hErESngyy69C0ThEk9Y7Wfr56kvmAMlvIU6REC5535q7YjmQ/E5CqpreT88Z/bonFPus1XDB81Ae1ZxeiI4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IuxtWYWDfZK5XJFeyCWUgOOc2EEX1xV0LEJU4mWSpGPhkuEFi
	NB6oxHmwIO6kiiOc/nSXhHJB2oE6wGLr+2NCAP3EvlJngZVAOb1I7zRV
X-Gm-Gg: AZFdTZf+MjVksoAs71DQSGtURgLboObrTEjbsjeiNz35AoiXpNJJF/aDslMgj8Ya0Ho
	ojEV25X0O0HiIBCQkf1FXO5sB22gnB7LNcEu04oGTOpT67kjOsPTi06qHDwpt0hnTRxiuWDUnUw
	nDPAypgtxlQsDPQQ16pqzMltRfmWWyehkjYMiK0lCU2dw8x9GU0TtGpT/VA3qAI1EywH/1OPVhe
	xogKW1geGNiPOeaJSzGCdz+spsucJgA3tDcLdIO1a9FV780QA369TbeaL95X2docJi/4+zVVIee
	j8y8q9gbBMBfCTkTDfa10SgITX9yBdjr7XJPLVuCe4C1aSOIOw+hZ6aDJDrsRO2kgU/P8CI010i
	mV/nUSY8CmgyIKI3MENQYjVyaNZzp/5a9vlMGMigOetLVvXLQqJBhH+y7lAABP/vn/5LVDz6o5x
	t0n46uMbkgeeYcfQLGuuZg2ET4POu9b5pn/rrHRfsm7I+x0SzRJin3LRlelJWPm26m6WSlaS5w1
	FC7oQus2qEyHe/c85tad64NQ9JmZT6RLzv3NRdm9evimHHPXV24HefwQi7DE2dvsewfG0qU0sye
	Zz04f2P+Nx+PoIJRT0wNXmQzi3uPCekq092T/1w0zQrszHKEqQy5P+xY8QU8kuYzCUFMI3Q9W3f
	V0Lmw
X-Received: by 2002:a17:90b:390c:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b41c9beafamr5939261a91.66.1795278986142;
        Sat, 21 Nov 2026 08:36:26 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm12357403a91.5.2026.11.21.08.36.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:36:25 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Morning Star <alexbestoso@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH rtw-next 1/3] wifi: rtlwifi: rtl8192ce: don't mark unencrypted frames as decrypted
Date: Sun, 22 Nov 2026 00:35:45 +0800
Message-ID: <20261121163547.37019-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121163547.37019-1-enderaoelyther@gmail.com>
References: <20261121163547.37019-1-enderaoelyther@gmail.com>
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

The receive descriptor's SWDEC bit is set when a frame still needs
software decryption. It is also clear for a frame that was never
encrypted. rtl92ce_rx_query_desc() nevertheless sets RX_FLAG_DECRYPTED
for every frame with SWDEC clear except a protected robust management
frame, including unprotected data and management frames.

mac80211 then accepts an unprotected unicast data frame although a
pairwise key is installed, because ieee80211_drop_unencrypted() passes
frames marked as decrypted, and it accepts unprotected deauthentication
and disassociation frames on a connection that uses management frame
protection. A station in radio range can therefore inject plaintext
data into an encrypted connection, or end a protected one, by spoofing
the peer's address.

Set the flag only for a protected frame that is not a robust management
frame, as the rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be and rtl8821ae
drivers do. rtw88 dropped the same assumption in commit 0649ff58a0f6
("rtw88: Don't set RX_FLAG_DECRYPTED if packet has no encryption").

Found by code review. Compile-tested with W=1.

Fixes: 0c8173385e54 ("rtl8192ce: Add new driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

834fc28d7880 (7.4-rc1) fixed "managment" in the comment this patch removes;
with the old spelling in the removed lines it applies to 5.10.y through 7.3.y.

AI assistance was used.

 .../wireless/realtek/rtlwifi/rtl8192ce/trx.c    | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
index 99472053ccff..3d11ddf86136 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
@@ -300,20 +300,13 @@ bool rtl92ce_rx_query_desc(struct ieee80211_hw *hw,
 
 	rx_status->flag |= RX_FLAG_MACTIME_START;
 
-	/* hw will set stats->decrypted true, if it finds the
-	 * frame is open data frame or mgmt frame.
-	 * So hw will not decryption robust management frame
-	 * for IEEE80211w but still set status->decrypted
-	 * true, so here we should set it back to undecrypted
-	 * for IEEE80211w frame, and mac80211 sw will help
-	 * to decrypt it
-	 */
+	/* SWDEC is clear for plaintext too; mac80211 decrypts robust mgmt */
 	if (stats->decrypted) {
-		if ((_ieee80211_is_robust_mgmt_frame(hdr)) &&
-		    (ieee80211_has_protected(hdr->frame_control)))
-			rx_status->flag &= ~RX_FLAG_DECRYPTED;
-		else
+		if (ieee80211_has_protected(hdr->frame_control) &&
+		    !_ieee80211_is_robust_mgmt_frame(hdr))
 			rx_status->flag |= RX_FLAG_DECRYPTED;
+		else
+			rx_status->flag &= ~RX_FLAG_DECRYPTED;
 	}
 	/* rate_idx: index of data rate into band's
 	 * supported rates or MCS index if HT rates
-- 
2.56.1

