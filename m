Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745976;
	b=1pIJU69L+HgPKfOWq46MAsmiz0/D4jc0j9/yqYAtsrUUxNxGAAM09uRKgPJRkzKwTmK6
	 zPI8XhQFHW87Fr0L5f0Fd9ochtFe8NqnMVpZ1yXAJWL9Lchnu3mn9qqvDxtLS5IsAOuML
	 EsC773FDIJTWEOo7urzGd3OJ8NDfigijJ6p1/cCw6Z8B6wiulnj7AgXylUMdFdaOPnlCj
	 QC7skbIYJJIyY61cH4O9ZojZmCA/eWUISZl5Wpgb9XlpSVE6odgUIykg87YHljM8VF9O2
	 iBQ+IWYsWbic0YtpIdQNcAF8HH5tJXM2e28BBH3CcWBDAyHblbIqBynJ9gt0xLgr8eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=;
	b=s293HJ6PQtLTClZDCqtEGI4j4kCpza5+oO+6V131xWW6iMoZQOIkNVX5Gv3pNsn0nYdX
	 UyW6VcKhRCHNL8oRWfbNP0Qk4vGudOn9ktQDH+d9byGF3IVPPNnm2AQvxFJSIsrEktLmK
	 zlEQzHvhddS4jK6O+RAf5ceuDbr7XYW/DuOc48IYrzqXojzK9zZPo3TldaJwN8kpVkOH7
	 E42wkOzxNn4LAxBnjW/Th2pcr5mDiRktIt1PBwit7sLeDtR40ZH8AvRhLdNuoGD/hLRsN
	 bWEpfjkhl3MdLkM+nwhMdaMdOFpBNgT8Ih3SKLgJ+RgCycqpL9mWlNrHOYNo8LiiweQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuETlU2K;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4997A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuETlU2K
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so3091316a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745975; x=1796350775; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=;
        b=RuETlU2K0Im3LWwSCZsjXpTfzQDYQZzZMMpPj+SbYZ9+PWzz3db55pzowT4+8J8naF
         ztOgPM8LC6rTQTl7QaPZ93E1tNbS4Tq5LJbNb5bljqFAfubbt9TKAjJPweJMLmjahY+p
         Y8pAQkHIPxe6gHSrxYM89LJvA02TOe09B5lhCNSB+UsHmHFfmLqnciaL9Q4pupj+uqpH
         IDAa0flcB3YYM0Hw3VfuY8xDkWh2jrybPzNvCUbTBoi3eUjVvX7Sain9Ag01RoD/4zba
         reC9A02CM7CvjTv4bs+k9LEu7xs0xodivigL2R5dnIHMLR6BshW0mE5KxFac/wcA1EIz
         +2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745975; x=1796350775;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lEdmfvtDYf59q6HkpOhInvb9oPzLhNZI7PhqbULg+04=;
        b=OE22YX7YhRx9aWLPmuadheXADYXbqOA/2/bb+FLvkw6zWvjf6jxRa4tDfRsWhp18g+
         iBybNNIrnkMpIFj7wtSWF3g8VBGGTSJskZChNEA8TMLJqKQnBgxsYOEkzuGT4NEgCU/L
         fWZlvsluDIZ8nXrTPrxVrPtZkpoUQ0NSYec/qooMLFL0lSzzRB9eBLTzlFkFSaxIvfsM
         sgl8HAjU15uDcKN8Pde+3mRnjGX9UNIpFhewKFe/XC7CQRrWmfWbGIHaaId/VJ6EMWw4
         5h9CzU3TrQ82fvYIBnE5bLE0I2hm8yAkaVc2Cn90klxnOMOBw2KYrc+BBsKAa0YJ+78X
         v0iQ==
X-Forwarded-Encrypted: i=1; AL+hErHbP4e/58h8/z4HAxMx+DK6mFEJJAzbbBhqMfngYp7ErtskOmklYggMJo2yQcwxNsxDPxZwmp+hXyOv1Mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ONdksR0LQU+5eaT9xOHFEIpU+deOzzNCUMint8CFjv3zy3T6+
	mrejEmdRgKyLs9XdTmSXwJahUG6u5Cjg5KZ9pEG8QUAaJnO2TtOm1Sdj
X-Gm-Gg: AZFdTZc/4FprCBVjpJiM3Ujluub/Qg6AdsONJDrNlcC7AGPqoenNbKtrwlLuFTOPnNt
	VhUSsO1xnJb+35k/yzmv9ZpciRdf5Z779d6QRR5op7RSeDkNgIPvWu9i07jw0obqbRoHWNlFX29
	B1vhs27VLdw1COW2npQOn6UsW3IJRBmdkeHBdpCDwIK3O9eC+c/fqUG3aYhChspl2wE/npKpZLr
	aqhlQmY9MLvV3+MbmwYsPhpmiS5a2qKHcYjOiDZV98DZZ8CJi1Oz+6WhWtSVNXvDaBr27kFHuuC
	1hwaXeO8BJczQVDDLoiA/VKBjOiWAeEBC2yTka1HUHt+ziIJn1Zor+531jwvqafdj7oh9bVjpW9
	B3vyPyMxhKNwWLbqpc81AS/xTMRrFzynuJFalWEFSM43I+a4HlWmyeFz4BQ/VXU5EVfPBqfkxbD
	io386UvjqQOnympD50kz0VrU68nIeOoaW+PNe4nFHlvWrUxnn0n8VJCQDRV/1ckFLq1wKzpQJv+
	jKfLAb1Bn6yw+Ru0xhN3Yi7O/dG0zMlvzgw85TTYvfUmQpj9oOg2+9GUcd1eihvwT+9U85KHdgX
	f4W0BmRPVKDjZQ0C3i8/voQ8KSYItgSxDG/Txl74VNtQBtSs4P39WAiA2k5Xr4jMt5yiHrLDclQ
	=
X-Received: by 2002:a17:90b:4e83:b0:3b3:ff70:4d06 with SMTP id 98e67ed59e1d1-3b41c9b324emr21488621a91.16.1795745975421;
        Thu, 26 Nov 2026 18:19:35 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm37964315a91.11.2026.11.26.18.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:19:34 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] iio: adc: mt6359: divide scale by ADC resolution
In-Reply-To: <cLdx9oABQCqAoQThLiQ2oL34p3QMP4Xjq-kkFh6bkQfY16c-wXzqrKm06VYO0rxMkR56vn2ycUamZ7i6zv0metPym3UtZP2DUW-7H1KKyB8=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-2-iasnezhkov@gmail.com> <cLdx9oABQCqAoQThLiQ2oL34p3QMP4Xjq-kkFh6bkQfY16c-wXzqrKm06VYO0rxMkR56vn2ycUamZ7i6zv0metPym3UtZP2DUW-7H1KKyB8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:19:29 +0800
Message-ID: <179574596911.3233.3328617859832706425@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Roman,

Sorry for missing your series and for respinning v2 too quickly — both
were my mistakes. I checked my other submitted series on lore and
confirmed no other duplicates, and I will give reviewers more time before
respinning going forward.

I will drop patch 1/3 in favor of your series and send a rebased v3 with
only the remaining fix.

Best regards,
Ilia
