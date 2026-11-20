Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199661;
	b=5L05xd+7YNPg5kkryu8d6Tb6nAKyo9EpdE0ilvT36YhX3KTi5GjDDGHGMH/DU/4G+GbZ
	 mVj8xEAC9dSAqKqyIgOxcwFxxW1iPsQDbhV+xiUx+p8prdL6aL23BbOiaweMdBCtNaytO
	 1WNC2axDqgj8cdspLp/kNwl6Cilgg09RLiTFUaoUugMOawMjZB7x5u4EFmWSssEDahTmt
	 84bgtd86OMdFsm8KjVJXpn1Z/BKJw/v4rPAtOk3zd02b/6DO4vVBCj1mE79S6lGCeuCZL
	 Xz5Ata9cdW52lNXjW14UA5bilj7aYpUFR2IOM4iBReFTQJvSyLFTqEnbhMbkitytwCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199661;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=IEZ0ox5r8LdG2Sd8SJBg61Hr10YfqdEQnggc1lNOx3c=;
	b=3K46WNfMNadzrp0y7KEXF4/Da8qQtITOGTZYdtMRn36d32CNuaLk1//V632OWfkxxNHi
	 HWTJyQf8ZgLrRIqMQmq0jjo6FwiP7hsS+OpEpg3toRni9b1R1t9qYe+m3hT2I/LH2GJh9
	 6LhvA+v5h0WmZVK8co6aiw67Tl+2VSSjhw1hI0VaYK7115Z37lP7YRLK5beBFgO/1+Zes
	 ratIZ87Et0BrPzIqVePdn9HQlGdlVLkZf8VX+T5aoyf6P3T+XyhQLudqNQLbFJ0tVUeDw
	 fiRR3V1NKyNhZHZwd2pxqQu7pBxkdyKD5eojcpwrysTvGFkMZO3MwSwlSaUyKiHBefw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D94606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D94606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D42086732A; Fri, 20 Nov 2026 19:34:15 +0100 (CET)
Date: Fri, 20 Nov 2026 19:34:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Heming Zhao <heming.zhao@suse.com>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v9 1/3] ocfs2: Add new ocfs2_map_blocks() to
 introduce iomap feature
Message-ID: <20261120183415.GA2450@lst.de>
References: <20261120060014.12087-1-heming.zhao@suse.com> <20261120060014.12087-2-heming.zhao@suse.com>
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
In-Reply-To: <20261120060014.12087-2-heming.zhao@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2026 at 02:00:11PM +0800, Heming Zhao wrote:
> As part of migrating OCFS2 DIO read/write code paths towards the modern
> and performant iomap framework, here introduces ocfs2_map_blocks() to
> replace the legacy, high-overhead buffer_head based block mapping
> routines.

Do you have numbers to antiy the high overhead?  Or should this be toned
down a bit?

> In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
> mapping flags with the iomap API requirements.

"gridge"?

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
