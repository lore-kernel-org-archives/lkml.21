Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436366;
	b=xkGMHJ0dNFD/Xsscst4xuNoMhFgORviXwUGWGiNw5ZvqVnBxAq3ulZNvmJH/Cnu8A+Gp
	 0ta4+lw5zSTgWLZCYVOdbvDG4bwxKa7L2GttI7vFSYG86w+8CJesTYmvHyVva2fFBUq0/
	 eanVWnxVl6m7dS3jJ5mEWDZAVpdYtoBeic0xMdtJUm5tO8N5Zig/caEYf6l52ShX2DtTG
	 JNgnLCqKRKeYRylxzqaBYjzC3xLGv8W89cbZ+fUMcbGMqmZk5ZFd9O0RV/toBbDuUM4dR
	 lU/hFmCixbqjkt1xPN/QULm/mDKtxlrjsZo6VyUUT0A4G3vmpSftOeNhQksBnvxgMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436366;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=arcQViGfeSECR0OhAG3djuwxROdLL3U7KRwsLLKnrew=;
	b=WuY7VIyG4ZY0XAsrgndzN3r1KufyiE5C1Ot1eLqFLYqtudL0Owf0OtMAWA2vyCrjqza6
	 gXWMcKzBnzyZSn48HJ0/PzbT7GGMLCKQHwVLKd6bfG8WiSyM/Ttnqrk+CaKWqDuuJ2P9T
	 FlKVT0CkF3l833OXfOhbOdXpaSCuXG1Qlb6SWhbaBNkXRmwqPK+/vM6O4VB4e6eprWNoQ
	 B/Fd+9CzuLrU3Er+nUkjl+HO1NIUTBskkgs9lxbgDXAX5Ea4EmoPm0lV8nTvYkKEjY3lo
	 bWKAJNIsBHAeGZLk+aBnnVB6gFHa1a7ZdaYE5/tAdlHKZ0iI+zDFWHkVMWKjWfC4R7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaga.pv.it;
	spf=pass smtp.mailfrom=vaga.pv.it;
	dkim=pass header.d=vaga.pv.it header.i=@vaga.pv.it header.a=rsa-sha256 header.s=protonmail2 header.b=BIRRy2GH;
	arc=none smtp.remote-ip=79.135.106.105
Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A66606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaga.pv.it header.i=@vaga.pv.it header.a=rsa-sha256 header.s=protonmail2 header.b=BIRRy2GH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail2; t=1795436361; x=1795695561;
	bh=arcQViGfeSECR0OhAG3djuwxROdLL3U7KRwsLLKnrew=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BIRRy2GHCbKZiR0S8v7+hR7G3WJ1VUDLw+/gYzRyE8a3rw6vcwaQrY2QteMxkjDSB
	 rfNwDrnDrGTiAY1TO8H77XYRo3p3+x9p9+JYz2jBgGFCG7XJXFHv943BT9oCvsYBGO
	 AdkVG5UJCcyP8XSDILQ9f/nQPYnyB7QeyZ6VKdeH5vnEac5v78Covvx8Fa35ZZgEvZ
	 5uryazw3EQrvHs5FU8jqtlGS8eZCLFHCquice6y3TyJ8HyeqGwzrQ+A3vFd/T7/pvP
	 371eRN09MEmULtWJyOe1QWfK03Sh+4TQEtTf2iJ0zOYtse1vPYyGm7ItWJVMeDFzQJ
	 vRphQxUi8IVIQ==
Date: Mon, 23 Nov 2026 12:19:10 +0000
To: Daniel Pereira <danielmaraboo@gmail.com>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: doc-guide: add a guide for translators
Message-ID: <w72e6t3uaxnhhmqyynfisaw6tvpc3ikg7t5hm2hcakguy2jexw@4oyhz7f3lzgn>
In-Reply-To: <20261119041009.63651-2-danielmaraboo@gmail.com>
References: <20261119041009.63651-1-danielmaraboo@gmail.com> <20261119041009.63651-2-danielmaraboo@gmail.com>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: d98de995ad347ea4d31fcf0b786e3cf2b54d181d
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

Hi Daniel,

it looks good to me. Thank you

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

On Thu, Nov 19, 2026 at 01:10:08AM -0300, Daniel Pereira wrote:
>The documentation has seven translations, but nothing in the English
>documentation explains how to contribute to them. The only guide that
>exists, Documentation/translations/zh_CN/how-to.rst, is written in
>Chinese and covers the zh_CN translation only.
>
>As a result, the same problems come up over and over in the review of
>translation patches: labels and citations copied from the original,
>which are global in Sphinx and collide with the English ones; partial
>builds with SPHINXDIRS that hide those collisions; lines over 80
>columns; translations not added to any toctree; missing commit
>descriptions, tags separated by blank lines, HTML email rejected by the
>lists, and the documentation maintainer left out of the recipients.
>
>Add Documentation/doc-guide/translations.rst, a guide that covers the
>whole workflow of a translation: choosing what to translate, the layout
>of a translated document (path, header, labels, citations,
>cross-references, what must not be translated), translation quality and
>terminology, adding the document to the build, checking it, preparing
>and sending the patch, the review process, keeping translations up to
>date and starting a new translation. The commit message format it
>suggests is the one already recognized by tools/docs/checktransupdate.py.
>
>Link the guide from the doc-guide index and from the translations
>index.
>
>Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
>Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>



--=20
Federico Vaga

