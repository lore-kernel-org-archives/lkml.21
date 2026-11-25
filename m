Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639036;
	b=dilnMGcsmPudUCjYxdtYYj3pIskW4kk07UQiM/pCN4ZL8a5IdlaJlpRWt67tZL+whyah
	 OV/LSZ/AXI5YXtrbMgJTSSprMwQlc/2s5aoRITzj9vpzNkCnG/RYiipUF6Vy+LQ7vjZBl
	 Z6hsBNsQZ7p3pTpjgh9sp02MH3DBvjAo3A7/TWb9NLs7igjP/nB7PL1Sx9Di9o0nHtBM4
	 jsFxRfdxP7xJpmB1diwop5lqpRr44fvlQFE29tcAkBtvr12zZCzi34oUGIzYp0VR38sVk
	 UersXwqqJi+2pVDtjUJk2WW0e0wtCN0XP7v0GXWyq0AFjd6+8deBUQMzlARO+HGqWlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uM94QE0TYPNheB2ffRJOQ/kVY8aqAYYyvQIO+dm/dJ0=;
	b=Lu/gmWxe+oiiAJRoc1FlxAZfL6dNKzfItfpXjRBWCzY5Qj+5AY6lv4m0M7jFxxRaG4ek
	 Fs8Iiii4I/cz9zgQiw60dRySIlcwpIbxEdLPJgUpO5X95Z20q8WeJaBFyHsXBoEY3IDNo
	 GHEEYeyi/LV1CH1HWsB50G/XD1R0dNE+QH1Vk4KRmHQzSZCJyehVvFlCOgXbxySf0vaJa
	 QHnhFZart5p6V8blUhdNhlchQ/L7VnZKQAJvSbyF0C7wgN1OgVupuJZBkggjTNYHhkH4r
	 cIp93W8TUi786G1w2tZMgH/Zz66h4QdXLpL5kltTljCEBKtosLOciAa5sHt6pqy6paw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vya3+18A;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B0E606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vya3+18A
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so29898415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795639033; x=1796243833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uM94QE0TYPNheB2ffRJOQ/kVY8aqAYYyvQIO+dm/dJ0=;
        b=Vya3+18Aqgr6G+X7cLOi23Eeff1ZPhQw9F9AlBmLx8ByXjYvJpXHeR2/U/SxGDS7w0
         W0L4vloGyAQ6RifY6OJA5E0KXH/42fR2yB1idRN2Qwptb+qYPpcFVkbbDd3JOyvaxyox
         3FxJvyCGVp2dbxVdGc82w9xMCxZxSzL0BNSL/WX7yotN0LPoLDiOb7xxZYxEYi4wQiZb
         Ol7DDP4b6LfY7D0AsxDRNWAqLZFAhxMUcEBIAFiueSSO54mVInISUIwjunJkVpnQX8l2
         X+95gulqzvOKDl+mTAW1feMP6q0tkPLg11HTBMdcQbaSfQgDMNf4C/Mi568tVDToUQ8K
         rWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639033; x=1796243833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uM94QE0TYPNheB2ffRJOQ/kVY8aqAYYyvQIO+dm/dJ0=;
        b=FqMmhWd7qqz5GqW/zVohQr3Qu2xixyorwBCEwT3KP/2rfJbG8H6Rn32CIi46iuNB5A
         ubmuOhPXImX4frqUW+Vol9vS+a/zusF3XesusmERfwApAdUQ/lb1ZWoEMk+eBIv2JRAT
         UcvQ1s26oaggxOrGRB2Mxq5A8CZIYP8CWNq6Dh+KD5wtcE8vVTRQhdrX4cSVad0IqZLN
         YxoZKcAmsbOZmiGnuZsMpCu00rkiXKpScAmdJpNOonjuJZL2/ZhGMBLa98begwtZhJdk
         VcQFndCec09zvV+E4Hh+vPmVaWiDiTvtEaxg1K6AI1YLMyhUYn7ofN3bWd9JSdbJLKRc
         BUZw==
X-Forwarded-Encrypted: i=1; AL+hErH16q4qnWzRD1hUXiNU8JHAi/vqhcLpIi6WYsTbj8LtO79LJcZJuM0B9oegn4+pCjWbqriSU1tHrZtP86M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oQccKiUeiyZtA0HYxBI6/yazrcOikTVYBWZlDInC+1+obfpDQ
	joSkIEPGqcxEknt9M3T+TwFmbvO9EIZTWYkla22TJ7ULSxImXbklVTVgWjmiUDQ8
