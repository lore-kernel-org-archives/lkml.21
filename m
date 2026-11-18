Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=165.204.217.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026953;
	b=EdF/uAhpZHA16Gzpt031K0HKecXft3OuQs3oHhVf2G2hXIFPySWvqipAA9lrLkzkuuPO
	 eTU4SHw4uaUy9T4F2FrEP51XqVyXXL9/fe5nfHokLuk2EAjAGKGhsd9zytWPc+DSPkTza
	 v0M121iF9Plh09QVEoEo7URHL8bnrMG7jjUG/kIRa5+aKAlsu224Tijymz5Pk67S+4dA1
	 dLFYsPoOxbD9vS1/XeGta8LdY/UckRiH3XpS4L6xkumSE13XbSIgmqsrq7rk6yLl7mtpq
	 FiUXoqpHoylZs0qcb/WM4oi3L+MrpzEjHQm2Hxc6kJRBolfp+c8OO7k/LCyxFz8jvIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026953;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PX/ml2vCqpFZ22MuI8UoFcZaYLNaXhtMmLryAJhzoqg=;
	b=jMdMyF0c94jtGayFr08m+EeTm6wOIVYUO1WJLMRr4L3pYRa+GiWvzO9Z2aCUlmGZ0c1i
	 pTmmTHf3dZ+WwRIsbSi6dB6Ex9mzXPDOYUB8nyg2BglNUOvipmtKOzRvAc0wuLLyXsQNc
	 KJjJg3pk4j3SY6XXjSBmgJdccvhRdjS+xFoog0dYkdYFFINonSfTwAKY/vOl4rdo0zSYn
	 ubgmQsHcjVKD0zf5VmmxCJ+7VbODvzOZCks8pKxWESxG/J9m1vVx69NtevvVzag516DlA
	 1ddPgpvRjpx43LPNzk3HVFhy1ZAVglcLrm0Npyih6yyjlBQefPchIi2N/Iz35UFFl0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com;
	arc=none smtp.remote-ip=165.204.217.251
Received: from aocl-turin-03-9e62.amd.com (unknown [165.204.217.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4580F606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4580F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com
Received: by aocl-turin-03-9e62.amd.com (Postfix, from userid 1000)
	id 27DAD17204FA; Wed, 18 Nov 2026 18:35:51 +0000 (UTC)
From: "S. Biplab Raut" <Biplab.Raut@amd.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Yann Collet <yann.collet.73@gmail.com>,
	Nick Terrell <terrelln@meta.com>,
	linux-kernel@vger.kernel.org,
	"S . Biplab Raut" <Biplab.Raut@amd.com>
Subject: Re: [PATCH v2 11/15] lib/lz4: switch the HC compressor to the vendored sources
Date: Wed, 18 Nov 2026 18:35:48 +0000
Message-ID: <20261118183548.1670635-1-Biplab.Raut@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-lz4-vendor-upstream-v2-11-ee04c3f0d7dc@samsung.com>
References: <20261106-lz4-vendor-upstream-v2-11-ee04c3f0d7dc@samsung.com>
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

With the whole of v2 applied on v7.3-rc4, the HC cases of the lib/lz4
KUnit tests I posted in this thread pass on UML, i386, and x86_64 under
QEMU with KASAN and KASAN_VMALLOC.  They cover LZ4_compress_HC() across
supported levels, including the kernel's clamp boundary, with full and
limited output, and the dictionary path of zram's lz4hc backend, with
work memory allocated at exactly LZ4HC_MEM_COMPRESS.

Tested-by: S. Biplab Raut <Biplab.Raut@amd.com>
