Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780773;
	b=z9WgPmZoc6mrZoLZMhP3y+cLf0WBgxVTmZ6RBeBqYVxVww0GwaXifKZDYgWUuZnJXkcQ
	 K+/IR/8IQpy25rAdV4PY28cZKgcaF8kKZw+pK3p9X6I2izKWC+of4pJsE5AFvnyTlfeKa
	 kim5SAuWV/AcbwEUOek270cJpnCDhHkP6vIw/gW7yltMKZnTXfqhDmT65WddIOz/i/1Dv
	 Vz5e3CSSW+3Qxe0e8BPl0Dg4JGh9kQHZqeIyPexUZ5eHR1ZHYhYozaI8M20CVCNTiPAts
	 yMiJMxPg5bwEp2FU5Pmd+lLAwJCrDPt3Kd6Sgz8XRXOnSmUORa414VjNebDbjl57ucg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780773;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9yn1iJxsbh46IrDULLLZ6bzkEUJL0/EuHJ2oxf+uClA=;
	b=Lzqxucf4hW72sb3Naqo2NHVPukYV8BSPSyZd4zlUCforRC0kfc58LmWOLM8RIsnQqdbt
	 ywz5TNBTH4Hp5pGOjsKb1FGkZPeq12PABB22JqcZ/ir5m5OcgX5INEioPjV1NT7zNlk9p
	 PQvgHhDY3ZCFDrdVpfZLNlDnCXcEw0JDJvpl86inMB57pi9HPr6Hp+N4Y3JgwqDSpdV36
	 SYGyC/NTbmimL2f9X90pcw+ETRPPJHGuQjMlccL53Bpexjphi2mST5miFIh2cg5KL9L7T
	 bqsaT7u49tQRm74BiJesKod3iFRa/p1mNxRYiGNiy57Fo23RI4t0mBQvSD5MCGLWYMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BGsNUWsP;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ABA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73ABA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BGsNUWsP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pzIAnmEIIV52PbP4rMlcMPnsFdTKL6Y+oHxJNALrQ00=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795780770; v=1; x=1796385570;
 b=BGsNUWsPXVDDkkjnVAXiqlkAM4O6VUER6ZzyrMEP+j3honaVJFBTAUYfuPE9Z7MDdcilLSOy
 2W4nPZig5iRX6fKec+2bUUD+H7rzg9Go5QE5XVmVmr18khr2vB2BPEBUfN2grczj5SbYcnv50Mz
 gFwccPHf17jCpaG6JreChbEw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 101eb2955bf02fce;
	Fri, 27 Nov 2026 11:59:30 +0000
X-Mizu-Trace-ID: 101eb2955bf02fce
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>
Subject: Re: [PATCH RFT rtw-next v2 2/2] wifi: rtw88: honour the retry count and NO_ACK of injected frames
Date: Fri, 27 Nov 2026 12:59:29 +0100
Message-ID: <20261127115929.40205-1-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127-b4-rtw88-inject-v2-2-f9701b9243a3@proton.me>
References: <20261127-b4-rtw88-inject-v2-0-f9701b9243a3@proton.me> <20261127-b4-rtw88-inject-v2-2-f9701b9243a3@proton.me>
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

Hi Ahmet,

Thanks for the update. One comment below.

On November 27, 2026 12:00:00 PM GMT+03:00, Ahmet Zeren
<niko3x@proton.me> wrote:

[ ... ]
>  	info = IEEE80211_SKB_CB(skb);
>  	ieee80211_tx_info_clear_status(info);
> -	if (acked)
> +	if (acked && info->flags & IEEE80211_TX_CTL_NO_ACK)
> +		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
> +	else if (acked)
>  		info->flags |= IEEE80211_TX_STAT_ACK;

As far as I can see, ieee80211_add_tx_radiotap_header() sets
IEEE80211_RADIOTAP_F_TX_FAIL for a unicast frame whenever
IEEE80211_TX_STAT_ACK is clear. So with this change the monitor capture
can show a failed transmission even when CCX reports success.

Could we check for IEEE80211_TX_STAT_NOACK_TRANSMITTED there too? For the
test in the cover letter, I think we need the raw CCX result to tell
whether the firmware actually reported retry exhaustion.

Best regards,
Luka Gejak
