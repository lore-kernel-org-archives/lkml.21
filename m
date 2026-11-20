Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133477;
	b=m00ewI/XbcFJF9Kbt9bH872akpkDtO+oKFGzsuBkJ7mJ+qYKEgZZOwAYem+OyqRLlxJb
	 DuJleNUXVN5KwrnHHLLXMwAGLMnUiMx2KZ2X/qY1ba7mxiESWCy6Qbaum9AuuU78IkS6d
	 TpBTIaVE1gvW2Hk3SyMYah2LG+msR3DVzGPpBAEbYlR2fwIE+HR7ZU7ksiYA+KsYHAbUq
	 Z/1s85tVNmmrp6klTorWoS25g+p/zs7xh2aHeQCd95VQ0hntNGH75K1Aoenech3XUR4Ud
	 emfscvSQs4dGlk5yKvceD1Uc4e5CnJyMOm8l4Bf+RbxdC6PDzgxIoKWMkUuXxuo4n0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dX2sdwg6msO+2Hy2n1fUrye627ZQcDy+aS+NuM+NVo0=;
	b=KVI5RP429qJyUDdVv9qtq/qGzH/bmMFbVdpUOdRNTZKTLDuCOKDAFuTUFcBIIYBSO91z
	 8aN2CttGBuM7Dv719nimuAqvQFt0pEvOYWPrspTXsOmGarUj19/Oz5saRI5iPXnW7L3Td
	 4QNjsk/YziBrAHXwTQpFdKVi/yqjdpkfIreh0lVtdyi8+OEZqQ022CNRBJwzWRcPQmbOj
	 fgZ69ePuN2Irv8Pyfca4UdtipqzXWzwVm3aiT6qPvLfyZeyebhtDIOerppvULaDuaWdcJ
	 BkLevEr3JgjZUME+DLpEr3sSyjATfxhe648miZ9o4kL3q3ogu2Nt5sU2TClS1Rv8ARA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJqzfke9;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ADF606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7ADF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJqzfke9
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so323721b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795133476; x=1795738276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dX2sdwg6msO+2Hy2n1fUrye627ZQcDy+aS+NuM+NVo0=;
        b=TJqzfke9jFntflzsu6R0AwzaFu1KNFLU8Cv8ipBv2rtoWTIDoqfa4z2rJQpQwPW6rL
         AOSMR4Zx4c+j3qhAuY2j2geHE3njxRCSbUTTqPTTLQRFiIXxYIb7kEq3zvUQyzkTStja
         MFoMDiR5ZFpGXlfotungxVz1P1pTJ/Asymf+IhJ305ug/IcsdkeVlby2kS5ydS4XKgJm
         BAbxyKX1DTsbgaXIzQ1LX6ptXki2d0PIJbttKfykgChhYgt3/HT7/x1NPMfAxoaMS7Hd
         b2XQLzaGXSmk0asB5G7Rb1Z6PUqAJJaAcW3UCTJBwwfmC/iarfy/LdqLB9LUROync6bN
         US9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133476; x=1795738276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dX2sdwg6msO+2Hy2n1fUrye627ZQcDy+aS+NuM+NVo0=;
        b=MLPRUhTKuKmQrrwlZljVyGeIFBmX5g50FgpWY1NZVJG3W7M0Mm4rh9hfhrTTLkrtsF
         Q2w3DhN6sIade7WAkAdC8XH3pDM7+xGgJkhI7JLaWAU5coTpSlCvRKP13iqmabe10SHB
         Dl657uyyKK68drxhfvyemO24z08UU/F4fyUxp5Jdyfak7/kFR++TyelW1W2//9zuAA7g
         0NkPIcbTdh+d91InKjo70hF7/sUBh+bDUe4C6jLyhLuRyVsQLoAYvv63RvlSHyQgQcro
         eecHDjUuySRYTHdcZxGECrcc2K3Tyor1hUdewZGcl8voUmxqXGUct17sPJh6fVPSIuvp
         Uv+Q==
