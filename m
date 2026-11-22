Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355392;
	b=aD7BpbbCYqixT0XOfHLyM4b/LZRB9ONspfmOj5Zd3hP8cjLnPxfB4cxAXBUJxB+jHlFR
	 UdDbFQfr5P3ww0R3/3wglTPKauAfPyPBFpeXmN6/8tQJU8rgK4MJtkrnWW1cg9j8hPlir
	 RQEC2N/ACitv4Zf1lwv9IFOpjLFVU8Ju8GUmqKebZsUnTPyBrh6+9nlqJyURvpiWHOl0W
	 6SbWEMUbmFuy2MYIpGSCjHpzVGxEn6da9eK3ZMjr53tD2IdPzA9Sy1bO0EC9OF3prYZS7
	 yk09B04/HX32P1PkpUn5GSUBQL7gd1HJ/JW+llLRzcfYSpRRFzhQc1fiJpcSeQScc9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355392;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TPKZwYaw4lTDLweoSjKyGDvkdRqKLZixX7yClELwv1I=;
	b=GLoOx2JxLc46UeSnWKOuQ3K+EYwoS5k9QIkXP5ahXRs53YitmUw06r6xufb7Jlh9VUYw
	 9nHO6O7vGPd8WmW7om/hvLjfLEu9C0tt6+7vDttNm2RXkJcGm1iDVCKWxZGGQAoBNV37w
	 2ZgNwoZwUS98BYt8iB3C7d46kaOmGWESwf5ZMILvYHpZJXjKF89AHO9GHyFnsAuO5N2O+
	 9Cb3SG1LKz719uuhFRvDVFQ/q1iLJ612erpBmh/hCTrYT8YiTTfMfTunWC0D1lO0ypxoL
	 pnzy+UwrtD8Xstz0nU8Xur+Ewl54SmsJrK+6SIzFVgoKc7YjDvEvLzWd6KBkFY1B1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b="SUA9pp/Q";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eEtWQIS9;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C93E606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C93E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=SUA9pp/Q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eEtWQIS9
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E50961D00517
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:49:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 22 Nov 2026 08:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795355390; x=
	1795441790; bh=TPKZwYaw4lTDLweoSjKyGDvkdRqKLZixX7yClELwv1I=; b=S
	UA9pp/Q3Mi2IwDlG/SPSZXQx6Tug0HG4laHYpOg3y/WG//KKtp69GyaIS6uL7wu+
	KZGFex+JFZS3Dj1OT7idNkZKY7TlJ0D33r5r/nic2TKyMP2EuAtEeAdqeSI5siJj
	0CadyxikfMH3kEihl/z2qZE05IsK2b4h4UX3V59iUkbH68fAvjLdghyEq9nYSBVk
	uONUXgDSNV3Lrfig2xUFftzAmqkvLeEG2gxdsOXCYuywGYZ31tIMOLCi7jpdvGRV
	WApODIDIfR4D2WboZI20d7ZViAa8iG5xVL2XNYlGTypzQ1KBWxym/9FxUVXrZ0cX
	gJBdUTWYhO8tBSMt2phRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795355390; x=1795441790; bh=TPKZwYaw4lTDLweoSjKyGDvkdRqKLZixX7y
	ClELwv1I=; b=eEtWQIS9KlanIO/rqSSFyjug/enNRjgZjU4gxwdiB6Ai3k8JUb6
	2pOhy++FnkfX6f9hbkIcuAdNo6XDgbTQd2AWpfO+sqJbl6UrQkhwRflBoefpKgSM
	d6yCKH2TVc3hz6y6byG4LosVoctZ/i0+vCM/Gf2L8AMlI4wBg7GX703+aqlfDj96
	P2hsVkBpEMcIRA+jm7SFZFeJB4hM3Z3Jd/OdS9+powRlzCmm8lXiziYpQW5oMmC4
	6azqpdyh160AUPnQ5tdQdMoQ6/h/GVhkxLR98oOTe/iSq0900sCPXgrq1WhRlRRo
	ZxSlEZ7qvHrN2GJOUxzhU5cgpv06m/CoA8Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795355390; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:s5ScAG5KVVd+hN0XRizGC7iMLMUK6KxN+AwiiaW2TYBYDnA
	Mta34r1Lt7muMZIFFsywTqnCud6+Vhup7zaW3WBrzM4xhHPm96JiWfCL+PUGoGe8
	hAApzAzUjydYsJPEQQK7J7jI2yc6DswDD64VEYQcXPB2sdxJMnjXuDIWZNetM9Xp
	CVN0rQVKC0U3jwgqDdSHia/DLq2aC7JvsOLJMOPa7axasBCZNxT4M+quDvIJ5kH/
	ic1ya3POL7fVXztOz7PqjJMB1Xf993GSmciXiDgqAQf+uKCZMr0yDIKkc+0MEOxT
	IB3U/0QOwD4UAbBaZSfDoTxTScghZEOrQxLxENg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:/rfYByouKADoA+MbjQeSCRwqzBtWnmvG3cLYGXMbf3Q=:mUNTyXOmajpz3ZLXFsck4En0ZsJd9cgE4XpqXYo7fmo=;
