Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=165.204.217.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026951;
	b=TeHjG6SXv8ZGV4kjOD8xsRIoxOhdEyoARq2kjW8pNIKO2DSBuZxAM8Hu63/upMdKHL0Y
	 7oSUj/CbADX3sSRzQaOkCm02Z/MjtRC2lkaoy5126z0IITf04xq8X86xau6nup+pzE6m5
	 Bgd+CHi8nzp4ZeRldpjZB8sqyVT3lmqee1KW09tkrQF9j1zZ4lA4lyRZB2bybhSM486v6
	 48YippXvTXsb/M3/oJk9004pxc0GL9lTKhKh5YXyBDXoFwKKdKY4OdQeUpXoV8ua6BXwj
	 acxzoRt6JifJVqGkEp5u+gB2vXf3WiVqNk4QvwqCsYUaOGaJlppbLW0LRUT2pWnIuzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026951;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=a7FD+0h8clElYLinSrBZIpEhXnW7sSZOsdo/YJHbDd4=;
	b=VPtUtJu/W6qL7vK95m1Fbb8Tgh3butvs28Q9QfX3JQNpxF7VxlPJzA20WSG9LsvR2rIT
	 T+LnluuqPxvU9T26CUdAFWadoKBCl8g02ShFEDBRT+BttYX5wiKyrFjjgX2BkoOvR38Mn
	 6PBihjbfw0B46qAQMbrK6BBEzI6ktd7aS776jAKCRe7VzgcE68d4AZ3O1fy70aTGv1b+n
	 aI4aFmb+lfWVnOG4xZUD7Ex7xDXvFnBg6LjmVol0h7u5CMGHiIoTfiXQ6GDgUmuHW1e9G
	 6dJOJiUl9uWoHR4EfvGS2PkZZoJmdAq/XYb/YGQiJ8EmjizyVW5kyR6XkgaUVpaDJLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com;
	arc=none smtp.remote-ip=165.204.217.251
Received: from aocl-turin-03-9e62.amd.com (unknown [165.204.217.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100EC606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com
Received: by aocl-turin-03-9e62.amd.com (Postfix, from userid 1000)
	id CB357172044D; Wed, 18 Nov 2026 18:35:48 +0000 (UTC)
From: "S. Biplab Raut" <Biplab.Raut@amd.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Yann Collet <yann.collet.73@gmail.com>,
	Nick Terrell <terrelln@meta.com>,
	linux-kernel@vger.kernel.org,
	"S . Biplab Raut" <Biplab.Raut@amd.com>
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored sources
Date: Wed, 18 Nov 2026 18:35:44 +0000
Message-ID: <20261118183544.1670592-1-Biplab.Raut@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
References: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
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

With the whole of v2 applied on v7.3-rc4, the lz4_compress cases of the
lib/lz4 KUnit tests I posted in this thread pass on UML, i386, and
x86_64 under QEMU with KASAN and KASAN_VMALLOC.  They cover
LZ4_compress_default() within LZ4_COMPRESSBOUND() and with limited
output, LZ4_compress_fast() acceleration, LZ4_compress_destSize(), and
the dictionary path of zram's lz4 backend, with work memory allocated
at exactly LZ4_MEM_COMPRESS.

Tested-by: S. Biplab Raut <Biplab.Raut@amd.com>
