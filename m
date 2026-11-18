Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989986;
	b=GPaCTrA90X3fvoJw/5xhwLw7RoTYRNN2DPgzhSW5mhBCN2NtcqBhHOu1sYiml2nN8hPq
	 DqEtkgCkX2KJA3M/BT1kSk7y59NxrmRATdj08zRxa3GHPpuvIziGhwZqDkQqTcyKn6NIN
	 FWV1zoF0nvVRPS88BUt38PYb93SoXS8/MObXLrDtUChg2rEVp33D1h9LiTATbKLWC0Tdw
	 zE7w6EF3f5o2J1SZpf3polOXOukGlsRERKNCIzV7MioydC5LsT/3x1QeOn+73f+2wMocv
	 zFDvgGG66jnu3w3Rp5GMrAAPZoEefXwOrZrnhW/DJW6O6fr/5QGf9FFiZJ4gl17IXFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989986;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EUug9EhHnn02oR/iLTLhfO3Tu25qBjfgSKtYg+eIcHk=;
	b=ylGNJ28FdrwZsqgP2Q8tENoh8i9mdS4MouglekSgt1lyHalnvx2S53dYKvazzTwvtwU7
	 BKlS7WzHy+7I0F7diyBv4A94Yh9M+ountlSl6TIsHtVdWsmq5Vj6VyyMdkiUu2PzNmz1N
	 hXf63tpdU8LBXOwuNs7XbgTz+iKzMYrmwUjLSXKlMji9pfaHCZjhjQW5Q0u+BFK6Oi1rM
	 1scW+eduXvUPUE1U2WCGw/E2JXxSD9julZHFaHumOUAjklZBTFiWMQ9Dp297kzQQskg2M
	 W41s919frOg5u+QVXh2drDGwNInJAB1b+QCNKcf5VuiIUlM1IBVJpib5ZmQzgEHTZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="gJw/fRUS";
	arc=none smtp.remote-ip=95.215.58.162
Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EE0606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EE0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gJw/fRUS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ytzQ5XeBidt7fXi1H8oh5svqQ3UECQimFjn0eSE7LFU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794989984; v=1; x=1795594784;
 b=gJw/fRUSHazv8IchAHw9WuTr42/RAqmI2uxV1TvMlRcMDUSIONvrZ7IZSPbh9L6s7EKNbSDN
 eGtEOQRMv68TjiUlPJeaSkxrzuHy7225xliTaonYo++R9pZCTVUJI1SbmUIyc6iyL1BJ3gd8LA3
 2iO9Fc+eKkKSiuylEkit7B5E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 523ac45decf7a92b;
	Wed, 18 Nov 2026 08:19:44 +0000
X-Mizu-Trace-ID: 523ac45decf7a92b
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 09:19:38 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <20261117232624.1956815-3-mehmet.fide@gmail.com>
References: <20261117232624.1956815-1-mehmet.fide@gmail.com> <20261117232624.1956815-3-mehmet.fide@gmail.com>
Message-ID: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Mehmet,

One more thing in addition to sashiko's comment.

On November 18, 2026 12:26:23 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> @@ -493,11 +513,17 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
>       struct rtw_dev *rtwdev = hw->priv;
>
>       mutex_lock(&rtwdev->mutex);
> +     rtw_fw_csa_stop(rtwdev, vif);
>       rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
>       rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
>       rtwdev->ap_active = false;
> -     if (!rtw_core_check_sta_active(rtwdev))
> +     if (!rtw_core_check_sta_active(rtwdev)) {
>               rtw_clear_op_chan(rtwdev);
> +     } else {
> +             /* what a countdown may have held back */
> +             rtw_fw_download_rsvd_page(rtwdev);
> +             rtw_send_rsvd_page_h2c(rtwdev);
> +     }

As far as I can see, this check can still miss the station.
rtw_core_check_sta_active() uses rtw_iterate_vifs(), whose collecting
callback skips an interface if its GFP_ATOMIC allocation fails.

If the station associated after the last countdown download, its page
update was deferred above. Skipping that station here leaves the
countdown cancelled without refreshing those templates or sending their
locations to the firmware. There is no next work to carry the update.

I think the presence check is better fixed in
rtw_core_check_sta_active(). Its callback only reads interface state, so
could it use an atomic interface iterator without allocating entries?

Best regards,
Luka Gejak