X-Gm-Gg: AZFdTZfQNJ1m6vxx7tdN5jqE37tyMv+pZ03n+JbYPc8D9i/g04AYRrX+7t+LqwDcPFq
	vDDI0AxIjnXAqiETTm84CfEBvJJmS14T3SUBNULB6DfSIXLn4kRWH0Xcj5Xs/Zabkg85SN0QQE0
	YZo5Wwj32naYrHZcuziLUw+8/J42dCdM8la5MfMWmx/ZFl5a2gY6EtfvfhHGC/vClOBn2n8JCqy
	fUy/MspusOcUbbrgWHAhuwPwUqyHKM40/C8rA9QtEVRO9H8kAdNbp9b+++3D9wz7UZd1rZ+9BhG
	bwjP6Kf+rUaEzHsRuPkn6+bZrBHwQ56MjF1ZXKjZprmw6b3P2hxeMROJSqsqbQ/TLM8sshHded1
	hsQLrGOOy0EnFN4PClgxbcOAwr1+u2iB9AKMg1kV6JkVd3kV8WaHYKV7X4I1AIstegAKzylFq8C
	23MGpqijaJOKyyyCmHm95d8xANoEY9NjURLwVppKBjHE68TYwLPNhmNYzSxATEEpnrFmtk9Kk5w
	ApQSRBlvB8wSpOamYp4NiYpyWBXkfAigieYR2Opwx9ERsUt5R1/XzBgMC9UHVkVfH42C9jl07eC
	MUwlXR44lXHJDGqYjL9OfrGrZA2/CW7gkHiFJA==
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr266635275e9.10.1795639033378;
        Wed, 25 Nov 2026 12:37:13 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1006004155e9.4.2026.11.25.12.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:37:13 -0800 (PST)
Message-ID: <2db4b526-1809-4ef7-8fe9-87b6cfcea6c9@gmail.com>
Date: Wed, 25 Nov 2026 22:37:10 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/4] wifi: rtl8xxxu: implement AP mode for 8188EU
To: Mehmet Fide <mehmet.fide@gmail.com>, =?UTF-8?Q?Georg_M=C3=BCller?=
 <georgmueller@gmx.net>
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
References: <20261125160616.1201001-1-mehmet.fide@gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261125160616.1201001-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2026 18:06, Mehmet Fide wrote:
> Hi Georg, Bitterblue,
> 
> I tested v3 on rtw-next (18d0bedbb5f0, context fixes in patches 2 and 4
> only) with an Edimax EW-7811Un V2 (RTL8188EUS rev D) as AP and a
> separate sniffer. I found three problems in the AP part, plus an older
> one that explains the duplicate pings.
> 
> 1. Beacons. After hostapd starts, the 8188e sends one beacon and then
> none. Probe responses go out, so clients still find the AP by active
> scanning, but association takes about 6 s and a passive scan sees
> nothing. BCN_VALID is set and the beacon function is enabled; the
> hardware clears the beacon queue after the first beacon. In AP mode the
> vendor driver (hw_var_set_opmode()) sets BIT(3) | BIT(4) in
> REG_MBID_NUM, commented "If set 0, hw will clr bcnq when tx becon
> ok/fail". With that there is a beacon at every TBTT and association
> takes 0.5 s.
> 
> 2. TBTT hold time. rtl8xxxu_start_tx_beacon() writes 0x80 to
> REG_TBTT_PROHIBIT + 1 and clears bit 0 of + 2; the vendor
> ResumeTxBeacon() writes 0xff and sets bit 0. On channel 6 with several
> neighbour APs, 7 runs of about 120 TBTTs each: 2-5 % of the beacons
> missing (one run 42 %) with the rtl8xxxu value; with the vendor value
> 0 % in 5 runs and 1-3 % in 2.
> 
> 3. macid in the TX descriptor, which Bitterblue pointed out:
> rtl8xxxu_fill_txdesc_v3() still does not set it; the vendor driver puts
> mac_id & 0x3f into txdw1. The same function also indexes
> priv->ra_info[macid] now, but for group addressed frames with a key,
> rtl8xxxu_tx() replaces macid with the security CAM index, which can go
> past the 16 entries of ra_info.

RTL8188E_MAX_MAC_ID_NUM should be 64 (hal_spec->macid_num = 64 in
hal/rtl8188e/rtl8188e_hal_init.c).

