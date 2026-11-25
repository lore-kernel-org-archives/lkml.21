Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622780;
	b=dLWZ1hUmdHSN9Aged9jKUf7OFjqbM+vap07vMpqC/5j6Pq8flYD0eB5fAELfuAFpJ2y+
	 BGm1hjUotUZTYXhqGUsgpR6yhcg0XvMK27bNZRjJnElE+zQPmqflgepIEFHOdcTG1QSnn
	 ABC72KiS/pcAaILkd8aJpGq+j65eh4USFXvDRxH68uKrjO3bVI8GPxiKhU4nF6gVZKg9G
	 W9JKJFvQVXmBH5tFi3/lmt6eVZOvm5ItFyf2HrkwFsybY02hiSgw11G6sbca6mzvmyv4D
	 IDXbtrRAciZ93pUeCUtzyLYsrL2VGGbsEuxZtZZYvGC3QXeqKh2jptNle9jhMHGhPjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Gq9YU/maKf0gmc7d1gIF7pc7KL6Wf9dUnlwKGyXxgs=;
	b=OiT36m4ZjJmgzO5PmWXi4dEr6PQECQmgjQkgUVBklj17/11ADpuZW0i3LTZjTCkEnLRE
	 Vg8Hee3VBR2lan39mbq4DlCr3CCpsqaiM63lq4eWmID8UeP5nA2YvXvY5ihekBTrq4ONU
	 0NUWWwZ6+xGr9zZr1LAbUv4m4SKKvB1zdkhYLKHXO49wbnKkb/UFm3WFVxP3/O7525859
	 CHMmm1/5VTKfVd7Aajn0HrOErvejqUbz1K7PhcCriOvWeRC/CB4q8KT4KXRvy7lVQ1D9H
	 cIV5IF3j74O7ojvmVUoOZyF9/CptXWw9jndeVObCucY+LLkigzkd4RnCsL3RDphJJ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIxh4Ln7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 570B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIxh4Ln7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso8409465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622779; x=1796227579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Gq9YU/maKf0gmc7d1gIF7pc7KL6Wf9dUnlwKGyXxgs=;
        b=sIxh4Ln7V3s6nCU3L1xeATftD3c/Ro1RGMJZT5I/xMiBIMzUldEiA2C2IbscL3hECF
         BDwRWdsJ/Db8Au65ovM16J5whhFZBy776Bxii5gPVCQ6v9y3otVzvG3/75X2gFIlPXhv
         ylDQIRT/mSoULNWpQEPlCPNkklk5/228GmQwZaUhkyfl9DPgU4rZUsTnlvxWFVPmLc41
         wOMAYMedGI2I2IN7hh2FQXZylnngaYqON3fYopQoXGdLaa55nNG9gLW6lH2Qw8VPqq2x
         Ker3hLD3czJRi+DcjzBYOrwzdh0zMhVaNx8Fyh6r/xsgNThzZoZZPCBK275HGMGua6JD
         zWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622779; x=1796227579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Gq9YU/maKf0gmc7d1gIF7pc7KL6Wf9dUnlwKGyXxgs=;
        b=SlH4yr+ijZj6nyCuy0TsMn/ejKOdSmkWEAhy5m2pJ3Mj6OPrgZPdifORLO6Lla0bzE
         PHQTvjDz1l4i50myN6dMrdPQRyS5wtbIKo1X958xEJ8bSr/4lY3aVBcwdGwZoPSjIXYv
         3yRPA3a9efuwD54YwAcPJjItB32qoHyotD0cPdP98RnR4cAIuIof0S4pngYAhgB0S8rC
         jcv7exBxFp0Ln7ce69/fydoGvUkYBJUtvCw4aRBtzMkm/6z9Q48iWOlnsjJj7WBUFxNR
         gpMWYj4qvzlyyq5pEvjMaI/VfNBuUcIpRcGEyVfxhSqvzEagImg5nxq+0fGcRXEVHYb7
         MAmw==
