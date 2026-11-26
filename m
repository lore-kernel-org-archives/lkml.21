Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682905;
	b=PKYEGItjPb6mMKu0cycunN5lTjV9d/Q7rnPBy6NedUmELtCivTwvd9IgyW8J/ABeWtIm
	 n/Ac5vmbjaM/1rn4KwJII9yWsAGK5WMqrSsub4h4KdHQOG1UOFgluvXb0rxkYVgM3n8+a
	 N6q364s+hODBUSW+A6VxmYhIDSyF4uWNUa34jPXFz0yHkwFSZ1W74f0fnA4M6V7m0nkjR
	 SoAloY/7kLHrYYFlPlbCpJN1vkeNwNuAUaeAZV/UPSros4drP2/Lm/NHAaDvTyXOKvMRi
	 Taz1nbJ6ex0zV6wqlY5e2PKZYhfYBYL3wdA9pa9KamaYxLaxpbPSMLXu6zOAhL74DQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682905;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=k+QouRNI1uHxt3hweqWR8woAvyGab0jC4T/uBCc07pS1H3XOwZQjMoaDOcX8KKRrcZcd
	 q9WIIePfB5Qr2drGhCy5D0T3oiTTFwNDIUFZSJ+Ti8WuDYRp7tWfy93pkNS0RpbAisAZ3
	 Grf3TivJIy/0pSiBmeW/0yA+nnVsL0+AK+3FcD6ougOZuRwyvMf9QRPvCw+qaJ0Hz0erR
	 IxJyZ0SYtf2xN/u+V7VCTABjAoVw9iS1NJcUCkwGITTuBFsMHJh7G1mHGlZSfhlBv8RcX
	 9gGeEt5jC3M5bLe2OWaNNa6PbS1wMYctXQDBlu4kdhd2ACeeej71NYJ54t/xfqosq5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4773E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AF8E768B05; Thu, 26 Nov 2026 09:48:20 +0100 (CET)
Date: Thu, 26 Nov 2026 09:48:20 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Cc: kbusch@kernel.org, sagi@grimberg.me, kamaljit.singh@opensource.wdc.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme: reject a controller type change on
 reinitialization
Message-ID: <20261126084820.GA7617@lst.de>
References: <20261124133122.4167640-1-yhlee@isslab.korea.ac.kr> <20261125145902.254297-1-yhlee@isslab.korea.ac.kr>
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
In-Reply-To: <20261125145902.254297-1-yhlee@isslab.korea.ac.kr>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
