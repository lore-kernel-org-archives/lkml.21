Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518638;
	b=yv6xJ32BJl1KWmuTyD9lWAz3wKuXm/+IoFEClufu+9Of0/X9XsSxqb0ebvsrQUDxFKP8
	 AKTVTdY5TfbPO+0VAiymz6nssJJgHHqJ727AcUihomabot/x0jJM43OeV8TqQOEqO9IBr
	 5AbD30V9qKsiUBivkZuSzfV/psQ3SV0YWQEs2aDB/lodpxFzk0jDwDimfrSGRWsL6Jn+f
	 aF8xMv0qmM0+7UONnm+3dJapIfrrEWK9GBh5s29XKaanIPV5CIInuhoXhBD/0QI1f5p34
	 6gHaqbAObJOlhfLM7X37Q0W7196dbD4vcCDgqM4vL8FrUfwg7jgXEHRaEz5U3NOZOVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518638;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=frSIgxUTlioq2uhgijeM3PWfH5xAEbVA200e6JXr+NE=;
	b=AsdJdG101jovojL6wkVDJeaVeSFYxbWAHR3V9spqZTvqWHmtuORkmImPL9nplAqL5xJy
	 TXKw3Z9LJd/kZpDANXGuy0z2K99+i5o28GMtvMLriLGap8bNCjAbc7/f/9HfWURCeGRhM
	 JxidE8d9JUBsmT//ifUbXuJL8GsD8trhumMm+vAzgDJOs+Zyh6V65Nn2lXGIVxZm8QSqq
	 HSJ4Hx/AkWxzos3X8yu/AvvClEJuNkLlvvy3kBs7cbsOBgK61WeuizaEzDAj6Rb20pIa8
	 TAaU+RhAYbJn6+lQqYK//A6To84oA2e2VbMZtebi/jwsZuS2t6FjPzCR1/f7XIrHkRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BYucXjt5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08E7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BYucXjt5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F164C1F000CA;
	Tue, 24 Nov 2026 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518638;
	bh=frSIgxUTlioq2uhgijeM3PWfH5xAEbVA200e6JXr+NE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BYucXjt5G91y0VAxxGlCdgd/4laD4od+Lg2Lj/i1nLEhdEg3GP6GTMLuOUB/o/Z9+
	 aMKmwN3Ek7fscLrppvrpUyATdQW3snq/Z3R7VuBn+plVi3bXH/PC1nyQqfcHGgcnAq
	 P9eYI2jH+X0C4jc5Hu4/HRzYfLl6xAfRInNjgBZ/OKid0i49kWOxdQkoV4VVC0a0Od
	 fm5ExHLScwOrEMpRwKrCMFE/yw3vUl9bxEKCU16vjBCtQtex0oLX9pMl1cGfNdhMiI
	 4H5+DJ/psLL004CY0h16IRiRI/HGh9oiKVT8XFZeVF0vvN7Z/W91zZM1BTVejBBsVd
	 kYEY+6fPW1S+w==
Message-ID: <31d57c47-d8a2-4ac1-bf40-292fd3eab1a1@kernel.org>
Date: Tue, 24 Nov 2026 12:10:32 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] macintosh: ans-lcd: add missing MODULE_DESCRIPTION()
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
References: <20261121192319.930162-1-rdunlap@infradead.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261121192319.930162-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 21/11/2026 à 20:23, Randy Dunlap a écrit :
> Add missing MODULE_DESCRIPTION() that is now required.
> 
> WARNING: modpost: drivers/macintosh/ans-lcd.ko: missing MODULE_DESCRIPTION()

Can you add in the commit message that it has been required since commit 
6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")

Also, that's probably not the only one in drivers/macintosh missing a 
MODULE_DESCRIPTION():

   drivers/macintosh$ git grep -l MODULE_ | wc -l
   28

   drivers/macintosh$ git grep -l MODULE_DESCRIPTION | wc -l
   23

> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> 
>   drivers/macintosh/ans-lcd.c |    1 +
>   1 file changed, 1 insertion(+)
> 
> --- linux-next-20261118.orig/drivers/macintosh/ans-lcd.c
> +++ linux-next-20261118/drivers/macintosh/ans-lcd.c
> @@ -202,4 +202,5 @@ anslcd_exit(void)
>   
>   module_init(anslcd_init);
>   module_exit(anslcd_exit);
> +MODULE_DESCRIPTION("/dev/lcd driver for Apple Network Servers");
>   MODULE_LICENSE("GPL v2");

