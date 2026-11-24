Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520041;
	b=XdHJsHtzi7cYk5aVsz39SDf0P2DBMtKYNbTXeWBsA7HmSTBa+Ds4I4mbYpHWrmIbyXfT
	 qqJ00V7j/UKj4J1Jx6BlUh6zlyanV5B4kB1ebmkFiU4fPZ6fqxiOv79IzOCTSRR9VmRWE
	 3Rwr4UoSNJ/6sU5jux+JpIEwI0oiTk9/SAIoRmZi/z+dmxOq4yD28pQuo3LBTI8z/tSjY
	 FYRG4zBxiJWpbW6HTFoLjbc5hvF+VhnX08+qGYsp4b+RL8p6JvaQBY1o4U49Te153YtH+
	 8vurk5QrhGPLFoFiQoNQeVg4wDkuNnUynilE6/e8p9rWVevinfgAQ+1sbKsFFPkCVzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520041;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EymnD5MBbabJpXRL0s2OgMISx5E+3aU+ua2xTgbJ1xM=;
	b=0aeBHItaOHT6Efp9wnoVnhFhLPtT5BhvT5OwjgkTSV/tYv5JyEJttHsuJVTHbyhA9sFL
	 852J+EUg1aE8kqtC9lR5GZmxb8nfhrmrWfnDkV25A/sAtBz6LN2LLIPEjT7G0BDPrKY0V
	 WxMIZvMgNnjEqzrIrLcFDG6aiPzcFn2C7qzYHO63acI3RsrNHZcRzMsLekmmeLNhm8gBM
	 y/TsoURD1SXHWCFgThMAbb0jGCEjh9W+/wFarQ0icfpfh9aA9bT3XjpaD5/IdL5isNajL
	 +tvEYCDS2TyMMXDFr3BMeys+Kza8qP7YNNnjWDCHwPjR1/NPYmojizApBDKZOpWxVHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ofIy15OT;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D659606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D659606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ofIy15OT
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A527A339;
	Tue, 24 Nov 2026 03:33:57 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D58553F86F;
	Tue, 24 Nov 2026 03:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795520040; bh=pF3xzyoFSRsAIr/NJIPBiWdUfn2WC5qYaw3V0lFMPyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofIy15OTKq1qh4cAumr3LmWK32Loo4zoq6ckUvHuNl4zPHsJJzUGR0L/iMU2QZXlq
	 3oy8DUbbvCjygFu6DxG4vN6b1iEDiYT4phayAkJgY9tu30rRRd/kqSNRA10xqwjtEE
	 H/sQsxIKA9V1HB2e6pOOZoyhIGRf7aMO2MJVvLNY=
Date: Tue, 24 Nov 2026 11:33:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	virtualization@lists.linux.dev, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: paravirt: Mark steal_acc as __initdata
Message-ID: <awV2I4GpgpMvIke-@arm.com>
References: <20261112193513.2655-2-blum@kernel.org>
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
In-Reply-To: <20261112193513.2655-2-blum@kernel.org>

On Thu, Nov 12, 2026 at 08:35:14PM +0100, Thorsten Blum wrote:
> steal_acc is only written by parse_no_stealacc() and read by
> pv_time_init(), both of which are __init functions.
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
