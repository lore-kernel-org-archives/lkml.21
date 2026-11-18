Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012527;
	b=G/yiH7Nhdu7z9zn8ge5se1bwFalPNgoyk6hbRCTd58vggV0H8xiqndm+o+G4cSzRWmwZ
	 ku+ix4nfkv8Hrv+B9RMs07Is+8h8eE5NAVqzdGC4yN/jSlI+81MazLWdX4pCTWZFIHMNX
	 68TJhCp2nTjyghpYY4h7YC8qtkoxUCANZu0cdCMPIjdiwIuBnyYmqmj21X8PUvB6cchgW
	 W6mrk7NlYRMrjOYTQq3R6N0N3wfTF2STWhJabz94Guy/i+nsDKh7SBsb/n8c8PZaX1J6m
	 qw33xQYbsm37FHQIJ+DziABg/cxikTNlVW08XkSBZFjk3y+GAs8fWEM3Kj1Ew45TAfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012527;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yUUBSOMNf2pSRnTYBHgO3x2ZaLH0HZLt7CrBGuzO0KE=;
	b=dLaFqBKvsU9ZCwmtJZL6qJFFbYzoBwk0/FtZxwxpFoq7+EP37SzUEchTRwheOW81ecjK
	 KT28Xy9QBCISM+epRHW+fta8YroRy3qLVDqNiZ744jjl6dEYVKpGAg71t4smqNqQdErdg
	 Bc+ZEOUEKPFdOFA1mTTYnk6S6PQZKVq/G5CvnD3hwFhP4j1x7RpDSnaJJmC86BoNGibe3
	 aMyVcHu9CLHfvFGqWXkwvv/a2wG+zL09RUNqlLJKYRLIGHAfiatZsU8IhyzBvGtQac4n5
	 GScMRs3o4J/UXJT6toop387K8/RwYiLl4wVh/IaUPyCuWAljFEbc3fNKqBjnvHsamOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b="PpO/wdCT";
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12398606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12398606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=PpO/wdCT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=yUUBSOMNf2pSRnTYBHgO3x2ZaLH0HZLt7CrBGuzO0KE=; t=1795012525; x=2110372525; 
	b=PpO/wdCTVvcIEHOzhF3fe6yoI5GEqbJef1mwv3SklzODlvPojSplVfSRbBpFzuXpOC5XcCCJAtd
	ftN/m0cABg6Auk3PpBIaY8D51gvSPOEmpXwAIBLs6rDRQcpdd8Ba8Lh38zk49awzRlRwDrRch7TTR
	x6HaofhijwcxcSoZ0Bo4a0rvpwhEfMM3wRlkoWH1r4XXbgIclUnxErYWtuR9W+IyndeKRSaQm2nLO
	KGkC9ZvZAzU99kWB2hLcqvSy7eR8DKKr3Epka0dN+8Ng4FraSOQ2JAGixAdpEAGvAbtzG5kGYYq1p
	A3gJny46CCnBJClzhqWoLDDb3N4brBJcgoag==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xTgko-000000012ui-1Vhc;
	Wed, 18 Nov 2026 15:35:18 +0100
Message-ID: <d76571d7-6c5e-4a36-85e3-db5a5b0cc2aa@igalia.com>
Date: Wed, 18 Nov 2026 11:35:12 -0300
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
Subject: Re: [PATCH v4 0/5] drm/vc4: dsi: Make failed reads visible and
 recoverable
To: Henry Zhang <henryzhang62@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20261028164539.3471833-1-henryzhang62@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/10/26 13:45, Henry Zhang wrote:
> DSI reads on the Raspberry Pi 4 (vc4, DSI1) can fail in two ways that
> the caller cannot handle:
> 
> - A peripheral that detected an error answers a read with an
>    Acknowledge and Error Report. vc4 copies its two bytes into the
>    caller's buffer and returns success, so the error bits look like
>    register contents (patch 2). An HSTX timeout can be reported as a
>    success as well (patch 1).
> 
> - After a read whose bus turnaround times out, every following DSI
>    transfer times out as well, until the display is switched off and on
>    (patch 5).
> 
> [...]
Applied the first patch (1/5) to drm-misc-fixes, thanks!

I'll leave the review of the rest of the patches for Dave, as he has
more expertise on the DSI side. Anyway, you should consider addressing
Sashiko's comment on 4/5.

Best regards,
- Maíra
