Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412311;
	b=4LNzcnF08nAoivLuy1iKtsP35S/8BSShGRiQ3cE9OpqiR/fyXzcZm3BIJJ1FMbbQvE3t
	 D/oaXitOV0RZL/SiLsyfRQDYfsZccrB7dtAcoWn2nhEdzDbrqcLhdh+UoiZ6kUpbQneHV
	 4TdxpiIJhafB8DV6O7vfTWZ4COqGhWd1vqgur0bsVZcRY/2D4FRBYcUamcFIg5h+6TvJt
	 GOxgZaNi7yCqA18d75UoqMP6nfEsyYSPjogcxttHXlhJ0QkXmHVaKMJjjVzhkRHEq1tPR
	 7h4XtAO9evxeZ9y5umotHbaqOe6RqTjkfdGPuEtlhs6L/NgRGw8n/IRt8oDLu+aYCEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412311;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kQBD5MbUBLOzHLbsNcCCef5FX4fxCpMbix7OBi6Syxg=;
	b=AloOxvnjaQqbDE0vhAcSbFftuMPVG6tZxn42ohfdbn1HbyR05GWllRBUCqulGvpeooKk
	 8so1CBZCBz/sBA+r0h+vFbreSreTW8c2jrhvn/huA210yNekZ1JpMJmZNWh/jG6558CzA
	 5O2haxAXrnMfmXOq5VXQJR5y8969/W36/Jb4kz8ivoskFNsmPjbPH/K/qRL8LUMeds33V
	 rtqLZsU/5oOHRa7psoZm6pCLwoc/EqXDweoXts+VDOKehP/J4wXKq2h4IXs8Z7k5HC1U8
	 UUdHmAijVx5T2+s7GbJ5dNJSAz22ZznW6AWWk2oGrqqWW7EaNl3p5MfeqPpR8P96FyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="qUI/6QwK";
	arc=none smtp.remote-ip=91.218.175.198
Received: from mta0.migadu.com (out-198.mta0.migadu.com [91.218.175.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA26606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qUI/6QwK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7q3ikdoHrSkNyqihxAmPncUqiSkmfzTa1Q8iooQg3NU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795412308; v=1; x=1796017108;
 b=qUI/6QwKZNVZcdiM4l9JMqD9j4EFMSNxuiuQnjJ1rLownZqabfNU3UgxzG+q4zGJCSqLAxQD
 Z/DZsCwP2pACDrSSIE4J823bvXcfLs+CQ4UTRyur0z6y9Mc+9zEDeZvQU8NHGukMwB1UOrzDYtP
 s50sTUVOH0cZGCrae+4hNTac=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 953e590f3ed05e65;
	Mon, 23 Nov 2026 05:38:28 +0000
X-Mizu-Trace-ID: 953e590f3ed05e65
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	nico.pache@linux.dev,
	jerrin.shaji-george@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	shao.mingyin@zte.com.cn
Subject: Re: [PATCH 1/2] mm/balloon: fix NR_BALLOON_PAGES accounting during page migration
Date: Mon, 23 Nov 2026 13:38:19 +0800
Message-ID: <20261123053819.88374-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261120-b4-balloon_nr_pages-v1-1-d8944b587819@kernel.org>
References: <20261120-b4-balloon_nr_pages-v1-1-d8944b587819@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Nov 20, 2026 at 11:34:42AM +0100, David Hildenbrand (Arm) wrote:
>balloon_page_migrate() doesn't update NR_BALLOON_PAGES in two scenarios:
>
> (1) If the new page is on a different node than the old page.
>
> (2) If the old page was deflated but the new page could not be
>     inflated, effectively deflating the balloon.
>
>Consequently the "Balloon" values in /proc/meminfo, the per-node meminfo
>etc. will be wrong.
>
>Fix it by adjusting the "Balloon" counters accordingly just after
>conditionally adjusting the manage page counts.
>
>This has low urgency.
>
>Fixes: 4d689474e1b2 ("balloon_compaction: update the NR_BALLOON_PAGES state")
>Cc: stable@vger.kernel.org
>Reported-by: Shao Mingyin <shao.mingyin@zte.com.cn>
>Closes: https://lore.kernel.org/r/20261115004708909xx05JgB9nXnOCG0zL7h_K@zte.com.cn
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