X-ME-Sender: <xms:_vICa4Xda_oMwaUNbHORBnj7wgkLr3rO0rOz1ns3DA2sd5EzxM99yQ>
    <xme:_vICa0VTWf5yZ1ZpIHyncdPNWcAuSCEi23Y6ybuRAHudphWQ1CUAqSvCWb4e2GaEU
    0VDHF4RXCZVW3BrLPYyUcCZ8lIgwcSVzncQNLKRCdkJasOQXhryvw8>
X-ME-Received: <xmr:_vICa_ft1ZCM3VChZUm2RaycYvIQpplv0fauGH_FX74gCl6ha2LzY2AevCWLAZh6vCfSVt4KtS43mgjHV515zeAdQicxYA>
X-ME-Proxy-Cause: dmFkZTGWiuyvrZLZthx0/vruFGXSiIXq5OA0mAfKWPK7VmV8NW6nvB8td0BxpO3ZPgHMdr
    waYDvYxn0UYrZyjFMU5by3YrCilmMJG6DzVELM0WMwNLsjcXBWyBTYzMRoqbIcnLaDtPR2
    SuPfOfI4itldnFyHIScEeoxKuvXOhPTGhIHt8XIWpWBvdsnFYe2rtW3AStQPkAssTTE4+A
    BoXVhOkrFHLx9Hw8FpaWlDHCyHvwNHJokHR6FNVkF/A+UaftBAECbgEbEmh9drX90huaRb
    Nu5bXzZnniDHdooougTfo7KsW1DqDSv6EJaCLbjr0lMrhaiE4Jobxto4desOlyyzVo8fp/
    yawtFqxgXlb/U+U9uMtZgig7UYi54YFZwayjWLjTUbVurdfivsWoDO8UDTjC4XYL5HdUv5
    avOrHCW5etNUcI4VI219Q0d8WrIkzazSmRzqk561KJdc4/G5k/G+QV8dlTSH9/CYMdPNs3
    +9kTws2aAB+xsmwZTyIFZfjO1mvqi2RBLYXgesOHMrU+Xdpczn6CJP7V+rqPwevxeqYEo9
    q2OR3/wcomI7/0LT49XNBKJUbPlkWZVAXTOkzCf9Bn44RepF3ttVUmZy9Qe03NODq1vbo1
    fzbLHvK+2vZx2KBG8Ji3ZCxnvwMvmIWpr5KWVJd+3KFRqMFdPmhRruVMdp1w
