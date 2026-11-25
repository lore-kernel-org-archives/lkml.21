Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641274;
	b=xlDJuArvwObJcL4aeban8fqZq81w0/CqJRRkY0JTe35EsFCpHZDhBhKBxgqOx3A0kMbm
	 oAYnkJIoY/xk0YMFep7980ay6vl44VD0K2zdqkurZ3DyNxd1AVE4Un/pLzl8r4tG35w5k
	 dDzk7LLCBYd66jYPiLM3+QZOUQQ+IFWqD6KX1DcwuolCWwqn438Flh3IKn/G2ZdxNN7xA
	 lVYDpK5Rcgd/DgcYdT71wIQhL5aNORPFdNWHpicgTnNsrC21+D2Xx8L7/1ISFOXH9fxBM
	 64VYpoNuiZh1eiEVUz9Xue0h6/vcNYYQRgDbRre84rVgltIcuou51XATQl8rLldgvQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641274;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zUMdJPi51RnBiU2zfEycf5XIIbWugmRYe7gtZhzzZm8=;
	b=xRJdgv6ojdHpemjfCPCqp0nov+KN+hbvo3UG+cAg5072DL+21Ge8guyUmF52Qs1rbXL9
	 oWHtA1vB/p3gEBMHEED/xnFHRIAMytP6w755V3qyX6ajsQQpIDI2mdmpcdAS38aKfFCOD
	 /Hug06bdSSLUbNd3mrgsIbdiXeF4v9RyMfGQdDiMhjZvPMWrmDudjiaaFU3ngO9toOCOR
	 tRhaKY8yMNOwB9obxQ6ub3NiYzbtez7NTfg5lkLfIJjxd+Oixj3Xh8VDSaFJCLFS7rCJ7
	 i5TCvz+QeuKDfzCTHQDvWVLtTKZVCM3+J9uRKPukWW6bI0Iybbj+1IJC9eU+VN1Sbjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="RwqFoJ/D";
	arc=none smtp.remote-ip=95.215.58.185
Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDE606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DDE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RwqFoJ/D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RKZsk0NS8mynIgA4hnJhFwJTH5k76SHJsDIZ2nxGxXM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795641271; v=1; x=1796246071;
 b=RwqFoJ/DwCGk5JBwOVBRAn2J2Dnm5G4YBeHsAuOkNgfASq6FlYhazCbq6gemNk/n6N7piTbh
 YmLfk7/F3xYG0i++iJWXojuDSvNEb+j4/pUhjIs/PaR2qdSGysx/j0QS9Sqph7FLz4Yqf35sojj
 BInX+fMJ6k3iL0GumPdIBLec=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 125b1af2ac55a052;
	Wed, 25 Nov 2026 21:14:28 +0000
X-Mizu-Trace-ID: 125b1af2ac55a052
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 22:14:25 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
CC: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4=5D_wifi=3A_rtw88=3A_8822?=
 =?US-ASCII?Q?c=3A_validate_bw_and_nrx_read_from_registers?=
In-Reply-To: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
References: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
Message-ID: <E6ECB3B5-5DEE-49A5-BDDC-0F20CE84065F@linux.dev>
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

On November 25, 2026 9:37:53 PM GMT+01:00, Zeshan Ahmed Nobin
<zeshanahmednobin@gmail.com> wrote:
>rtw8822c_phy_cck_pd_set() reads nrx and bw from the chip with
>rtw_read32_mask() and uses them as indexes into dm_info->cck_pd_lv[][]
>and rtw8822c_cck_pd_reg[][].
>
>When the chip stops responding on the PCIe bus, register reads return
>all ones, so bw and nrx both become 3. bw = 3 is past the end of both
>arrays.  When the chip stopped responding on Ubuntu's 7.0.0-43 kernel,
>UBSAN reported:
>
>  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
>  index 3 is out of range for type 'u8 [2][4]'
>  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
>  Call Trace:
>   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
>   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
>   rtw_watch_dog_work+0x217/0x330 [rtw88_core]
>
>nrx = 3 fits in cck_pd_lv[][], but rtw8822c_cck_pd_reg[][] only has
>registers for nrx 0 and 1. The entry for nrx 3 is empty: register 0,
>mask 0. If bw is valid and the level changes, the driver uses that
>empty entry. rtw_read32_mask() then shifts by __ffs(0), which is
>undefined; in a test that faked only nrx 3, UBSAN reported "shift
>exponent 64 is too large".
>
>Return early if bw or nrx is out of range, before either is used as
>an index.
>
>Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
>Cc: stable@vger.kernel.org
>Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
