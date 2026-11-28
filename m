Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835782;
	b=UzpfdoC7eLb7O8vO3o7H8kpYFXXWB0XuC78ptRvzKNJFFWPmzEeo6RzObQosz3QRR05q
	 aXplP7FIwW6vi9mguBlg3aTm6MRU5NEZRX5gBOLnzGaMSeQJ/NqV/6tuhJYqoCf6aG64n
	 InJrXLQwLoLe7TVc3unXtzlfk92SHMqthbPGUUSG/ni4pxalbaw+sJ1ROjIpfuzTMEdrS
	 GHeSUxYLydkIOX9CkljymyScig1uXBo4C5SbxyP+QhmLBZTCmWcyyoMuf+hXEuIYoJBC6
	 1FOQB+TMLcQ87F+57dxt7D1ZbdLNlfSQbFzvavR+4gA7HtXir5fLxLnbRoXjB6qUdgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=3Ok5Lrv8H0htPRrt5HaRVW8ZGBYCsHXaIAgQkyhQ8Io=;
	b=SH/V1KZ0zgPfjHPiLbpEOx6Bp33xICG7MLIH8FUu7GWzqp99FxOYJcuFiKrC7qECfl+Y
	 xHUqMlD6Ot/9/X+2NiILdor52yQmH+Jnhh6ydxvk1GR4d1BCT/ckCuoGmxkUB6m9KGbjl
	 hv+KPfggoFGuZ7U86y7hnJ8CzvrQ7jUY26d8Xp/CjLEabq6x9yWewfuInaKTA4RFlGzAD
	 ubXIHjH+95cAG06xw9yt6nIIylaw7hO7ssfMtZSRsaHI/tN1LMjke6SPHSr2oVSjEReME
	 QqrBr7cRNZ0KadUbj2k0/1qBoHDgKdUYTyD247Id9Pa48Ku+9m+HwnZNQN4w8Q7OeGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=WR3iI+MZ;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E91606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E91606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=WR3iI+MZ
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so14192988c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795835781; x=1796440581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Ok5Lrv8H0htPRrt5HaRVW8ZGBYCsHXaIAgQkyhQ8Io=;
        b=WR3iI+MZM8Sx695G4+b7/SPK73hGU4cE4Qu1+7lznzVRy9uR5PJ35VG6f5pTrbRFyY
         AIVQjcLeImXwpU8a+tF/IWC4L8BIhkXR/j3cTsB4AKSNdyAEf6y07NrQ4xW7C4Y5Jwey
         tdUuSSdI7epNQciLkyqg45/y0f0f9n9lYSa7JCftlaQYlIZ6iwyHLqEdJwlujqcQFtlg
         nrYoxbd2x7LeKtljtZqE3S8Fy0gRmiwSGLkYTfgcx6jz/E5B+KAwO4fhqs8dcGezw1jL
         Hry9F2MwN03ja63mizJg66neaADF7CYPIxRS5+14C3mK4xZZd35pUou7h+UqUUyRtTo1
         yFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795835781; x=1796440581;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ok5Lrv8H0htPRrt5HaRVW8ZGBYCsHXaIAgQkyhQ8Io=;
        b=2GvBBRkTp2SYaZy7FXeIV6BZG9llUoOruSxn3enjJw2ALL8+wLAb9I4BqNiadZ/DfX
         yYEJIK2vICLtHhA87eezXEUPWiut1mf5KzJ3vj+LMz5Zm+NKdwvC7iI48dKRF13S8QLY
         n8NY1Ww/B+fBI8AnS89XXmgqsPvEs34hQZ0GrapnmnTt0cV0MimwiXP730wxS281XsRE
         jwxnsCy0DksWwuvAxOiT1V9soVUKsGekxYd6Jdx/tDJtqpW5G80vA45AR/eldnXtMu+L
         q2DB1VnddlRHsfMSFvJCiGFKLO+F3UqfffFAEknlLwtrXKoM8Sj+UwXE/Ww0wLK+E8/C
         cT6g==
