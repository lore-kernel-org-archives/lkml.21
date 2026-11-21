Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795291139;
	b=yrecJ0uMJXJBz2eGwm681XNugjSiC5wBMLQSPjCdgGO4XXxizod7bTjF5RyiBJLWmQpm
	 EewqlVuD8go280q3hpN0xJD/Wi19DhCKifL/ehe9ZfS4R6RVpxkHibiaBrur2wb5CnDGR
	 678/wtR2yCkf+oZY2rSGHz8kFW5yxvaq5C8/rCAzChIq1DO9YF08dedPlumeIJUpnx0S9
	 MMih26DY5514SaSQl8MNIK0CE5/H2RUp61XpVnWSUH/l/rPEE3WkSzNbnZrDg4wwx3xgH
	 395O6K0N5OFC8v51Ek/rJqPng+qTODXYACP/Das4PQV5Q/ADVPSgWdSsZncCowT/jWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795291139;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Date:Message-Id:In-Reply-To:
	 References;
	bh=AMEe9uy+oW3f3SwsgSW+M/nxThzS0Dp2S/VJ3lcqVCQ=;
	b=QyucJ751/uS9GmN08N5olJwOerb759Ddcf6zO/D1IHCjGbm5OcvZNxqxZc7HYPueMRDt
	 4HR18Nuj+qXkqOR+KT1ocCb4T2QEDY3wYK1WshxIQoXACXjhyIgsKgWmWSuz+S3VL7GG7
	 1LFHO63IyVS5YALXKbVmfPJo7/k+m9744XYpVnRrEodJNBS82wz5MaQ4yOAYUZ5dPo5pg
	 729qwFkCn5O3uPb7a2bnNA2BTOReE4QACd76nrSk0cdTy+cxSJWxaA8mnPKD2tqGvitkT
	 yQ8gjCm3+nD6RE+wzWGpqPlz6uWUy62/Lwp3VaTGi2uvh1b3A3yEYutWXuXQlPXN3+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cressey.dev;
	spf=pass smtp.mailfrom=cressey.dev;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E423606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E423606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cressey.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AMEe9uy+oW3f3SwsgSW+M/nxThzS0Dp2S/VJ3lcqVCQ=;
 c=simple/simple; d=cressey.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795291136; v=1; x=1795895936;
 b=kJhAd9K4ndTKd5xgwqITCwW2p0FEvQy7CDm3hX+FKOvASBD9sfGYZDNmb0LQZad+P0ZxQyzr
 62PUFq8Zf2Uli5rQj+1KJqdUVqItG8zhPJXNekBSU3qw3Bu8Rcd+Dy8MaHD29QJ7zTGDMPCoDFs
 HtOLxml3QUYT1a6UI1YsQpqeDjoe9bE/r5WbjM7+qZt7K4xjNGjt0UbmOWWRxx8j4q2eXH2Wgvs
 7dqs/FrjhiyO43ZURYhSGGRkrMrok6eZ1skkJNRICajA9F+o8r1bAUCs66KQbqinscdzXU94Gg5
 uNq+4UNfcxFCoz0xmoVvKQcSTdib8N2wg0WDb9MdgcHgw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cba09444c80e291f;
	Sat, 21 Nov 2026 19:58:56 +0000
X-Mizu-Trace-ID: cba09444c80e291f
X-Migadu-Flow: FLOW_OUT
From: Ben Cressey <ben@cressey.dev>
To: Wei Wang <wei.w.wang@hotmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Anthony Vardaro (Anthropic)" <me@anthonyvardaro.com>
Subject: Re: [PATCH v2] PCI: Add ID@path device format for pci= parameters
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
Date: Sat, 21 Nov 2026 11:58:42 -0800
Message-Id: <20261121-re-913694b40323@cressey.dev>
In-Reply-To: <JH0PR01MB57796AD53E6089D3254A76D6DC7C2@JH0PR01MB5779.apcprd01.prod.exchangelabs.com>
References: <20261111-pci-idpath-selector-v2-1-83ea668e38f0@cressey.dev>
 <JH0PR01MB57796AD53E6089D3254A76D6DC7C2@JH0PR01MB5779.apcprd01.prod.exchangelabs.com>

On Mon, Nov 16, 2026 at 09:21:00PM +0800, Wei Wang wrote:
> Nit: I think this is more readable with a single '@' check:
> [...]

Thanks for the review and the suggestion. I will revisit that block if
a v3 is needed.
