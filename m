Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795867702;
	b=GuYi3yzDuUmXJw0FOLspF7tNvHS8X4faxrEtbCafg3gu5/VQgZJqYpBmEOw4wTtWB5Gb
	 g0YLEMSPa4HwSKpq9vh63bc+roiAG4UwNkLmpP74bR0Sz/NON2xPPLzq2ejAMIFlWkvnO
	 dXtpKdAFhP9KfmyyhA3EuMCpBFXA6ME6ytkncV3L6miFlxRqCj47xZC09nuoIvZ6qFt0J
	 LabJSkcGFqicCKtfoS8Mnb/wuysavJ743XUQGc6kOQw3MCCUbh+PkHokTCi30t4bR/BEI
	 z/MzR7Sf9RxBPb+yCIUSACafuOSeFbM+g0mJZbB3bJ+2BMZ9cyY/xStKmXhDtYZ37dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867702;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ODl16E8KXgfksgXPCf1teoNDDtT/w6wAcEpA8bErby8=;
	b=4yvZQe7+wYS+Wm2KEI+oMHSQBtBiE/VIWhaqNb2yvyp5OBPwkdamknzOkJNPiYzurN/f
	 E9yXWpMW1df935NmN7N6jlCa0toQ3oqfCioVzabzTDlwNS9YXSEYjU0EQ8udfDPrnsOv4
	 R4ZQzSRur4kQ1vlyHhThsjgXNvqWNQ6Zhwjp4F3EHWyhUAWm0qN9PjJ6LBqlfGEFMfWgJ
	 4BiX9mfLTaADSgApat1aBMTHtEGOnlSOvI7EH8Vs72jQJQ6GrzI08//bJ5UPFJe2AKMbH
	 4ZFQw5TIbo+6m6I5aUGpINFs+lRw4Qo5I7lUnHod9VEEaPTgb7jOxMdK2DVaVIGlkdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lEpsgMY0;
	arc=none smtp.remote-ip=91.218.175.153
Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A71606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lEpsgMY0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z2McixSH+wdtJom92EHTKQ4A+3QLj1zEhPo1ydXwJXA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795867699; v=1; x=1796472499;
 b=lEpsgMY0aC39WPjE23/cfJq1BtwCzcBxGKhVKbFj2QzXr8/QZa5eEDeZViFex+U5VNwOwFgM
 XeJ4RMEqo8fOAs7JeuftZOKSUXJTJSBEJrG+HI6Odx5X34Gbwp3UMBnuFKwp29S3XNSeR2MmYYA
 tSAqu4nvgyANN1Qxty/0xMvA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dd07eafdd2a5ecad;
	Sat, 28 Nov 2026 12:08:19 +0000
X-Mizu-Trace-ID: dd07eafdd2a5ecad
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v15 2/3] wifi: rtw88: support channel switch in AP mode
Date: Sat, 28 Nov 2026 13:08:16 +0100
Message-ID: <20261128120816.36110-1-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071858.42275-3-mehmet.fide@gmail.com>
References: <20261128071858.42275-1-mehmet.fide@gmail.com> <20261128071858.42275-3-mehmet.fide@gmail.com>
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

Hi Mehmet,

Thanks for the v15. Two comments below.

On November 28, 2026 8:18:57 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> +		if (rtwdev->csa.count == 1) {
> +			ieee80211_csa_finish(vif, 0);
> +			goto out;
> +		}

As far as I can see, the AP moves to the new channel without the RF
calibration it gets in rtw_ops_start_ap(). The channel change sets
need_rfk, but rtw_chip_prepare_tx() is only called on the managed
station path. On the RTL8822C the watchdog can then adjust DPK using
the thermal values recorded on the old channel.

Where should we run the AP calibration after the retune?

[ ... ]

> +			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;

You confirmed on the RTL8822CE that when the station stays on the old
channel, mac80211 accepts the AP switch and then stops the AP at the end
of the countdown. By then the AP has already told its clients to move.
Could pre_channel_switch() reject the request while the station still
needs the old channel?

https://lore.kernel.org/linux-wireless/20261124083130.206249-1-mehmet.fide@gmail.com/

Best regards,
Luka Gejak
