Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195520;
	b=NIrxXNX9oYIKhhFTTTgkf3qbAQRUtMVKpRGh6fKyrMnRHnRyPXj8CpGOR+eXDNVBuONT
	 pzLkGAxMxpz/jneRuMoKt50mAGM0tTjIl9v7deUUbLFrY9GsCEE7v29DZdPYJPnvnnhlM
	 uIN7I38nwuchrJSfmGaLNQT4nIQQ4mINR0fuH9GzbHlJEro9xhLkEA7nOL1s1ysTKcMY1
	 DzvICfkWEmVo90424w0TieZC5c8oAQq++yfWEzU3KMCSeQ+TZTzUrzxZWS/6OsrKuVStu
	 7rwVKB22DLTFHgMWiBGrJ+4HRgW09Z9vDV3tg6Lnx43HyqrGNRafdYZM/qllE2fgDjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195520;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=hxA7w/a3RGE1PASrKQP14vJepTUnPJTytiHPwQ1jY3e5pU22+feATxKBY0wFt3YXf3Im
	 6qGvPzKbjrR4+RszYBzlrfP2QCR+IVv86A47lDPz1Cu+hLbIzZbLr4+p14h6GLzMnexno
	 YAesPmiiDK+KydKOWCwOPyUm0Ubh1aXzXJjGtX9jhh9a8Xe4EAL9fWa+4q/3FTvASn0FX
	 BKvEwwXHz1nxrHsQv5UhQyTYT/YnCGG42nOLlh54Fin0Y0S2lp30/bJRL1rerQ7vDEcNW
	 Sx+KiQT6EF5vWiSxh6nvSaulpreeYlt6WY/djpS6InAXq5tZ+pQMiCHtM6z0+q8tVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E2606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906E2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B1B146732A; Fri, 20 Nov 2026 18:25:15 +0100 (CET)
Date: Fri, 20 Nov 2026 18:25:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] nvme-multipath: apply delayed_removal_secs
 changes to a pending removal
Message-ID: <20261120172515.GC941@lst.de>
References: <20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev> <20261119-bug-nvme-mpath-set-live-srcu-v5-1-e1483e2e447f@linux.dev>
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
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v5-1-e1483e2e447f@linux.dev>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

