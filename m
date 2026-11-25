Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627560;
	b=CtERVa3lbweqsS4SVfI6bRJv3MD4Ul5QYwT+lC605nAmUZe+JNwUa8RoboIUPajhYOBU
	 j7HXhX385GfzLAas9u+qJW3Zp1cNnAn94UzNmnEaZx2s931Q6KitkAsFQnISCTZCUAKlw
	 /h4puldu3HvFYgp2jxBxtS63p6ZkpTkvh9ngRQ5DXgXcF5ZIrKgFzN1/CaDLj9UC5jRuE
	 VS9aKSBN+LzI+3sgN2zdbKNMWRpMwtlzT79rC2+sppvZXrG7uZQmtudGAvWSW/q18Ljs3
	 aJzno+92cRoTcZRBkQUY/QHzH9W31HnXekUbbWdYRB7M3Jj+C1IObt+dUmBiPICNckA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=0eeo8xLsFVG8280bwD1Dy/maRtfEJTegVNCHlzkxjN0=;
	b=QQU8e2eCM7gk0n1WoO+RXkhtcXuTRa0edBN3wWPl1gDXDyzZ1WmXe/BRcLGPig5e0Gk3
	 01SXx6+il30WP/hcckE81s55jPv1IdOvxZJ04/u2gNwwARQkeftTbOWzjHxroHTcZz6n0
	 YqF+wzswJy8choenuzUNoMipzf7YPjWs+0Wl8SRCUVUCtek6MhcCmnizL1x7rQUJIYrxX
	 8cT4Zzy8NS0QnuDirGpeYGVxH8DilGZXCqQUl3SzIx46NbvXsC6W/Q+6XW4PR7KzZ6UCs
	 /Ei8D9gU5FkYeS1YrVz7xRVQIhdOzcZsdhqosR/HlvAsbOHt/6phhafUkp/ZW2mg2bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=qHEQRIic;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47AF606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47AF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=qHEQRIic
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862b98b2e47so2398266a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795627557; x=1796232357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eeo8xLsFVG8280bwD1Dy/maRtfEJTegVNCHlzkxjN0=;
        b=qHEQRIicaHwGLJVpZorCRJS8V6QqQD46EpXiCM3lMMd8jsp4BaecZ89/o5B+1BG8mU
         D46nMwhJrZv5JkWRVuA1rWJrt8LgQokH8ulCW59UILLtXGbbRtYP2A+2x5i/E9e/lTq4
         yi+FRYMLYmWgypLe+9PyYlVFo2DAV0mjA6HRLLXt+z+jB0Sv0Kv0NzW+qwREB0tXSNfw
         Rxx8A3tM2Y2jaAPsMp4diVccGyyKa4y3Pxji1SkcCW9c7/0C31XeRmVLM/zY4z3wNj9u
         1Qr3IstKa5vEruhdJ+cuucopc6qu+1SJR6Q9YY4gprQZc5l9plOVPqNsEtKLfrYrSYEn
         Tdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627557; x=1796232357;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eeo8xLsFVG8280bwD1Dy/maRtfEJTegVNCHlzkxjN0=;
        b=qfqjyklwxPR7VOMlXGt/WrpNTnyvqEtCVnyuEVLAWheEToLhdsgme6vL684Olnka2W
         0UYiMvxLwIB+l5GWcTf5Rxka0KGbfjp4MoF9Gg2goGlZ/6HrZ+ZRdx2+34MYMJo8j6os
         26a6BnX9gNXWsav9mBO8yJe4S6bXHpOAyBjcVQA6n3YrgRPHnBEeFWKncIFqhJe3j17H
         QUDW+V3jfATeW7t5y3rdeMFj/JIZ2Dz+0iQQfh+QC0zZ/BxcNSvNv+EJtBd6AcGr3bet
         zs7OmH4MoII0gDzzdC+5NNo/28r0cqv9I5ET/PGU7hq6HjH+9/Rzt12apMfrv4hjOc3/
         vejg==