X-Forwarded-Encrypted: i=1; AL+hErFb/b8iFZ+kIwj50v8l6Mmeioc4uhA01J/3qH1sOpEqe7pPdaCLcLIAfmJ0rq5qnnVnsE1KE1d7mAuHc80=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IKnBZgpzcbav5yD1nLHRZCpjKeByaf57z1XZ/L1YrRLYQR1bN
	Jcy4Ng6/ogHcFAUHMRMrA0VS2wWlXnUZ7HQhlgp6DyRc3AoObauDgH0A
X-Gm-Gg: AYBFou0zyFW/zswh/4V0RYvnHKDBCY72g027FWiOVOwyVrYsygX+3r5lbPBQkQGKxGL
	XxJTRFvXzfdfgEKBAuDre6mn/KHLN6NCGZ2JA8AU6Ul/NbZYJFtbdL9x5BAjPAsWs8urQvFC9ca
	lrXyLVHCwdJPb4eYH4pHGc+QHllL6gO1FbqEdkyOFwftFVfEHFCtRwtkNmk8u8gZU86XO4UKRkV
	kGN9/JsojfyPzwUvM4jN6A4/iUOz7sYaPgncUuxa8eBdv10na7Z4ps2DVVwH6FM+kHK4fDgLavI
	9Gf0lW0k4/g3f+A3p1XCKOEvX4WPWrqCeL3m8aCHZXSnoQjirjiLoIzq4p8Kj0q7GvvtVlSR7S5
	KaxdqK0cgeyAT3R2uUOGIGH3fNvVklBY6VwPbIcrcuK8gDSs3zIWexhUqKe91+D9rjTr7ldKsEi
	/vpYssHjFKUprDSARmDBtxXRWlCdXrnZD9HeQf++bJH5mmez/Dgn0AHCJgYV1af59jDKrgQ6DUq
	jJcrXW3pr1UR0AeLixzieSR6OJxVs54A7KHh1u5xzGRjwkT9EDX018LLr6LF8Tty+2EkZDVVPzG
	0vsFW4rmdvsjso5SOp1akq6wjyLUpNVdKakaTdSQOZYNCUGOdlaSLkHHTS3QFvtH+aY2s9O59QO
	zAv6x
X-Received: by 2002:a05:6a20:914a:b0:3f8:c7b1:688e with SMTP id adf61e73a8af0-4014d4557ffmr1304618637.30.1795133476084;
        Thu, 19 Nov 2026 16:11:16 -0800 (PST)
Received: from macbook.localdomain ([50.35.8.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm604400b3a.17.2026.11.19.16.11.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 16:11:15 -0800 (PST)
From: Brian Martin <brayniac@gmail.com>
To: Louis Thiery <thiery.louis@gmail.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to truesize for managed frags
Date: Thu, 19 Nov 2026 16:11:14 -0800
Message-ID: <20261120001114.61077-1-brayniac@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119232935.1708458-1-thiery.louis@gmail.com>
References: <20261119232935.1708458-1-thiery.louis@gmail.com>
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

On Thu, 19 Nov 2026 23:29:35 +0000, Louis Thiery wrote:
> Only the in-page part of the offset matters for how much memory a
> fragment ties up, so use offset_in_page().

This is the change suggested in my report earlier today:

  https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sUDV-XJiBPd6R3Kuqc-7Q@mail.gmail.com/

I applied this patch to io_uring-7.4 (0659e44ce739) and ran the
reproducer from that report. With it, SEND_ZC from a registered huge-page
buffer is charged the same as SEND_ZC without one on every row, for
hugetlb and THP, including 8192 for a send that crosses a page boundary.
On the stock kernel the same run shows the overcharge.

Jens, if you apply this, could you add:

Reported-by: Brian Martin <brayniac@gmail.com>
Closes: https://lore.kernel.org/io-uring/CAC+fX10wVVSqGnfCg+aazorsCxB34sUDV-XJiBPd6R3Kuqc-7Q@mail.gmail.com/

Tested-by: Brian Martin <brayniac@gmail.com>
