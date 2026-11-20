Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188037;
	b=xfnK2s5h/CkG0BGf6xNHiHl1bLx9gI6ElQ6ZUrRfjY5S8xl5TYFWt6bW6yI6W2WeiDbf
	 DUzZx2DHjA36Y24rZN/ozlTrf6cWQf0rboikG8xkELnUge0k4y9zAGECGdg6/ewraALF8
	 o4da4po3+rQM2b/s6IljzgZTMdu1mvyLmuxvqndFhKtt92dpRP4pCYczNISnw0lUhp76S
	 x9C0ctsN9YS5BBzMJ29YU9LRsO2H5pvk/l7qeELV4nC4gMaMjWiOgHs9Rk/894pRMC+QR
	 F+3ZOoDLBSKVahQinHTjLbowmuIcQwd40I9Q4e8b1XQDMhDAEMD7NjK1VSN+iTV7gqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
	b=CzrDFqd/jZ4tQ8Puxn9BLNu9c/JzqIhx0E2QJDrX5HQ8YeGnihMQn/wP1UycdtBvTFGH
	 GIse5xOOB3dACgHGynWpzFTNVStEM7L3awZMvdqI6GytPcjPVqRAH6rIwR0Dbhtdtcb+O
	 YK7KrIAoZ67i5R3qURcyTn9ic0rSg0Aq1hCC8jZyRRMP4wuFM9UGCHfkNYahqY22T+3eN
	 7B7Rjmlhcpbo5h7plZ7eJAfRx8GK3pQSIMNRs46VVaK5cClv+jqUxsFYaEqjJ5rT2wGGa
	 Bvm0cxPuHU6ONI+ZZogTDSBTWKPYH4bdHmBDRZNwdDTaVuyBC/RzVT3IBfAFpnT0ttg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KrCLE9f0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B1606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8B1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KrCLE9f0
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2154451a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188035; cv=none;
        d=google.com; s=arc-20260327;
        b=AWS72Rxk8aQQDvlE2TLoAYFy4FDCnR4ZnJG0N7Fus/EqDUrrxu0OPxuqydL1W9zpwj
         ZCJDrFDgaSnuaZq+2gOOvqODxnUkqePM4/38cI4AFkhJc/2swxVWJeYvDqnWNoBXRD8T
         2Bu1nIWhGlL9bwIkOrZHZwTLfb4GVEBgCznYmADvFAvrMiB5vZvT5G9kUUvuoTjLGO30
         OfRRdOnBw5u38v880ET3V7naQ5SgenhD5xupo3SIZ1d/cXrml0XEG/c8t5U919zq/zLB
         uAeesDW83RXODso7R6u+QpYzngH8E6KBjUxblxFQofaZwXbyykmN60d6EuymmWZGkxeT
         QCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        fh=wzSsMKsCGs/OuPQsTM1yAaR8pFrZSOkrO6Qn84so0Bs=;
        b=LrKj6Ue/K8uC+j6MjrQbKyOrvAl9Tq6h4yHYUnKzodsTkoaT5p1I/rMj4PO+hePK3R
         MRFv5AcI2ddN7uX0uLn66kNeMi7Z9gCtBDRbKKkHKWgBtLvHJpV4NxszYsuQ2j5s3hi6
         oiPOc2bAMqxzqWzOZ1VbLuogGIYqsSh9q785NRqfdiky4d1KEcPuGFm46tk5WlkUArc+
         qNS6TZe2RhyHXDtf8ujHCNy9r2ARzWHWPEkBpC3aZiWHEyD0K9i749NA1IlJ1TfEX5l2
         b+kbmXZiD+Pzk56IVbUZNp/QRhOXEtxSGF1Sbdjsr6VEkh0Sg/lE/1cmgZvhD5qaJPk5
         Q3gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188035; x=1795792835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        b=KrCLE9f0l5kQICrTLb1eNF7JtQCvVuF5pqZmRGYh90Wdtxtc2EQ/byEDmslVTkS6G+
         Y//VKMfmofLsmNk/ui+8AMa7DPRNVJn7RU1PKbE37nSs9wL/SASUgwkuODsBC0fu0Dc7
         spKgJLyXh2jcWB4ScKLkSdjpaI9+qpIG0aZnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188035; x=1795792835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XAPGvEQrLB1HXvB/eqEUppDavW95bHQ7K6tJw/flOAo=;
        b=oidjHtb8EjQiVhbIttCQCrHWjz3tUFfDGHYWIxNSN+0fEtiu61fC4LVi5/gGS9wn9e
         TwGqfo7K4EM7nk+1lAG9Y66CdJBBPSZBB2bMnFyBXN4hXWAB9glq5GiSs54Dcu8hX8Uv
         nrt9MrATr75GfLOQe7o5xucLRe2CqkPfnLVTFp/L4fDM0oKLh98y6dw3asM2ngX0Pk1u
         9ad3Zcfkler7+2dQP/BUnZVO8rtEfr3znA58Qr0WLGMshFXtctCuVclkGpepK/hBQF6M
         voz9efxekIpVTAyrxnKmWrWy3Xv04sVVhJRkcLzRDTbnl+46rWnwFY/lYMsOeX4AL97s
         q2jQ==
