Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794975232;
	b=FFd7USbKta07dZLpJjF0gaPO86jC/55PG58GY9g4aqQeCKIQAiDEdYH5r9Z6ZDChKh99
	 brBQnXGLED/arkbw4q1rEvkFoiKu1EArKslC71/8/+3PYiJR1x2F8IZmlYJw6MfsKes1f
	 dUmNdx6yumvxDGIZS4pACq33NGkkQMZcSojRtzV+VBS2ut2AXyMv5+TKrkm7Tp5B7Ck0g
	 xn5FT7oNCDJfEJ9gNrBdmM93LW3yYsdyVYdYXzyHBH2w98mGI6TPip2legLzdHCxX0Doi
	 An6kyxjnAmCQuliPodsQF/J4Jk9licAgEOimRKBR96QQzFriFgrIV3rarBnSUppV9Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9/n7bNHhI4mAu4n07g+LOiXJUPBrwLMib4F/XWShiOs=;
	b=nzKaBwIyHFn/oaQbuit+BVicmANVyOp/H0GbSqfqRxaq3Hr0k0QAUmOVB2n+5GoD8OIi
	 e8YtOlblU4zeUj4hnfDQzJtnxcP2WyrhBvqZXFEelS/5/ahaB4sVp67BaxnOwB30aq1bC
	 KYjPDkiNEYvdu4lGlnTm2dD6r34D28rS5pPnhJAPOFLTwU2JxPK0sMf6tQqaX1M1BNJPx
	 6qMVVZ2+CX7NkHED8Ay6XufhfD3RL2Jwfv94uz6y26/rRBpyiJ2Tmjhmbal/g89+LZIez
	 T27enoIzB81x41d8+cQxfaPtjdEQVxLbJai9bslTY8L2UtW5KUEAJBhMeJDMkOte+gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cjwbJ6dg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDD6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cjwbJ6dg
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso8195a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794975230; cv=none;
        d=google.com; s=arc-20260327;
        b=CMYDGjKRkOcKEXv/7oBFw+/CBV4lJk3po01bPLSg4P3LyrzmMALOVMicN0dsJOiml7
         6aVjOJzSSitDL70Kt2u0bpUvcDbBCSNP+zldyXz1ixJvZz56aVndNzryTBUzMYtT/tGr
         LfhCxRB766okwUb0di8hchajMfUIPj50XJf/DVZlZoYaP/cjg7yVbyBNcq0Bpt/9wDQ0
         nt9O+iDXs1GWxmmxvYdo7aaYR04j8KFPt3aPsmNaYKAhxpaDhamDewQ4FlzRAu7R4NAt
         vKN8yToZ/aNuSuRCYzTvlLR2UKRSZ6ZYc5ieJJnn1vz33YRUaAPjtMKe2VN/53xVJ0Fg
         +cBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/n7bNHhI4mAu4n07g+LOiXJUPBrwLMib4F/XWShiOs=;
        fh=HLkuVFUakeZ4vA0vbcJKJpSJlzKC0K5TA7d1eqKja/Q=;
        b=VGY+mLQmjCucC99JZ5eA+Sq/3PVPDqg+XHk0DjKHkrPRP00K5Ezew974ZVAeuEGni8
         mCSfW8ljJeDeL/IUd9T4RpjN0vxcEJJLKKh3WoJUyNVNApVMwQMKzvojFUrB/rXCjcXt
         wGx8INZF4RlXa5XwRH/4kX/DEqwUvbjseLEmzSkvWwfmlPXvYw61Oyk3Y0TTC5qkdXwk
         tsikrBXmZbRwCXHMPAogeo8XS11YVfDPcmQJuhPoBIXfsc8K1PwoHgF0bmj6ES7xjTdu
         iYs8+fAXCF5sK6hCZLMVUg42DqSYZSS04Q/dXK0AoS+XpHFh+00brt9qNglAB/4hC7u9
         wv9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794975230; x=1795580030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9/n7bNHhI4mAu4n07g+LOiXJUPBrwLMib4F/XWShiOs=;
        b=cjwbJ6dg5FxOlD5tWwt+lPw14GBpXLZIzfqMZID/M8OEogQqOiZJ9ytfTUMATMjBjd
         0w2Nq8qXY2SjhmA91ocfXhn5ACeEvPeh+HVioOaUWhGTq8Yu3iCIIGZXStCTs2NeCEgN
         6VqFQdtOSX24wlrNHx+t4Z8OxcLjpSLYxO0U3J/STa2yFY02fzvZATIgYH6OgRIpSzYl
         F/bl2D4l1RduzOW30deKY0/t9WwgRenyeJvgLfky1lTFM31aJEY/H3jMuVBk+2YrFzq0
         nBOjt/smy8bNzn9Tx+0Dq3e2P65IWNZtkM/nBxh8JTQvfNWdEy5uaj3vGAx36Xuo36AL
         oBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975230; x=1795580030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/n7bNHhI4mAu4n07g+LOiXJUPBrwLMib4F/XWShiOs=;
        b=BivLpUWmxp9lpTT7zRgEi8AQcwjscGByLUdht2YfriheNPuUQM7Ell4pG/LjT/iLVY
         fsCAFbJ5CluyskwQTuXbr1k5eE7E7aCFN5IKUzDvKx2T94Lj80satgL1P7z7SzeS1rFb
         qHhV0llAWEM+zN7isGv1WaJcS5sxsegd9krCK0+CteegVtRZMzBBFXoUxd2qOif9WoSv
         VdUSdcsn4X2gXQ4PUxAdHNs7oL4YndbWRBrgUFCjZVRBWv7rt4PuAdb15IeNzOVVuXvW
         ftUzWn7yGQp5bQ6vjnl0WuXFPSWgfAgXTSFOQECl1cMDkpje0mDqf9dAw9VM22/AQpWL
         ZguA==
