Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683236;
	b=3yV5LSEdRWx7y3RyKUnp8keR2iyM0eKoFfaAn6SjeFJW2WWiGIrhYCQr1BcORglqPBpH
	 9T7/h/zKwfRS1h0jklEf5FLVJsV2SypZTIhF05Kzdh8KJyXaVHp18Y2Kgs0STsXazyA5w
	 C9X1tWIrSvx5d8rGY6zN3Tsb2iyXKJsIl9Euw5Yq5OxEO57mJwLiE9f+eJ+/RWNX+F7zO
	 ZKNa0nwVqagL5BRpqepIRTx7r1rBdh8ZCoxowlMWjdUNqyit97GDVUPF3H2h8fnc2vuyV
	 aj+MAiW9OqbuZLPq53emG/HB5E30HmdWTfcm87xj3eQqMuHiFotssbGn72I2Ir9rGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683236;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=Rwa5TNWkAISBac98UL6jPXuwWneHAOqMHZhjRMH6TYOupsLZDkKOP7rQaWbYWDA/H3il
	 oQeT7L2641GUkX32g9AKF7KEcGE4lckGpzFGvdosd140/NcohUrH2+WC7SFoAOWF7cWsz
	 KHQpK3ZcrfixOMm2Y0BcuNdCkl2kTSVv7F043Cr5qiHtrB7uLWsRqgAKxCtedWGYvtkm3
	 TqqEbTTbOubrpCuBkOoqXR0xXP3UiPLcBRhgy658on5mQ3xqAhNnOcQ/71VRrOokl3mhe
	 xrXZlEjMJrhrRSMR2xXiSWasIcRFtMup9Rh78Ghu5V/hs3Sibna2QbTQ+litb2gTh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3674606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3674606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0DF9568B05; Thu, 26 Nov 2026 09:53:51 +0100 (CET)
Date: Thu, 26 Nov 2026 09:53:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	Chris Leech <cleech@redhat.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-tcp: limit the direct send path to poll queues
Message-ID: <20261126085350.GC7617@lst.de>
References: <20261126063255.3240292-1-snishika@redhat.com>
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
In-Reply-To: <20261126063255.3240292-1-snishika@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

