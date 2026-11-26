Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684404;
	b=teyvV8+AE59OEOgTfOVhubP/+XVJB7QkBNqgzOXW27k/r63oiEmpTJ19gAFYITi2UIFv
	 lgD0Ted+1DBc3YItwgSqdqetN3mPiL2JPJzCQgFbDi9VVFixA9PkuadF6uj8PyGp9osMU
	 eW2OH7CLojRZQZ7MWJzlSTbcYf5qpoLRGuf9Lm0DkZ3Qiggrs25rx7vfWyaqvfHg/NSph
	 +moYXT4OeecTx6HtnaKQosSAidilJRx1tzjWhuIzqe14j8WTMDmtFALh71nzTck5ab4Ky
	 NVrGvKiwudWS9Wf4QxgXUQhcaPe8ntXXUpziAgBendeFCufBp3aal1aplcv5gxz2ETw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684404;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=TbTI2r4VqWsRIKuZXTXWupd6q3fmIng2t7X/GEjnoLI+s13DCoGAUHfq0YBV4GNrkSfU
	 uejzMP2V/OrkEQPLZk/2JdEOFXGQrvg3Vs6GX2foBO68oqoBkpDuuhIA8IxFt0EleGpV9
	 NrM8O8dGImwIfdiSQsiYUyJHFIg5+Y40dAYU0TnNHFQd36gSFzNB51pU2571TEjnG9FJH
	 N9O/ykmk8K1VtpDZ58DZ2PU5Os0YRmR6ui8ikQ81gnfjyocYcXn0mZj2QvkLOr/s3/pdf
	 OAHyqfAuBzagm8Kt6CZupclgB0g98jF+jZ/BB5lLXFe2MOOPtupYJAGNI4UjYHeaRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46B606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC46B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 25EDB68B05; Thu, 26 Nov 2026 10:13:19 +0100 (CET)
Date: Thu, 26 Nov 2026 10:13:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	Chris Leech <cleech@redhat.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: fix use of a released socket in
 nvme_tcp_poll()
Message-ID: <20261126091318.GA8380@lst.de>
References: <20261126085653.3339227-1-snishika@redhat.com>
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
In-Reply-To: <20261126085653.3339227-1-snishika@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