X-Forwarded-Encrypted: i=1; AL+hErEj1V94V5xioxYlUZyIfBlz/Axqs3tMVu0inOraiKmB72L8Hn/aDWQbI2VAc66aQ+ZrUDcq5kiBr9ZX5ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sIwB1zlfifCuosBBy8l4Rr7MfX/gMBo7wUTQRWduZUzNRUfgM
	wgiNi3Eu4WaFY3qRpF5OgMqzCfmuqEYhETEYDZY5L92tj43M6yH68cth37ExZD7IZQMWSgJhRi/
	P4Rm8T2cZSfydr96ZyV8tuLUCOdxY8hemHXVFYvf8
X-Gm-Gg: AYBFou1S8VcNkb2mZwbsYvsVHFZ/WY0yb7TSyER/DZXaeCVcB9pheXqmyyF6khxYH51
	Pd0aNWjA6U8WFGuzEQs1eUMAjVs9ETvltmty7vO97YSGCgtZLQXktRYnRH8/X8+5Ng5KdnxBrFF
	B1HE/0huK4563WGhqoxQpWF49EbqPsgTx1qLVvQ65RP1wgRGOTCmlCJ/XcPOmTpxKHwb5mS1pNp
	Taf/Qhg+or0i8m7TTUXhBi99kzHEnlP8pqgtxdeeNh/IjdINn6V8Fd7KcOJLSmT5osniBntSFU6
	3bKNjOc7dq2P4zem2S+ZZOd+l5WHlUtdnQg/+iyLjuKMFc/CnsoAVMy4h009rLteVA/A5xrC/mI
	Wk1hVABviiiuFzakik5TUNXBFUaGaGatRFswTwxD+wBiJAN7n22poXeaRorW31KqrTQ0TIX+2rs
	GK/9WXoHSYhsZDZIacg2JZXcHFG5PDsYNcr48t66QNzuINdal0A3vToyeJCvtXWwD5pQ/OvxEwp
	mU=
X-Received: by 2002:a05:6402:a514:10b0:6b7:b033:b489 with SMTP id
 4fb4d7f45d1cf-6b891f61ae5mr35791a12.13.1794975230020; Tue, 17 Nov 2026
 20:13:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-10-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-10-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 17 Nov 2026 20:13:37 -0800
X-Gm-Features: AclHuK_rboYqgTKdPhlI6PDF9EIfp5hVCnG4G8MclhgUoUlvM_c427GmBpqJiDs
Message-ID: <CALMp9eQ4uM1gV2MTu6mDh9O-ia5G-WYy3-MP-KoP65CKcN-KQQ@mail.gmail.com>
Subject: Re: [PATCH v9 09/20] KVM: VMX: Support instruction information extension
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Define the VMCS field offset for the extended instruction information.
> Then, support 5-bit register indices retrieval from VMCS fields.
>
> Although the APX CPUID enumeration indicates that the extension is
> available, hide it when using eVMCS, as eVMCS support is not ready yet.
>
> For safety, do not assume that previously reserved bits were zero
> on older implementations.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/aakEsXJgO-3m2xca@google.com
Reviewed-by: Jim Mattson <jmattson@google.com>