X-ME-Proxy: <xmx:_vICa1W9J3sk45FnYQuSo_TfL5UNDVIqAppqxra6L5wqDZ6wAFrgQw>
    <xmx:_vICawcFNdKbpd6iv3h_eo3gGkXJIgbVXSG9VLgMfm80rNugWg_HKQ>
    <xmx:_vICa5MuujqoMpMFxnm2DYmfSWY3P7a3MPyt7zxcg8QeTxQnotuLIw>
    <xmx:_vICa2j0ix4-dYoUxIWzj1NklUe_oH_PmwR_F2ESSYszNxl3-Udleg>
    <xmx:_vICa7gqF-OKSNu1y5NVdZRNobA4GsojII-pNkmaQA-3hGjxKseQAk_t>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 08:49:49 -0500 (EST)
Date: Sun, 22 Nov 2026 22:49:47 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH v2 0/2] firewire: Fix out-of-bounds access in CSR iterator
Message-ID: <20261122134947.GB503983@sakamocchi.jp>
Mail-Followup-To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>,
	linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
References: <20261103042408.GB1229640@sakamocchi.jp>
 <20261103151421.7248-1-sreekuttan2156239@gmail.com>
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
In-Reply-To: <20261103151421.7248-1-sreekuttan2156239@gmail.com>

Hi,

Sorry for the delayed response. I wanted to take some time to carefully
consider the issue that this patch is intended to address.

On Tue, Nov 03, 2026 at 03:14:19PM +0000, Sreeraj S Kurup wrote:
> Hi Takashi,
> 
> This series fixes an out-of-bounds read in fw_csr_iterator_next() and
> adds KUnit tests for the CSR iterator.
> 
> The first patch fixes the iterator by checking its position before
> dereferencing the current entry.
> 
> The second patch adds a separate KUnit test suite covering:
> 
> - Iteration over valid entries.
> - Calling the iterator after reaching the end.
> - Iteration over an empty directory.
> 
> It also adds a separate Kconfig option for the iterator tests.
> 
> Testing:
> 
> - Ran the FireWire KUnit tests using:
>   python3 tools/testing/kunit/kunit.py run
>   --kunitconfig=drivers/firewire/.kunitconfig
> 
> - All tests passed.
> 
> - Results:
>   [14:47:14] ======== firewire-config-rom-iterator (3 subtests) =========
>   [14:47:14] [PASSED] test_csr_iterator_with_valid_entries
>   [14:47:14] [PASSED] test_csr_iterator_at_end
>   [14:47:14] [PASSED] test_csr_iterator_empty_directory
>   [14:47:14] ========== [PASSED] firewire-config-rom-iterator ===========
> 
> Please review the patches.
> 
> Regards,
> Sreeraj
 
At this point, I would like to reject this patchset, as I believe it
attempts to address problems that are unlikely to occur in practice.

In my review of the previous patchset, I mentioned the KUnit tests for
configuration ROM parser (read_config_rom() function). I hope these tests
have helped demonstrate that the parser can detect structurally malformed
configuration ROMs.

Consequently, the parser copies the content of well-formed configuration
ROM to the cache, after which the CSR iterator operates on that cached
data. Therefore, an out-of-bounds access is unlikely as long as the
iterator is used as intended, i.e. initialized directly with either
'struct fw_node.config_rom' or 'struct fw_unit.directory'.

I think it would be preferable to document the preconditions of
fw_csr_iterator_init() in the kernel documentation rather than add more
code to the function.

Of course, there is still room for discussion from the perspective of
defensive programming. However, I think it is also worth considering the
principle of Design by Contract.

> Sreeraj S Kurup (2):
>   firewire: Fix out-of-bounds access in CSR iterator
>   firewire: Add KUnit tests for CSR iterator
> 
>  drivers/firewire/.kunitconfig               |  1 +
>  drivers/firewire/Kconfig                    | 12 +++
>  drivers/firewire/config-rom-iterator-test.c | 93 +++++++++++++++++++++
>  drivers/firewire/core-device.c              | 10 ++-
>  4 files changed, 115 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/firewire/config-rom-iterator-test.c
> 
> -- 
> 2.55.0


Thanks

Takashi Sakamoto