X-Forwarded-Encrypted: i=1; AL+hErEOOj2nvPtE2cZOo6TUzQ+uUTrzovkGHD0NQa0A0Ao3Bbp3Vv0vcsk5Vl9m8du0ET/dlpnE4XiqSrP3lyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kCm8l8KQDMthz4NR4e8Oplf52/YLEKLFLtfIprJ3vtWsZPulS
	xyMdT0ucOJpomt6Q1sN6jtjI5VZ+xF+fkS39/LoS2ng9sjvkvl260Cfd5MAFZrvPizg=
X-Gm-Gg: AZFdTZcSqgrPUllWUL8apDtZUDsJOKsoeGh+56W1YkhBP9804y4owa2sM1eVjopGjkf
	ax97Ik9lohzu9mBOT/2c4Gx5ZO5dp3ONFr/vrxa3sgxqxTZ59jVGNbBQOFbJHoqXsVhH4/e+PkK
	BaLpHoyjRqmlgnP+IzQMJ6ROx/3J5f5jddzheN9LFrd2pQRZYqEVsx0NE0D46WC25bmV3XOrSm0
	LibvcHbM0cnN3arkt2j6zWOKAgvEreqlC1h3pKeVaipgzHPA9FSZfaZ9+Mk20PLtJC/m5rxrVmS
	QiHMyfSl94rgTZeXJMn3ngmBPNYHLvEgwvWBJSxeHNozt6wmlNPLBhONS4WxMn+aEQjQz+IvMjZ
	2XexRmUkjl61JK5UBJTVjQdF6NUqGDsdbQ7/kFBfx9Q6HrA5pTHVI6f5Dm0ns2lB3QTpRXQrE2F
	IZUHAUplKYrneGDK0s/TAFnhutzIDx/0EdbWJ8m4VCZDAqRfKPlOrM90ffJL5qttqeGoBUGTYCX
	Nk2gqZmVCNEFduIzv7Wv5xVOMLO9zN6XGyEBfo6rYIZgSQJ/2XOgSoC9fSbgxYRCs/AZkPc0iM9
	UNNZpeEt8MeiWmp63Cghs8sUrK6HyA+v4p4fGyOE5QgSHsyEucSKx2RyU9vQksnHXnIgZP6E++C
	vgv0smOzVOVih53EUbYreXmNFFaZVVNhUcDdj7GyNjah8LiI=
X-Received: by 2002:a05:6830:2e13:b0:822:95ff:43f3 with SMTP id 46e09a7af769-863157b02famr24543779a34.24.1795627557598;
        Wed, 25 Nov 2026 09:25:57 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631682200esm13061193a34.2.2026.11.25.09.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:25:56 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Louis Thiery <thiery.louis@gmail.com>
Cc: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261119232935.1708458-1-thiery.louis@gmail.com>
References: <20261119232935.1708458-1-thiery.louis@gmail.com>
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to
 truesize for managed frags
Message-Id: <179562755579.12696.13061594470426753053.b4-ty@b4>
Date: Wed, 25 Nov 2026 10:25:55 -0700
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


On Thu, 19 Nov 2026 23:29:35 +0000, Louis Thiery wrote:
> Registered buffers backed by huge pages are coalesced into one bvec per
> folio, so bv_offset is relative to the folio, not to a 4K page.
> io_sg_from_iter() adds PAGE_ALIGN(bv_len + bv_offset) to the skb
> truesize, which charges the socket for the whole run-up inside the
> folio. A 64K send from 1.5MB into a 2MB THP folio adds about 1.6MB of
> truesize, and sk_wmem_queued fills long before any real memory is used.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: don't charge the folio offset to truesize for managed frags
      commit: aaa55c8ff9147b1ce1ba50267aa9f080d469a963

Best regards,
-- 
Jens Axboe



