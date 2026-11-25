Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643436;
	b=hDHzm9qxrbbMl2HcGcCmE1BF9TItZjEF9Xq6B1AeB9Hx8evUubF6uK7kvAZ6XV2zHRo6
	 a3bytSbY7m6jkQS83VFHYebm7fUvS1FzQQTIP4Oz8m4ABs6DtLOQ8vrAGvgkNZw+OSaBK
	 pomU7lXWMXx0gOmf28/WWIlkCFHeRJOlS1gopauHGF66WgAT7sEg7jMzQStmsw4A5SUio
	 8UwSPJho0ssikjOBObn2KI5eXILQd9RGua1j6c4PvbEsSdsllKYFvkOwWpTNK5GFIJr6q
	 VWLrUwoloq4ozB2Q0oRVIGHIu7DqgygXIQtfO3a2QTYR6TrSr8NR4E0LeKAKMCVRRlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643436;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V+3TiGy3sSxyhaiGHLZNJdGYKiQc1BwWZ3abIKtTVCI=;
	b=4Pb+SL0ZmxpdTR2t7jOaPDuL3k0/AzKEmlwPVRBymCIp848KuUZe07dclEMm1Z5HlRFL
	 KhF5C28812vStcRAuN55ln2EEdHwxaLpRVHr+DM1UCwW6zTMYpP07BlP+mIGu6LJz2vPA
	 c8UBEvK8B9/DQHIorH5SAwemhuhQUg7U298Dn1CVQDvXsOHZTaNkKEpmNBSDXT9cPbXAG
	 VTmEcskaqbe2Yg0K7CjmrvRVkjETHEEt/2KOFqtzXDAi2KVAcUV9fBSuJ74jiSRkKmQAN
	 Rxw06oCvo8bG/Fibo81i2QkX5iD+dqUiorP/Ob0XN/cplo7mW8Va0ZHqismktZj1EQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mhC7wQyz;
	arc=none smtp.remote-ip=91.218.175.19
Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C94606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C94606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mhC7wQyz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=d9tmaEDaam3zf5/opnl/lrNgub3N6fRlqVdGEjaEfQI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795643434; v=1; x=1796248234;
 b=mhC7wQyzyom0rbpREeoED+gM/ek34ln0QIlDHcpd/3nG0vuLDuYXXHt/dex3m8ykeSnwRDK8
 23gr5VAH4hTbFL357i0IqbEVMyd86upgt6z6IEIOFoOVr7cs5uE7AMZNqTFsyZsChHOlkWgksxk
 TWMyf5iUJbo6gXAxidCmGJeg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66bb3235c50c3afa;
	Wed, 25 Nov 2026 21:50:31 +0000
X-Mizu-Trace-ID: 66bb3235c50c3afa
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 22:50:30 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: niko3x@proton.me,
 Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 linux-kernel@vger.kernel.org, Ahmet Zeren <niko3x@proton.me>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFT_rtw-next_1/2=5D_wifi=3A_rtw88=3A_use?=
 =?US-ASCII?Q?_the_rate=2C_bandwidth_and_GI_of_injected_frames?=
In-Reply-To: <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me>
Message-ID: <8E47D781-B1FF-4B2F-B0EA-AABA130E2778@linux.dev>
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

Hi Ahmet,

Thanks for picking this up. One comment below.

On November 24, 2026 11:32:30 AM GMT+03:00, Ahmet Zeren
<niko3x@proton.me> wrote:

[ ... ]
> +     if (rate->flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
> +             pkt_info->bw = RTW_CHANNEL_WIDTH_80;
> +     else if (rate->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
> +             pkt_info->bw = RTW_CHANNEL_WIDTH_40;
> +     else
> +             pkt_info->bw = RTW_CHANNEL_WIDTH_20;

Do we also need DATA_SC when the requested width is narrower than the
channel? The RTL8822B vendor driver sets it alongside DATA_BW for HT and
VHT data. Here we leave it at zero and program the primary subchannels
through REG_DATA_SC. I am unsure which one the MAC uses with USE_RATE set.

Could we check that a 40 MHz frame on an 80 MHz channel goes out on the
half containing the primary channel, with the primary channel in each
half in turn?

Best regards,
Luka Gejak
