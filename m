Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344562;
	b=IDXbFByn2b2zc9jJRCV04nyhfIr/FZ7SXpEAuBhFIsNfO3wKjlyC50/eF1mESA/4u0jf
	 Tf8CQ6hWnLj0qGQB20ovJB+r3tWxJfU+Q6/aiVfBIKnnf4LXSYafmIuwav2FCZSL0DIr8
	 yofDNqI301QwP7nZ1wBor8qGhni8V0C+so2kV2qSFVTZAaWd0vhuToK5IgqQaJRhU874c
	 EjFm66LGPu94f9vYoK6DyqGDAZ63dc7eQ0FW0NouDCb9TZyfIvQlKOEIljS5N8WwzyR1M
	 e2rduH7FLlb4c4tJkHpDMmb/GFMTJV9RiicmVY1X50usn/kmFc9ZAzo4qi68d008g8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344562;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SdPhVrPD3FLfRdA9n5gci/RQLV/kspB0OdPKdxqs61g=;
	b=0b+4o80suRwTSybYH1sRZnBe+xvMZ4AbVTE4BsY+JOlBMCY2I1zuZM7DaOclwVdW36Oe
	 HoUyBjIlcoWcrKRWmDhqpY2Cx0FAJfNkUtAjRfknrZZUPJ3HBnuixzehF7uPydBSrVZc5
	 fRY6ncodH8y4R3QdjGxokOyOHJJoXq3g46HpklvRVxCmXL4i3OZayE7idKmFzvnzDZWLL
	 sBrmT4HuE5Exob2ngCcHdwy6jj2VgPvXQAoL/lpavxmv6ZXNRea2vKvlQ0gobbfEVOGXi
	 M3SRTbjtZbzA8x32YWcLXPabfjTJKoBwoQKzregJpF/QODy2iD8Cvr5h95wO85LOHtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=njt6uaCY;
	arc=none smtp.remote-ip=109.224.244.27
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435F606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8435F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=njt6uaCY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795344558; x=1795603758;
	bh=SdPhVrPD3FLfRdA9n5gci/RQLV/kspB0OdPKdxqs61g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=njt6uaCYTLwQ+imeLSN37A0zq9iaPO/++XP/P6IDtELLxW1Ih7KDeHkHWY+1rURw9
	 IYVxLJXOe+Tx/vtNR16Y8RWottwqjOpJqBIaVFBwpI0rc9XmzZZ4xGb3ymbuji7pAZ
	 2rEtl/4igA/WcGth1adLfgAWOXMUxn6MfnYs50RcjEreyNxW4ZzVtJ10Qwa1/wEHAB
	 A99yCbjJAF5/QkhPjBcJ2OmU6PGOVO/afZyvWrivi0fxkCssDF5X+mL4ca8c4rMXVL
	 lVFNLCS2kqPxf0rUfxFKjFpbEUcHd0YpQvzB38IEEqGbxQIthX1O3Yg3WD7j0z20yV
	 EAzNCCQBKIzNw==
Date: Sun, 22 Nov 2026 10:49:14 +0000
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "christian.koenig@amd.com" <christian.koenig@amd.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "axboe@kernel.dk" <axboe@kernel.dk>, "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>, "asml.silence@gmail.com" <asml.silence@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in dma_buf_io_ctx_create() WARN path
Message-ID: <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
In-Reply-To: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 67157a7a4555990622919bb0247c6c6c6fb36fdd
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Withdrawing this patch. Apologies for the noise.

The WARN_ON_ONCE() path in dma_buf_io_ctx_create() is not reachable with
in-tree code: the only in-tree implementation, nvme_init_io_ctx_locked(),
installs all of dev_ops (map/unmap/release) before it returns 0.

And on the only path where it could ever fire =E2=80=94 an importer violati=
ng the
contract =E2=80=94 freeing ctx directly is not safe: init_dma_buf_io_ctx() =
has
already attached ctx to the dmabuf and linked it into the importer's
tracking, so kfree() + dma_buf_put() leaves dangling pointers and turns an
unreachable leak into a potential use-after-free. Since dev_ops->release
may itself be one of the missing callbacks, the core has no safe generic
cleanup on that path.


Thanks,
Falconet3




Em domingo, 22 de novembro de 2026 =C3=A0s 00:05, Falconet3 <Falconet3@prot=
on.me> escreveu:

> (leak of ctx + dmabuf ref on the WARN_ON_ONCE path, new file in v7.4-rc1,=
 patch attached)
