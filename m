Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=165.204.217.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026956;
	b=k/hGfqYkvjeTplCNofnyQok+T1yRMXL50NyuxOurv0H5SOIDyPY1PqT+/SRiZ6RKz6W3
	 KhcjouB3KxtceQKZDZ1/Ws7U3/5wdxs0gUBPMkzgIK+wkSbKBMnCskfQbR5D1ONzgOo0Q
	 6TCXWFCwp/gbGK/2dA2WKUKS49wX8EXmgomjx4dM3L0Ru1k5Eq+YkeBE12p9L02efz9J0
	 YFqjmh5ZldfQrdtDPGNTSYDVoAAR0HdXZ7ZCCSou/0SfCrRR4PDYaYXl9rTGnKiEZbzcm
	 1bAQLsTLBSrTkhOFLQDCo4lIwz0HXb9UtLTuFx46/qmvm2ZwgUvx2nfYqfRiWWaYINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026956;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IfTtvM/3+s40XCW0hkVAEdNiQuNayjBzRBn88skgIHc=;
	b=js/GLSV99fQ2J1eBxVnwnaoEvZYzOKFFWsxY7xs0PxA55ReoCFjiMeCxkh/8J3Iq+VEG
	 ynhbbKiV0/YprqzTFOcU4daHzE8cA1TLEwVTKWpKPHk34WX1cGlvat0X3FaAanUQVp1UB
	 LwYcvvGMyiHGKVZPEmo+YjwH7CW083vvygCJ726RnUZrh+f8W+A7D9aYKLJBy2rEUnO3f
	 VIU9RaTvWpPttjitjW/YFt9PgS/70Z4sba3DtN5ngsemJF6k+Rawk4uyX2rWb/Hbbe0wt
	 UCJd/FCNwBXjv+hocUzQeKNu5LBxt3+4roKb80T9hZqpRMfmPXDu3ahkZUJg2wJgA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com;
	arc=none smtp.remote-ip=165.204.217.251
Received: from aocl-turin-03-9e62.amd.com (unknown [165.204.217.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B7606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B3B7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com
Received: by aocl-turin-03-9e62.amd.com (Postfix, from userid 1000)
	id 29D6F1720679; Wed, 18 Nov 2026 18:35:54 +0000 (UTC)
From: "S. Biplab Raut" <Biplab.Raut@amd.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Yann Collet <yann.collet.73@gmail.com>,
	Nick Terrell <terrelln@meta.com>,
	Gao Xiang <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"S . Biplab Raut" <Biplab.Raut@amd.com>
Subject: Re: [PATCH v2 13/15] lib/lz4: switch the decompressor to the vendored sources
Date: Wed, 18 Nov 2026 18:35:52 +0000
Message-ID: <20261118183552.1670705-1-Biplab.Raut@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
References: <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
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

With the whole of v2 applied on v7.3-rc4, the lz4_decompress cases of
the lib/lz4 KUnit tests I posted in this thread pass on UML, i386, and
x86_64 under QEMU with KASAN and KASAN_VMALLOC.  They cover round trips
through LZ4_decompress_safe() and LZ4_decompress_safe_partial(),
truncated and corrupted blocks, offset-0 matches, and overlong literal
and match lengths, with work memory allocated at exactly
LZ4_MEM_DECOMPRESS.

On i386 this also fixes a case mainline gets wrong: a match length
whose extension bytes sum to SIZE_MAX is now rejected, where v7.3-rc4
alone wraps it to 18 bytes and accepts the block.

Tested-by: S. Biplab Raut <Biplab.Raut@amd.com>