X-Forwarded-Encrypted: i=1; AL+hErELj7JNwe3dshAx3pt8KqDli6XNr9sHxTDP+a9gITXa1dfeYpeeGSPq/djlnb17vd0fWt968De0kYSkLMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IyVBBV2rQ2e0vDbEuTMwLbtTil00syHm2MH2ss3JQTJA1Docq
	Vbod4hMF3Ln/NgM2L8BJnP6hPmc9VQ+XBkFufNNf28fe3jmA1UV/Xikz5PIOcbYR9cI=
X-Gm-Gg: AZFdTZei/xxsMX5AFVC3sWX8Bv9WhDGSwzkzGS1lyF8DBfcd77j/MqAeaY/RrCjJkuT
	EHtqB9NclOpBv2bdYqsuVCkX6B0/y3JsYOtXV4QqRpdpu7Xdc+sZ664JKfN1QA6yfAk9XRExnxf
	3ruYqSV0oLI+QBxMF/B/9lK09tlEYrW+7XHm4ViUl8f8uO6T3YBo9KmqAe2rHM+WfvJx4D1VpzZ
	Hsgo9VQIBSaYV0zDKikK8SNlspLdJ4aB4B08siBlZlVhbvDoLgZMn8c4/uYpkGDqOilIHdKJZUF
	BsFz66XNoXyL6d8+hdF84RId4jwjZ5p8h5ERmuQIjYFrU75HAci8emtmybxj0S/sy9QoAgytjwE
	lcOANQioSTG3RtlYl7ElO7loPcTyg73faWgQRYS8t+WPZd0qBo9c2q2clhHLcf+QkHuru+0YncZ
	+lecrwanKabwe20J7pIRznJyM8/7iy1mFXoR12NRFoCEf2lu+109nulR/RGrKKRgsYgLzlWEf2n
	YBrzVqaXZlvRba2EFZl1gNmsqgFeOkL2dnMfpDNFUFSWB5Ui6X1aZ1OV0f5O43QyTK/Aw61dXyk
	x0Unsuuwm5Ke5gDldzjBSbKJTBwMo9MTwjZSf+Ukx/UxIenCP3+IhZG71ToPM8UV3dPZ5XqWyJg
	pC23pa8J8ExQWFeUZk/w4PcnvKTemzgCLcLx9BdhEYiLVabSd
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr20378523eec.22.1795835781504;
        Fri, 27 Nov 2026 19:16:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm36623124eec.17.2026.11.27.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:16:21 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Zakaria Belkadi <zakaria.belkadi@inria.fr>
Cc: Christoph Hellwig <hch@infradead.org>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Kanchan Joshi <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>, 
 florence.schadle@ssi.gouv.fr, frederic.tronel@centralesupelec.fr, 
 louis.rilling@irisa.fr
In-Reply-To: <20261120195644.19511-1-zakaria.belkadi@inria.fr>
References: <20261120195644.19511-1-zakaria.belkadi@inria.fr>
Subject: Re: [PATCH v2] block: bounce user PI when writes may remap
 reference tags
Message-Id: <179583578039.94675.216278078774861873.b4-ty@b4>
Date: Fri, 27 Nov 2026 20:16:20 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 20 Nov 2026 20:56:44 +0100, Zakaria Belkadi wrote:
> On an io_uring O_DIRECT write, bio_integrity_map_user() can attach the
> caller's protection information (PI) buffer directly to the bio. The
> block layer pins the pages for reading, but reference-tag remapping can
> write to those same pages.
> 
> A caller with write access to a block device whose integrity profile
> enables reference-tag remapping can therefore modify a page it can
> only map for reading. In testing, remapping changed a tag in the page
> cache of a read-only file. With a PI buffer backed by the shared zero
> page, the kernel faulted during remapping.
> 
> [...]

Applied, thanks!

[1/1] block: bounce user PI when writes may remap reference tags
      commit: 348d25516523c3edfec477d56abde2b2491dbf9d

Best regards,
-- 
Jens Axboe



