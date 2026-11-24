Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541580;
	b=2CwQpgsRkS++tQSxdIXTFNibIfJQeUFb49d11d5Iza2p8j+6nek7qNRFL/KI446+iunG
	 u3Y+yinBxZa4rA+vGj0CjlvZq+mbXaZCw2vO6bozhHmfaJXuxWAeveYToPcabeRkS89ct
	 FgFYsfagMN5U12Xh4WMXBnxYUM33ZbArxxMHL1HjbKjX2H7Vip4tucKni3hz4Rt0yzLGf
	 8c6KPfFKCrCspgJQ/q3t0Sj93XL0hfFJXplDrZdQJ6L85zipTP2e6JLiG2sQTVGOaZOd6
	 KKeLBjMXPTYh+XXKyMnBE4TYy0QQk+Mt3uDbc/4ieX0PjIaqMMKqRW59a82P9N9zoFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541580;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=98A+7uN4OE7FH54APkf+DmmnH7gzrRDq3ZVMmdDn64o=;
	b=eSSYIYBRtpIskPSKO0wTKIHt4U+CyiNyR1bZvW/bCSbEOamAfP7oIxg+e2u/z3fqn6Mj
	 hsXUV7H8f/KfTmRm0q5dw5U8xWouPwix7aAU/o3+VkCy2WoCAHrJlGQz1dYItDd6OUPTH
	 RP1guYad6TFprsxMaS5dxnZ9CxfSPB7EA3gMxW3SSkhfKVQ9fLmJ/Q+w1r52LTIp2yH8o
	 AtSaCeY90GcAqqk2+hRymtdcKzg2zUz/uNxLrQsCHLrTfZuCo7S7qAkEXUuiCGmOKm/y/
	 /o1yveqChNAbzwiCKaTBGfRgI4mCTnMdVyXQ+effkZhKTqKKZUeN1xZg1wY0F9eTjrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hm16ekas;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D83D606A6AE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D83D606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hm16ekas
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=98A+7uN4OE7FH54APkf+DmmnH7gzrRDq3ZVMmdDn64o=; b=Hm16ekasdYLPomvBkJw5X66rV8
	qBap+Z4Nz/KXi8CvYxm347QOP2tNba+zrR6iofdgWaHhuNXJ3HIJG+Lj5G2NHVIvKqu+CDFAOQcoT
	lv44a004RmudgeDVba6WEEtBydQkBB2kVwJS968tRnfctXQqAPR1XhVGjb0jqcUFP927uIdU13Ikg
	PYwAd1wYWLeJ6spprzCnzr35ywY0j9iUdaiZR2xABsencCBn3z7QwXRMB0T+ynRjE0HQxDOIyRBbP
	dqZM023Udr0gZqungI+fYTvKBjaGcTL/ORuTH80tIDSZrg/ZGGLN3hcwA8CTZI9XU5cdhmLW/vJzU
	EeZsV0lA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuO2-00000007N71-3KWQ;
	Tue, 24 Nov 2026 17:32:58 +0000
Message-ID: <0f88a818-55eb-407d-847c-7d2c9d2bcbd1@infradead.org>
Date: Tue, 24 Nov 2026 09:32:58 -0800
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
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
References: <20261121192319.930162-1-rdunlap@infradead.org>
 <31d57c47-d8a2-4ac1-bf40-292fd3eab1a1@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <31d57c47-d8a2-4ac1-bf40-292fd3eab1a1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/24/26 3:10 AM, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 21/11/2026 à 20:23, Randy Dunlap a écrit :
>> Add missing MODULE_DESCRIPTION() that is now required.
>>
>> WARNING: modpost: drivers/macintosh/ans-lcd.ko: missing MODULE_DESCRIPTION()
> 
> Can you add in the commit message that it has been required since commit 6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")

Will do.

> Also, that's probably not the only one in drivers/macintosh missing a MODULE_DESCRIPTION():
> 
>   drivers/macintosh$ git grep -l MODULE_ | wc -l
>   28
> 
>   drivers/macintosh$ git grep -l MODULE_DESCRIPTION | wc -l
>   23

It's the only one that I found after doing a lot of allmodconfig
test builds on various $ARCH.

But I'll take a look at the others. Thanks.

>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
>>
>>   drivers/macintosh/ans-lcd.c |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> --- linux-next-20261118.orig/drivers/macintosh/ans-lcd.c
>> +++ linux-next-20261118/drivers/macintosh/ans-lcd.c
>> @@ -202,4 +202,5 @@ anslcd_exit(void)
>>     module_init(anslcd_init);
>>   module_exit(anslcd_exit);
>> +MODULE_DESCRIPTION("/dev/lcd driver for Apple Network Servers");
>>   MODULE_LICENSE("GPL v2");
> 

-- 
~Randy