X-Forwarded-Encrypted: i=1; AL+hErHqpfBeCOd6zmYmGJE2D8xd9vrse8GRZ6N8SsNK7Xhh620F14KbqpR3KME8cAI2ArZhzVYKWksetE4NSjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vhkRqaab3IxKJZ85ToNtQp8Rxn2jPe9UYoMzVpLHumhkhiNy1
	fkQvhsITSDF7JyrzOOVMKvxDmDLEc102Xt7+cE0x4nEqqyDruR5l55R2
X-Gm-Gg: AZFdTZeUfYm0EMZC+5wK1C3ChjJBkiSXO13t4WNDYu9ScLGjIk1Z1xWfOInWTPjCb8T
	neHMu8ZGaSIRS7A0Fze6pmJ/GBmMrSxOmEWx7DUUSxgtjh47JMvZxef/AI1wiRa7qeySuKvjto0
	YQ2g5f5KflhBFt16kUftncbhzZf/s1t9y5IZnR7R6HKgNabj1lkHJcttidUZLKe4E1e3dnu4bX/
	fKTWtUjqemptSkPe2auDdIye+DVP4sWbbhWEn/U9xRvwr7ztmPvqhp5a3YrijyTRXbyEJzoMqVz
	kt7KYDcXQwD2i0khoXLOHTB0VcR0PAJvlmLSmJcENgHZYlA4BY2F3wu+wWno5OUKCQEbRRO75hu
	eqfSYDL6NyKH1/GAOSdE6iRu82VDVShKKFMsea7AuY+hFeQrECzS50szRB6rc965MnbXIcfTx+P
	s+jFo8VMtO26mkSHAGljZZ5Eu/2XniWVk7rd33wgsjuH+zgB6RIQ9DSjlsmNKy1xDoJthnsCtyN
	1DxAuIP2azKhV2ghPLruPuqoTR/Q8E8m/denCPZfun7PxJeq3C3UXZp28kBohlr48eWtiAJ63j4
	qJx30w5h5ibxgAx1TxNoNXsnhNI+KJ+hJao=
X-Received: by 2002:a05:600c:4e87:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb8881e95dmr376484565e9.33.1795622778314;
        Wed, 25 Nov 2026 08:06:18 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm33011838f8f.34.2026.11.25.08.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:06:17 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [RFC PATCH v3 0/4] wifi: rtl8xxxu: implement AP mode for 8188EU
Date: Wed, 25 Nov 2026 17:06:16 +0100
Message-ID: <20261125160616.1201001-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4161102f-dcdc-4780-9bf5-26961a1360c8@gmx.net>
References: 
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

Hi Georg, Bitterblue,

I tested v3 on rtw-next (18d0bedbb5f0, context fixes in patches 2 and 4
only) with an Edimax EW-7811Un V2 (RTL8188EUS rev D) as AP and a
separate sniffer. I found three problems in the AP part, plus an older
one that explains the duplicate pings.

1. Beacons. After hostapd starts, the 8188e sends one beacon and then
none. Probe responses go out, so clients still find the AP by active
scanning, but association takes about 6 s and a passive scan sees
nothing. BCN_VALID is set and the beacon function is enabled; the
hardware clears the beacon queue after the first beacon. In AP mode the
vendor driver (hw_var_set_opmode()) sets BIT(3) | BIT(4) in
REG_MBID_NUM, commented "If set 0, hw will clr bcnq when tx becon
ok/fail". With that there is a beacon at every TBTT and association
takes 0.5 s.

2. TBTT hold time. rtl8xxxu_start_tx_beacon() writes 0x80 to
REG_TBTT_PROHIBIT + 1 and clears bit 0 of + 2; the vendor
ResumeTxBeacon() writes 0xff and sets bit 0. On channel 6 with several
neighbour APs, 7 runs of about 120 TBTTs each: 2-5 % of the beacons
missing (one run 42 %) with the rtl8xxxu value; with the vendor value
0 % in 5 runs and 1-3 % in 2.

3. macid in the TX descriptor, which Bitterblue pointed out:
rtl8xxxu_fill_txdesc_v3() still does not set it; the vendor driver puts
mac_id & 0x3f into txdw1. The same function also indexes
priv->ra_info[macid] now, but for group addressed frames with a key,
rtl8xxxu_tx() replaces macid with the security CAM index, which can go
past the 16 entries of ra_info.

