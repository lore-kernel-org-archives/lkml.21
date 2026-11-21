Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283678;
	b=YJw35dEWyhV3tR0jokB0VkL8F48C76+Ggehqw0RoJ/6D2ijzpM6XhQ37Bk/h6SgfNz3K
	 zHGJIkwlA3X1Yl2T79NpmapwPHgnAC1JWYxUefqv2xA+fQm/gaOAKs2RnnxonE/3vas5U
	 PT4UPiZPiN7t+8lmHvzUwkZ79XsXivpPtUCSsWQF+o+psdeqP1lvIYS9Ilq4cyyP6ju0C
	 1hNsC0AgKy9RfrZ0wfJ0pxaeMR7DOekP8D7rPwDgWJFRkYTbACF1tgLTdL8eytC/wWINQ
	 igUKWtSEXYtQfFdSB6Q1qZq2CU8/PBSLeCAf/ziq0OAH1JKU/HV749yeq4/MmM4GmHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
	b=K3rUTkYh3bAVqPZFXNUVLFUegp1HMcBah1ioNsbvs6V801xfQSu4Ni2i0l/PXGK+AopP
	 8irkQPvnxJehLp2dimt/DYwWVyZT2KbfZ7KELNEvHfCmG5Wc24VWx9SvQYeU/rAFlnN05
	 BcW5Uc5Jn+YAtAbmFb4KsQFIjRsbqZIJetFASxS2803UwlwRIEh04jbaTDSc7tY+/50bj
	 E18pl4RIypChGXSQRkmyhdGPUS1DPuIFq6cn9VaIp403aue4txSjSUolCBN3KbKIoaUQb
	 IqdbNsDpJI1K4jV0lCaEVStITF5LpZIcG2IOf9lZWH07rWlKaSj9zHDu/OJe6iyF8Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AcmbfQeD;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD049606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD049606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AcmbfQeD
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so2534419a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283676; x=1795888476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
        b=AcmbfQeDHF1SP1rK2vBlLSRVF766CGuZPoSMy8YGszfU7has5aJWhVIagP2sla7fGr
         BsbApheicPLt8y5qCtqium0lp2rRxlNa7Sww7sD5+LnXIJtmO/29N/BFV2dQApmhiqLh
         K2N+7b6pFvJ0dduqgAgIR43Na599F0Y6nqWNSuiXd0Iv3DSnsG4ZcTJ4bqlDaV+YnZS7
         uajU1LN1akKOoV/aLmQkZcoFexWiHWjIKqKCQop03M8WQXe/NOxvTawifJtaDqPV1K6C
         lNPJDP/YzeQk3+0UrC/EuNH6EQ9nY4dicqskyLIJFiORPQyvE4aUMR3OJ2wXrzbmX5Dq
         RRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283676; x=1795888476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
        b=zLjbTCli5T/ZzEsIjIk0NmOGpJl19gJa+7krRP7XYMeu0qYu8uBifwmC8YSNVf4AbQ
         JNPqpmHNSHUpOfBw/dRpaKCj4fSZ5oTx4a0ZOtI9yWW37iMsx4iF490tt2gmRbGiM5Ez
         5OJDpuWakjiJ+skoh5ei27truGD8ULRmcZCSt3vN8KQoFToyujzEAFLvdqCs91iyk+sQ
         tkmqPyP+3ytmUF4kLlPDyjqvj0b46IDExV8K3dqqw3aM3uckjcPTakbeVSKBC2QzbVqT
         89LyOeY2MZ9b11hRg+oBuVjPzGwxL/H8RRJ6CP++wr6kn9f7ZeLFY5OYJf03EfpEUP6A
         bm2g==
X-Forwarded-Encrypted: i=1; AL+hErGVT/fdWBPHJdD4W7iwCIjji6MIY2d5xe/0JH8nZ6mn2hl+Hf1qxt6DWQJ19fGaW52qdrcrH8dDXEMRBtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z87GJ9Qq8EUPrpMdz04zIaL4gtcYWIR/rsWYHiRshWvWGe7NXDX
	KR7VrwGqWe6ORO2R+byAU7ea0b71ApE/TeQcantgy7c4VBKLepqmga9kpEQinuC3dQ==
