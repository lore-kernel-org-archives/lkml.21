Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099670;
	b=GKI4xsQdRK02ShYFoIhU9FnRfWOd+YqLpwXTVhMactleDUuR1HpezzUhPntF93hEFbgp
	 KiH5dm5q41DA3e08yeG8Uzwu7MSa72JfQjXXWmibcobWrHCJqUYqYidJo/OHI6aNMH7iS
	 XsAVKISt3d46io05uVee0xYFj40ilgrpnrQVIBGR8fi/t1a2VMdnZnRq2ouwTJD5vmZmK
	 ccJXyr17xHFhaNgh0/EuZBCNnq7d5iGXqkC+VxPDjpm4guvpelXPaTFQYogZNTCwbka21
	 5rTViNpM75V9fY0p/CJM+3O0SSYRz8L26GB/OX3a3Ik6egft5X53DPIGwAHvFLjALMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=in5nQCoUrQujBZoVynDTrPnVxRm7bzTP2QSdV3z7N8I=;
	b=1Tgl+CxzGpfmVCCpdG/Cd8oNUpF+SN6R4cOiLOueqB0HBxuAHyr50lsISDIHNU4H+Lgc
	 q6W24mMvwBmLUMN80Zrse3ZNwgeUIDHWEmMV91buMQIu1W5zEzIJYI17M0m9S5ltKsKC7
	 Uwh2taMpjsBwqMBh6xTiGE1+zI7weV4aFJAX7V90q5l0v4QvdD5UtjmZUHcstLfTZ8Vmh
	 w0GTxNrluUxLSCNqnP6O0b5xpfnAdnLFiaPgEqjX7DClyXJLopXIy9+O+aL3BXW+vHGZa
	 jEKD8ig/cjF9Lzb4qYNqdcqt+jVu27zjjucebOEQfu0iBBu646xCb9HSyMaji7gW+3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b="Iy/JV+x3";
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FAF60A2634
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FAF60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=Iy/JV+x3
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElf7v018189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099663; bh=in5nQCoUrQujBZoVynDTrPnVxRm7bzTP2QSdV3z7N8I=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Iy/JV+x381U9clIcsV8XrLP4T4/74yutFZlHmQYKvK9RIqbAp0TNEQC9IBn2M3iPv
	 i7aLwoME5qYNWIRgR2enY7/JjAFMmmHM4tUNhnuW8FuFo+T6e7kUxfgUpjLaO0N6Za
	 ns3ZRDuvFsgW5/X2VRNb9Q1sWIk6FT4ca4c8WLLJteWHOnflWJAxKRu06n+TpDtkBO
	 6Jc9JHBMyovDStvio29KcodeFemdrlQO1lUhGfELEv8fmnXv07zkCaLV5dyRtzlTta
	 XPlg/QaSn3MJVZmxBXTm4wYpwNLUpSPCqqBUJ2YL80oMSh6a8DV78AiSSsoIjlv6Xr
	 I80KQJAyQ8F6w==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 5813C2E0193; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Jan Kara <jack@suse.com>, Qiliang Yuan <odys.yuan@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5] jbd2: fix shrinker scan budget accounting in jbd2_journal_shrink_scan()
Date: Thu, 19 Nov 2026 09:47:16 -0500
Message-ID: <179509948690.1938961.2752357000354922584.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001-fix-jbd2-shrink-scan-nr-scanned-v5-1-5348b51efce2@gmail.com>
References: <20261001-fix-jbd2-shrink-scan-nr-scanned-v5-1-5348b51efce2@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Thu, 01 Oct 2026 15:43:43 +0800, Qiliang Yuan wrote:
> do_shrink_slab() reads count_objects() once per invocation to derive
> a one-shot scan budget, then calls scan_objects() repeatedly until
> that budget is exhausted or scan_objects() returns SHRINK_STOP.
> include/linux/shrinker.h documents that scan_objects() "should track
> its actual progress" in sc->nr_scanned, so do_shrink_slab() can tell
> when there is nothing left to examine and stop early.
> 
> [...]

Applied, thanks!

[1/1] jbd2: fix shrinker scan budget accounting in jbd2_journal_shrink_scan()
      commit: 9e6f36987aafbbf10b87c153fad0337dd2e611e1

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
