Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834039;
	b=kTu8009Wr/yKSIPovBfnsVkye6iEZ0ygIdyR9LfuYGKech6aXVSTau7QP8V7mtNjM13u
	 c8R8vGkUOFCtxFi0bFSLdyhF4NQQ3oSyDmpBzaK1qc20jX/AGKHERUzdhu9HJNZPUpBuY
	 WIz7Tx+r+lbz5VXbIY9fbWekbFyk8H9XrUnizlv9p/iz/6pYNOm9mVtEOQhZ3Krf3rSn4
	 PI3BjnFA1HlWd6P62lOddW5JQdwvw+zc8uPfLzhCI8Ne62srQSUiv4QTBVcPSrcDonFEp
	 EofVsBpr3PPh1YFwvpHb/aZ0ReZKa7pvvmtWMmKTRsB9u2qZnhI63qRHzHPyMynCNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=6WKT27fdX/tFqhewESdRPtk5HTiyQzUxICUqNBuVX0M=;
	b=y9LkuKAjJrrNGk3+BRwG7dMAYnmfVubQCCTNFplrFa8VNcx6By195IRS24ngDNWwhMdz
	 FPwnv7NJ9nAVvjhjNFufY7CqhK448N8mKMwTjnHdI5uAHLwHN6QU00ZqY4M+0RzPnV0CF
	 dVDl8DhtkPI5EHJCKM2YgXAdkodWzmKbLNIYUWKP5rjbM885184GuC+2HNYGOwVnu+VF2
	 GL4I6VrZRQr3n0ED39YtRjBnpiq2dAjw6ZcBi1XmIPI3nqPDEFwA0SdN0HZZQKJDARLzE
	 iXK8X3ClGCq6/WyiluDoUnq26zkCFPNqRSVM5qb0K25VYyix5sbOV9U+isEeC6cKN4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=FiuhkhtQ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483CE606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 483CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=FiuhkhtQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869f03af6aso7742002eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795834037; x=1796438837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WKT27fdX/tFqhewESdRPtk5HTiyQzUxICUqNBuVX0M=;
        b=FiuhkhtQpTj02YUL2JydJxu7pP80ao7UIcx71q2j7NDWqv8zjwSqfHsgdYc/vNm9uZ
         OwV4iQpfm60T48BM7zkX30KHYk8NM75Q6QpM3dWv8XQvpRIyXqzZ9SFzsEIx9wgE9mp9
         gbnHoXfhWqG9nzd1ItBNVhu3rrmCjBYaAc0Jk+TW1ufAbAe//L/36bk2jNkDRQQXdJec
         Inf/Fj2kKa3TtaMFUbRAbCfsa+qypmduCT+3CZpkFVDNn6KnVRSBoTqqqYQh7oFQ9q1p
         nHgQJ3LwwMoHLHOJ3j4nVjJkhWMaov75Zvp1GyPiFADc942jmTe3Z3EwST7PFtLDNbDr
         S4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834037; x=1796438837;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WKT27fdX/tFqhewESdRPtk5HTiyQzUxICUqNBuVX0M=;
        b=VHQc9wRntOpxJb8sgsqOP7vPTb4WCvcETAAoyMhkeXXmpw9tuM4YnQfbLsXg8Sqy3X
         G42Oi2yauWQSSaNyYzCjKoGgQHqKnno7OVOFGTSIfxGPyIgxMZww7CPbShedyaSRpKZ7
         y1K3B6mVEC/3f5LyWJ1geLoUNkoP4mLT666FBfndQaB2qbeYyW5bLjPTr31IKibV/pBW
         ZaI1MRt7BE9GJMrGeSqo0mwu3U8hMMyJwNIclVw2/GvznM28iLZuDiBSXQ+OM6gfYx7t
         EU2SjgpiDAEQUn6HVwUOiO/opkOc0Sw37mCsdPfFX52szNBVSUs9dBEVxB7hirom8qFl
         zPng==