X-Gm-Gg: AZFdTZeViNNmN4rBhhV5sVDd4CMp5Qs+707/1WsUNXots+Zb67/nG80B+qiL5YK9TSq
	b7slyW+aiZ5/x2onke/9tXk1Yl68TAAszSa9bddi/sb315HcL5M7gAZsTTnipqYeNUEH7kH+OhV
	AzfRWrUTXvafsxhnEZc4J+6fzOCAdX2Mwkz11kmk0+KZTMZ1fX91f1wDK+WLgbtWUP/6um/dX2X
	qLJiwW4+SZs499NVgiT1kzrjDgr6EWQzNg6zSyQneh7vto9Ue7sEzer3fdUS7geZJA2NvUsYy0N
	ZLze4Zzmbs5l77ViWuZIOtCcGYl/QbL3Ht49J+J0zLSKMbZVNvnlhoofaVMXZheGtY9dLYseR/8
	jjLjRUBeUNEi1K0U6Y5q2TIUIWqXhSLw6FwMmFAi5iOqCU5p2Kdww2MdbfpIBJR7G9wV5zhgB6k
	xOjcvdIzwigDrwL21BuYsXO+PVxKEOcEslLVVJ+f99E5j/UzEeNVijyzYlc5uNI+e4Vx+6+Nm4Z
	7ySirmqJOl3JpONoxCQR8yzQkva7PRkm+2Vl6u8hDhOJDiRyDA3+M5XbMlCPqPh5u2zsXSGnk3Y
	lW1jZe6dMtqMozLHBzg1FljXjv+3QrdH52nIa1/OolKX7oMdlgqkruJx5cMjOhu6II10YGDpb6p
	G1NfWYG80JslLU3od00oJ4kOE0+RNH9gZ7y3WieR+0MdIU0qLAChC8R+XlDJaGfM9btnb1eUIuc
	bzke7CoHfMXLgB99tgFLe1LsoxIyKTVsZKarSrpai8FE7NegpDtKiA5MxJeoIvbudYaB5xj2Lji
	+qxJ7mcp7/n5mAxDjdrp526NtCJB8zmBdR+F5WYYEu5MBifUL0ewimHXuzXsME/ohKTD7hxPgYJ
	YKAxZDqvYCgaAAvitBmwdGYgDPap6XRiuF7HgTDSkE58gtOtJEanbxA=
X-Received: by 2002:a17:906:a11a:b0:c4c:d96e:80de with SMTP id a640c23a62f3a-c513a5dabbdmr467707266b.8.1795283676178;
        Sat, 21 Nov 2026 09:54:36 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm217895266b.80.2026.11.21.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:36 +0100
Message-ID: <20261121175436.648565-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
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

On 11/18/2026 11:57 AM, Jeff Johnson wrote:
> I'm concerned that you are taking an approach to benefit routers which can
> actually harm mobile clients (which want to minimize the number of CPU cores
> in use to reduce power consumption). I'm very hesitant to consider a series
> for upstream that could be detrimental to mobile devices.

Agreed. In v2 only QCA988X, QCA9887, QCA99X0, QCA9984 and QCA9888 take
the vector block, set by ce_msi_spread in their ath10k_hw_values.
QCA6174, QCA6164 and QCA9377 keep one MSI vector and no affinity hint.

> This looks like something that should stay within OpenWrt, which is focused on
> the AP, and not come upstream where we have to treat mobile devices nicely.

Without ce_msi_spread, ath10k_pci_init_irq() calls
pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI), the call
pci_enable_msi() makes, and request, free, sync and deinit make the
same calls as ath-next, so the client chips see no change.

v2: https://lore.kernel.org/all/20261121175402.644803-1-julius@bairaktaris.de/

Julius
