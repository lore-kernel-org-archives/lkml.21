Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119765;
	b=P0F9drEF1C4p6GAynFXGBYVZTClmq0SE8VWURCqU4VWa9Fv7J7Z4saDzdaFBxRwi8elG
	 2ZvJTLketKTLe1Qf7glnNQJgVdV5Np+pLwy5D//W9B/wDKJvfR8tOB3VC8AbpQmW5z9HD
	 OZ0lduQfhQ0ut4VReNp0EGNuaFcFTIMBDsEWY6fBabSIAM+TGLrdan/dWdo32s6lOAixT
	 TN7zX8+uGbynHYB+mhdreEgClIxNVedL3cjHTL87Q+jpgeoKtq/x0WON50+Cn1Zb+ws6O
	 L182n5cEl59ksHiYBk/MIYITGDACM8EZhMAHQrlBQXeiKdXD41JQ0X8Bp1H0RXOoFdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119765;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mgVpFkBiyzs2DPlioXUTpvfQdmQUI4RfrR5rU4gK4FQ=;
	b=SDxt2NJv+kJzuFmO9eoFW2E2zq2ABKjRHz/ebfRbG+O1t7wZmXm8fAEH5QLDXXHVOkwv
	 KPCHMdPLNNOwSAD05ccnLBMyFyGEafxuTRvf6/HnTg0fgkMeRZK+7ZjhdVcbopWGrDX8G
	 hoCV4HxbzH2lALTjOFpDHS/QaXwpl8O+0sEww5gdiQ55iBUuI1CSlQ1vvk+fvIsg7OLTw
	 rz9cT8T16SpjpmXcdaytJ94GhhCI30LWw7ECUcB6m6br1lqVE9pW7qUd6F+YiwR2XW6eg
	 fwxO9EUqxR9CmwUcSSsfyEecAd+nwkaJ0CkxO86kB+LBmahQyb5Zur+fp2Y8Fc2KOmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=EAMgXLdj;
	arc=none smtp.remote-ip=95.215.58.165
Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76560606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76560606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=EAMgXLdj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=q96NL1S2dvdtT4JxbppSch+QLobZqj7yWTN8oU6f9xM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795119762; v=1; x=1795724562;
 b=EAMgXLdjv8XLc/w9HINIl4KOdCUW3oowuctYznZYirkxYzkgSO1RmQZdO9BXVpOVK/y8DGt7
 EAWM2GmYFp67uBTpuGa7P+2/ueYrwp5S7EKdrwSqP4qQ81c9q5Mtn3nQSJpFqKFBBv7vkgRt0PD
 LWrYcVY7l5Uofj0T9TQiBrqTc1xUs6befcr0Ki55ywNXHLgOciQV/zGOSjatd7KRhr2DPxXGG2i
 2gOE2z6ghVXe89kCqko2/cuwJtlqJcHChTdOOFVghJSAufwfODMrEtv6fDWZvIyi8qqX9VWdWaq
 P6q+3hmnobYIr2+XFm3+IIU6L2VxzEmYXLpOlAwMB7anw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d0be6c136bf3c826;
	Thu, 19 Nov 2026 20:22:42 +0000
X-Mizu-Trace-ID: d0be6c136bf3c826
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: jwboyer@kernel.org,
	dwmw2@infradead.org,
	ben@decadent.org.uk,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	litien.chang@mediatek.com
Subject: Re: [PATCH] linux-firmware: update firmware for MT7925 WiFi device
Date: Thu, 19 Nov 2026 13:22:29 -0700
Message-ID: <20261119202229.150946-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261020013839.523295-1-jb.tsai@mediatek.com>
References: <20261020013839.523295-1-jb.tsai@mediatek.com>
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

On Tue, 20 Oct 2026 09:38:38 +0800, JB Tsai wrote:
> File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
> Version: 20261016233029

With this version, a NETGEAR A9000 (MT7925, USB 3.0) sometimes stops
sending partway through an upload. Within about a minute the driver
resets the chip and the connection drops.

    one-minute uploads at USB 3.0    stalled
    20261016                         6 of 21
    20260813                         0 of 26

That is on two machines, an AMD mini PC and a Raspberry Pi 5. Only the
firmware file changed between the two rows. On 20260813 we have seen
the transmit queue stop like this only when an AP switched off one link
of an MLO connection, never in a plain upload.

When the driver gives up, it logs:

    mt7925u_git 6-1:1.0: Message 00020016 (seq 5) timeout
    mt7925u_git 6-1:1.0: timed out waiting for pending tx

Devin
