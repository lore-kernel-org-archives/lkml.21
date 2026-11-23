Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426932;
	b=VnomzYKR8usdgx20q3VnPJmANk3rLdIcwzYEXKlK26Xg9gDTczbHDygp/UX9+FvQP0+g
	 7s8ZJI+ov/G9lv6qBF4BkHOKLTBgDIigtZ0B/yilVlI9sEu3U30nTHqqmjOQm1suReQ+R
	 xiQEU4MJd05D+rRM7AGzv41LEGc2Zf+FcocG0QYxF/SLgBYaxJBBOnI9szXMxxLmpU73j
	 PMvhQR2e+Wwu3qMejDjF19KVoYJ3ge+LuyLUaELpk9E9/2/g+LsKD9JM4H329ZnpUvuuV
	 HiKlirKRN7C/rQv+y6l02K7Y+/dVH/fJMFrgHC2glBb8M1W9WWV4Mf6ftK6h1aCrIgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426932;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tsSv8AXKdn74dLQqZ+Pw+96MlkzYgFsnQpQ9ZDWK5PU=;
	b=ZmEuRwVPlsrFvJc0SDaopM8BIi3vZcB+1vcDmqnLB31gr/svWD3S/qI7Ogfbkck1mLqz
	 bOS1tFMhKvj3odkxQSKvD71QUbqZ3o4GL2REr+1SyEM2em4OLVnOuvFKmnVLNwHy1G2ae
	 bzXokb+VXPEw3JgfCWDan9tyoLWKsQQNRipRGO9uxG9NSYtKWTKEt21jV9bePbGVIgjgD
	 xnK6U4FLm086wDN/EnNu/jV/DWLX8wBy9Pz6A6/o+PVYscBqtxUV5MNTlzBH9sIhjiXiG
	 LceSltenwT9SOjQz5RB4NoekwW56Tq1EnZyB6vVqzexHA0Y7w5vy9ra8909w8bfeM1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Su5MkqYw;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642D606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2642D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Su5MkqYw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795426923;
	bh=S24fkSd1EQP4rOBdYiQSTxbzQ48LBCI/965cSSyCzRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Su5MkqYwPsO9vse+8XqNW5Uhvk5SiJLPabfmUZfHNJsWpR57AYGiuf0lo10BcXv90
	 Ezt1PCg43uVdg3RErbBCm4JMQ2Oa6oQ253vvGTomD+v3jtIlbNdlXo6qpB5cnopg0N
	 ubd7BSovGhNtLNnn36XotKtX5BE6gOebZOKo1uBWCFXMZ3eFaO87iQkNQju2oeSxan
	 J7skIs4UOf5DSUkfeZS88sKLnFZYFGKmVAcDqrrfBODQfGz5HVJslfv1SXK6HX5i4Q
	 T3HhltHfr9HnMVrhYXDrmOmKQiKvyn1LNysZ/ReLKoLd68HSJGPX0//028EVAVdj3n
	 mQtY9CoGPRpTQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A516917E04F7;
	Mon, 23 Nov 2026 10:42:03 +0100 (CET)
Message-ID: <f6c16695-35b9-4d59-bb3d-fc247e2c278c@collabora.com>
Date: Mon, 23 Nov 2026 10:42:03 +0100
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
Subject: Re: [PATCH v2] regulator: mt6363: Serialize BUCK_TOP key access
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 06:29, Alexandre Mergnat wrote:
> The bits that select the FAST mode of the bucks only accept writes
> while the BUCK_TOP key is unlocked. mt6363_regulator_set_mode() unlocks
> the key, updates the bit and locks the key again, but the regulator
> core only locks the buck being changed. When two bucks change mode at
> the same time, one of them can lock the key between the unlock and
> the mode write of the other. The PMIC then ignores that write, and
> regulator_set_mode() returns 0 while the buck stays in its previous
> mode. mt6363_va15_set_voltage_sel() unlocks and locks the same key,
> so it can also lock it during a buck mode change.
> 
> Hold a mutex from each unlock of the key to its relock, in the FAST bit
> writes and in the VA15 voltage setter.
> 
> Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