> 
> This is what I use on top of v3 for 1-3:
> 
> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
> index 49c167fd6ee4..9a297b077443 100644
> --- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
> +++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
> @@ -1154,6 +1154,14 @@ static void rtl8xxxu_start_tx_beacon(struct rtl8xxxu_priv *priv)
>  	val8 |= EN_BCNQ_DL >> 16;
>  	rtl8xxxu_write8(priv, REG_FWHW_TXQ_CTRL + 2, val8);
>  
> +	if (priv->rtl_chip == RTL8188E) {
> +		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0xff);
> +		val8 = rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
> +		val8 |= BIT(0);
> +		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 2, val8);
> +		return;
> +	}
> +
>  	rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0x80);
>  	val8 = rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
>  	val8 &= 0xF0;
> @@ -5572,7 +5580,7 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
>  {
>  	struct rtl8xxxu_priv *priv = hw->priv;
>  	struct device *dev = &priv->udev->dev;
> -	struct rtl8xxxu_ra_info *ra = &priv->ra_info[macid];
> +	struct rtl8xxxu_ra_info *ra;
>  	u8 *qc = ieee80211_get_qos_ctl(hdr);
>  	u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
>  	u32 rate = 0;
> @@ -5580,6 +5588,10 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
>  
>  	seq_number = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
>  
> +	/* macid is the security CAM index for group addressed frames */
> +	ra = &priv->ra_info[macid < RTL8188E_MAX_MAC_ID_NUM ? macid : 0];
> +	tx_desc->txdw1 |= cpu_to_le32(macid & 0x3f);
> +
>  	if (ieee80211_is_data(hdr->frame_control)) {
>  		rate = ra->decision_rate;
>  		tx_desc->txdw5 = cpu_to_le32(rate);
> @@ -7002,6 +7014,13 @@ static int rtl8xxxu_add_interface(struct ieee80211_hw *hw,
>  		rtl8xxxu_write16(priv, REG_TSFTR_SYN_OFFSET, 0x7fff); /* ~32ms */
>  		rtl8xxxu_write8(priv, REG_DUAL_TSF_RST, DUAL_TSF_RESET_TSF0);
>  
> +		/* The 8188e clears the beacon queue after each beacon unless told not to */
> +		if (priv->rtl_chip == RTL8188E) {
> +			val8 = rtl8xxxu_read8(priv, REG_MBID_NUM);
> +			val8 |= BIT(3) | BIT(4);
> +			rtl8xxxu_write8(priv, REG_MBID_NUM, val8);
> +		}
> +
>  		/* enable BCN0 function */
>  		rtl8xxxu_write8(priv, REG_BEACON_CTRL,
>  				BEACON_DISABLE_TSF_UPDATE |
> 
> With these, beacon loss is 0.5-3.4 % at the sniffer and association
> takes 0.5 s.
> 
> 4. Duplicate pings. I can reproduce them with two clients, on one of
> the two and in both directions, and not with one client. The captures
> show the client sending the same MSDU again with a new sequence number
> after its retry limit, because many of its frames are not acked: 62-73 %
> of the frames sent to the 8188e carry the retry bit.
> 
> This is not AP specific. With the 8188e as a station of an rtw88 AP,
> same dongle, place and traffic, 63 % of the frames to the 8188e are
> retries with rtl8xxxu and 0 % with Realtek's v5.3.9 driver
> (aircrack-ng/rtl8188eus with kernel API fixes only, on a non-RT kernel;
> it crashes on PREEMPT_RT). I dumped the registers of both
> drivers while associated and wrote the vendor values into rtl8xxxu one
> group at a time. The difference is REG_OFDM0_XA_AGC_CORE1:
> rtl8xxxu_start() sets the IGI to 0x1e (see c8bc37602779 ("wifi:
> rtl8xxxu: Simplify setting the initial gain")) and nothing changes it
> later, while the vendor driver had 0x40 in that test. With IGI 0x40 alone the
> retries drop to 1 %.
> 
> A fixed value does not solve it, though. In AP mode with the two
> clients at -44 and -52 dBm, IGI 0x40 removes the duplicates but loses
> 35-65 % of the pings. The 8188e seems to need the vendor's dynamic
> initial gain (IGI from the lowest station RSSI and the false alarm
> count). Bitterblue, is there a reason rtl8xxxu has no DIG, or would a
> simple one for the 8188e be acceptable?

I think the reason is just that nobody implemented it yet.

> 
> Georg, do you plan a v4? I can send 1-3 as patches on top of your
> series, or include them in a v4 with your patches if you prefer.
> 
> Best regards,
> Mehmet

