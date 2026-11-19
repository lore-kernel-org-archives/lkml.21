Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092751;
	b=nE3EfMVR4rnGF6AAhve9zhtnYOFKGYcKMHl4bp1aOTOE5aD9k03ncLzGuaUJJqOooFTM
	 nvSVLrqhGn7pac1KTrbQ9v2fL/DdXvRwQ2+WVPn1O3rtV4uugyAJXjv00uNDYWOSqeq5Y
	 wE32OOuwQVqT99AUopQ385dUx+mYzNDie6s6WqwYq2KMUmNxaCqtCZTn5+BKSyjnO2DHk
	 9iggrACuKEwdLqVjUoK9qA8Xb+N1ZBgTkelYWbWJ4G0beR/oJeApG6fX31+0Ofp2yPhPS
	 CDEl/ZSJksU5ow/7qWwS07wehHJDXwptI0vRoXex6JZGjvVC8K9onJ92hHTJpfxCGsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092751;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nOPSfl7MrQH3aAdmvuLmCg2r2GTpQs9P2IrkXtthaEg=;
	b=SCc2tNjUtyLyC1iDWc0RiNCa3Z7TI4Q/9o6NcgmgpyKSOShyB62CRnI9i/tqxYBnU1vN
	 2UkubgEEq2mPpWxOUduH775OjSCnhq4cYjyvWS90gNt1ZXglgc2EFHLyGQmr2tjpimm3C
	 YCJpueKkzhuxgo4MCLhZ8+R9nKeEvNXQAEHxyHwTsDy+z+6W/vVgKgD7W+SNJqX44KtFf
	 AAT75et/Tf1Jq1KoxtR/hZLPs+liHe+TTZotWoaMqqPBa/XpW+KmwQeVHj8/W8PPMm73N
	 5vA0ldIZYn/pogvIUXV0ridZYjpXUizIXnsDfIB4JUlV2cBdSRidhk9Y8xMxT2uywUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="GcxX/XWM";
	arc=none smtp.remote-ip=91.218.175.58
Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F428606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F428606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GcxX/XWM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nOPSfl7MrQH3aAdmvuLmCg2r2GTpQs9P2IrkXtthaEg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795092747; v=1; x=1795697547;
 b=GcxX/XWMeZeuTZblPzOCtHls2XYIzke8Wax5r/ZTDw01/8E0Ew5c+J5EUDAe6wPJ+SBNgxO2
 W1IO25VH7eI9UG4Pun7lF/zTewsf0Qe0eTP3N9GVUTCSBNSFInYGMP0Cpy0Rrh4x5KPEFMc63FB
 jGN0iSoqJ4DjznvX+zMivyik=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c26360b5cbcdfa14;
	Thu, 19 Nov 2026 12:52:27 +0000
X-Mizu-Trace-ID: c26360b5cbcdfa14
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	rppt@kernel.org,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Allow memblock arrays to resize
Date: Thu, 19 Nov 2026 21:52:21 +0900
Message-ID: <20261119125221.11897-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
References: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
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

Hi Huacai,

On Thu, Nov 19, 2026 at 8:05 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> Would you mind if I move it between memblock_dump_all() and
> memblock_set_bottom_up(false)?

Not at all, please go ahead. KHO still works with it there, since
kho_memory_init() runs after setup_arch().

Thanks,
George
