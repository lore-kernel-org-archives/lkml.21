Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397024;
	b=PcmqE6rd331s4g5K9hBWv9n47hHmGK1UJyuSriynWUidHYGqNVBWauNKCmA2VFcqyvse
	 lW2YvExbHZjnWksHi6yRKW4Ui3LGyS+vgPbNTRGdjQ78rhD/O2g30LBuaCrhVgY25aRCg
	 51F/B72XFFRrStIRBwzfZ2JxRtkx1SpGUZUMAWJLDVdRhWWNi4KPDeWVT6Bj4zjix+SL2
	 VfrRaGjw38qgMwHIVbRInH1JK4hl/XxOvVScjCdd0sAH3mM1Oy+1QICDBHq8lWDqirul8
	 CUzuPyWdC4mYVovWH87F9ytGnfb/qlkXPzqS/3xyy0COwLjPi+jNKgFV3JZk8LpDbJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397024;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=QSMho1NjVP5XGqEqimgjpY4GbPekT5vt0w3BGd5duAI=;
	b=tVpj2vAcmjP5l8ATjE5nB5U8kbu5dT9OX0Uw6vHd3Lt1vh5E5Kv3GlOsxy5TmqpvQXcD
	 RLVA3WTOhc023ApHkqJujQyLgeMApI71YRwh+VynlEgbTjrAP2UTGfbuQFfYw2qrUVvxw
	 ASelBIjtVSfLVsRus1qw3SXrcVXgPSeQrh1JQsHp1DVbYFbDtNRH8sGIkeqo59o3EXP7U
	 kMnqZbvBsr2dB8lZIJ4pa9QeAINuHz0rm2Cna8kvwV/mKmC+qNdAfw32er6DRbyzajA7T
	 DJB1u62yUstXRbLTBCgYpEw3UNLXCNQPbRuMZEf7Ys1QJs58SCiL0gj1nlkRIGP8sdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=TLCLPRKt;
	arc=none smtp.remote-ip=91.218.175.101
Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C845606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C845606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=TLCLPRKt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SyzFxx8j0goNtlq88x6jpGh70AV+UkBtEoBlAWhDzcY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795397021; v=1; x=1796001821;
 b=TLCLPRKtJ+XUIOxiMYbm3LeZcd/UebZ0Btq8DrOwbK6DFZH107uau9hfwumboTSFs+2/3xWZ
 dXIt8IIAiH06/edkE871N/haqxIR2Lktd3Ssxg2oiU4g3w6+epN09QM1ZY3mwemBddPwLxgXoET
 2LaXnQ3QlI4jIgofKSd63z4XbebAFZEO9cRh1NFCYVbpLubenaKvXdDLqzsvku+4KxZpNCa+eow
 Lbw2kGB+RyRNicVY27NDOSpvN9j9eF1j8OTEDpoN7faeU/PQiPFRPU0pH/vphoSwe8Wf5J1YPii
 lJ3xlQ8rikR/QUPrYqbgiua1rEk8fPEAu9YiEw0VuenWg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 384d2ed1f0f21d74;
	Mon, 23 Nov 2026 01:23:41 +0000
X-Mizu-Trace-ID: 384d2ed1f0f21d74
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 09:23:37 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the
 English original
Message-ID: <awOVmVPNOCNTzLcD@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-4-chenyou910331@gmail.com>
 <avVQdrfqVqRfY5ex@wyuan.org>
 <CAKspUhLvHoWW9unBOFfFrykdxpBswBraaBJnbxpC9rg7yvTFUQ@mail.gmail.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhLvHoWW9unBOFfFrykdxpBswBraaBJnbxpC9rg7yvTFUQ@mail.gmail.com>

On Thu, Nov 19, 2026 at 07:50:57PM +0800, 葉宸佑 wrote:
> On Thu, Nov 12, 2026 at 01:36:54PM +0800, Weijie Yuan wrote:
> > You used <tw_codingstyle> label here, but after rendering, the html
> > output is still "Documentation/process/coding-style.rst", which is
> > pointing to the zh-tw translation, not the original one. So it is
> > inconsistent, right?
> 
> You're not misunderstanding, you're right. With :ref:`text <label>`, the
> text is displayed as is and only the label decides where the link goes.
> Since the label exists, Sphinx has nothing to warn about.
> 
> > I suggest that in this series, either use the full path to refer to a
> > file directly, or stick to the discouraged writing style and wait until
> > once these two series are completed, we can then carry out a thorough
> > cleanup. What do you think?
> 
> I'll go with the second option for v2: keep the :ref:s and labels, but
> display the zh_TW path, e.g.
> 
>   :ref:`Documentation/translations/zh_TW/process/coding-style.rst
> <tw_codingstyle>`
> 
> so the text matches where the link goes. Turning them into plain paths
> can then go into the cleanup together with the label work.
> 
> To make sure nothing is missed, I checked every :ref: in both series
> with a script. Besides the ones displaying an English path, it found
> one in embargoed-hardware-issues.rst copied from the English text as
> "Documentation/admin-guide/ <securitybugs>", where both the text and the
> target are English. The zh_TW security-bugs.rst has no label, so I'll
> use its full path there instead.

Thanks!

> > Regarding the "ref" of one specific section, I remember that it could be
> > referred to using a relative path, and with a label?
> 
> A :ref: only takes a label, so a section needs one, like
> <tw_interleaved_replies> in 2.Process.rst, which points at a section of
> submitting-patches.rst. A relative path works with :doc:, but that
> links a whole document, and for that a plain path is simpler since
> automarkup turns it into a link.

Okay, got it.

> I'll leave your Reviewed-by off this patch in v2.

Aha, that was completely my carelessness ;-)

Sorry that my schedule has been a bit tight recently, but I'll try to
take a look at the rest soon. But of course you can start brewing your
v2 if you have time now. ;-)

Thanks.