X-Forwarded-Encrypted: i=1; AL+hErGuYG6+msDv8JtdcHZfkDHwy1BGVbnX7tJVsxKx3MHrBt5+6UEyjm9+kcmTGCpvEwhjzyRCNUxBIAM0Nz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9otoeXuWi4xiuvamSYeySy/zN8AXszVOCEkV/6kMPHl9VZLIsZ
	MDr2WV8Zm/4Z0yfIEo/q/XW9WqE/kMkylNBgnpiFam+Hfgz94TGk1aEAqA8WSbpD3Qo=
X-Gm-Gg: AZFdTZdf/KGZzNd2eekeFLi56+iFTilo7LRtGUZnYixNJRPnDmiHCCGyw1PFQqPxaoj
	Avh9zAAAMtHONaOK2ZuNtPDTH18RE2U9CNzTRlQ7UGy8zRyeO9fjod83D3reJU8XXlHFyjp+i0n
	pSkLfhisvH+S/7fJpHqWdbonW8pWM9ne6pTE/EuNn1bIkKokO3E39scd5FpCm0CSaCeQSOB40bb
	30oEgFWXgL0MQ0Isc2Loxjlz9Wi5pTEZ+/t6SMIIkat7TYc7aSlPzYGzhQa2oyRIiEg7c/ag/6t
	i2/ABkZis9yQx4pUuaV6Sa3WbveScyNtkg/TMGIZ+tD9AvpTLyUiQ8Mel2zE+gLEcTiUYiStPLb
	gAUEEyoBezbrXHZMuPyQVRvWfiXg6QJCCl/68iZSwBAGQ6yDD1GEiXtDFOio8vnCHv9lSRvTxJX
	D4zjrMyHfLqhSdLntu6Zl8Amy2/xQmdfjj9GE7Og2vICI6FkKoFGITxa+WjmowukrWCaXK3ypDB
	R6bWO3uHLTpEboHnv+RbmRPFraepXVOPSFXhdIfs7IuWQkBYTKYPvMp9VZfpnbxyis3S7Q+69u/
	5E3yqXboloyI9Vn9/zz/kjQrgKgxI2XHLqHyFSs8xBjGctbV9XLlSX+bMKwohGCsqPl8/eY5m68
	4csKYhxSkliS4UIs5skoXJLlpK0vc+UYjDOONdxIL+BdVD4i+
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr21137020eec.10.1795834037229;
        Fri, 27 Nov 2026 18:47:17 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm134059672eec.3.2026.11.27.18.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:47:16 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: hch@infradead.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev, mtsai@redhat.com, 
 stable@vger.kernel.org, hch@lst.de
In-Reply-To: <20261120101758.45513-1-dennylin0707@gmail.com>
References: <20261120101758.45513-1-dennylin0707@gmail.com>
Subject: Re: [PATCH v4] block: fix discard alignment for non-power-of-two
 granularities
Message-Id: <179583403624.86956.1820367114895807728.b4-ty@b4>
Date: Fri, 27 Nov 2026 19:47:16 -0700
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


On Fri, 20 Nov 2026 10:17:58 +0000, Hungyu Lin wrote:
> bio_discard_limit() uses round_up() and round_down(), which require a
> power-of-two alignment. However, discard_granularity need not be a power
> of two. For example, dm-thin supports data block sizes that are arbitrary
> multiples of 64 KiB and advertises the block size as its granularity.
> 
> With a 192 KiB granularity, discarding one complete block at offset
> 384 KiB is split into 128 KiB and 64 KiB bios. Neither covers a complete
> thin block, so dm-thin ignores both and the mapping remains allocated.
> 
> [...]

Applied, thanks!

[1/1] block: fix discard alignment for non-power-of-two granularities
      commit: f6ce3d09d6480b56e357336ac080952f9525eab0

Best regards,
-- 
Jens Axboe