X-Forwarded-Encrypted: i=1; AL+hErEkhAG14mK6+fB/TvEDgs22jfgPjd9lMYZaA5waPeedXHIHvfe52yZ7alEvI+6qp39SmjHxJNk2BTRgEiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uj0lRahNMgXOD4Sw9+sgwpIZvvxEum7Ut4sDIWbbLn1KmV5h/
	XCGGfT2IDBKbyKNQQ7la8+3LqhWGoBZy+bEeVkdE0YTMLcbMztvC++6Ua5JXjfGLVd+MOYJZMfI
	jG/IrFDIuk6FzNQUp/au+oRm2x6VVbZaYKG2cm29J
X-Gm-Gg: AZFdTZdcD+kIWRPxS4wL3Dy6G1V/8COeUhE4AExmWGC8WkaEX9MzbPckZcRg3N6e9qK
	0+OXeFZRVfICCMxczkJmFvpzUGbjEZMVMEEs5iI52A8OiAwG75r6ql/mpT/LAGb/xfa4YwgZGnE
	SqhCxWQ/flXSAdFf+x8NJPYX3qo2gt5EzHd0l3JqBfZCPve0ZJVTCDr5W5jweEVn65BclbkKbT3
	Exm+0IeL3BkmD16NqqnrFNZnEVl7AgUujdWqdYCo/VNEm6ViacGqNJdEzHHL5XM55v/scnrwvX/
	tFkRy5eVMzI5wbW6HDFOtEvesArVUM/cLrsOTkvV9loPW4d2CO3c2+y7D1Gcti8zY99X9ConIb4
	XIn1VIhr8E6+kxXPUD2JPljHSrpGOR9IZjAluin1NKuGE1KVuJXt0Pg8X
X-Received: by 2002:aa7:c249:0:b0:6b7:d0c7:4aad with SMTP id
 4fb4d7f45d1cf-6ba37c75ef9mr2328640a12.6.1795188034912; Fri, 20 Nov 2026
 07:20:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-8-dianders@chromium.org>
In-Reply-To: <20261116205320.1621386-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 08:20:23 -0700
X-Gm-Features: Aa3M54psUBrQPUKXYteeAD9WgtZ-YuEDe8s7JLMYNK5VihZIqFHf2DJoFUBm_As
Message-ID: <CAFLszThHKUSDbiDqbmhSd7SDpMOvpeGcU_NdizYb1azYhejrow@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] libpydt: Add DeviceTree live tree representation
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> libpydt: Add DeviceTree live tree representation
>
> `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
> device tree blobs, where inserting or deleting nodes and properties
> shifts subsequent node offsets. That works well for in-place queries and
> localized edits, but makes multi-tree comparison, structural diffing,
> and bottom-up tree construction (as needed by the upcoming `fdtfactor`
> tool) awkward and error-prone.
>
> Add `pylibfdt/libpydt.py` providing `DeviceTree`, an in-memory live tree
> representation where each node holds `props` (a dict mapping property
> name to `libfdt.Property`) and `children` (a dict mapping child node
> name to child `DeviceTree`), along with `unflatten()` and `flatten()` to
> convert between `FdtRo`/`Fdt` blobs and live trees, and helpers for path
> lookup, node creation, and pre-order traversal.
>
> Add unit tests in `tests/libpydt_tests.py` covering `DeviceTree`
> round-tripping, subtree unflattening, duplicate-name and corrupt-tree
> rejection, and navigation helpers.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libpydt.py    | 184 +++++++++++++++++++++++++++++++++++++++++++++++++
>  pylibfdt/meson.build   |   2 +
>  tests/libpydt_tests.py | 106 ++++++++++++++++++++++++++++
>  tests/meson.build      |   2 +-
>  tests/run_tests.sh     |  13 ++--
>  5 files changed, 302 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
