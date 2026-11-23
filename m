Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441323;
	b=O7lAV9qH0s6uIHzYrQmYvYgbsm7lnyThlsRV4sVd7GPEuEBPZRPBxUVJHR6esR49d9Nq
	 nCCKFh8LmumwgVKFEgjWg1DMiLIBAE0r+R9Dy1++zjPfN1VS3sJ4jmUEc0LHRqXJadCPT
	 ZNlxQIVXYKq766987n0JDj8vKrJwWdiU6p0FaliVuByhhuFPTIoXqG9sbkkh59iD1aGzn
	 IMVBU1tQJi30vF6/fUtM31lcG8x9nKJ79Sywx71c999D+frmTWCFrTv8flKUqahQqJFmx
	 PPO7HZgM4hQ6sbbU7vgeBmdmf2yZupISq2natrbdg+nZ70sRD4jD2lmAMra5CN7V1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441323;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GGnM0TZCofw/NWgW1vYpZRtaqJU+biK+2YkRW/4cIC8=;
	b=N45cOaiLF/HE+1Ew6naNYreZlsWPX+uLMjH35TAw4qpRt1uXap1rzu1hGlmt+WWmJsy7
	 fN9QGZ2wVV4iLcE/77t/fGuIjC333FvbWvX07jdmKvazI77a/6aApW76M256ckg1qVDYl
	 YpwRQE7IAfZqX8ZfFD3lluC/sJu1A1X+2kevTj+8TzFYTxqoaT4sfs1H0DAXcVDupd4iY
	 SB3N7/C1sG4jHa/muqXkdM9QA7kKuXhmNpWiRR7eAao3FQw2D3bMnvUG9VrhnC5ow2Od/
	 9ftQWiQwQpVhzDa0mZB3Ii2IOvnMsG6TI+PrUCX1+vEdJEQLylfJdCs1HMrGeOUL+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=faabQryq;
	arc=none smtp.remote-ip=91.218.175.44
Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52311606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52311606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=faabQryq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9M2PxqsBIT5oufgzXeepgRVpkrLEF6NDh3LaxXiKaPs=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795441320; v=1; x=1796046120;
 b=faabQryqhpI7sWN12aKNkKNNdNKFtwncuHJb1a/9yhKTycu71GR9pAdoyqIURYOj0ZdgRkDd
 HacX3WI0GaT8OeM2D7X/jqFK7teMnFJ8QFIh/JhjW4f5s4bdEDAsruA7LTGZ+Ftg2KkYnays93j
 zKqUvlqCETsinHmDV19wnJNvIZKqQyw7KvSXWtkGTfE5MzcXZJrQxzSzeFyxVfstAJ0ta2LbWtA
 nXYpVhjapzoZxG0ttEzG5lqjJb6kR1zAgajbWVaovnScWR/79DOz+NC0z6PvfRTfPRnmNGA5gmC
 OixtiooC2l2PvcuvJw+CmnpvJsiZqnFxCasL91Xvr77fw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8e188c9b65a6afe;
	Mon, 23 Nov 2026 13:42:00 +0000
X-Mizu-Trace-ID: b8e188c9b65a6afe
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 21:41:56 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: doc-guide: add a guide for translators
Message-ID: <awRCpJIjpKMbA2J5@wyuan.org>
References: <20261119041009.63651-1-danielmaraboo@gmail.com>
 <20261119041009.63651-2-danielmaraboo@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119041009.63651-2-danielmaraboo@gmail.com>

On Thu, Nov 19, 2026 at 01:10:08AM -0300, Daniel Pereira wrote:
> The documentation has seven translations, but nothing in the English
> documentation explains how to contribute to them. The only guide that
> exists, Documentation/translations/zh_CN/how-to.rst, is written in
> Chinese and covers the zh_CN translation only.
> 
> As a result, the same problems come up over and over in the review of
> translation patches: labels and citations copied from the original,
> which are global in Sphinx and collide with the English ones; partial
> builds with SPHINXDIRS that hide those collisions; lines over 80
> columns; translations not added to any toctree; missing commit
> descriptions, tags separated by blank lines, HTML email rejected by the
> lists, and the documentation maintainer left out of the recipients.
> 
> Add Documentation/doc-guide/translations.rst, a guide that covers the
> whole workflow of a translation: choosing what to translate, the layout
> of a translated document (path, header, labels, citations,
> cross-references, what must not be translated), translation quality and
> terminology, adding the document to the build, checking it, preparing
> and sending the patch, the review process, keeping translations up to
> date and starting a new translation. The commit message format it
> suggests is the one already recognized by tools/docs/checktransupdate.py.
> 
> Link the guide from the doc-guide index and from the translations
> index.
> 
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks!

> ---
> Changes in v3:
> - State the path-mirroring rule explicitly, and exempt documents that
>   exist only in a translation, such as a glossary or a language-specific
>   how-to (Chen-Yu Yeh, Dongliang Mu, Weijie Yuan).
> - Make ":Original:" optional, needed only when the path does not mirror
>   the original, and drop it from the header example (Jani Nikula, Weijie
>   Yuan, Dongliang Mu).
> - Drop the sections that duplicated Documentation/doc-guide/sphinx.rst
>   and Documentation/process/submitting-patches.rst, keeping only the
>   points specific to translations, and link to those documents instead
>   (Federico Vaga, Jonathan Corbet).
> - Encourage translators to send a fix for the English original when they
>   find a problem in it while translating (Jonathan Corbet).
> - Mention b4 as an alternative for preparing and sending a patch series
>   (Weijie Yuan).
> - Drop avadhut.naik@amd.com from the recipients; the address bounced
>   twice on v2.
