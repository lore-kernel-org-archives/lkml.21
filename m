Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676129;
	b=l1OIbH/Z1HzvTzDTQUTmRoZGFmgFb22OoiKrv2aKx+oqZmQnfiwc4Ty1Fj4Ixc0aEqqL
	 Bp4zaBjX1y7RsRGtQCpvEenVTAx4mW94cFGnXRruSnyUK4wER9HYLOt2qbqvGjhLGPQMX
	 q4n+qT+pjd4ogCSa32iDcGPE0TVyINb2UuCSPQ1mDGtu+Gqm8G+95uAYjD+igWYTtIBHa
	 TUxsnmnuQRsieIMj3dP0uLWVgG/EFED9wOFB+66N9CRTi7qCavWyTvXVD4m7qANY9r++0
	 bWMXD5z3IeZ77gBzFhi4y+wmFc4GdtynFzcCuBqBFJPQ4JPkUecvfxGUEFDA67szwXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iqbQqcdSjyv2aUti1jwoQTqpIf6exML0ZMxImf95UxM=;
	b=XjhboPKoeOMtOTOazUdDHQmEMbVgPk5xdCdlfS9qjXKZgV2hGUbUGNm3vFhZ3L0Hkrnx
	 sKiJ3PLwXFselm8dr/AXtpl1x4+VQy3YFyWhY9pypE1wv1Xrx/hCS7+mf+2Jh/XwhFfIu
	 jm08kJWfUs9ZyeYE+fqxVzYXokU2joYub3SxNwcaKIBXKkt5HvevvHruFQoU2ipdgeg4X
	 hvggbzGP4IvWWZ4OJ9qI2iAaXw4mPc6d2G3W+9oSUQ+srBIKoFaET0v4EwUUG/dkh2VF6
	 jtLs+1HtZ/yjDAIhEgTA1XuIOwXzZJn3p1TUMcA1rj0b3v/G/8kHeC+F7vSM5+CaS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FM8LkwKR;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695C6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 695C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FM8LkwKR
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f05b465cd1so36679725ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676129; x=1796280929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqbQqcdSjyv2aUti1jwoQTqpIf6exML0ZMxImf95UxM=;
        b=FM8LkwKRoJm23W7XzvaZ4+GcK2obMCuA0HAqO2OxkpE2HtanpM1tLQPX3USZ1iXPam
         +1NF37DAxnea3UIuOG0jW8xrDVMyPTJ8Yomt7WXHB5bazenk5murQXoDd1qiiJVTCh5f
         tHs763cOMkE/JN4AWWv/6w2zxF11RfVs42f3sAi8zlYFZ185k2fkVXGr+RzBWuFf6v3b
         Lxk3NIi8Yti2AShqFLZVIJ2ykrQOmc1aUvkYujfbmYl5ExwaVOChgAfvUFimSSxi7Wu0
         S2jKezmXfqNNsSHLxQYYkDLO1uSVG3g4yTbhy8xuBoxE1foFwuxqPJ8/AHweVEacEqzX
         3yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676129; x=1796280929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqbQqcdSjyv2aUti1jwoQTqpIf6exML0ZMxImf95UxM=;
        b=dGhvZTsxovZ7J2RNFUhislcn2Ftp2ji3VDokvAix9C+tgJqsLjtlvzzRtlXkJ/slCV
         PgIiAruKMwKqHxBaOehNMTb6Lq8PnOwabFLAWKgZ0UdSzmFVUXOHOVvyCJryhY2JAfhg
         mOdIeidniLY5sclwM1vx4xSt8RZz9NbYbBKRFTXcMKvz1CTNSfbYoM5cJI6ourBOyUkk
         Qr5XC6EX1ht82dN98la/1nHopbiHWL2msUh1YYVbhNdXPFxgLMpc/eQpwUsxTuRhHAcr
         ouI7Jow3kQGo+3gySdgZxNnxxRNbWxU8LE0ul2WdfxuiaPrRY4GK3yfEUFERW74lEpV6
         Pftw==
X-Forwarded-Encrypted: i=1; AL+hErF6elDG9zuft9a/ZJpJF8YbQn7zrlU20Pq4sU116r2a0PW0HTlCKVwRUqpWavPNwIlJmT9axb7tTMWVxjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LUpyuTmr4NbQRe2QRvT/LcozfB8IJ+wtnXekUlSW1jl75UfNx
	fa2PmzQCTQYxAhsJRtdqiRH6ppj2jtgMvHT7X23gTjIVA8o2LxJUgfTc
X-Gm-Gg: AZFdTZeSQN757pFVUqcAXBFZs6UXReXahf+gpKdCtNdZuPqTnO5QSGOOsOKYglj6/Vg
	mTdaZhTpzDYecLpPbO4BmEUS28t4bRm4iDQcCjnICp6HQN3YI9pvS2RP2cnpJl+RXzxQ6wB9oev
	+2H8ObVSOAZEmbJgDKlxt5CNyFCrMxmoPWuAo1WycELif9p0PmGAUmeLAL8SfHIpUeMKdHa1nGL
	GHbbnYIZhyl1+4h7z5rFUDIHzxsUWsc8uhRvDPkvoYzh7JwVI1tz/qysH7oDjhI0d+vXWB2ceq2
	O8Ye+B9zdf1rLT1z1ffrUCRVjEb6fepE/b82nClJOMaFhV6fYqNSYTcnSq9RqgWgQ9xEznyXBsc
	EkkIh2LaeYFv0Jqfezl5JGoyO/z0veHoRC7cMyGL8Tic+r1Y2kgn/LMKVse+xoaaZfb8e/j2CRd
	E/zSl/z7CdCHsIm/CHl5imeoYp/WEvHChmE9WvbdHwgnYY+pn/DWtlIOrafFxbf2Lom1W2gB6pI
	r5dKwyln2IZx9Rys3qQS1Zpvselroh26RyEttncUIQ3U2QzolN+6xA32cttVT7l2UOPaLiKAycg
	7kcdBBVCnVKWkvrhIbfpayUbQ1iTvngG0Zz7DOgPDPyScE2lSWc33pyd4SpfUJasXafsxf76hwW
	/5UCspbtVqciL0PRWKx0cIttzYIj7B2s7Vt+KoawL4ag2ebK8cj7EyWWUEvmzD1k40qF1NuIO/B
	uea/3IVXDmEDiNU7RVY1k5Ps8=
X-Received: by 2002:a17:902:f545:b0:2f0:585b:8d8e with SMTP id d9443c01a7336-2f0585b8e12mr169456435ad.60.1795676128663;
        Wed, 25 Nov 2026 22:55:28 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm98854535ad.16.2026.11.25.22.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:55:28 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Ilia Snezhkov <iasnezhkov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: inkern: guard fwnode_xlate with info_exist_lock
Date: Thu, 26 Nov 2026 12:25:16 +0530
Message-ID: <20261126065516.678227-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126060615.63790-1-iasnezhkov@gmail.com>
References: <20261126060615.63790-1-iasnezhkov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 06:06:15AM +0000, Ilia Snezhkov wrote:
> Hold iio_dev_opaque->info_exist_lock with scoped_guard(mutex, ...)
> matching the rest of inkern.c, and return -EPROBE_DEFER if
> indio_dev->info is NULL.

Thanks for the respin. -EPROBE_DEFER matches what the !idev path
already returns, so the race no longer looks like the -ENODEV
"keep looking" case to the parent/map-list fallbacks, and the
unrelated num_channels check is gone. Applies to iio testing and is
checkpatch clean.

Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
