Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551231;
	b=YoUN50BzN7+QRjRkxjAABEEwFVlS39uP91NBabAfRqKfEkCM9iwWQqwQY0OhkZ4XZ/71
	 ho/8qUsemdpTrx3e56vwSMwAumXiZgY5k+yizrtZABWV9Q53z6LyzdAxHpZWCc6TO1fDr
	 XUJ91R+6IBpJoLjbl9oWSbIVXBEmXTBUwIM2KjAd6hU5dffKZzT2s+/ROr7aXiRtCPiKh
	 5DgI7xR5vlSKEvcXKK2X0rSNtxhvurZl3MdHxto2BlbWofUkP7LDussSCe+3BknPfYHdj
	 0ZI1g0A0wO0s/dPM8Ur5LS6Zvzx9nOaez7iwKkkiDeBpdmUNpuKDc1gYuFATpQ80bmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551231;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
	b=YtKD5TFtRtxGGyTvuPetP/uCosNL9nyBeDF91O3FcYlfmHCjNO6SMRqTM8c+LPRK69t/
	 TWJ+/c0yxvQ9tdmslKYZ0PjXHCqHb2mT6ChrFCbXFld6TfZ9CHxmXSOrNdcc2ERhwm3YW
	 7Twk8KnCPC9aikn32Z5YizAAkcEpxLtI7QBXk88sCDtRPAjEMlj6xI2PLPYOeLRInMmAu
	 rJruQfs0eOVFVqmBYqLa8PJ1rZiJmv/mKqoqrCYZT5+LlJr7M1CD0v6Nki+6wX8ncSRpw
	 UkiM6KHajNjl4AFZcNPJBF0Mw3JXvflAdb9MJN0w1UqfEvbHeS1BfqdbmgQjPsEdMGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="M7HGd/3T";
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC6606A6B0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EC6606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M7HGd/3T
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-949589c1495so439989485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551230; x=1796156030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
        b=xfhX/ERacqZYL11pTiwcYmfsPBBAStFcCEGxr0IlMJ+7RTgV02kO4XUUW1ijLMYEK3
         6jTdvE4VMKgNcHISAfX9OyX7cnNq0Aa20Sl8h9iG+Kb/s/yor3Wzj5Vt1ZXlyNrCizyA
         NbIZIU17YjZg3jmW4bKCycpDoqnmMh6tK+KYuyLcmdl1Dipo98XKbsEsQPHFqNHzk67C
         kYQZCV1bpyEcfXStywI1HFM8x6zRaEqkAE2SSW33AHYS2vdXkQgU6uIZ+Bnmr54yNut2
         F81aAnk4Glv8JP5yJIGif055dzR7OJJMgYKGdLXDqDX7q1zgIL19lCIm2g4y60jlOkwk
         S14w==
X-Forwarded-Encrypted: i=1; AL+hErEuTMXSiyTs3of+qWD9v9ydpIkw+onQD6/Bboyldk8RMokXqoKDrNyGZfFqn5ksYPRjsyZ+Zo2Bbwl+6V8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DgnK1QErKP6/Smw7j73C/sNMs4F5+1PyW/cewJm19K5v0KNUg
	HX91FqorYM75cUF2mSjxHMU6GtSHfzCEVSq3x0oL7OArPvTF2m1nra+HV1UScMmuv83tbak4tA+
	xYl6CicYEJh5O9B6KeUOBtBFHDiZtjtQF7t34Od7v8N1A0Ok03dAw2AteVp2nOuLGfVS+H1XePF
	H5Sso/HUFm8NbJRwtysajmMnMqtIKoKRYc1j0BpDdhJZ+kBmMqXg5GvQdZ61GbZ23vEi37TULU0
	AyJudCDu9thgYtcFEef3VR/gg==
X-Gm-Gg: AZFdTZcqPUpxyRD7KGnip3qbWPuxwUvp3V2pTbaDcbnFi0XsQnz0vdjWK6sx/bYrG7u
	X8pEw+gmcRN4m7hopIzgF2V40l9Cc5H+nC66X3hHSqZvgHHiQDiYKpMY9zN0Tnb0uqI+c5MroYp
	Tr8vbn6gmpWV1Tm48UG/zTumOEVagT0YKeJpacEW72DJcv3ACiW/mjdM2a7g5XJMh/mVFpxPEs/
	61Cc7y1ysb8OfwtavnBl2eQYjTurgkn6o2j3S2XW9NW+D6ZyFYfeSbxpWBBfOT8EnMfRxcB3sxr
	PE3UFEBen/l0eEatarhT7webRmPCl5E6Rj5iFpk3x6/9IkSnil3eRzMI8buFzC7Awb990GE0j8I
	IsUfK0wkbXtkr2pEg33v9ykojO6pTQPXbYxOWWsqdiu/kOFgks0q9hSxo1jXpPHzXYiC8jiKl9l
	Y3fzbKykAWP9mlw4X1fH2cZZmsD1gt2vPnjykTNVqaRg==
X-Received: by 2002:a05:620a:6c18:b0:949:61fc:88a1 with SMTP id af79cd13be357-949ba81a55cmr2501755085a.10.1795551230222;
        Tue, 24 Nov 2026 12:13:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3f55d3sm105799185a.18.2026.11.24.12.13.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso3122491241.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551228; x=1796156028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
        b=M7HGd/3TpBUGPZ1clDzQQjzBjwjIe6K59CWkQ19W7DcpRKGoYxib6Nw4UvURpwY46W
         P7RQLVK3DQThTzGVosGY8a2qKmfAgLpYza7ErvdKnxU6jZNGbqNoS7QddvvuVhky7fYq
         VtV3S41abudzT03vJbRYSr3XM9eemBqp2m7Qk=
X-Forwarded-Encrypted: i=1; AL+hErEMfTw9KCRy3ZHm9E6C4jgylWX9vVIad1J3zh8Kezj1Ug/zI1Mf5lpkIZS3Ui6v6rVLd7yeYnJFXRp5ihY=@vger.kernel.org
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr7708535137.36.1795551228583;
        Tue, 24 Nov 2026 12:13:48 -0800 (PST)
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr7708490137.36.1795551228151;
        Tue, 24 Nov 2026 12:13:48 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm140905426d6.1.2026.11.24.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:47 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
Date: Tue, 24 Nov 2026 21:13:43 +0100
Message-ID: <20261124201344.3494326-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115185843.64633-2-maoyixie.tju@gmail.com>
References: <20261115185843.64633-2-maoyixie.tju@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 16 Nov 2026 02:58:42 +0800, Maoyi Xie <maoyixie.tju@gmail.com> wrote:
> brcmf_fws_rxreorder() allocates max_idx + 1 slots when a reorder flow
> starts. It then uses the indices of each frame without a check.
>
> 	rfi->pktslots[rfi->cur_idx] = pkt;
>
> A cur_idx above the allocated maximum makes the driver write and read
> past pktslots[]. An exp_idx above max_idx makes
> brcmf_rxreorder_get_skb_list() read past the array or loop forever.
>
> Store the allocated maximum in the flow. Bound max_idx by it and the
> other indices by max_idx. Deliver a frame that fails the check without
> reordering.
>
> This was found with a static analysis tool that we develop. A userspace
> harness that compiles the fwsignal.c functions unchanged runs under
> AddressSanitizer. It shows the out-of-bounds accesses and the endless
> loop before this patch, but not after it. No hardware was available for
> testing.
>
> Fixes: 87edd8916ee2 ("brcmfmac: add AMPDU reordering functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
>  .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 24 ++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
