Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199705;
	b=p5XNAngcnlWvEv7NsIvU06yWQhyr47Pwrzm5NhdwMAduEWRRqjhUpp/hjqRzuHIvqwmb
	 LPnRhZ41Zf+XJOzrbnpKPcLT35CbN3uKhryXnqLCm/mBzTF1sK9MVC2w91izu8EcPkO7c
	 4Bvh1m4kvBXXOhs0Ds2WYEh94US/rMJoDkv42dBxvtCowk65Rz676HyhUFJbc3v2XaDG0
	 YF4Ok7zOg1wCZDu6fqSEILsl6t1eUVN1gZJZO2E2UFmd5n7w4fxrbYqR7gxO4yxJqHpQV
	 nzQ3q3EVE5ozjAJ8P4yy5CiOLHDSJKgOohEpQUxdDQDq0/59dRh3FiWtYtYWSOpNvXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199705;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=Kri7eOIiukMC5IdWfCCNpZgSErM4wkzLZmzzauzlN/fR2sjaKURPoyEEG9B8/21OJcuS
	 pzk0f5xRf8oEx5FUdIFE9ibwH7Oeh18LNv1dg7W8s4W6Fy5N9x11O6y+Yt41GNTC6NSrH
	 +LWcplKsqZAeetqQhMygbZiXvuIjJwFb3bDtM5QvJK9uUrA2mvo1ouY4KqIlIKtpsaSyP
	 XaM3x0OfdTn+h5M4fu+DEuDiiShwjcc54QP3yW1wdUjXbCuUhCGBPcWfAorhbdzLcgKDj
	 uRYPkLDFzrvs1LSATFMyzRjIFrzx8McdhqtRg/Q2EjiN6iF/WiOD0WdtD0qbTMjaxUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605460A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3605460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 934F86732A; Fri, 20 Nov 2026 19:35:01 +0100 (CET)
Date: Fri, 20 Nov 2026 19:35:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Heming Zhao <heming.zhao@suse.com>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v9 2/3] ocfs2: switch DIO read path from
 buffer_head to iomap
Message-ID: <20261120183501.GB2450@lst.de>
References: <20261120060014.12087-1-heming.zhao@suse.com> <20261120060014.12087-3-heming.zhao@suse.com>
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
In-Reply-To: <20261120060014.12087-3-heming.zhao@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
