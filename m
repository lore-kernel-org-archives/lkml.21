Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050466;
	b=J3/4rO7ZWpGBjqMTxpfubNrxRwwSH32vaKdOuwIQbidYY1c8LOB88ISs+xI6elRk1luV
	 vmN2GBkzVifSeGRAExn/XcM3ewxFS7nHUBVk+/y+nWLv+spLBxIUq/+sBG3Q9po+rMEVn
	 JocFZN8d4xFEVV4cfuwP8h/Ne2kMYbARpgpp1AJTXdGX+idkqeqiWUVbN4mEEHO9clzY/
	 /NHIde6+vP+2dyDChQTQAzBcHDvbUb9LmtYdkdZ6eMNs40mY9RoC0gqaZ+BdnsAja+fA7
	 18GYKZrp2KbXabgDWqrY9hrJL+PpKtzpTYIhkFeubj/yxzJWae22vPgv5xGm1VG6W+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050466;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HINsME+iXYJtTjFPv+yuivxQq/X+Lpd6mIVAkSLmihQ=;
	b=nD+v159KGE6QGbQfVjpIb/EEmCRcVNk/K6tLt0uJ900LeMPYp6DuUUGmSOQZ+XyB3eX/
	 h8A8mUtMblq2BA/aqoMW4fChODjfS+YgtB5uzMEvyL9hvDa31gsUQRR5bbkshJICdXDzf
	 vAbQZtPwlizEFH6v8ao4v3J5hlUE43UilpB+HAyJkcFJ1qSAWpKmbZvtCjGoTxwUalS8l
	 GN9Lr1LYtkU1IlII01SBSYZFlg4FirT/eZeotgEpJcodCYZSd/TY0nRZ36B+LDOnvUDuC
	 c1MagL0hQhxo4OnjQmJZhO412dMrIcalZ3LShTrASxZ3NwzkCElCn/fQ4mmt7LYmWgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XiHBymb7;
	arc=none smtp.remote-ip=95.215.58.86
Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D95606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D95606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XiHBymb7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ev8iubwzB9gJIKDmBRQcGMapM70UHKFSQ4HST5j9XkA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795050463; v=1; x=1795655263;
 b=XiHBymb7+evCbuL7RUwbRiwejYVNNR/hnchCub46hbyquGO1xF1WwAxEgQrPYc26MeSRbJsn
 XO4ROre2E0r2Ueutg624X66Idae8Z/W6LPL1rdxgocOGFtoyp+r8tvjyRSIUxqbko3WpJeN3r4d
 fE+7lKT6EE2zXxWOXOcibNik=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 03252fbf95683bbe;
	Thu, 19 Nov 2026 01:07:43 +0000
X-Mizu-Trace-ID: 03252fbf95683bbe
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Jens Axboe <axboe@kernel.dk>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <tom.leiming@gmail.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Hannes Reinecke <hare@suse.de>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 0/2] block: make changing to the current I/O scheduler cheap again
Date: Wed, 18 Nov 2026 20:07:33 -0500
Message-ID: <20261119010733.7312-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179501805754.17649.16701221943802051712.b4-ty@b4>
References: <20261114-bug-block-elevator-unchanged-v2-0-5a1fe7d72fa0@linux.dev> <179501805754.17649.16701221943802051712.b4-ty@b4>
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

On Wed, 18 Nov 2026 09:07:37 -0700, Jens Axboe wrote:
> Applied, thanks!
>
[...]
> [2/2] block: return early when the elevator doesn't change
>       commit: 375a88c6176ffe05e521c2df31b1ceaf4ae5fbaf

This one went in from v2, whose Fixes tag Christoph pointed out was
wrong. v3 changed it to the commit that added the freeze, with the code
unchanged:

Fixes: af2814149883e ("block: freeze the queue in queue_attr_store")

Could you update it in for-next?

v3: https://lore.kernel.org/r/20261116-bug-block-elevator-unchanged-v3-2-cb4dda2dadf4@linux.dev

Thanks,
Qiliang