This is what I use on top of v3 for 1-3:

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 49c167fd6ee4..9a297b077443 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -1154,6 +1154,14 @@ static void rtl8xxxu_start_tx_beacon(struct rtl8xxxu_priv *priv)
 	val8 |= EN_BCNQ_DL >> 16;
 	rtl8xxxu_write8(priv, REG_FWHW_TXQ_CTRL + 2, val8);
 
+	if (priv->rtl_chip == RTL8188E) {
+		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0xff);
+		val8 = rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
+		val8 |= BIT(0);
+		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 2, val8);
+		return;
+	}
+
 	rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0x80);
 	val8 = rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
 	val8 &= 0xF0;
@@ -5572,7 +5580,7 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 {
 	struct rtl8xxxu_priv *priv = hw->priv;
 	struct device *dev = &priv->udev->dev;
-	struct rtl8xxxu_ra_info *ra = &priv->ra_info[macid];
+	struct rtl8xxxu_ra_info *ra;
 	u8 *qc = ieee80211_get_qos_ctl(hdr);
 	u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	u32 rate = 0;
@@ -5580,6 +5588,10 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 
 	seq_number = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
 
+	/* macid is the security CAM index for group addressed frames */
+	ra = &priv->ra_info[macid < RTL8188E_MAX_MAC_ID_NUM ? macid : 0];
+	tx_desc->txdw1 |= cpu_to_le32(macid & 0x3f);
+
 	if (ieee80211_is_data(hdr->frame_control)) {
 		rate = ra->decision_rate;
 		tx_desc->txdw5 = cpu_to_le32(rate);
@@ -7002,6 +7014,13 @@ static int rtl8xxxu_add_interface(struct ieee80211_hw *hw,
 		rtl8xxxu_write16(priv, REG_TSFTR_SYN_OFFSET, 0x7fff); /* ~32ms */
 		rtl8xxxu_write8(priv, REG_DUAL_TSF_RST, DUAL_TSF_RESET_TSF0);
 
+		/* The 8188e clears the beacon queue after each beacon unless told not to */
+		if (priv->rtl_chip == RTL8188E) {
+			val8 = rtl8xxxu_read8(priv, REG_MBID_NUM);
+			val8 |= BIT(3) | BIT(4);
+			rtl8xxxu_write8(priv, REG_MBID_NUM, val8);
+		}
+
 		/* enable BCN0 function */
 		rtl8xxxu_write8(priv, REG_BEACON_CTRL,
 				BEACON_DISABLE_TSF_UPDATE |

With these, beacon loss is 0.5-3.4 % at the sniffer and association
takes 0.5 s.

4. Duplicate pings. I can reproduce them with two clients, on one of
the two and in both directions, and not with one client. The captures
show the client sending the same MSDU again with a new sequence number
after its retry limit, because many of its frames are not acked: 62-73 %
of the frames sent to the 8188e carry the retry bit.

This is not AP specific. With the 8188e as a station of an rtw88 AP,
same dongle, place and traffic, 63 % of the frames to the 8188e are
retries with rtl8xxxu and 0 % with Realtek's v5.3.9 driver
(aircrack-ng/rtl8188eus with kernel API fixes only, on a non-RT kernel;
it crashes on PREEMPT_RT). I dumped the registers of both
drivers while associated and wrote the vendor values into rtl8xxxu one
group at a time. The difference is REG_OFDM0_XA_AGC_CORE1:
rtl8xxxu_start() sets the IGI to 0x1e (see c8bc37602779 ("wifi:
rtl8xxxu: Simplify setting the initial gain")) and nothing changes it
later, while the vendor driver had 0x40 in that test. With IGI 0x40 alone the
retries drop to 1 %.

A fixed value does not solve it, though. In AP mode with the two
clients at -44 and -52 dBm, IGI 0x40 removes the duplicates but loses
35-65 % of the pings. The 8188e seems to need the vendor's dynamic
initial gain (IGI from the lowest station RSSI and the false alarm
count). Bitterblue, is there a reason rtl8xxxu has no DIG, or would a
simple one for the 8188e be acceptable?

Georg, do you plan a v4? I can send 1-3 as patches on top of your
series, or include them in a v4 with your patches if you prefer.

Best regards,
Mehmet
