Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096877;
	b=4KFuurdiUto4gW/2zLOrBFtd+zrUgafb30XU4DwFh7cP1ZzRe8TQ3+ORDD6vBwMuly3w
	 2vccFm5CRh406+6x7v24UMRQztYO6ySueomlb3MMt7Icqq39OpgHNvvfl2bdA38ggtO+R
	 HsuwhP6uY3apuQKafccKqB5GYOWJIhfa9B6bVT7jw+kMu3XVotS1nbIMG06pvw94ong1P
	 pI1XYZ3d+t86DjPrLA78GRajDwgA+IoVJ+yYL/jZHjFDUvM+6CIfmbXhYbzUPHiyQjbrQ
	 5yI//xM16mOPMp/IC1h6CWF3Vv7tPfhwn5CtV4AJC0elPdbSP/MvBCdcPeCaJQiRWig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096877;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/yhXF4dYa6GQ6SQ2pZILWrMX9tMQLpG8x7TuaSX3fSM=;
	b=z5Dsbk663vwVl0sGTpzRJJqu1U0VaVcsiL1/OMwpycVzyxWtBopw5Clo/FgrG+S8Rcsc
	 uVH7Raq3lCZXFL5wxoyDXIa2JzlSV7fQZ0OSftrb+J2sakCfpmxbZdKC+nJyJmBYIi5Yj
	 tNJmmbdhIFUGfkdn6ZJhzYGyVLpyUARPR1kOySnPAslVRqD509q5AgCj5cRu72l3Po0xi
	 R4mgQNi1PeSn4Q7DKPePaSmr+0xdqV6fBt4TqtdsqSVaUJasVxMxyM2DqPzKxJNjHs/cP
	 xVyT7laT9rXN9yP0VzDghhd/CT/VVA8OFlOuYCqaxlzzZ+4rR25F6myE3GBaBMw7Y1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jM8M99lU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 3C8A6606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jM8M99lU
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4D7B71F000C4;
	Thu, 19 Nov 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096877;
	bh=/yhXF4dYa6GQ6SQ2pZILWrMX9tMQLpG8x7TuaSX3fSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jM8M99lULsGDL3yhFyk0tBc89kBQMS1bQlKuuq5n0RPGSWOgb9SSqMGElbnU/Acq9
	 Q9edfbKlOUuXIkreDY69Z9zO4VTqfTWxKVDPprXLrwg2r7uJazEEVPN4lVv7aqIk3V
	 mwW4WUKr64gYtCUuc31j01ef+I6lgzwT+U1VRTTm1tmR0TxU/0PtDtof8vNPf2hhUe
	 3Rwh9d2IE7CuvKqLqZ5uY+sX8ZY6PmabBmVYyVQfVYdwOUwvuXsxZwXGNd4kn6sSro
	 p2XqLsREM6SnIPeXcTQKLjZaZpe1nJL5SCNXodF/s6Wpy8YsT5LmP2GETinE5GUMdO
	 MYy7d10aHCgQQ==
Date: Thu, 19 Nov 2026 15:01:13 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 11/11] nvmem: allow providers to specify an explicit NULL
 owner
Message-ID: <qsu6fn7366roc2sq3eiahsnw4ucyaocyycbxfobil27uy232fq@qmlu663id5i7>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-11-3cfbd48812b5@gmail.com>
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
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-11-3cfbd48812b5@gmail.com>

On Tue, Nov 17, 2026 at 12:38:18PM -0700, James Hilliard wrote:
> The owner fallback treats NULL as an unspecified module. A provider whose
> operations belong to built-in subsystem code therefore cannot distinguish
> its deliberate NULL owner from a request to use the parent driver module.
> 
> Add owner_is_explicit so such providers can select their actual callback
> owner. Leave existing callers on the parent-module fallback. Unregister
> still disconnects and drains callbacks before the provider releases its
> state.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
