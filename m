Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=165.204.217.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026955;
	b=etfPiyGbsFwPepbuehVL0K9FcD0dSRq8nP/eqfbzomsPPTXp6mDKnAhUvZDM6GUk8nE9
	 oP6KlJkl+D+CUM5SU0LUznKYYPrrl0HglH1uvyi+QBhtndKPEJHvUNwtS2EAGGokT6+nf
	 tXlTHod797GHFGb1DNs/lPdaZ2T2e+TH70er6HinEU3Bk1cprABvEq/u52KbuXUN8GCPb
	 aJoXIhcNkC7m4cvDjRFXN0I2tralEQEg4TAecqLwJ9FxF3FlXMvgFiOaxZvylnjtEQ+2N
	 gF+Pn9aa8ULALcjF+vRKrNJ1jibeq16IoUkSs0vUQCVl6lHlxrU5nrpDIPyRhyiZhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026955;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=V23cxcuWzVaRdpJ+wIRz1kR8tN12Y6x1ZFT74cu7xO4=;
	b=FxYFGVmA4vi7TYwQ3CZ1dbDTrthSEdmoHPIQK9tDKYfGjiJ3fbjA+5jkQGYgUKbNv8nY
	 9fl1LlVC6OkGoOODnNph+D3dfi9J77gn74fqAsJkbtL4i2D+EKulk0DFpmjWDASSXNv/W
	 tgIqqSDKtXTkeybF18t5HEEJngnbW41nQ41MUBmC6vknPcumkgoYSXlkQoiNJmnZtCQh0
	 udIGfJog2pMbEUxS4hznTSvg/1gs+wtjiNQt6qPGltm2jlPrnhaNEJ13CX002gWmUrCmV
	 AwiUqs29ZEb5BtV42OCs5s3qsi/dk0oSXzWCYCDddf0HzSDz/TDk5pmRSUVru6DgRcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com;
	arc=none smtp.remote-ip=165.204.217.251
Received: from aocl-turin-03-9e62.amd.com (unknown [165.204.217.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9AA606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD9AA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com
Received: by aocl-turin-03-9e62.amd.com (Postfix, from userid 1000)
	id BDF481720567; Wed, 18 Nov 2026 18:35:52 +0000 (UTC)
From: "S. Biplab Raut" <Biplab.Raut@amd.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Yann Collet <yann.collet.73@gmail.com>,
	Nick Terrell <terrelln@meta.com>,
	Gao Xiang <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"S . Biplab Raut" <Biplab.Raut@amd.com>
Subject: Re: [PATCH v2 12/15] lib/lz4: widen LZ4_DECOMPRESS_INPLACE_MARGIN for the fast decode loop
Date: Wed, 18 Nov 2026 18:35:51 +0000
Message-ID: <20261118183551.1670675-1-Biplab.Raut@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-lz4-vendor-upstream-v2-12-ee04c3f0d7dc@samsung.com>
References: <20261106-lz4-vendor-upstream-v2-12-ee04c3f0d7dc@samsung.com>
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

With the whole of v2 applied on v7.3-rc4, the in-place cases of the
lib/lz4 KUnit tests I posted in this thread pass on UML, i386, and
x86_64 under QEMU with KASAN and KASAN_VMALLOC.  They include a fixed
block that corrupts in place with the old + 32 margin and decodes
cleanly with this patch's + 36.

In userspace, against the vendored v1.10.0 decoder, I saw no in-place
corruption at + 36 in 600000 random streams, nor in a port of upstream's
worst-case in-place test for any source size from 300 to 4096.

Tested-by: S. Biplab Raut <Biplab.Raut@amd.com>
